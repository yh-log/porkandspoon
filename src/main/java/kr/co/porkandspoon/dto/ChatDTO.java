package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class ChatDTO extends ResponseDTO{


    // chat_room 채팅 룸 테이블
    private String roomId;
    private String name;        // 채팅방 이름
    private String create_date;

    // chat_room_user 채팅 룸 연결 테이블
    private String username;
    private String custom_name;
    private String join_date;   // 들어온 일

    // chat_message 채팅 메시지 테이블 (pk : idx)
    private String content;     // 메시지 내용
    private LocalDateTime send_date;   // 발송 일시
    private String sender;      // 발신자 username

    // chat_message_read 채팅 읽음 테이블
    private int chat_message_idx;   // 채팅 메시지 idx
    private String receiver;        // 수신자 username
    private String read_time;       // 읽은 일시
    private String is_read;         // 읽음 여부

    private List<String> usernames;

    private String formatDate;

    private String type;

    private int idx;

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCustom_name(String custom_name) {
        this.custom_name = custom_name;
    }

    public void setJoin_date(String join_date) {
        this.join_date = join_date;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setSend_date(LocalDateTime send_date) {
        this.send_date = send_date;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public void setChat_message_idx(int chat_message_idx) {
        this.chat_message_idx = chat_message_idx;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public void setRead_time(String read_time) {
        this.read_time = read_time;
    }

    public void setIs_read(String is_read) {
        this.is_read = is_read;
    }

    public String getName() {
        return name;
    }

    public String getCreate_date() {
        return create_date;
    }

    public String getUsername() {
        return username;
    }

    public String getCustom_name() {
        return custom_name;
    }

    public String getJoin_date() {
        return join_date;
    }

    public String getContent() {
        return content;
    }

    public LocalDateTime getSend_date() {
        return send_date;
    }

    public String getSender() {
        return sender;
    }

    public int getChat_message_idx() {
        return chat_message_idx;
    }

    public String getReceiver() {
        return receiver;
    }

    public String getRead_time() {
        return read_time;
    }

    public String getIs_read() {
        return is_read;
    }

    public List<String> getUsernames() {
        return usernames;
    }

    public void setUsernames(List<String> usernames) {
        this.usernames = usernames;
    }

    public String getFormatDate() {
        return formatDate;
    }

    public void setFormatDate(String formatDate) {
        this.formatDate = formatDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }
}
