<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메신저</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">


<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
	#profile-seachBox {
		display: flex; /* 가로 정렬 */
		align-items: center; /* 세로 중앙 정렬 */
		gap: 10px; /* 요소 간 간격 */
	}
	
	#profileBox {
		width: 60px;
		height: 40px;
		background-color: #3498db;
		border-radius: 50%;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 10px;
	}
	
	.form-control.seachBox {
		border-radius: 20px;
	}

	.chatPersonListBox{
		display: flex;
		align-items: center;
  		gap: 10px;
	}
	
	.chatUserProfileBox{
		width: 40px;
		height: 40px;
		background-color: #3498db;
		border-radius: 50%;
		display: flex;
		justify-content: center;
		align-items: center;
		margin-bottom: 10px;
	}
	
	.chatSubject{
	    color: var(--bs-primary);
	    font-size: 18px;
    	font-weight: 600;
	}
	
	#no-chat-box{
		height: 500px;
		width: 1200px;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	
	#no-chat-font{
		color: #CCCCCC;
		font-weight: 600;
		font-size: 18px;
	}
	hr{
		color: var(--bs-secondary);
	}
	

	#chat-input-box{
		display: flex;
		gap: 15px;
	}
	
	textarea.form-control.chatInputText{
		max-width: 90%; /* 최대 크기를 90%로 제한 */
	  	word-wrap: break-word; /* 단어가 넘치면 줄바꿈 */
	 	word-break: break-word; /* 긴 단어도 줄바꿈 */
	  	overflow-wrap: break-word; /* 최신 브라우저 호환성 */
	  	padding: 10px; /* 내부 여백 */
	  	resize: none; /* 수동 크기 조정 비활성화 */
		overflow: auto; /* 넘칠 경우 스크롤 처리 */
	}

	.chat-item {
	    display: flex; /* 수평 정렬 */
	    align-items: flex-start; /* 상단 정렬 (왼쪽 기준) */
	    padding: 10px 10px 0px 0; /* 왼쪽에 패딩 제거 */
	    margin-bottom: 10px; /* 요소 간 간격 */
	}
	
	.profile-container {
	    position: relative; /* 상태 표시가 프로필 내부에 겹쳐지도록 설정 */
	    flex: 0 0 40px; /* 가로 크기를 고정 (40px) */
	    height: 40px; /* 세로 크기 */
	    margin-right: 10px; /* 텍스트와 간격 */
	}
	
	.profile-image {
	    width: 100%; /* 프로필 컨테이너에 맞춤 */
	    height: 100%;
	    background-color: #3498db; /* 배경색 */
	    border-radius: 50%; /* 원형 모양 */
	    display: flex; /* 중앙 정렬을 위한 flexbox */
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center; /* 세로 중앙 정렬 */
	}
	
	.status-indicator {
	    position: absolute; /* 프로필 이미지 위에 겹쳐지도록 설정 */
	    width: 12px; /* 상태 표시 크기 */
	    height: 12px;
	    background-color: #28a745; /* 초록색 (온라인 상태) */
	    border-radius: 50%; /* 원형 모양 */
	    bottom: 2px; /* 프로필 이미지의 아래쪽 여백 */
	    right: 2px; /* 프로필 이미지의 오른쪽 여백 */
	    border: 2px solid #ffffff; /* 흰색 테두리로 구분 */
	}
	
	.chat-details {
	    flex: 1; /* 가변 크기 */
	    display: flex;
	    flex-direction: column; /* 수직 정렬 */
	    overflow: hidden; /* 넘치는 내용 숨김 */
	}
	
	.chat-name {
	    font-size: 16px; /* 채팅방 이름 폰트 크기 */
	    font-weight: bold; /* 굵은 텍스트 */
	    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
	    overflow: hidden; /* 넘치는 내용 숨김 */
	    text-overflow: ellipsis; /* 말줄임표 표시 */
	    margin-bottom: 5px; /* 메시지와 간격 */
	}
	
	.chat-message {
	    font-size: 14px; /* 메시지 폰트 크기 */
	    color: #555; /* 메시지 색상 */
	    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
	    overflow: hidden; /* 넘치는 내용 숨김 */
	    text-overflow: ellipsis; /* 말줄임표 표시 */
	}



</style>

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
					<h4 class="menu-title">메신저</h4>
					<div id="profile-seachBox">
						<div id="profileBox"></div>
						<div class="form-group position-relative has-icon-left">
							<input type="text" name="username" class="form-control seachBox" placeholder="Username"/>
							<div class="form-control-icon">
								<i class="bi bi-search"></i>
							</div>
						</div>
					</div>
					<div class="btn btn-primary full-size">새로운 채팅</div>
					<div>
						<p class="chatSubject">Chat Participants</p>
						<div> <!-- 채팅방 리스트 반복으로 넣기 -->
							<div class="chat-item">
							    <div class="profile-container">
							        <div class="profile-image"></div> <!-- 프로필 이미지 -->
							    	<div class="status-indicator"></div> <!-- 상태 표시 -->
							    </div>
							    <div class="chat-details">
							    	<div class="chat-name">홍길동 사원</div> <!-- 채팅방 이름 -->
							    	<div class="chat-message">기획부서 마케팅팀</div> <!-- 최근 메시지 -->
							    </div>
							</div>
							<div class="chat-item">
							    <div class="profile-container">
							        <div class="profile-image"></div> <!-- 프로필 이미지 -->
							    	<div class="status-indicator"></div> <!-- 상태 표시 -->
							    </div>
							    <div class="chat-details">
							    	<div class="chat-name">김철수 대리</div> <!-- 채팅방 이름 -->
							    	<div class="chat-message">기획부서 마케팅팀</div> <!-- 최근 메시지 -->
							    </div>
							</div>
						</div>
					</div>
					<hr/>
					<div>
						<p class="chatSubject">Chats</p>
						<div> <!-- 채팅방 리스트 반복으로 넣기 -->
							<div class="chat-item">
							    <div class="profile-container">
							        <div class="profile-image"></div> <!-- 프로필 이미지 -->
							    	<div class="status-indicator"></div> <!-- 상태 표시 -->
							    </div>
							    <div class="chat-details">
							    	<div class="chat-name">인사팀 채팅방</div> <!-- 채팅방 이름 -->
							    	<div class="chat-message">이번 인사이동은 언제 시작하죠?</div> <!-- 최근 메시지 -->
							    </div>
							</div>
							<div class="chat-item">
							    <div class="profile-container">
							        <div class="profile-image"></div> <!-- 프로필 이미지 -->
							    	<div class="status-indicator"></div> <!-- 상태 표시 -->
							    </div>
							    <div class="chat-details">
							    	<div class="chat-name">총무팀 친구들을 위한 메신저방</div> <!-- 채팅방 이름 -->
							    	<div class="chat-message">오늘 점심 뭐먹을지 고민이네..ㅜㅜ</div> <!-- 최근 메시지 -->
							    </div>
							</div>
						</div>
					</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>채팅방 이름!</h5>
						</div>
						<div class="cont-body">  
							<div id="no-chat-box">
								<img src="/resources/img/chatIcon.png" height="100px"/><br/>
								<p id="no-chat-font">채팅을 시작해보세요</p>
							</div>
							<div id="chat-input-box">
								<textarea name="content" class="form-control chatInputText" rows="2"></textarea>
								<button class="btn btn-primary"><i class="bi bi-send"></i>&nbsp;전송</button>
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

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<script>




</script>

</html>