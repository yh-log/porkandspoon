package kr.co.porkandspoon.service;

import kr.co.porkandspoon.dao.ChatDAO;
import kr.co.porkandspoon.dto.ChatDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

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
}
