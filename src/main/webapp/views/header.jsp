<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		$(document).on('click','li.has-sub > a',function(){
			console.log('click!!');
			$(this).siblings('.submenu').toggleClass('submenu-open submenu-close');
		});
	});
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" integrity="sha384-tViUnnbYAV00FLIhhi3v/dWt3Jxw4gZQcNoSCxCIFNJVCx7/D55/wXsrNIRANwdD" crossorigin="anonymous">


<sec:authentication var="loggedInUser" property="principal.username" />
<script>
	function checkNewAlarms() {
	    var loggedInUser = '${loggedInUser}';
	
	    if (!loggedInUser) {
	        console.warn('로그인 정보가 없습니다.');
	        return;
	    }
	
	   fetch('/getAlarm/' + encodeURIComponent(loggedInUser), {
	        method: 'GET',
	        headers: { 'Content-Type': 'application/json' }
	    })
	    .then(response => response.json())
	    .then(alarms => {
	        if (alarms.length > 0) {
	            alarms.forEach(alarm => {
	                displayAlarmMessage(alarm);
	            });
	        }
	    })
	    .catch(error => console.error('알림 조회 실패:', error));
	}
	
	function displayAlarmMessage(alarm) {
		var alarmMessage = document.getElementById('alarmMessage');
		alarmMessage.innerHTML = '<i class="bi bi-circle-fill alarm-icon-style"></i>' + alarm.subject;
		updateAlarmCount();
		// 메시지 표시
		alarmMessage.style.display = 'flex';
	    setTimeout(function () {
	        alarmMessage.style.opacity = '1';  // 천천히 나타나기
	    }, 10);
	    // 3초 후 메시지 천천히 사라짐
	    setTimeout(function () {
	        alarmMessage.style.opacity = '0'; // 점점 사라지기
	        setTimeout(function () {
	            alarmMessage.style.display = 'none'; // 완전히 사라진 후 숨김
	        }, 1000); // 사라지는 애니메이션 지속 시간 (1초)
	    }, 3000); // 알림이 유지되는 시간 (3초)
	}


	// 5초마다 알림 확인
	setInterval(checkNewAlarms, 3000);
</script> 
<style>
	#alarmPopup {
	    position: fixed;
	    top: 80px;
   		right: 128px;	
	    width: 440px;
	    border: 1px solid #ddd;
	    padding: 20px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    z-index: 1000;
	    display: none;
	    border-radius: 10px;
	    background: #fff;
	}
	
	.chatPopup {
	    position: fixed;
	    top: 80px;
   		right: 71px;	
	    width: 440px;
	    border: 1px solid #ddd;
	    padding: 20px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    z-index: 1000;
	    display: none;
	    border-radius: 10px;
	    background: #fff;
	}
	
	.chatPopup .popup-content {
	    position: relative;
	}
	
	.chatPopup .btn-close {
	    position: absolute;
	    top: 0px;
	    right: 0px;
	    font-size: 14px;
	    cursor: pointer;
	}
	
	#chatListContent {
	    max-height: 300px; /* 고정된 높이 설정 */
	    overflow-y: auto; /* 스크롤바 표시 */
	    background: #fff;
	    border-radius: 10px;
	    padding-right: 10px;
	    margin: 3px;
	    width: 100%;
	    overflow-x: hidden; /* 가로 스크롤 숨기기 */
	}
	
	#alarmPopup .popup-content {
	    position: relative;
	}
	
	#alarmPopup .btn-close {
	    position: absolute;
	    top: 0px;
	    right: 0px;
	    font-size: 14px;
	    cursor: pointer;
	}
	
	.alarmHeader {
	    background: #fff;
	    height: 36px;
	}
	
	.alarmSubject {
	    font-weight: 600;
	    font-size: 20px;
	}
	
	#alarmInfo {
	    font-size: 14px;
	    color: gray;
	    margin-left: 38%;
	}
	
	#alarmListContent {
	    max-height: 300px; /* 고정된 높이 설정 */
	    overflow-y: auto; /* 스크롤바 표시 */
	    background: #fff;
	    border-radius: 10px;
	    padding-right: 10px;
	    margin: 3px;
	    width: 100%;
	    overflow-x: hidden; /* 가로 스크롤 숨기기 */
	}
	
	#alarmBox {
	    background: #fff;
	    width: 100%;
	    padding: 7px 6px 7px 10px ;
	    border-bottom: 1px solid #e5e5e5;
	    position: relative; /* 자식 요소가 절대 위치로 고정될 수 있도록 설정 */
	}
	
	#al_subject{
		font-weight: 600;
	    font-size: 15px;
        width: 70px;
	}
	
	#al_content{
		font-size: 14px;
		display: inline-block;
		white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
	    overflow: hidden; /* 넘치는 부분을 숨김 */
	    text-overflow: ellipsis; /* 잘린 부분에 "..."을 표시 */
	    width: 272px;
	}
	
	#al_date{
		font-size: 13px;
   		color: darkgray;
   		float: right;
   		margin-left: 6px;
	}
	
	.alarmclose{
	    font-size: 20px;
	    cursor: pointer;
	    color: #888; /* 닫기 아이콘 색상 */
	    border: none;
	    transform: translateY(-2px);
        margin-left: 8px;
	}
	
	.alarm-item {
	    position: relative;
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
        width: calc(100% - 30px);
	}
	
	#alarmPopup * {
	    pointer-events: auto;
	}
	
	.red-one {
		position: absolute;
	    right: -4px;
	    top: 5px;
	    background: #ff7976;
	    color: #fff;
	    border-radius: 50%;
	    width: 13px;
	    height: 13px;
	    font-size: 11px;
	    text-align: center;
	}
	.alarm-msg {
		width: auto; /* 텍스트에 따라 유동적으로 크기 조정 */ /* 최대 너비 설정 */
	    height: 50px; /* 텍스트 크기에 따라 높이 조정 */
	    position: absolute;
	    right: 100px;
	    top: 85px;
	    background: white;
	    padding: 3px 10px;
	    border-radius: 3%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    opacity: 0;
	    transition: opacity 1s ease-in-out;
	    font-size: 16px;
	    font-weight: bold;
	    white-space: nowrap; 
	    border: 1px solid #bbbbb;
	    z-index: 1000;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}
	
	.alarm-icon-style {
		font-size: 7px;
    	color: #ff7976;
    	display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.allAlarm {
		position: fixed;
    	width: 800px;
    	background: white;
    	padding: 20px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    border-radius: 10px;
	    z-index: 1000;
	    display: none;
        top: 80px;
    	right: 128px;
    	border: 1px solid #e5e5e5;
	}
	
	.unAlarmList {
	    height: 500px;
	    overflow: auto;
	    padding: 3px;
    	margin: 3px;
	}
	
	.readAlarmList {
	    height: 500px;
	    overflow: auto;
	    padding: 3px;
    	margin: 3px;
	}
	
	#chat .num {
	    position: absolute;
	    right: -4px;
	    top: 5px;
	    background: #ff7976;
	    color: #fff;
	    border-radius: 50%;
	    width: 13px;
	    height: 13px;
	    font-size: 11px;
	    text-align: center;
    }
    
</style>

<header>
    <a href="#" class="burger-btn d-block ">
        <i class="bi bi-justify fs-3 d-xl-none"></i>
    </a>
   <!--  <i class="bi bi-search"></i> -->
    <div class="input-area">
     	<!-- <input type="text" name="schMenu" placeholder="메뉴 검색"/> -->
    </div>
    <div class="user-area">
    
     <div class="profile-area" onclick="location.href='/myPageView'">
     	<div class="profile-img"></div>
     	<span class="name"></span>
     </div>
     <div class="utils">
     	<a id="alarm">
     		<i class="bi bi-bell-fill">
      			<span class="num"></span>
     		</i>
     	</a>
     	<a id="chat">
     		<i class="bi bi-chat-dots-fill" style="position: relative;">
     			<span class="num"></span>
     		</i>
     	</a>
     	
 		   <button id="logout">
     		   <i class="bi bi-door-closed-fill" style="position: relative;"></i>
     	   </button>
     </div>
    </div>
</header>
<div class="alarm-msg" id="alarmMessage" style="display: none;"></div>
<div id="alarmPopup" class="popup">
    <div class="popup-content">
        <span class="btn-close"></span> <!-- onclick="closeAlarmPopup(event)" -->
        <div class="alarmHeader">
        	<span class="alarmSubject">알림</span>
        </div>
        <div id="alarmListContent">

		</div><!-- alarmListContent -->
		<div style="text-align: right;">
       		<span class="allView" style="color: gray; font-size: 13px; cursor: pointer;" >전체보기</span>
		</div>
    </div><!-- popup-content -->
</div><!-- alarmPopup -->

<div class="allAlarm">
	<div class="col-12 col-lg-12 row">
		<div class="col-sm-11">
			<div class="alarmHeader"><span class="alarmSubject">알림</span></div>
		</div>
		<div class="col-sm-1"><span class="btn-close" style="position: absolute; font-size: 16px; margin-left: 52px; cursor: pointer;"></span></div>
	</div>

	<div class="col-12 col-lg-12 row">
		<div class="col-sm-6">
			<div class="unreadAlarm" style="margin: 0 0 0 3px">안읽은 알림</div>
		</div>
		<div class="col-sm-6">
			<div class="readAlarm">읽은 알림</div>
		</div>
	</div>
	<div class="col-12 col-lg-12 row">
		<div class="col-sm-6">
			<div class="unAlarmList" style="border: 1px solid #bbbbbb; border-radius: 3px;">
			
           </div>
		</div>
		<div class="col-sm-6">
			<div class="readAlarmList" style="border: 1px solid #bbbbbb; border-radius: 3px;">
				
			</div>
		</div>
	</div>
</div>

<div class="chatPopup" class="popup">
    <div class="popup-content">
        <span class="btn-close"></span> <!-- onclick="closeAlarmPopup(event)" -->
        <div class="alarmHeader">
        	<span class="alarmSubject">채팅</span>
        </div>
        <div id="chatListContent">

		</div><!-- alarmListContent -->
    </div><!-- popup-content -->
</div><!-- alarmPopup -->





<script src="/resources/js/common.js"></script>
<script>
	/* 사용자 정보 */
	$.ajax({
        type: 'GET',
        url: '/header',
        data: {},
        dataType: 'JSON',
        success: function(response) {
            console.log("[[[[헤더]]]] response.userInfo:: ",response.userInfo);
            var info = response.userInfo;
            $('.profile-area .name').text(info.name + info.position_content);
            if(info.profile != null){
	            $('.profile-area .profile-img').css('background','url(\'/photo/'+info.profile+'\') no-repeat top center/cover');
            }else{
	            $('.profile-area .profile-img').css('background','url(/resources/img/common/user_default.png) no-repeat top center/cover');
            }
        },
        error: function(xhr, status, error) {
            console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
        }
    });

	/* 알림 */
	var loggedInUser = '${loggedInUser}';
	$(document).ready(function() {
		updateAlarmCount();
	});
	
	// 알림 갯수 가져오기
	function updateAlarmCount() {
	    const url = '/getAlarmrow';
	    const data = {username: loggedInUser};

	    $.ajax({
	        type: 'GET',
	        url: url,
	        data: data,
	        dataType: 'JSON',
	        success: function(response) {
	            const count = response.arow; 
	            const Ccount = response.crow;  
	            const $alarmNum = $('#alarm .num');
	            const $CNum = $('#chat .num');

	            // 알림 수 표시 로직
	            if (count > 9) {
	                $alarmNum.text('9+').show();
	            } else if (count > 0) {
	                $alarmNum.text(count).show();
	            } else {
	                $alarmNum.hide();  // 알림이 없을 때 span 숨기기
	            }
	            
	            if (Ccount > 9) {
	                $CNum.text('9+').show();
	            } else if (Ccount > 0) {
	                $CNum.text(Ccount).show();
	            } else {
	                $CNum.hide();  // 알림이 없을 때 span 숨기기
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
	        }
	    });
	}
	
	
	// 알림 클릭하면 리스트 가져오기
    $('#alarm').on('click', function() {
    	const url = '/getAlarmList';
    	const data = {username: loggedInUser};
    	$.ajax({
            type: 'GET',
            url: url,
            data: data,
            datatype: 'JSON',
            success: function(response) {
                drawAlarm(response);
                $('.chatPopup').hide();
                $('.allAlarm').hide();
                $('#alarmPopup').show();
            },
            error: function(xhr, status, error) {
                console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
            }
        });
    });

	// 모달창 닫기
    $('#alarmPopup .btn-close').on('click', function() {
        $('#alarmPopup').hide();
    });
	
	
	
	
	
	function drawAlarm(response) {
	    const alarmListContent = $('#alarmListContent');
	    
	    alarmListContent.empty(); // 기존 내용 제거

	    const filteredAlarms = response.filter(alarm => alarm.is_url === 'N');

	    if (filteredAlarms.length > 0) {
	        // 필터링된 알람이 있을 때만 렌더링
	        filteredAlarms.forEach(function(alarm) {

	            const alarmHTML = 
	                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
	                '    <div class="alarm-item">' +
	                '        <a onclick="deleteAlarm2(' + alarm.alarm_idx + ')" href="' + alarm.url + '">' +
	                '            <span id="al_content">' + '<i class="bi bi-circle-fill" style="font-size: 8px; vertical-align: middle; color: #ff7976; margin-right: 5px;"></i>' +alarm.content + '</span>' +
	                '        </a>' +
	                '    </div>' +
	                '    <button style="background: #fff" class="alarmclose" onclick="deleteAlarm(' + alarm.alarm_idx + ')" data-alarm-idx="' + alarm.idx + '">×</button>' +
	                '</div>';
	            alarmListContent.append(alarmHTML);
	        });
	    } else {
	        // 'N'인 알람이 없을 때 메시지 표시
	        alarmListContent.append('<div class="no-alarm">새로운 알림이 없습니다.</div>');
	    }
	}
	
	

	
	function deleteAlarm(data) {
		const url = '/updateIsurl';
		const params = {alarm_idx: data};
		var csrfToken = document.querySelector('meta[name="_csrf"]').content;
	    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

	    $.ajax({
	        type : 'POST',
	        url : url,
	        data : params,
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	if(response.status === 200) {
					console.log('성공');	        		
					if ($('#alarmPopup').is(':visible')) {
		                $('#alarm').trigger('click'); // 알림 팝업일 경우
		            } else if ($('.allAlarm').is(':visible')) {
		                $('.allView').trigger('click'); // 전체보기 팝업일 경우
		            } else if ($('.chatPopup').is(':visible')) {
		            	$('#chat').trigger('click');
		            }
					$('[data-alarm-idx="' + data + '"]').remove();
					
					updateAlarmCount();
	               
		        	}
	        },error: function(e){
	            console.log(e);
	        }
	    });
    }
	
	function deleteAlarm2(data) {
		const url = '/updateIsurl';
		const params = {alarm_idx: data};
		var csrfToken = document.querySelector('meta[name="_csrf"]').content;
	    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

	    $.ajax({
	        type : 'POST',
	        url : url,
	        data : params,
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	if(response.status === 200) {
					console.log('성공');	  
	        	}
	        },error: function(e){
	            console.log(e);
	        }
	    });
    }
	
	$(document).on('click', '.allView', function() {
	    const url = '/getAlarmList';
	    const data = {username: loggedInUser};
	    $.ajax({
	        type: 'GET',
	        url: url,
	        data: data,
	        success: function(response) {
	            $('#alarmPopup').hide();
	            $('.allAlarm').show();
	            drawAlarms(response);
	        },
	        error: function(xhr, status, error) {
	            console.error("데이터 불러오기 실패:", error);
	        }
	    });
	    
	    
	    function drawAlarms(response) {
		    const unreadAlarmList = $('.unAlarmList');
		    const readAlarmList = $('.readAlarmList');
		    
		    // 알람 리스트 비우기
		    unreadAlarmList.empty();
		    readAlarmList.empty();

		    // 알람을 각각 분류
		    const unreadAlarms = response.filter(function(alarm) { return alarm.is_url === 'N'; });
		    const readAlarms = response.filter(function(alarm) { return alarm.is_url === 'Y'; });

		    // 안읽은 알람 렌더링
		    if (unreadAlarms.length > 0) {
		        unreadAlarms.forEach(function(alarm) {
		            const alarmHTML = 
		                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
		                '    <div class="alarm-item">' +
		                '        <a href="' + alarm.url + '" onclick="deleteAlarm2(' + alarm.alarm_idx + ')">' +
		                '            <span id="al_content">' + '<i class="bi bi-circle-fill" style="font-size: 8px; vertical-align: middle; color: #ff7976; margin-right: 5px;"></i>' + alarm.content + '</span>' +
		                '        </a>' +
		                '    </div>' +
		                '    <button style="background: #fff" class="alarmclose" onclick="deleteAlarm(' + alarm.alarm_idx + ')" data-alarm-idx="' + alarm.idx + '">×</button>' +
		                '</div>';
		            unreadAlarmList.append(alarmHTML);
		        });
		    } else {
		        unreadAlarmList.append('<div class="no-alarm">새로운 알림이 없습니다.</div>');
		    }

		    // 읽은 알람 렌더링
		    if (readAlarms.length > 0) {
		        readAlarms.forEach(function(alarm) {
		            const alarmHTML = 
		                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
		                '    <div class="alarm-item">' +
		                '        <a href="' + alarm.url + '" onclick="deleteAlarm2(' + alarm.alarm_idx + ')">' +
		                '            <span id="al_content">' + alarm.content + '</span>' +
		                '        </a>' +
		                '    </div>' +
		                '</div>';
		            readAlarmList.append(alarmHTML);
		        });
		    } else {
		        readAlarmList.append('<div class="no-alarm">읽은 알림이 없습니다.</div>');
		    }
		}
	    
	    $('.allAlarm .btn-close').on('click', function() {
	        $('.allAlarm').hide();
	    });
	    
	});
	
	$('#chat').on('click', function () {
		const url = '/getChatList';
    	const data = {username: loggedInUser};
    	$.ajax({
            type: 'GET',
            url: url,
            data: data,
            datatype: 'JSON',
            success: function(response) {
                $('#alarmPopup').hide();
        		$('.allAlarm').hide();
        		$('.chatPopup').show();
                drawChat(response);
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
            }
        });
	});

	$('.chatPopup .btn-close').on('click', function() {
        $('.chatPopup').hide();
    });

	function drawChat(response) {
	    const alarmListContent = $('#chatListContent');
	    
	    alarmListContent.empty(); // 기존 내용 제거

	    const filteredAlarms = response.filter(alarm => alarm.is_url === 'N');

	    if (filteredAlarms.length > 0) {
	        // 필터링된 알람이 있을 때만 렌더링
	        filteredAlarms.forEach(function(alarm) {

	            const alarmHTML = 
	                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
	                '    <div class="alarm-item">' +
	                '        <a onclick="deleteAlarm2(' + alarm.alarm_idx + ')" href="' + alarm.url + '">' +
	                '            <span id="al_content">' + '<i class="bi bi-circle-fill" style="font-size: 8px; vertical-align: middle; color: #ff7976; margin-right: 5px;"></i>' + alarm.subject + '  ' + alarm.content + '</span>' +
	                '        </a>' +
	                '    </div>' +
	                '    <button style="background: #fff" class="alarmclose" onclick="deleteAlarm(' + alarm.alarm_idx + ')" data-alarm-idx="' + alarm.idx + '">×</button>' +
	                '</div>';
	            alarmListContent.append(alarmHTML);
	        });
	    } else {
	        // 'N'인 알람이 없을 때 메시지 표시
	        alarmListContent.append('<div class="no-alarm">새로운 알림이 없습니다.</div>');
	    }
	}

	document.getElementById('logout').addEventListener('click', function() {
        var csrfParameterName = '${_csrf.parameterName}';
        var csrfToken = '${_csrf.token}';

        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/logout';

        var hiddenCsrfInput = document.createElement('input');
        hiddenCsrfInput.type = 'hidden';
        hiddenCsrfInput.name = csrfParameterName;
        hiddenCsrfInput.value = csrfToken;

        form.appendChild(hiddenCsrfInput);
        document.body.appendChild(form);
        form.submit();
    });
		
</script>
