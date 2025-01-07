<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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

	// 메시지 표시
	alarmMessage.style.display = 'flex';
	alarmMessage.style.opacity = '1';  // 천천히 나타나기
}
    // 3초 후 메시지 천천히 사라짐
    /* setTimeout(function () {
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
    	border: 1px solid #ddd;
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
      		<span class="num"></span>
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
        	<span id="alarmSubjectaa">알림</span>
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
			<div id="alarmHeaderdd"><span id="alarmSubject">알림</span></div>
		</div>
		<div class="col-sm-1"><span class="btn-close" style="position: absolute; font-size: 16px; margin-left: 30px; cursor: pointer;"></span></div>
	</div>

	<div class="col-12 col-lg-12 row">
		<div class="col-sm-6">
			<div class="unreadAlarm">안읽은 알림</div>
		</div>
		<div class="col-sm-6">
			<div class="readAlarm">읽은 알림</div>
		</div>
	</div>
	<div class="col-12 col-lg-12 row">
		<div class="col-sm-6">
			<div class="unAlarmList">
			
           </div>
		</div>
		<div class="col-sm-6">
			<div class="readAlarmList">
				
			</div>
		</div>
	</div>
</div>







<script src="/resources/js/common.js"></script>
<script>
	var loggedInUser = '${loggedInUser}';
	$(document).ready(function() {

		 const url = '/getAlarmList';
		 const data = {username: loggedInUser};
		 $.ajax({
		        type: 'GET',
		        url: url,
		        data: data,
		        datatype: 'JSON',
		        success: function(response) {
		            const unreadCount = response.filter(alarm => alarm.is_url === 'N').length;
		            const alarmIcon = $('#alarm .num');
		            if (unreadCount > 0) {
		                if (alarmIcon.length === 0) {
		                    $('#alarm i').append('<span class="num">' + (unreadCount > 9 ? '9+' : unreadCount) + '</span>');
		                } else {
		                    alarmIcon.text(unreadCount > 9 ? '9+' : unreadCount).show();
		                }
		            } else {
		                alarmIcon.remove(); // 'N' 알람이 없을 경우 span 제거
		            }
		        },
		        error: function(xhr, status, error) {
		            console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
		        }
		    });







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

	    const filteredAlarms = response.filter(alarm => alarm.is_url === 'N');

	    if (filteredAlarms.length > 0) {
	        // 필터링된 알람이 있을 때만 렌더링
	        filteredAlarms.forEach(function(alarm) {
	            const relativeTime = getRelativeTime(alarm.create_date);

	            const alarmHTML = 
	                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
	                '    <div class="alarm-item">' +
	                '        <a onclick="deleteAlarm2(' + alarm.alarm_idx + ')" href="' + alarm.url + '">' +
	                '            <span id="al_content">' + alarm.content + '</span>' +
	                '            <span id="al_date">' + relativeTime + '</span>' +
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
		            }
					$('[data-alarm-idx="' + data + '"]').remove();

	                // 알림 개수 업데이트
	                const alarmIcon = $('#alarm .num');
	                let currentCount = parseInt(alarmIcon.text().replace('+', ''), 10); // 9+ 처리 대비
	
	                if (currentCount > 1) {
	                    currentCount--; // 알람 1 감소
	                    if (currentCount > 9) {
	                        alarmIcon.text('9+'); // 10개 이상이면 9+ 표시
	                    } else {
	                        alarmIcon.text(currentCount); // 9개 이하일 때 실제 수 표시
	                    }
	                } else {
	                    alarmIcon.remove(); // 알람이 0개면 <span> 제거
	                }
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
		            const relativeTime = getRelativeTime(alarm.create_date);
		            const alarmHTML = 
		                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
		                '    <div class="alarm-item">' +
		                '        <a href="' + alarm.url + '" onclick="deleteAlarm2(' + alarm.alarm_idx + ')">' +
		                '            <span id="al_content">' + alarm.content + '</span>' +
		                '            <span id="al_date">' + relativeTime + '</span>' +
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
		            const relativeTime = getRelativeTime(alarm.create_date);
		            const alarmHTML = 
		                '<div class="alarm-item" id="alarmBox" data-alarm-idx="' + alarm.idx + '">' +
		                '    <div class="alarm-item">' +
		                '        <a href="' + alarm.url + '" onclick="deleteAlarm2(' + alarm.alarm_idx + ')">' +
		                '            <span id="al_content">' + alarm.content + '</span>' +
		                '            <span id="al_date">' + relativeTime + '</span>' +
		                '        </a>' +
		                '    </div>' +
		                '    <button style="background: #fff" class="alarmclose" onclick="deleteAlarm(' + alarm.alarm_idx + ')" data-alarm-idx="' + alarm.idx + '">×</button>' +
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
	
	

	


		
</script>
