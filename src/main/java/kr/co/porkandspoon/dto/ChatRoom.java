package kr.co.porkandspoon.dto;

import java.util.UUID;

public class ChatRoom {

    private String roomId;
    private String name;
    private String createdBy; // 채팅방 생성자 (username)

    // 생성자
    public ChatRoom(String name) {
        this.roomId = UUID.randomUUID().toString(); // 고유한 채팅방 ID 생성
        this.name = name;
    }

    // Getters
    public String getRoomId() {
        return roomId;
    }

    public String getName() {
        return name;
    }

    // 채팅방 생성 메서드
    public static ChatRoom create(String name) {
        return new ChatRoom(name);
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public void setName(String name) {
        this.name = name;
    }
}
