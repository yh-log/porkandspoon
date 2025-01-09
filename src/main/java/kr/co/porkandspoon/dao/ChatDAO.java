package kr.co.porkandspoon.dao;

import kr.co.porkandspoon.dto.ChatDTO;
import kr.co.porkandspoon.dto.ChatRoom;
import kr.co.porkandspoon.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ChatDAO {

    /**
     * author yh.kim, (25.01.06)
     * 채팅방 페이지 이동
     */
    UserDTO getUserStoreInfo(String username);

    /**
     * author yh.kim, (25.01.06)
     * 생성된 채팅방 정보 저장
     */
    int createRoom(ChatRoom room);

    /**
     * author yh.kim, (25.01.06)
     * 채팅방 생성한 직원 정보 저장
     */
    int createRoomUser(ChatRoom room);

    /**
     * author yh.kim, (25.01.06)
     *  채팅방 직원 추가
     */
    int saveUsersToRoom(ChatDTO chatDTO);

    /**
     * author yh.kim, (25.01.06)
     * 직원 채팅방 리스트 조회
     */
    List<ChatDTO> userRoomList(String username);

    /**
     * author yh.kim, (25.01.06)
     * 채팅 메시지 조회
     */
    List<ChatDTO> chatRoomMessage(Map<String, Object> params);

    /**
     * author yh.kim, (25.01.06)
     * 채팅 메시지 읽음 처리
     */
    int chatMessageReadUpdate(String chatRoomId, String username);

    /**
     * author yh.kim, (25.01.06)
     * 채팅 메시지 저장
     */
    int saveChatMessage(ChatDTO chatDTO);
    
    /**
     * author yh.kim, (25.01.06)
     * 채팅방 읽음 테이블 입력
     */
    int saveChatRead(ChatDTO chatDTO);

    /**
     * author yh.kim, (25.01.06)
     * 채팅방 나가기
     */
    int chatRoomDelete(ChatDTO chatDTO);
}
