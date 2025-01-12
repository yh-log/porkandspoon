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
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">


<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/chartModal.css">
<link rel="stylesheet" href="/resources/css/common.css">

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<style>
	#profile-seachBox {
		display: flex; /* 가로 정렬 */
		align-items: center; /* 세로 중앙 정렬 */
		gap: 10px; /* 요소 간 간격 */
	}
	
	#userProfile {
		width: 50px;
		height: 50px;
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
		gap: 30px;
		margin-top: 15px;
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

	/* 채팅 리스트 전체 컨테이너 */
	#userChatList {
		max-height: 250px;
		overflow-y: auto;
		height: 350px;
	}

	/* 스크롤바 스타일 */
	#userChatList::-webkit-scrollbar {
		width: 8px; /* 스크롤바 너비 */
	}

	#userChatList::-webkit-scrollbar-thumb {
		background-color: #ccc; /* 스크롤바 색상 */
		border-radius: 4px; /* 둥근 스크롤바 */
	}

	#userChatList::-webkit-scrollbar-thumb:hover {
		background-color: #aaa; /* 스크롤바 호버 색상 */
	}

	/* 전체 컨테이너 박스 */
	.custom-chat-item {
		display: flex;
		flex-direction: column;
		padding: 10px;
		margin-bottom: 5px; /* 아래쪽 마진 추가 */
		border-bottom: 1px solid #ddd; /* 아래쪽에 연한 회색 선 추가 */
		background-color: #fff; /* 기본 배경색 흰색 */
		transition: background-color 0.2s ease; /* 배경색 변경 효과 */
	}

	/* 마우스 오버 시 효과 */
	.custom-chat-item:hover {
		background-color: #eaf4ff; /* 연한 하늘색 배경 */
	}

	/* 위쪽 이름 스타일 */
	.custom-chat-name {
		font-size: 18px; /* 폰트 크기 */
		font-weight: bold; /* 굵은 텍스트 */
		color: #333; /* 텍스트 색상 */
		margin-bottom: 5px; /* 아래 내용과의 간격 */
	}

	/* 아래 메시지 스타일 */
	.custom-chat-message {
		display: flex;
		justify-content: space-between; /* 좌우로 정렬 */
		font-size: 14px; /* 폰트 크기 */
		color: #555; /* 텍스트 색상 */
		overflow: hidden; /* 넘치는 내용 숨김 */
		text-overflow: ellipsis; /* ...으로 표시 */
		white-space: nowrap; /* 한 줄로 표시 */
	}

	/* 메시지 내용 스타일 */
	.custom-chat-message span:first-child {
		flex: 1; /* 메시지가 가능한 공간을 차지 */
		margin-right: 10px; /* 시간과의 간격 */
		overflow: hidden; /* 넘치는 내용 숨김 */
		text-overflow: ellipsis; /* ...으로 표시 */
		white-space: nowrap; /* 한 줄로 표시 */
	}

	/* 메시지 시간 스타일 */
	.custom-chat-message span:last-child {
		color: #888; /* 흐린 색상 */
		font-size: 12px; /* 작은 폰트 크기 */
		text-align: right; /* 오른쪽 정렬 */
		flex-shrink: 0; /* 크기를 줄이지 않음 */
	}

	/* 전체 채팅 메시지 박스 스타일 */
	.chatMessageBox {
		display: flex;
		flex-direction: column;
		margin-bottom: 10px;
	}

	/* 보낸 메시지 박스 스타일 */
	.sendMessageBox {
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		margin: 5px 0;
	}

	/* 보낸 메시지 내용 스타일 */
	.sendMessage {
		background-color: #007bff;
		color: #fff;
		padding: 10px;
		border-radius: 10px;
		max-width: 70%;
		word-wrap: break-word;
	}

	/* 보낸 메시지 날짜 스타일 */
	.sendMessageDate {
		font-size: 12px;
		color: #888;
		margin-top: 5px;
	}

	/* 받은 메시지 박스 스타일 */
	.receiverMessageBox {
		display: flex;
		flex-direction: column;
		align-items: flex-start;
		margin: 5px 0;
	}

	/* 받은 메시지 이름 스타일 */
	.receiverName {
		font-size: 14px;
		font-weight: bold;
		color: #555;
		margin-bottom: 5px;
	}

	/* 받은 메시지 내용 스타일 */
	.receiverContent {
		background-color: #f1f1f1;
		color: #000;
		padding: 10px;
		border-radius: 10px;
		max-width: 70%;
		word-wrap: break-word;
	}

	/* 받은 메시지 날짜 스타일 */
	.receiverMessageBox .sendMessageDate {
		font-size: 12px;
		color: #888;
		margin-top: 5px;
	}

	#chatingDivBox {
		display: flex; /* Flexbox 활성화 */
		flex-direction: column; /* 세로 정렬 */
		height: 550px; /* 부모 높이 전체 사용 */
	}

	#chatOutIcon {
		display: flex;
		align-items: center; /* 세로 가운데 정렬 */
		justify-content: flex-end; /* 가로 정렬 (아이콘을 중앙에 위치) */
		margin-left: auto; /* 오른쪽 끝으로 정렬 */
		cursor: pointer; /* 마우스 포인터 변경 */
		font-size: 20px;
		color: gray;
	}

	#chatMessageDivBox {
		flex: 1; /* 나머지 공간을 차지 */
		border: 1px solid #ccc;
		padding: 10px;
		height: auto; /* 부모 컨테이너에 따라 자동 조정 */
		overflow-y: auto; /* 스크롤 활성화 */ /*overflow-y: scroll; */
		box-sizing: border-box; /* 패딩 포함 크기 계산 */
	}

	.userDeptText{
		font-size: 14px;
		color: gray;
		margin-left: 5px;
	}

	.chatUserName{
		font-weight: 700;
	}

	.chatUserEmail{
		font-size: 14px;
		color: gray;
	}

	#loading {
		height: 5px;
		background-color: transparent;
		visibility: visible;
	}

	#charRoomNameBox{
		display: flex;
		gap: 20px;
	}

	#customNameInput{
		width: 300px;
		height: 30px;
		margin-top: 18px;
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
						<div id="profileBox">
							<img src="" id="userProfile"/>
						</div>
						<div class="form-group position-relative has-icon-left">
							<div class="chatUserName">${userDTO.name} <span class="userDeptText">${userDTO.dept_name}</span> </div>
							<div class="chatUserEmail">${userDTO.email}</div>
						</div>
					</div>
					<div class="btn btn-primary full-size" id="createChatRoom" onclick="loadChartModal('chartInputModal')">새로운 채팅</div>
					<div>
					<hr/>
					<div>
						<p class="chatSubject">Chats</p>
						<div id="userChatList"> <!-- 채팅방 리스트 반복으로 넣기 -->

						</div>
					</div>
<%--						<p class="chatSubject">Chat Participants</p>--%>
<%--						<div> <!-- 채팅방 리스트 참여인원 -->--%>

<%--						</div>--%>
					</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<div id="charRoomNameBox">
								<h5 id="chatRoomName"></h5>
								<input name="custom_name" class="form-control" style="display: none;" id="customNameInput"/>
								<span id="chatUpdateBtn" style="display: none;" onclick="chatRoomNameChange()"><i class="bi bi-pencil"></i></span>
								<button class="btn btn-sm btn-outline-primary" type="button" style="display: none;" id="charRoomNameUpdate">변경</button>
							</div>
							<div id="chatOutIcon" style="display: none;">
								<i class="bi bi-box-arrow-right"></i>
							</div>
						</div>
						<div class="cont-body">

							<div id="noChatDiv" style="height: 550px; display: flex; justify-content: center; align-items: center; color: #888; font-size: 18px;">
								메신저를 시작해보세요.
							</div>

							<div id="chatingDivBox" style="display: none;">
								<div class="form-control" id="chatMessageDivBox" style="border: 1px solid #ccc; padding: 10px; height: 550px; overflow-y: auto;">
									<div id="loading"></div>
									<!-- 수신된 메시지가 여기에 추가됩니다 -->
								</div>
								<div id="chat-input-box">
									<textarea name="content" id="messageInput" class="form-control chatInputText" rows="2"></textarea>
									<button class="btn btn-primary" id="sendMessageButton"><i class="bi bi-send"></i>&nbsp;전송</button>
								</div>
							</div>

						</div>
					</div> 
				</section>
			</div>
		</div>
	</div>
	<!-- 조직도 모달 사용 시 추가 -->
	<div id="chartModalBox" class="modal" style="display: none;">
		<div class="chartModal-content"></div>
	</div>
	<input type="hidden" name="username" value="${userDTO.username}">
</body>



<script src='/resources/js/common.js'></script>
<script src='/resources/js/charjstree.js'></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>


<script>

	// CSRF 토큰 및 헤더 설정
	const csrfToken = $('meta[name="_csrf"]').attr('content');
	const csrfHeader = $('meta[name="_csrf_header"]').attr('content');

	let stompClient;

	let currentFunction;

	let chatRoomOpenValue;

	let currentRoomId = null; // 현재 열려 있는 채팅방 ID

	let currentPage = 1;
	let isLoading = false;

	$(document).ready(function(){
		// WebSocket 클라이언트 초기화
		stompClient = Stomp.over(new SockJS('/wsConnect'));

		// 페이지가 로드되면 웹 소켓 연결 진행
		stompClient.connect({}, (frame) => {
			console.log("WebSocket 연결 성공:", frame);
		});

		let userProfile = '${userDTO.new_filename}';

		if(userProfile){
			document.getElementById('userProfile').src = '/photo/' + userProfile;
		}else{
			document.getElementById('userProfile').src = '/resource/img/person.png';
		}

		participationChatList(`${userDTO.username}`);



	}); // document ready

	/* 조직도노드  */
	//초기 데이터
	const initialData = {
		headers: ['이름', '부서', '직급', '구분', '삭제'],
		rows: [
			['${userDTO.name}', '${userDTO.dept_name}', '${userDTO.position}', '<span style="color: var(--bs-primary);">참여</span>', '<div onclick="chartTableDelete(this, \'${userDTO.username}\')"><i class="bi bi-trash3" style="display: none;"></i></div>'],
		],
		footer: '<div style="display: flex; margin: 5px 10px;"> 채팅방 이름 : <input type="text" name="chatRoomName" class="form-control" style="width: 80%; margin-left: 15px;" placeholder="채팅방 이름을 입력해주세요."/></div>'
	};

	const exampleData = JSON.parse(JSON.stringify(initialData));

	// 선택된 ID를 rows에 추가하는 함수
	function addSelectedIdToRows(selectedId) {
		console.log("가져온 ID:", selectedId);

		// 초기 데이터와 현재 데이터 모두 확인
		const isAlreadyAdded = [...initialData.rows, ...exampleData.rows].some(row => {
			// row[4]에 포함된 username 값을 추출하여 비교
			const rowUsername = row[4]?.match(/'([^']+)'/); // row[4]에서 username 값 추출
			return rowUsername && rowUsername[1] === selectedId;
		});

		if (isAlreadyAdded) {
			console.log('이미 추가된 사용자입니다.');
			return; // 중복된 경우 함수 종료
		}

		let username = {'username':selectedId};

		getAjax('/chat/userAppend', 'JSON', username);
		currentFunction = 'UA';

	}

	function getSuccess(response){

		if(currentFunction === 'UA'){
			// 새로운 row 데이터 생성
			let newRow = [response.name, response.dept_name, response.position, '<span style="color: var(--bs-secondary);">미참여</span>', '<div onclick="chartTableDelete(this, \'' + response.username + '\')"><i class="bi bi-trash3"></i></div>'];

			// 기존 rows에 추가
			exampleData.rows.push(newRow);

			// 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
			updateTableData('customTable', exampleData);

		}

		if(currentFunction === 'CL') {
			console.log(response);

			// 기존 리스트 초기화
			$('#userChatList').empty();

			let content = '';
			response.forEach(function (item) {
				content += '<div class="custom-chat-item" onclick="chatRoomopen(\'' + item.roomId + '\')">';

				content += '<div class="custom-chat-name">' + item.custom_name + '</div>';
				content += '<div class="custom-chat-message">';
				content += '<span>' + item.content + '</span>';
				content += '<span>' + item.formatDate + '</span>';
				content += '</div>';
				content += '</div>';
			});
			$('#userChatList').append(content);
		}

		// 받아온 채팅 메시지 리스트
		if(currentFunction === 'ML'){
			console.log(response);



			let chatName = response[0];

			$('#chatRoomName').text(chatName.custom_name);
			console.log('방아온 정보= ',chatName.custom_name);


			let content = '';
			response.reverse();
			response.forEach(function (item){
				content += '<div class="chatMessageBox">';
				if(item.type === 'S'){
					content += '<div class="sendMessageBox">';
					content += '<div class="sendMessage">' + item.content + '</div>';
					content += '<div class="sendMessageDate">' + item.formatDate + '</div>';
					content += '</div>';
				}else{
					content += '<div class="receiverMessageBox">';
					content += '<div class="receiverName">' + item.sender + '</div>';
					content += '<div class="receiverContent">' + item.content + '</div>';
					content += '<div class="sendMessageDate">' + item.formatDate + '</div>';
					content += '</div>';
				}

				content += '</div>';
				//console.log('생성된 HTML:', content);
			})
			//$('#chatMessageDivBox').append(content);

			isLoading = false; // 메시지 로딩 완료

			// `#loading`이 없으면 추가
			if ($('#loading').length === 0) {
				$('#chatMessageDivBox').prepend('<div id="loading" style="height: 5px;"></div>');
			}

			// 채팅 메시지 상단에 삽입
			$('#chatMessageDivBox').prepend(content);
			//$('#loading').after(content);

			// 스크롤을 새로 추가된 메시지 위치로 조정
			$('#chatMessageDivBox').scrollTop($('#chatMessageDivBox')[0].scrollHeight);

		}

	}

	// 선택된 ID를 받아서 처리
	getSelectId(function (selectedId) {
		addSelectedIdToRows(selectedId);
	});

	// 선택된 username 삭제
	function chartTableDelete(element, username) {
		console.log('삭제 실행 ', username);

		// 1. 해당 버튼의 부모 tr 요소 찾기
		const row = element.closest('tr'); // 호출된 버튼을 기준으로 tr 찾기

		// 2. 행 삭제
		if (row) {
			row.remove(); // 테이블에서 해당 행 삭제
		}

		// 3. exampleData.rows에서 해당 username에 해당하는 데이터 제거
		exampleData.rows = exampleData.rows.filter(function (row) {
			return row[4].indexOf(username) === -1; // username과 일치하지 않는 데이터만 남김
		});

		// 4. 테이블 데이터 업데이트
		updateTableData('customTable', exampleData);

		console.log('삭제 완료!');
	}


	$(document).on('click', '#addModal', function () {
		console.log("등록 버튼 클릭됨!");

		// 원하는 동작 수행
		const roomName = $('input[name="chatRoomName"]').val();
		const username = $('input[name="username"]').val();

		console.log(roomName, '룸 네임은 ');

		// 1. 채팅 룸 생성 (id 리턴)
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
					//$('#chatRoomIdInput').val(room.roomId);
					userJoinRoom(room.roomId);
				} else {
					alert("채팅방 생성 성공했지만 roomId를 찾을 수 없습니다.");
				}
			},
			error: function (xhr) {
				console.error("채팅방 생성 실패:", xhr.status, xhr.responseText);
			}
		});
	});

	// 2. 받은 아이디로 조직도에 포함된 인원 구독 진행
	function userJoinRoom(roomId){
		console.log('룸 아이디 => ', roomId);

		// 새롭게 추가된 사용자 찾기
		const newRows = exampleData.rows.filter(row => {
			return !initialData.rows.some(initialRow => initialRow[0] === row[0]); // 이름(username)을 기준으로 비교
		});

		console.log("새롭게 추가된 사용자 행:", newRows);

		// 새롭게 추가된 사용자들의 username만 추출
		const newUsernames = newRows.map(row => {
			// `row[4]`에서 username 추출
			const usernameMatch = row[4]?.match(/'([^']+)'/); // onclick 속성에서 username 추출
			return usernameMatch ? usernameMatch[1] : null;
		}).filter(username => username !== null); // null 값 제거

		console.log("새롭게 추가된 사용자들의 username:", newUsernames);

		if (newUsernames.length === 0) {
			console.log("새롭게 추가된 사용자가 없습니다.");
			return;
		}

		// 새롭게 추가된 사용자 정보를 DB에 저장
		$.ajax({
			url: '/chat/saveUsersToRoom',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify({ roomId, usernames: newUsernames }),
			beforeSend: function (xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 추가
			},
			success: function (response) {
				console.log("사용자 저장 성공:", response);
				if(response.status === 200){
					// 모달 닫기
					const modal = document.querySelector("#chartModalBox");
					modal.style.display = "none";
					resetTableData();
					const username = $('input[name="username"]').val();
					participationChatList(username);
				}else{
					layerPopup(response.message, '확인', false, removeAlert, removeAlert);
				}

			},
			error: function (xhr) {
				console.error("사용자 저장 실패:", xhr.status, xhr.responseText);
			}
		});

	}

	// 참여하는 채팅방 리스트 조회
	function participationChatList(usernameId){
		console.log('로딩될 때 받은 유저네임 !! ', usernameId);

		const username = {'username' : usernameId};
		getAjax('/chat/userRoomList', 'JSON', username);
		currentFunction = 'CL';
	}

	// 채팅방 열기 함수
	function chatRoomopen(roomId) {
		console.log('채팅 룸 아이디 => ', roomId);

		if (currentRoomId === roomId) {
			return;
		}

		// 기존 채팅방 내용 비우기
		$('#chatMessageDivBox').empty();

		// 채팅 UI 토글
		$('#noChatDiv').hide(); // "채팅이 없습니다" 메시지 숨기기
		$('#chatingDivBox').show(); // 채팅 UI 보이기
		$('#chatOutIcon').show();
		$('#chatUpdateBtn').show();

		// 현재 열려 있는 채팅방 ID 갱신
		currentRoomId = roomId;

		//chatRoomOpenValue = roomId;

		// WebSocket을 통한 구독 요청
		stompClient.subscribe('/sub/chat/' + roomId, function (message) {
			const receivedMessage = JSON.parse(message.body);
			console.log("수신 메시지:", receivedMessage);

			// 보낸 사람이 나인지 상대방인지 확인
			const isSender = receivedMessage.username === '${userDTO.username}';

			// 메시지 화면에 추가 (서버에서 저장 실행)
			if (isSender) {
				// 내가 보낸 메시지 (Send)
				$('#chatMessageDivBox').append(
						'<div class="chatMessageBox">' +
						'<div class="sendMessageBox">' +
						'<div class="sendMessage">' + receivedMessage.content + '</div>' +
						'<div class="sendMessageDate">' + new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) + '</div>' +
						'</div>' +
						'</div>'
				);
			} else {
				// 상대방이 보낸 메시지 (Receive)
				$('#chatMessageDivBox').append(
						'<div class="chatMessageBox">' +
						'<div class="receiverMessageBox">' +
						'<div class="receiverName">' + receivedMessage.username + '</div>' +
						'<div class="receiverContent">' + receivedMessage.content + '</div>' +
						'<div class="sendMessageDate">' + new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }) + '</div>' +
						'</div>' +
						'</div>'
				);
			}

			$('#chatMessageDivBox').scrollTop($('#chatMessageDivBox')[0].scrollHeight);

		});

		// AJAX 요청으로 기존 메시지 로드
		loadChatMessages(roomId);
	}


	$('#sendMessageButton').on('click', function(){
		console.log('실행!');
		const username = '${userDTO.username}';
		const content = $('#messageInput').val();
		const roomId = currentRoomId;

		console.log('직원 아이디 => ', username);

		if (!content.trim()) {
			layerPopup("메시지를 입력해주세요", '확인', false, removeAlert, removeAlert)
			return;
		}

		// 메시지 발송
		stompClient.send('/pub/chat/message/'+roomId, {}, JSON.stringify({
			username: username,
			content: content
		}));

		console.log('메시지 발송: roomId => ,' , roomId , ' content => ', content);
		$('#messageInput').val('');

		participationChatList(username);

	});





	// 채팅 메시지 조회
	function loadChatMessages(roomId, pages = 1){

		console.log('여기서 증가한 페이지는? ', currentPage);

		console.log('메시지 요청 ', roomId);
		console.log('페이지는 ', pages);

		// 페이지 같이 넘겨야 함!

		let chatDTO = {'username' : '${userDTO.username}', 'roomId' : roomId, 'page' : pages};
		getAjax('/chat/messages/' + roomId, 'JSON', chatDTO)
		currentFunction = 'ML';
	}

	$('#chatOutIcon').on('click', function (){
		const roomId = chatRoomOpenValue;
		const username = '${userDTO.username}';

		let chatDTO = {'roomId' : roomId, 'username' : username};
		httpAjax('DELETE', '/chat/roomDelete', chatDTO);

		// 채팅 UI 숨기기
		$('#chatingDivBox').hide();
		$('#noChatDiv').show(); // "채팅이 없습니다" 메시지 표시

		// 현재 열려 있는 채팅방 ID 초기화
		currentRoomId = null;

		// 채팅 내용 비우기
		$('#chatMessageDivBox').empty();

	});

	const observer = new IntersectionObserver(function (entries){
		console.log('감지된1');
		if(entries[0].isIntersecting && !isLoading){
			console.log('감지된2');
			isLoading = true;
			currentPage++;
			loadChatMessages(currentRoomId, currentPage);
		}
	}, {
		root: document.querySelector('#chatMessageDivBox'), // 스크롤 컨테이너 지정
		threshold: 0.1 // 완전히 보일 때 실행
	}); // 완전히 보일 때 실행

	const loadTrigger = document.querySelector('#loading');
	if (loadTrigger) {
		observer.observe(loadTrigger); // 로딩 트리거 요소에 감지 기능 추가
	} else {
		console.error('#loading 요소를 찾을 수 없습니다.');
	}


	// 스크롤 이벤트로 추가 감지
	$('#chatMessageDivBox').on('scroll', function () {
		if ($(this).scrollTop() === 0 && !isLoading) { // 스크롤 상단 감지
			console.log('스크롤 상단 감지');
			isLoading = true;
			currentPage++;
			loadChatMessages(currentRoomId, currentPage);
		}
	});

	// `#loading` 위치 보장
	if ($('#loading').length === 0) {
		$('#chatMessageDivBox').prepend('<div id="loading" style="height: 1px;"></div>');
	}


	function chatRoomNameChange() {

		console.log('채팅방 이름 변경 클릭');
		$('#chatRoomName').hide();
		$('#customNameInput').show();
		$('#chatUpdateBtn').hide();
		$('#charRoomNameUpdate').show();

	}

	$('#charRoomNameUpdate').on('click', function(){
		console.log('채팅방 이름 변경 클릭');

		const csrfToken = document.querySelector('meta[name="_csrf"]').content;
		const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;


		const username = $('input[name="username"]').val();
		const custom_name = $('input[name="custom_name"]').val();
		const chatDTO = {'roomId': currentRoomId , 'username' : username, 'custom_name' : custom_name};

		$.ajax({
			type: 'PUT',
			url: '/chat/roomNameChange',
			data: chatDTO,
			dataType: 'JSON',
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			},
			success: function (response){
				console.log('성공', response);
				if(response.status === 200){
					// 성공 후 리스트 재로드 필요
					layerPopup(response.message, '확인', false, removeAlert, removeAlert);
					participationChatList(`${userDTO.username}`);
					$('#chatRoomName').show();
					$('#customNameInput').hide();
					$('#chatUpdateBtn').show();
					$('#charRoomNameUpdate').hide();

				}else{
					layerPopup(response.message, '확인', false, removeAlert, removeAlert);
				}
			},error: function (e){
				console.log('이름 변경 중 에러 => ', e);
			}

		});


	})

</script>

</html>