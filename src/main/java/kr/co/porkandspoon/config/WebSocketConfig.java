package kr.co.porkandspoon.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    /**
     * author yh.kim, (25.01.04)
     * 웹 소켓 엔드포인트 설정
     */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/wsConnect") // 클라이언트가 /ws 경로로 요청 보낼 시 웹 소켓 활성화
                .setAllowedOriginPatterns("*") // 모든 도메인에서 웹 소켓 서버에 접근할 수 있도록 허용 (CORS 설정)
                .withSockJS(); // .withSockJS() : SockJS 지원(낮은 버전의 브라우저도 사용할 수 있도록)
    }

    /**
     * author yh.kim, (25.01.04)
     * 메시지 브로커 경로 설정
     */
    // 메시지 브로커 : 메시지 전송을 중개하는 역할 (관심사 분류 가능(
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {

        // 메시지를 수신 받을 때, 경로를 설정해주는 함수
        // 내장 브로커를 사용하겠다는 설정 (브로커 경로)
        // /sub가 api에 prefix로 붙은 경우, messageBroker가 해당 경로를 가로채 처리
        // 해당 경로 /sub으로 SimpleBroker를 등록
        registry.enableSimpleBroker("/sub");
        // => 스프링의 인메모리 메시지 브로커를 사용한다는 설정

        // sub : 브로드캐스트 메시지 (해당 경로를 구독한 클라이언트 모두 메시지 받음)
        // private : 1:1 메시지 처리 경로 (특정 사용자에게 비공개 메시지)
        // registry.enableSimpleBroker("/room", "/private");

        // 클라이언트 송신(발신) 경로 (prefix 설정)
        // ex. /api/chat , @MessageMapping 과 연동됨
        //      => @MessageMapping("/chat") -> /api/chat 요청 처리
        // client에서 SEND 요청을 처리
        // 클라이언트가 메시지를 보낼 때, 경로 앞에 /pub가 붙어있으면 Broker로 보내짐
        registry.setApplicationDestinationPrefixes("/pub");
        // => 구독할 주소
    }

}
