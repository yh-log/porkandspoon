<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- fullcalender -->
	<script src='/resources/js/calender/main.js'></script>
	<script src='/resources/js/calender/daygridmain.js'></script>
	<script src='/resources/js/calender/interactionmain.js'></script>
	<script src='/resources/js/calender/timemain.js'></script>

	<link href='/resources/css/calender/main.css' rel='stylesheet' />
	<link href='/resources/css/calender/daygridmain.css' rel='stylesheet' />
	<link href='/resources/css/calender/timemain.css' rel='stylesheet' />
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon"
		href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
		type="image/png">
		
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">	
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>	
<style>
  #calendarBox {
    width: 100%;
    max-width: 900px; /* 최대 너비 설정 */
    margin: 0 auto; /* 중앙 정렬 */
    padding: 0 15px; /* 좌우 여백 */
    box-sizing: border-box; /* 테두리 및 패딩 포함 */
    position: relative; /* 셀렉트바 위치 조정을 위해 relative 사용 */
  }

  #calender {
    width: 100%; /* 부모 컨테이너에 맞게 너비 조정 */
    height: auto; /* 높이를 자동으로 */
  }

.select {
    width: auto; /* 자동 너비 설정 */
    position: absolute;
    
    right: 15px; /* 캘린더 박스 오른쪽 정렬 */
}
    /* 기본 모달 스타일 */
	.modal {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 1100;
	}
	
	/* 모달 내부 콘텐츠 */
	.modal-content {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    width: 400px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	/* 모달 헤더 */
	.modal-header {
	    display: flex;
	    justify-content: end;
	    align-items: center;
	    border-bottom: 1px none #ddd;
	    margin-bottom: 15px;
	}

	/* 닫기(x) 버튼 */
	.modal-close {
	    font-size: 20px;
	    cursor: pointer;
	}
	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}
	
	.form-label {
	    display: block;
	    font-size: 14px;
	    margin-bottom: 5px;
	}
	
	.form-input {
	    width: 100%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	/* 모달 푸터 */
	.modal-footer {
	    display: flex;
	    justify-content: center;
	    gap: 10px;
	}
	
	/* 버튼 스타일 */
	.btn {
	    padding: 8px 12px;
	    font-size: 14px;
	    border: none;
	    cursor: pointer;
	    border-radius: 4px;
	}
	
	.select{
		width: 200px;
		display: flex; 
		justify-content: flex-end; 
		margin-bottom: 10px;
	}
	 
    .fc-prevYear-button, .fc-nextYear-button, .fc-today-button {
        display: none !important; /* 양쪽 화살표와 today 버튼 숨김 */
    }
    .fc-dayGridMonth-button, .fc-timeGridWeek-button, .fc-timeGridDay-button {
        display: none !important; /* 보기 전환 버튼 숨김 */
    }
	
</style>
</head>
<body>
	<!-- 부트스트랩 -->
	<script src="assets/static/js/initTheme.js"></script>
	
	<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
		<section id="menu">
			<h4 class="menu-title">구내식당</h4>
			<ul>
				<li><a href="/ad/mealTicket">식권구매</a></li>
				<li class="active"><a href="/ad/mealMenu">식단표</a></li>
				<li><a href="/ad/mealMenu/Write">식단등록</a></li>
				<li><a href="/ad/mealTicket/Write">식권등록</a></li>
				<li><a href="/ad/meal/List">상품리스트</a></li>
			</ul>
		</section>
		<section class="cont">
			<div class="col-12 col-lg-12"> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
				<div class="tit-area">
					<h5>식단표</h5>
				</div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
					<div id="calendarBox">
					
					<div class="select" >
				        <select class="form-select short" id="mealTypeSelector" name="is_time">
				            <option value="B" selected="selected">아침</option>
				            <option value="L">점심</option>
				            <option value="D">저녁</option>
				        </select>
				    </div>
											
							
						<div id='calender'></div>
					</div>
					
					<div id="calendarModal" class="modal" style="display: none;">
					   <div class="modal-content"></div>
					</div>   
               </div>
            </div>
         </section>   
      </div>
    </div>
	</div>
	
	
	
</body>

<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calender.js'></script>

<script>
url = "/ad/mealMenu";
var is_time = $('#mealTypeSelector').val();
$(document).ready(function () {
	//loadCalender(section);
	// 캘린더 초기화
	initializeCalendar();
});

var result = getAjax(url);

console.log(response);


 

/* document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calender');
    var mealTypeSelector = document.getElementById('mealTypeSelector');
    var calendar;

    // 캘린더 데이터 로드 함수
    function loadEvents(is_time) {
        var url = '/ad/mealMenu/${is_time}`;
        	getAjax(url)
    }

    // 캘린더 업데이트 함수
    function updateCalendar(events) {
        var formattedEvents = events.map(function (item) {
            return {
                title: item.content, // DB의 content 컬럼 사용
                start: item.start_date, // 시작 날짜
                end: item.end_date // 끝 날짜
            };
        });

        calendar.removeAllEvents(); // 기존 이벤트 제거
        calendar.addEventSource(formattedEvents); // 새로운 이벤트 추가
    }

    // FullCalendar 초기화
    calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['dayGrid'],
        header: {
            left: 'prev,next',
            center: 'title',
            right: ''
        },
        locale: 'ko',
        buttonText: {
            today: '오늘'
        },
        initialView: 'dayGridMonth',
        events: [] // 초기 이벤트 빈 배열
    });

    calendar.render();

    // 초기값 설정 및 데이터 로드
    var initialMealType = mealTypeSelector.value; // 기본 아침 메뉴
    loadEvents(initialMealType);

    // 셀렉트 박스 값 변경 시 데이터 갱신
    mealTypeSelector.addEventListener('change', function () {
        var selectedMealType = mealTypeSelector.value;
        loadEvents(selectedMealType);
    });
}); */
</script>
</html>