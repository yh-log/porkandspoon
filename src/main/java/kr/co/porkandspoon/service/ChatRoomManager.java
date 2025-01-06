package kr.co.porkandspoon.service;

import kr.co.porkandspoon.dto.ChatRoom;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class ChatRoomManager {

    private final Map<String, ChatRoom> chatRooms = new HashMap<>();

    Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * author yh.kim, (25.01.05)
     * 채팅방 생성
     */
    public ChatRoom createRoom(String name){
        ChatRoom room = new ChatRoom(name);
        chatRooms.put(room.getRoomId(), room);

        logger.info("(ma) 채팅방 생성 완료 - name: " + name + ", roomId: " + room.getRoomId());
        return room;
    }

    /**
     * author yh.kim, (25.01.05)
     * 모든 채팅방 조회
     */
    public Map<String, ChatRoom> findAllRooms(){

        logger.info("(ma) find all rooms");

        return chatRooms;
    }

    /**
     * author yh.kim, (25.01.05)
     * 특정 채팅방 조회
     */
    public ChatRoom findRoomById(String roomId){

        logger.info("(ma) find room by id ->" + roomId);

        return chatRooms.get(roomId);
    }

}
