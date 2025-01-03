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


	
#home,#schedule{
		width: 200px;
	}
	/* 이벤트 폭 고정 */
	.fc-event {
    position: absolute !important;
    z-index: 1 !important;
    width: 90% !important; /* 이벤트 간 폭 좁히기 */
    margin-left: 10px; /* 좌측 간격 */
    border-radius: 5px;
    padding: 5px;
    font-weight: bold;
    color: #fff !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
}


	
	/* 겹칠 때 폭 좁아지는 현상 제거 */
	.fc-timegrid-event {
    width: 100% !important;
    margin: 0 !important;
    border-radius: 5px;
}

/* 텍스트 정렬 및 색상 */
.fc-event-title {
    color: #fff !important;
    text-align: center;
    font-weight: bold;
}

  .fc-toolbar-chunk:nth-child(3) {
    display: none !important; /* 'week' 버튼을 포함한 오른쪽 상단 버튼 숨김 */
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
						<li class="active"><a href="/ad/part">아르바이트 관리</a></li>
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
    var colorMap = {};

    // 이름별 고유 색상 설정
    function getRandomColor(name) {
        if (!colorMap[name]) {
            const letters = '0123456789ABCDEF';
            let color = '#';
            for (let i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            colorMap[name] = color;
        }
        return colorMap[name];
    }

    // 이벤트 데이터 로드
    function loadEvents() {
        $.ajax({
            url: '/ad/getPartTime',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                updateCalendar(data);
            },
            error: function (err) {
                console.error('Failed to load events:', err);
            }
        });
    }

    // 캘린더 이벤트 업데이트
    function updateCalendar(events) {
        var formattedEvents = [];
        var maxOverlap = 3; // 최대 겹칠 수 있는 이벤트 수
        var eventWidth = 100 / maxOverlap; // 이벤트 폭 계산

        events.forEach(function (item, index) {
            formattedEvents.push({
                title: item.title,
                daysOfWeek: [item.daysOfWeek],
                startTime: item.startTime,
                endTime: item.endTime,
                backgroundColor: getRandomColor(item.title),
                borderColor: getRandomColor(item.title),
                zIndex: index + 1, // z-index는 순서대로 설정
                overlapIndex: index % maxOverlap, // 겹칠 때의 위치를 순환적으로 설정
                eventWidth: eventWidth // 폭 설정
            });
        });

        calendar.removeAllEvents();
        calendar.addEventSource(formattedEvents);
    }

    // 캘린더 초기화
    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['timeGrid', 'interaction'],
        header: {
            left: 'prev,next',
            center: 'title',
            right: ''
        },
        locale: 'ko',
        initialView: 'timeGridWeek',
        events: [],
        eventDidMount: function (info) {
            var zIndex = info.event.extendedProps.zIndex || 1;
            var overlapIndex = info.event.extendedProps.overlapIndex || 0;
            var eventWidth = info.event.extendedProps.eventWidth || 100;

            // 스타일 적용
            info.el.style.backgroundColor = info.event.extendedProps.backgroundColor;
            info.el.style.borderColor = info.event.extendedProps.borderColor;
            info.el.style.position = 'absolute';
            info.el.style.zIndex = zIndex;

            // 이벤트 폭과 위치 조정
            info.el.style.width = `${eventWidth}%`;
            info.el.style.left = `${overlapIndex * eventWidth}%`;

            // 텍스트 중앙 정렬
            info.el.style.display = 'flex';
            info.el.style.alignItems = 'center';
            info.el.style.justifyContent = 'center';
        },
        eventOverlap: true // 이벤트 겹침 허용
    });

    calendar.render();
    loadEvents();
});


</script>

</html>