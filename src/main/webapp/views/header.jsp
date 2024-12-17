<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/layerPopup.js"></script>

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
	    width: 174px;
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
</style>

<header class="mb-4">
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
     			<div class="alarm-item" id="alarmBox" data-alarm-idx="562">
     				<div class="alarm-item" onclick="chatWindowSet('/chat/100')">
     					<span id="al_subject">1:1 채팅</span>
     					<span id="al_content">HH</span>
     					<span id="al_date">2024-12-03</span>
    				</div>
    				<button style="background : #fff" class="alarmclose" data-alarm-idx="562">×</button>
   				</div>
   				<div class="alarm-item" id="alarmBox" data-alarm-idx="561">
   					<div class="alarm-item" onclick="chatWindowSet('/chat/100')">
   						<span id="al_subject">1:1 채팅</span>
   						<span id="al_content">dd</span>
   						<span id="al_date">2024-12-03</span>
  					</div>
  					<button style="background : #fff" class="alarmclose" data-alarm-idx="561">×</button>
 				</div>
 				<div class="alarm-item" id="alarmBox" data-alarm-idx="560">
 					<div class="alarm-item" onclick="chatWindowSet('/chat/100')">
 						<span id="al_subject">1:1 채팅</span>
 						<span id="al_content">hh</span>
 						<span id="al_date">2024-12-03</span>
 					</div>
 					<button style="background : #fff" class="alarmclose" data-alarm-idx="560">×</button>
				</div>
				<div class="alarm-item" id="alarmBox" data-alarm-idx="536">
					<div class="alarm-item" onclick="chatWindowSet('/crewChat/open/84/45')">
						<span id="al_subject">크루 채팅</span>
						<span id="al_content">크루와 함께 Just Run!</span>
						<span id="al_date">2024-11-11</span>
					</div>
					<button style="background : #fff" class="alarmclose" data-alarm-idx="536">×</button>
				</div>
				
				
				<div class="alarm-item" id="alarmBox" data-alarm-idx="521">
					<div class="alarm-item" onclick="chatWindowSet('/crewChat/open/84/45')">
						<span id="al_subject">크루 채팅</span>
						<span id="al_content">크루와 함께 Just Run!</span>
						<span id="al_date">2024-11-11</span>
					</div>
					<button style="background : #fff" class="alarmclose" data-alarm-idx="521">×</button>
				</div>
				<div class="alarm-item" id="alarmBox" data-alarm-idx="489">
					<div class="alarm-item" onclick="chatWindowSet('/crewChat/open/84/45')">
						<span id="al_subject">크루 채팅</span>
						<span id="al_content">크루와 함께 Just Run!</span>
						<span id="al_date">2024-11-11</span>
					</div>
					<button style="background : #fff" class="alarmclose" data-alarm-idx="489">×</button>
				</div>
				<div class="alarm-item" id="alarmBox" data-alarm-idx="480">
					<div class="alarm-item" onclick="chatWindowSet('/crewChat/open/84/45')">
						<span id="al_subject">크루 채팅</span>
						<span id="al_content">크루와 함께 Just Run!</span>
						<span id="al_date">2024-11-11</span>
					</div>
					<button style="background : #fff" class="alarmclose" data-alarm-idx="480">×</button>
				</div>
				<div class="alarm-item" id="alarmBox" data-alarm-idx="448">
					<div class="alarm-item" onclick="chatWindowSet('/crewChat/open/84/45')">
						<span id="al_subject">크루 채팅</span>
						<span id="al_content">크루와 함께 Just Run!</span>
						<span id="al_date">2024-11-10</span>
					</div>
					<button style="background : #fff" class="alarmclose" data-alarm-idx="448">×</button>
				</div>

				<div class="alarm-item" id="alarmBox" data-alarm-idx="367">
					<div class="alarm-item" onclick="chatWindowSet('/crewChat/open/84/49')">
						<span id="al_subject">크루 채팅</span>
						<span id="al_content">크루 권한 테스트 크루</span>
						<span id="al_date">2024-11-08</span>
					</div>
					<button style="background : #fff" class="alarmclose" data-alarm-idx="367">×</button>
				</div>


				
			</div><!-- alarmListContent -->
			
	    </div><!-- popup-content -->
	</div><!-- alarmPopup -->










<script>
	//알림 리스트 불러오기 (20개)
	$('#alarm').on('click', function(){
		alarmListPrint();
	});
	
	function alarmListPrint(){
		$('#alarmPopup').show();
	}
	
	/* 알람 닫기 */
	$('#alarmPopup .btn-close').on('click', function(){
	    $('#alarmPopup').hide();
	});
	

	
</script>
