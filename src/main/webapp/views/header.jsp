<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" integrity="sha384-tViUnnbYAV00FLIhhi3v/dWt3Jxw4gZQcNoSCxCIFNJVCx7/D55/wXsrNIRANwdD" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
    alarmMessage.innerHTML = '<i class="bi bi-circle-fill alarm-icon-style"></i>'+ alarm.subject;

    // 메시지 표시
    alarmMessage.style.display = 'flex';
    alarmMessage.style.opacity = '1'; // 천천히 나타나기

    /* // 3초 후 메시지 천천히 사라짐
    setTimeout(function () {
        alarmMessage.style.opacity = '0'; // 점점 사라지기
        setTimeout(function () {
            alarmMessage.style.display = 'none'; // 완전히 사라진 후 숨김
        }, 1000); // 사라지는 애니메이션 지속 시간 (1초)
    }, 3000); // 알림이 유지되는 시간 (3초)
}

// 5초마다 알림 확인
setInterval(checkNewAlarms, 5000); */
</script> 
<style>
	#alarmPopup {
	    position: fixed;
	    top: 80px;
   		left: calc(50% - -384px);	
	    width: 440px;
	    border: 1px solid #ddd;
	    padding: 20px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	    z-index: 1000;
	    display: none;
	    border-radius: 10px;
	    background: #fff;
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
	
	#alarmHeader {
	    background: #fff;
	    height: 36px;
	}
	
	#alarmSubject {
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
	
	.alarm-msg {
	width: auto; /* 텍스트에 따라 유동적으로 크기 조정 */ /* 최대 너비 설정 */
    height: auto; /* 텍스트 크기에 따라 높이 조정 */
    position: absolute;
    right: 100px;
    top: 85px;
    background: #cfd8f4;
    padding: 3px 10px;
    border-radius: 3%;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    transition: opacity 1s ease-in-out;
    font-size: 16px;
    white-space: nowrap; 
	}
	
	.alarm-icon-style {
		font-size: 7px;
    	color: #ff7976;
    	display: flex;
	    align-items: center;
	    justify-content: center;
	}
</style>

<header>
    <a href="#" class="burger-btn d-block ">
        <i class="bi bi-justify fs-3 d-xl-none"></i>
    </a>
   <!--  <i class="bi bi-search"></i> -->
    <div class="input-area">
     <input type="text" name="schMenu" placeholder="메뉴 검색"/>
    </div>
    <div class="user-area">
    
     <div class="profile-area">
     	<div class="profile-img"></div>
     	<span>백종원 상무</span>
     </div>
     <div class="utils">
     	<a id="alarm">
     		<i class="bi bi-bell-fill">
      		<span class="num">6</span>
     		</i>
     	</a>
     	<a id="chat">
     		<i class="bi bi-chat-dots-fill"></i>
     	</a>
     </div>
    </div>
</header>
<div class="alarm-msg" id="alarmMessage" style="display: none;"></div>
<div id="alarmPopup" class="popup">
	    <div class="popup-content">
	        <span class="btn-close"></span> <!-- onclick="closeAlarmPopup(event)" -->
	        <div id="alarmHeader">
	        	<span id="alarmSubject">알림</span>
	        </div>
	        <div id="alarmListContent">
	        	<div class="alarm-item" id="alarmBox" data-alarm-idx="569">
	        		<div class="alarm-item" onclick="chatWindowSet('/chat/100')">
	        			<span id="al_subject">1:1 채팅</span>
	        			<span id="al_content">kuk</span>
	        			<span id="al_date">2024-12-03</span>
        			</div>
       				<button style="background : #fff" class="alarmclose" data-alarm-idx="569">×</button>
      			</div>


				
			</div><!-- alarmListContent -->
			
	    </div><!-- popup-content -->
	</div><!-- alarmPopup -->








<script src="/resources/js/common.js"></script>
<script>
	var loggedInUser = '${loggedInUser}';
	$(document).ready(function() {
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
	                $('#alarmPopup').show();
	            },
	            error: function(xhr, status, error) {
	                console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
	            }
	        });
	    });

	    $('#alarmPopup .btn-close').on('click', function() {
	        $('#alarmPopup').hide();
	    });
	});
	
	function drawAlarm(response) {
	    const alarmListContent = $('#alarmListContent');
	    alarmListContent.empty(); // 기존 내용 제거

	    if (response && response.length > 0) {
	        response.forEach(function(alarm) {
	            // 상대적 시간 계산
	            const relativeTime = getRelativeTime(alarm.create_date);


	            // 동적 HTML 생성
	            const alarmHTML = 
	                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
	                '    <div class="alarm-item">' +
	                '        <a href="' + alarm.url + '">' + // href 속성으로 URL 처리
	                '            <span id="al_subject">' + alarm.subject + '</span>' +
	                '            <span id="al_content">' + alarm.content + '</span>' +
	                '            <span id="al_date">' + relativeTime + '</span>' +
	                '        </a>' +
	                '    </div>' +
	                '    <button style="background : #fff" class="alarmclose" data-alarm-idx="' + alarm.idx + '">×</button>' +
	                '</div>';

	            alarmListContent.append(alarmHTML);
	        });
	    } else {
	        alarmListContent.append('<div class="no-alarm">새로운 알림이 없습니다.</div>');
	    }
	}

	function getRelativeTime(createDate) {
	    const now = new Date(); // 현재 시간
	    const past = new Date(createDate); // recreate_date를 Date 객체로 변환
	    const diff = Math.floor((now - past) / 1000); // 시간 차이를 초 단위로 계산

	    if (diff < 60) {
	        return diff + "초 전";
	    } else if (diff < 3600) {
	        return Math.floor(diff / 60) + "분 전";
	    } else if (diff < 86400) {
	        return Math.floor(diff / 3600) + "시간 전";
	    } else {
	        return Math.floor(diff / 86400) + "일 전";
	    }
	}


	
	
		
</script>
