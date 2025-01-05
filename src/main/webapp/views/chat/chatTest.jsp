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
                        <input type="text" name="username" value="" id="username"/>
                        <button>채팅방 입장</button>
                        <input type="text" name="message" id="content">
                        <button>보내기</button>

                        <div id="chatMessage">


                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- 웹 소켓 사용 시 아래 라이브러리 선언 -->
<script src="https://cdn.jsdelivr.net/npm/@stomp/stompjs@7.0.0/bundles/stomp.umd.min.js"></script>

<script>

    // http : ws , https : wss
    // 80 포트와 443 포드를 모두 사용하기 때문에 별도 포트 설정은 x

    const stompClient = new StompJS.Client({
        brokerURL: 'ws://localhost:8080/wsConnect'
    });

    // 메시지 발행
    stompClient.publish({
        destination: "/pub/chat",
        body: JSON.stringify({'username' : $('#username').val(),
                            'content' : $('#content').val()})
    });

    stompClient.subscribe('/sub/chat', (greeting) =>{

    });


</script>

</html>