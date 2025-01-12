package kr.co.porkandspoon.controller;

import kr.co.porkandspoon.dto.ChatDTO;
import kr.co.porkandspoon.dto.ChatRoom;
import kr.co.porkandspoon.dto.NoticeDTO;
import kr.co.porkandspoon.dto.ResponseDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.AlarmService;
import kr.co.porkandspoon.service.ChatRoomManager;
import kr.co.porkandspoon.service.ChatService;
import kr.co.porkandspoon.util.CommonUtil;
import kr.co.porkandspoon.util.security.CustomUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/chat")
public class ChatController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmService alarmService;

	private final ChatRoomManager chatRoomManager;

	private final ChatService chatService;


	public ChatController(ChatService chatService, ChatRoomManager chatRoomManager) {
		this.chatService = chatService;
		this.chatRoomManager = chatRoomManager;
	}

	/**
	 * author yh.kim, (25.01.06)
	 * 채팅방 페이지 이동
	 */
	@GetMapping(value="/list")
	public ModelAndView chatListView() {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		UserDTO userDTO = chatService.getUserStoreInfo(username);

		ModelAndView mav = new ModelAndView("/chat/chatList");
		mav.addObject("userDTO",userDTO);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.05)
	 * 클라이언트 구독 요청 처리
	 */
	@MessageMapping("/chat/sub/{chatRoomId}")
	@SendTo("/sub/chat/{chatRoomId}") // 채팅방에 메시지를 브로드캐스트
	public void subscribeToRoom(@DestinationVariable String chatRoomId) {
		logger.info("채팅방 구독 요청: roomId => " + chatRoomId);

		// 구독 로직만 처리 (클라이언트에서는 성공 시 UI 업데이트)
	}

	/**
	 * author yh.kim, (25.01.06)
	 * 클라이언트가 보낸 메시지 처리
	 */
	@MessageMapping("/chat/message/{chatRoomId}")
	@SendTo("/sub/chat/{chatRoomId}") // 해당 채팅방에 메시지를 브로드캐스트
	public ChatDTO sendMessageToRoom(@ModelAttribute ChatDTO message, @DestinationVariable String chatRoomId) {
		logger.info("채팅방 메시지 발송: roomId => " + chatRoomId);
		logger.info("발송 메시지: " + message.getContent());
		logger.info("요청 직원 => " + message.getUsername());
		
		message.setRoomId(chatRoomId);

		saveChatMessage(message);
		
		// 알림
		NoticeDTO noticedto = new NoticeDTO();
		noticedto.setContent(message.getContent());
		noticedto.setFrom_id(message.getUsername());
		noticedto.setSubject(chatRoomId);
		noticedto.setCode_name("ml010");
		alarmService.saveAlarm(noticedto);
		
		return message; // 메시지를 구독 중인 사용자에게 전송
	}
	
	
	/**
	 * author yh.kim, (25.01.04)
	 * 채팅방 생성
	 */
	@PostMapping("/room")
	@ResponseBody
	public ChatRoom createRoom(@RequestParam String name, @RequestParam String username) {
		logger.info("채팅방 생성 name = > " + name);
		logger.info("채팅방 생성 username = > " + username);

		// 채팅방 생성
		ChatRoom room = chatRoomManager.createRoom(name);
		room.setCreatedBy(username); // 생성자 정보 추가

		// DB에 채팅방 저장
		chatService.createRoom(room);

		return room;
	}

	/**
	 * author yh.kim, (25.01.06)
	 *  채팅방 직원 추가
	 */
	@PostMapping(value = "/saveUsersToRoom")
	@ResponseBody
	public ChatDTO saveUsersToRoom(@RequestBody ChatDTO chatDTO){

		if (chatDTO == null){
			chatDTO.setStatus(400);
			chatDTO.setMessage("정보가 존재하지 않습니다..");
			return chatDTO;
		}
		return chatService.saveUsersToRoom(chatDTO);
	}


//	// 모든 채팅방 조회
//	@GetMapping("/rooms")
//	@ResponseBody
//	public Map<String, ChatRoom> findAllRooms() {
//
//		logger.info("채팅방 조회 모든");
//
//		return chatRoomManager.findAllRooms();
//	}
//
//	// 특정 채팅방 조회
//	@GetMapping("/room/{roomId}")
//	@ResponseBody
//	public ChatRoom findRoomById(@PathVariable String roomId) {
//
//		logger.info("특정 채팅방 조회 -> " + roomId);
//
//		return chatRoomManager.findRoomById(roomId);
//	}


	/**
	 * author yh.kim, (25.01.06)
	 * 채팅방 추가 직원 조회
	 */
	@GetMapping(value = "/userAppend")
	@ResponseBody
	public UserDTO chatUserAppend(@RequestParam String username) {

		logger.info("받아온 username => " + username);

		return chatService.getUserStoreInfo(username);
	}

	/**
	 * author yh.kim, (25.01.06)
	 * 직원 채팅방 리스트 조회
	 */
	@GetMapping(value = "/userRoomList")
	@ResponseBody
	public List<ChatDTO> userRoomList(@RequestParam String username) {
		logger.info("받은 아이디 => " + username);

		List<ChatDTO> chatList = chatService.userRoomList(username);

		return chatList;
	}

	/**
	 * author yh.kim, (25.01.06)
	 * 채팅 메시지 리스트 조회
	 */
	@GetMapping(value = "/messages/{roomId}")
	@ResponseBody
	public List<ChatDTO> chatRoomMessage(
			@PathVariable String roomId, @RequestParam String username, @RequestParam String page) {

		return chatService.chatRoomMessage(roomId, username, page);
	}

	/**
	 * author yh.kim, (25.01.06)
	 * 채팅 메시지 저장
	 */
	public void saveChatMessage(ChatDTO chatDTO) {

		logger.info(CommonUtil.toString(chatDTO) + " : 채팅 메시지 입력 메서드");

		chatService.saveChatMessage(chatDTO);
	}

	/**
	 * author yh.kim, (25.01.06)
	 * 채팅방 나가기
	 */
	@DeleteMapping(value = "/roomDelete")
	@ResponseBody
	public void chatRoomDelete(@ModelAttribute ChatDTO chatDTO) {
		chatService.chatRoomDelete(chatDTO);
	}

	/**
	 * author yh.kim, (25.01.12)
	 * 채팅방 이름 변경
	 */
	@PostMapping(value = "/roomNameChange")
	@ResponseBody
	public ChatDTO chatRoomNameChange(ChatDTO chatDTO) {

		logger.info(CommonUtil.toString(chatDTO));

		chatDTO = chatService.chatRoomNameChange(chatDTO);

		return chatDTO;
	}

}
