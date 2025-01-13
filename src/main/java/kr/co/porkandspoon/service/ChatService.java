package kr.co.porkandspoon.service;

import kr.co.porkandspoon.dao.ChatDAO;
import kr.co.porkandspoon.dto.ChatDTO;
import kr.co.porkandspoon.dto.ChatRoom;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ChatService {

    Logger logger = LoggerFactory.getLogger(getClass());

    private final SimpMessagingTemplate template;

    public ChatService(SimpMessagingTemplate template) {
        this.template = template;
    }

    @Autowired
    ChatDAO chatDAO;

    /**
     * author yh.kim, (25.01.05)
     * 클라이언트가 보낸 메시지 처리
     */
    public void sendMessage(ChatDTO message) {

        // 메시지 저장 필요

    }

    /**
     * author yh.kim, (25.01.06)
     * 채팅방 페이지 이동
     */
    public UserDTO getUserStoreInfo(String username) {

        UserDTO userDTO = chatDAO.getUserStoreInfo(username);

        if (userDTO == null){
            userDTO.setStatus(500);
            userDTO.setMessage("직원 정보를 조회하지 못했습니다.");
            return userDTO;
        }

        return userDTO;
    }

    /**
     * author yh.kim, (25.01.06)
     * 생성된 채팅방 정보 저장
     */
    public void createRoom(ChatRoom room) {

        if(room.getName().isEmpty()){
            room.setName("이름 없는 채팅방");
        }
        
        logger.info(CommonUtil.toString(room));
        int createRow = chatDAO.createRoom(room);
        logger.info(createRow + " 생성된 채팅 로우");

        if(createRow == 1){
            int createRoomUserRow = chatDAO.createRoomUser(room);
            logger.info(createRoomUserRow + " 생성된 채팅 유저 로우");
        }
        
    }

    /**
     * author yh.kim, (25.01.06)
     *  채팅방 직원 추가
     */
    public ChatDTO saveUsersToRoom(ChatDTO chatDTO) {

        int saveUserRow = chatDAO.saveUsersToRoom(chatDTO);
        if(saveUserRow != chatDTO.getUsernames().size()){
            chatDTO.setStatus(500);
            chatDTO.setMessage("등록에 실패했습니다.");
            return chatDTO;
        }

        chatDTO.setStatus(200);
        chatDTO.setMessage("등록에 성공했습니다.");

        return chatDTO;
        
    }

    /**
     * author yh.kim, (25.01.06)
     * 직원 채팅방 리스트 조회
     */
    public List<ChatDTO> userRoomList(String username) {

        List<ChatDTO> chatList = chatDAO.userRoomList(username);

        if(chatList == null){
            return new ArrayList<>();
        }

        LocalDateTime now = LocalDateTime.now();

        for (ChatDTO chatDTO : chatList) {
            if(chatDTO.getSend_date() != null){
                LocalDateTime sendDate = chatDTO.getSend_date();
                String CalculateCate = fomatSendDate(sendDate, now);
                chatDTO.setFormatDate(CalculateCate);
            }else {
                chatDTO.setFormatDate("");
            }
        }

        return chatList;
    }

    /**
     * author yh.kim, (25.01.06)
     * 날짜, 시간 데이터 가공
     */
    private String fomatSendDate(LocalDateTime sendDate, LocalDateTime now) {

        long daysBetween = ChronoUnit.DAYS.between(sendDate.toLocalDate(), now.toLocalDate());
        long weeksBetween = daysBetween / 7;

        // 오늘 날짜인 경우
        if (daysBetween == 0) {
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
            return sendDate.format(timeFormatter);
        }

        // 하루에서 6일 사이인 경우
        if (daysBetween > 0 && daysBetween < 7) {
            return daysBetween + "일 전";
        }

        // 일주일 이상인 경우
        if (weeksBetween > 0) {
            return weeksBetween + "주 전";
        }

        // 기본 포맷 (필요시)
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return sendDate.format(dateFormatter);
    }

    /**
     * author yh.kim, (25.01.06)
     * 채팅 메시지 조회
     */
    public List<ChatDTO> chatRoomMessage(String chatRoomId, String username, String page) {

        int limit = 10;
        int pages = Integer.parseInt(page);
        int offset = (pages - 1) * limit;

        Map<String, Object> params = new HashMap<>();
        params.put("chatRoomId", chatRoomId);
        params.put("username", username);
        params.put("limit", limit);
        params.put("offset", offset);

        List<ChatDTO> chatRoomList = chatDAO.chatRoomMessage(params);

        if(chatRoomList == null){
            return new ArrayList<>();
        }

        LocalDateTime now = LocalDateTime.now();

       for (ChatDTO chatDTO : chatRoomList) {
           if (chatDTO.getSend_date() != null) {
               LocalDateTime sendDate = chatDTO.getSend_date();
               String CalculateCate = fomatSendDate(sendDate, now);
               chatDTO.setFormatDate(CalculateCate);
           } else {
               chatDTO.setFormatDate("");
           }

           if(chatDTO.getSender().equals(username)){
               chatDTO.setType("S");
           }else{
               chatDTO.setType("R");
           }
       }

       // 채팅방 참여 인원 프로필 정보 가져오기!



        // 채팅 읽음 처리 진행
        int readUpdateRow = chatDAO.chatMessageReadUpdate(chatRoomId, username);
        logger.info("읽음 처리 로우 =>" + readUpdateRow);

        return chatRoomList;

    }

    /**
     * author yh.kim, (25.01.06)
     * 채팅 메시지 저장
     */
    public void saveChatMessage(ChatDTO chatDTO) {

       // 채팅방에 저장
       int saveChatMessageRow = chatDAO.saveChatMessage(chatDTO);
       logger.info("채팅 메시지 저장 로우 => " + saveChatMessageRow);

       // 채팅 읽은 처리 테이블에 입력
        int saveChatReadInsertRow = chatDAO.saveChatRead(chatDTO);
        logger.info("채팅 읽음 테이블 저장 로우 => " + saveChatReadInsertRow);

    }

    /**
     * author yh.kim, (25.01.06)
     * 채팅방 나가기
     */
    public void chatRoomDelete(ChatDTO chatDTO) {

        int deleteRow = chatDAO.chatRoomDelete(chatDTO);
        logger.info("비활성화 로우 => " + deleteRow);

    }

    /**
     * author yh.kim, (25.01.12)
     * 채팅방 이름 변경
     */
    public ChatDTO chatRoomNameChange(ChatDTO chatDTO) {

        int chatNameChangeRow = chatDAO.chatRoomNameChange(chatDTO);
        logger.info("채팅방 이름 수정 로우 => " + chatNameChangeRow);

        if(chatNameChangeRow == 0){
            chatDTO.setStatus(500);
            chatDTO.setMessage("채팅방 이름 변경에 실패했습니다.");
            return chatDTO;
        }

        chatDTO.setStatus(200);
        chatDTO.setMessage("채팅방 이름이 수정되었습니다.");

        return chatDTO;
    }
}
