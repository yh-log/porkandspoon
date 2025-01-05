package kr.co.porkandspoon.controller;

import kr.co.porkandspoon.dto.ChatDTO;
import kr.co.porkandspoon.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ChatController {

	Logger logger = LoggerFactory.getLogger(getClass());

	private final ChatService chatService;


	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}

	/**
	 * 채팅방 페이지 이동
	 */
	@GetMapping(value="/chat/list")
	public ModelAndView chatListView() {
		return new ModelAndView("/chat/chatList");
	}

	/**
	 * author yh.kim, (25.01.05)
	 * 클라이언트가 보낸 메시지 처리
	 */
	// /api : 기본으로 붙어있게 됨!
	@MessageMapping("/chat/{chatRoomId}")
	@SendTo("/sub/chat.{chatRoomId}") // sub를 구독하고 있는 모든 사용자에게 전송됨
	// 특정 채팅방을 구분할 수 있는 chatRoomId
	// chatRoomId 값을 가져올 수도 있고 SendTo에 값을 전달할 수도 있음
	public void sendMessage(ChatDTO message, @DestinationVariable String chatRoomId) {


		chatService.sendMessage(message);
	}

	/**
	 * author yh.kim, (25.01.04)
	 * 채팅방 생성
	 */
	@PostMapping("/room")
	public ChatDTO createRoom(@RequestBody ChatDTO message) {
		return null;
	}

	// 전체 채팅방 조회

	// 채팅방 메시지 조회

	// 사용자가 웹 소켓에 연결되었을 때 실행 로직 (채팅 jsp에 들어갔을 때)

	// 사용자가 웹 소켓 연결을 끊었을 때 (다른 페이지로 나갔을 때)


}
