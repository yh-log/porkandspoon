<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- FullCalendar -->
<script src='/resources/js/calender/main.js'></script>
<script src='/resources/js/calender/daygridmain.js'></script>
<script src='/resources/js/calender/interactionmain.js'></script>
<script src='/resources/js/calender/timemain.js'></script>

<link href='/resources/css/calender/main.css' rel='stylesheet' />
<link href='/resources/css/calender/daygridmain.css' rel='stylesheet' />
<link href='/resources/css/calender/timemain.css' rel='stylesheet' />

<!-- CSS -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<style>
  #calendarBox {
    width: 100%;
    max-width: 900px;
    margin: 0 auto;
    padding: 0 15px;
    box-sizing: border-box;
    position: relative;
  }

  #calender {
    width: 100%;
    height: auto;
  }

  .select {
    width: auto;
    position: absolute;
    right: 15px;
    margin-bottom: 10px;
     z-index: 10; /* z-index로 다른 요소 위로 올리기 */
  }

 .fc-event {
    background-color: transparent !important; /* 배경색 투명 */
    border: none !important; /* 테두리 제거 */
    color: black !important; /* 글자색 검정 */
    font-size: 14px; /* 글자 크기 */
    white-space: pre-wrap; /* 줄바꿈 허용 */
    text-align: center !important; /* 가로 중앙 정렬 */
    line-height: 1.5; /* 줄 간격 */
    display: flex; /* 플렉스박스 사용 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
}
	
	.fc-daygrid-event .fc-event-title {
	    color: black !important; /* 제목 글자색 검정 */
	}
	
	.fc-daygrid-event:hover {
	    background-color: transparent !important; /* 호버 시에도 배경 투명 */
	    color: black !important; /* 호버 시 글자색 유지 */
	}
#home,#schedule{
		width: 200px;
	}
</style>
</head>
<body>
<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
				<section id="menu">
					<h4 class="menu-title">매장관리</h4>
					<div class="buttons">							
						<button class="btn btn-outline-primary" id="home"  onclick="location.href='/ad/spotManage'">매장관리 홈</button>
						<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/partSchdule'">스케줄 관리</button> 
						<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/part/Write'">등록하기</button>
					</div>
	
					<ul>
						<li class="active"><a href="/ad/part/List">아르바이트 관리</a></li>
						<li><a href="/ad/rest/List">휴점신청</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>아르바이트 관리</h5>
               </div>
               <div class="cont-body">
                  <div id="calendarBox">
      
                     <div id='calender'></div>
                  </div>
                  <div id="modalBox" class="modal" style="display: none;">
				    <div class="modal-content">
				        <div class="modal-header">
				            <h5>식단 수정</h5>
				            <button type="button" id="closeModal" class="modal-close">X</button>
				        </div>
				        <div class="modal-body">
				            <form id="editMenuForm">
				            <div class="form-group">
				            	<select class="form-select short" id="mealTypeSelector" name="is_time">
		                           <option value="B" selected="selected">아침</option>
		                           <option value="L">점심</option>
		                           <option value="D">저녁</option>
	                        	</select>
				            </div>
				                
				                <div class="form-group">
				                    <label for="menuStartDate">시작 날짜</label>
				                    <input type="datetime-local" id="menuStartDate" class="form-input">
				                </div>
				                
				                <div class="form-group">
				                    <label for="menuEndDate">종료 날짜</label>
				                    <input type="datetime-local" id="menuEndDate" class="form-input">
				                </div>
				                
				                <div class="form-group">
				                    <label for="menuContent">내용</label>
				                    <textarea id="menuContent" class="form-input" rows="4" name="content"></textarea>
				                </div>
				                
				            </form>
				        </div>
				        <div class="modal-footer">
				            <button type="button" id="saveMenu" class="btn btn-primary">저장</button>
				            <button type="button" id="cancelModal" class="btn btn-secondary">취소</button>
				        </div>
				    </div>
				</div>
                  
                  
               </div>
            </div>
         </section>
      </div>
   </div>
</div>
</body>
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calender.js'></script>


<script>
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calender');
    var mealTypeSelector = document.getElementById('mealTypeSelector');
    var calendar;

    // 캘린더 데이터 로드 함수
    function loadEvents(is_time) {
        var url = '/ad/mealMenu/' + is_time; // 엔드포인트에 is_time 추가
        $.ajax({
            url: url,
            method: 'GET',
            success: function (data) {
                updateCalendar(data); // 데이터 업데이트
            },
            error: function (err) {
                console.error('Failed to load events:', err);
            }
        });
    }

    // 캘린더 업데이트 함수
    function updateCalendar(events) {
        var formattedEvents = events.map(function (item) {
            return {
                title: formatEventContent(item), // 포맷된 텍스트로 변환
                start: item.start_date,
                end: item.end_date
            };
        });

        calendar.removeAllEvents(); // 기존 이벤트 제거
        calendar.addEventSource(formattedEvents); // 새로운 이벤트 추가
    }

    // 메뉴 데이터를 줄바꿈 포맷으로 변환
    function formatEventContent(item) {
        const meals = item.content.split(','); // 예: "흑미밥,두부조림" -> ["흑미밥", "두부조림"]
        return meals.join('\n'); // 각 메뉴를 줄바꿈으로 연결
    }

    // FullCalendar 초기화
    calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['dayGrid', 'interaction'], 
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: ''
        },
        locale: 'ko',
        buttonText: {
            today: '오늘'
        },
        initialView: 'dayGridMonth',
        events: []
    });

    calendar.render();

    // 초기값 설정 및 데이터 로드
    var initialMealType = mealTypeSelector.value;
    loadEvents(initialMealType);

    // 셀렉트박스 변경 시 데이터 갱신
    mealTypeSelector.addEventListener('change', function () {
        var selectedMealType = mealTypeSelector.value;
        loadEvents(selectedMealType);
    });
});
</script>
</html>
