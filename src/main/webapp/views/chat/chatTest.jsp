<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메신저 테스트</title>
    <!-- 부트스트랩 -->
    <link rel="shortcut icon"
          href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">



    <link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
    <link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
    <link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
    <link rel="stylesheet" href="/resources/css/common.css">

    <meta name="_csrf" content="${_csrf.token}">
    <meta name="_csrf_header" content="${_csrf.headerName}">

</head>

<body>
<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/initTheme.js"></script>
<div id="app">

    <!-- 사이드바 -->
    <jsp:include page="../sidebar.jsp" />

    <div id="main">
        <!-- 헤더 -->
        <jsp:include page="../header.jsp" />

        <div class="page-content">
            <section id="menu">
                <h4 class="menu-title">사내메일</h4>
                <ul>
                    <li class="active"><a href="#">받은메일함</a></li>
                    <li><a href="#">보낸메일함</a></li>
                    <li><a href="#">임시보관함</a></li>
                    <li><a href="#">중요메일함</a></li>
                    <li><a href="#">휴지통</a></li>
                </ul>
                <div class="btn btn-primary full-size">사사이드바 버튼</div>
            </section>
            <section class="cont">

                <div class="col-12 col-lg-12">
                    <div class="tit-area">
                        <h5>받은메일함</h5>
                    </div>
                    <div class="cont-body">
                        <h1>실시간 채팅 테스트</h1>

                        <!-- 채팅방 생성 -->
                        <div>
                            <h3>채팅방 생성</h3>
                            <input type="text" id="username" placeholder="사용자 이름" value="admin"/>
                            <input type="text" id="roomNameInput" placeholder="채팅방 이름 입력" value="test"/>
                            <button id="createRoomButton">채팅방 생성</button>
                        </div>

                        <div>
                            <h3>채팅방 참여</h3>
                            <input type="text" id="chatRoomIdInput" placeholder="채팅방 ID 입력" />
                            <button id="joinRoomButton">채팅방 참여</button>
                        </div>

                        <div>
                            <h3>채팅</h3>
<%--                            <input type="text" id="username" placeholder="사용자 이름" />--%>
                            <input type="text" id="content" placeholder="메시지 입력" />
                            <button id="sendMessageButton">메시지 전송</button>
                        </div>

                        <div>
                            <h3>채팅 메시지</h3>
                            <div id="chatMessage" style="border: 1px solid #ccc; padding: 10px; height: 200px; overflow-y: auto;">
                                <!-- 수신된 메시지가 여기에 추가됩니다 -->
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>






<%--<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>--%>
<!-- 웹 소켓 사용 시 아래 라이브러리 선언 -->
<%--<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@7.0.0/bundles/stomp.umd.min.js"></script>--%>


<%--<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@6.1.2/bundles/stomp.min.js"></script>--%>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>


<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>
<script>

    // CSRF 토큰 및 헤더 설정
    const csrfToken = $('meta[name="_csrf"]').attr('content');
    const csrfHeader = $('meta[name="_csrf_header"]').attr('content');

    $(document).ready(function () {
        console.log("Stomp 객체 확인:", typeof Stomp);

        // WebSocket 클라이언트 초기화
        const stompClient = Stomp.over(new SockJS('/wsConnect'));

        // WebSocket 연결
        stompClient.connect({}, (frame) => {
            console.log("WebSocket 연결 성공:", frame);

            let currentChatRoomId = null; // 현재 참여 중인 채팅방 ID

            // 채팅방 생성 버튼 클릭 이벤트
            $('#createRoomButton').click(() => {
                const roomName = $('#roomNameInput').val();
                const username = $('#username').val();

                if (!username || !roomName) {
                    alert("채팅방 이름과 사용자 이름을 입력해주세요!");
                    return;
                }

                // AJAX 요청으로 채팅방 생성
                $.ajax({
                    url: '/chat/room',
                    type: 'POST',
                    contentType: 'application/x-www-form-urlencoded',
                    data: { name: roomName, username: username }, // 요청 데이터
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 헤더 추가
                    },
                    success: function (room) {
                        console.log("채팅방 생성 응답:", room); // 응답 데이터 확인

                        // room 객체에서 roomId와 name을 알림에 표시
                        if (room && room.roomId) {
                            alert('채팅방 생성됨: ' + room.name + ' (ID: ' + room.roomId + ')');
                            $('#chatRoomIdInput').val(room.roomId);
                        } else {
                            alert("채팅방 생성 성공했지만 roomId를 찾을 수 없습니다.");
                        }
                    },
                    error: function (xhr) {
                        console.error("채팅방 생성 실패:", xhr.status, xhr.responseText);
                    }
                });
            });

            // 채팅방 참여 버튼 클릭 이벤트
            $('#joinRoomButton').click(() => {
                const chatRoomId = $('#chatRoomIdInput').val();
                const username = $('#username').val();

                if (!chatRoomId || !username) {
                    alert("채팅방 ID와 사용자 이름을 입력해주세요!");
                    return;
                }

                currentChatRoomId = chatRoomId;

                // WebSocket 구독
                stompClient.subscribe('/sub/chat/' + chatRoomId, (message) => {
                    const receivedMessage = JSON.parse(message.body);
                    console.log("수신된 메시지:", receivedMessage);

                    // 화면에 메시지 추가
                    $('#chatMessage').append(
                        '<div>' + receivedMessage.username + ': ' + receivedMessage.content + '</div>'
                    );
                });

                // 메시지를 전송하여 서버에서 메시지 매핑 메서드 호출
                stompClient.send('/pub/chat/' + chatRoomId, {}, JSON.stringify({
                    username: username,
                    content: username + '님이 채팅방에 참여하셨습니다.'
                }));

                alert('채팅방 참여: ' + chatRoomId);
            });

            // 메시지 발행 버튼 클릭 이벤트
            $('#sendMessageButton').click(() => {
                if (!currentChatRoomId) {
                    alert("채팅방에 참여하세요!");
                    return;
                }

                const message = {
                    username: $('#username').val(),
                    content: $('#content').val()
                };

                // WebSocket 메시지 발행
                stompClient.send('/pub/chat/' + currentChatRoomId, {}, JSON.stringify(message));
                console.log("메시지 발행: username = " + message.username + ", content = " + message.content);
            });
        }, (error) => {
            console.error("WebSocket 연결 실패:", error);
        });
    });




</script>

</html>

