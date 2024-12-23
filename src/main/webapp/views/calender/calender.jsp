<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		href="resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon"
		href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
		type="image/png">
		
	<link rel="stylesheet" href="resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="resources/css/common.css">	
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<style>
    #calendarBox{
        width: 80%;
        padding-left: 15%;
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
	    width: 800px;
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
	    
	}
	
	.form-input {
	    width: 30%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	.form-input1 {
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
            <h4 class="menu-title">캘린더</h4>
            <div class="btn btn-primary full-size">일정추가</div>
            <ul>
               <li class="active">전체 캘린더</li>
               <li>공지 캘린더</li>
               <li>팀별 캘린더</li>
               <li>개인 캘린더</li>
            </ul>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>캘린더(많이수정)</h5>
               </div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
					<div id="calendarBox">
						<div id='calendar'></div>
					</div>
					<div id="modalBox" class="modal" style="display: none;">
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
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calenderJH.js'></script>

<script>

	var section= 'calender';
	
	$(document).ready(function () {
		loadCalender(section);
	});
	
	// 일정 등록 이벤트
	document.addEventListener('click', function (event) {
	    if (event.target && event.target.id === 'addSchedule') {
	    	console.log('일정 등록 클릭');
	        // 입력 데이터 가져오기
	        var start_date = document.getElementById('calendar_start_date').value; // 시작일
	        console.log(start_date,'시작일');
	        var end_date = document.getElementById('calendar_end_date').value; // 종료일
	        console.log(end_date,'종료일');
	        var subject = document.getElementById('calendar_subject').value; // 일정 제목
	        console.log(subject,'제목');
	        var content = document.getElementById('calendar_content').value; // 일정 내용
	        console.log(content,'내용');
	        var type = document.getElementById('calendar_type').value; // 일정 타입
	        console.log(type,'타입');

	        // 입력값 유효성 검사
	        if (!content) {
	            alert("일정 내용을 입력하세요.");
	            return;
	        }
	        if (!start_date || !end_date) {
	            alert("시작일과 종료일을 입력하세요.");
	            return;
	        }
	        if (new Date(start_date) > new Date(end_date)) {
	            alert("종료일은 시작일 이후여야 합니다.");
	            return;
	        }
	        if (!subject) {
	            alert("일정 제목을 입력하세요.");
	            return;
	        }

	        // 서버로 전송할 데이터
	        var params = {
	        	username:'${pageContext.request.userPrincipal.name}',
	            subject: subject,
	            content: content,
	            start_date: start_date,
	            end_date: end_date,
	            type: type
	        };
	        
	        // 서버 요청
	        httpAjax('POST', '/calenderWrite', params);

	        // 모달 닫기 및 초기화
	        initializeModal(['calendar_content', 'calendar_start_date', 'calendar_end_date']);
	    }
	});

	function httpSuccess(response){
	    loadCalender(section);    
	    var arr = ['calendarModal', 'calendar_content', 'calendar_start_date'];
	    initializeModal(arr);
	}
	
	
	// 일정 등록 ajax
	function httpAjax(type, url, params) {
	    var csrfToken = document.querySelector('meta[name="_csrf"]').content;
	    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

	    $.ajax({
	        type: type,
	        url: url,
	        data: JSON.stringify(params), // JSON 형식으로 변환
	        contentType: 'application/json; charset=UTF-8', // Content-Type 설정
	        dataType: 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 설정
	        },
	        success: function(response) {
	            httpSuccess(response); // 성공 콜백
	        },
	        error: function(e) {
	            console.log(e); // 에러 로그 출력
	        }
	    });
	}
	
	// 일정 상세보기
	function scheduleDetail(idx) {
	    $.ajax({
	        type: 'GET',
	        url: '/calenderDetail', // 컨트롤러의 상세 조회 엔드포인트
	        data: { idx: idx }, // 전달할 idx
	        dataType: 'JSON',
	        success: function(response) {
	            if (response.success) {
	                var schedule = response.schedule;
	
	                // 모달 열기
	                loadModal("calender", "Info", {
	                    subject: schedule.subject,
	                    content: schedule.content,
	                    start_date: schedule.start_date,
	                    end_date: schedule.end_date,
	                    username: schedule.username
	                });
	            } else {
	                alert(response.message || "일정 정보를 가져오는 데 실패했습니다.");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("일정 상세 조회 실패:", error);
	            alert("서버와 통신 중 문제가 발생했습니다.");
	        }
	    });
	}

	// 데이터 주입
	function setModalData(data) {
	    // 데이터 확인
	    console.log("주입할 데이터:", data);

	    // 데이터 주입
	 	document.getElementById("calendar_subject").textContent = data.subject;
		document.getElementById("calendar_content").textContent = data.content;
		document.getElementById("calendar_start_date").textContent = data.start_date;
    	document.getElementById("calendar_end_date").textContent = data.end_date;
	    document.getElementById("calendar_username").textContent = data.username; 	

	}
	
	
</script>
</html>