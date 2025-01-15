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
	    z-index: 900;
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
	/* 체크박스 선택 시 색상 지정 */
	#filterC:checked {
	  background-color: #D7F5FC;
	  border-color: #D7F5FC;
	}
	
	#filterT:checked {
	  background-color: #EDC0FF;  
	  border-color: #EDC0FF;
	}
	
	#filterP:checked {
	  background-color: #FFF2D6; 
	  border-color: #FFF2D6;
	}
	
	#filterA:checked {
	  background-color: #E8FADF;  
	  border-color: #E8FADF;
	}
	
	#filterR:checked {
	  background-color: #CBCCFF;  
	  border-color: #CBCCFF;
	}
	#sort{
		margin-top: 10px;
	}
	#amendSchedule{
		display: none;
	}
	#deleteSchedule{
		display: none;
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
			<div id="sort">
		        <input type="checkbox" id="filterAll" class="form-check-input" onchange="toggleAllFilters()" checked>
		        <label for="filterAll">전체보기</label>
		    </div>
			<div id="sort">
		        <input type="checkbox" id="filterC" class="form-check-input" onchange="handleIndividualFilter()">
		        <label for="filterC">공지 일정</label>
		    </div>
			<div id="sort">
		        <input type="checkbox" id="filterT" class="form-check-input" onchange="handleIndividualFilter()">
		        <label for="filterT">팀 일정</label>
			</div>
			<div id="sort">
		        <input type="checkbox" id="filterP" class="form-check-input" onchange="handleIndividualFilter()">
		        <label for="filterP">개인 일정</label>
		    </div>
		    <div id="sort">   
		        <input type="checkbox" id="filterA" class="form-check-input" onchange="handleIndividualFilter()">
		        <label for="filterA">물품 일정</label>
		    </div>
		    <div id="sort">  
		        <input type="checkbox" id="filterR" class="form-check-input" onchange="handleIndividualFilter()">
		        <label for="filterR">회의 일정</label>
   			</div>
            <div class="btn btn-primary full-size" onclick="loadModal('calender','Input')">일정추가</div>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>캘린더</h5>
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
	
	var data;
	
/* 	$(document).ready(function () {
		//loadCalender(section);
		var url= "/" + section + "List";
    	getAjax(url,'JSON')
	}); */
	
	$(document).ready(function () {
	    applyFilter(); // 초기 필터 적용 (전체)
	});
	
	// 체크박스 간 상호작용을 관리하는 함수
	function toggleAllFilters() {
	    var isChecked = $('#filterAll').is(':checked');
	    $('#filterC, #filterT, #filterP,#filterA,#filterR').prop('checked', isChecked);
	    applyFilter();
	}
	
	function handleIndividualFilter() {
	    // 모든 개별 필터가 선택되었는지 확인
	    var allChecked = $('#filterC').is(':checked') && $('#filterT').is(':checked') && $('#filterP').is(':checked') && $('#filterA').is(':checked') && $('#filterR').is(':checked');
	    $('#filterAll').prop('checked', allChecked);
	    applyFilter();
	}
	
	// 필터링 기능
	function applyFilter() {
	    // 체크된 필터 값 수집
	    var filters = [];
	    
	    if ($('#filterAll').is(':checked')) {
	        // '전체'가 체크된 경우 모든 타입을 포함
	        filters.push('C','P','T','A','R');
	    } else {
	        // 개별 체크박스 상태에 따라 필터링
	        if ($('#filterC').is(':checked')) filters.push('C');
	        if ($('#filterT').is(':checked')) filters.push('T');
	        if ($('#filterP').is(':checked')) filters.push('P');
	        if ($('#filterA').is(':checked')) filters.push('A');
	        if ($('#filterR').is(':checked')) filters.push('R');
	    }

	    // 서버로 전송할 데이터 객체 생성
	    var data = {
	        filters: filters
	    };
	    
	    console.log("필터 항목",data);	    	    
	    console.log('실행');
	    
	    $.ajax({
	        type: 'GET',
	        url: '/calenderList',
	        data: data, // data가 null이 아니면 전송, 아니면 빈 객체
	        dataType: 'JSON',
	        traditional: true, // 배열의 직렬화
	        success: function(response) {
	            getSuccess(response);
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });

	}
		
	function handleAddSchedule() {
		console.log('일정 등록 클릭');
        // 입력 데이터 가져오기
        var start_date = document.getElementById('calendar_start_date_input').value; // 시작일
        console.log(start_date,'시작일');
        var end_date = document.getElementById('calendar_end_date_input').value; // 종료일
        console.log(end_date,'종료일');
        var subject = document.getElementById('calendar_subject_input').value; // 일정 제목
        console.log(subject,'제목');
        var content = document.getElementById('calendar_content_input').value; // 일정 내용
        console.log(content,'내용');
        var type = document.getElementById('calendar_type').value; // 일정 타입
        console.log(type,'타입');
		
        // 컨펌박스로 교체	        
	    // 데이터 유효성 검사
	    if (!subject || !start_date || !end_date || !content) {
	    	layerPopup("항목을 모두 입력해주세요.", "확인", false, secondBtn1Act, secondBtn1Act);
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

	function httpSuccess(response){
		applyFilter();    
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
	function scheduleDetail(info) {
		var idx = info.event.id;
		var filter = info.event.groupId;
		console.log("클릭한 일정의 idx:", idx);
		console.log("클릭한 일정의 타입:", filter);
	    $.ajax({
	        type: 'GET',
	        url: '/calenderDetail/'+idx, // 컨트롤러의 상세 조회 엔드포인트
	      	data: {
	      		idx: idx,
	      		filter: filter
	      	},
	        dataType: 'JSON',
	        success: function(response) {
	            if (response.success) {
	                var schedule = response.schedule;
	                var attendees = response.attendees;
	                console.log('상세보기 파람스 주입 : ',schedule.idx);
	                console.log('상세보기 참석자 주입 : ',attendees);
	                var params = {
	                		idx: schedule.idx,
	                		subject: schedule.subject,
	 	                    content: schedule.content,
	 	                    start_date: schedule.start_date,
	 	                    end_date: schedule.end_date,
	 	                    username: schedule.username,
	 	                   	name: schedule.name,
	 	                    type: schedule.type,
	 	                   	no: schedule.no,
	 	                  	count: schedule.count,
	 	                  	item_name: schedule.item_name,
	 	                  	selection: schedule.selection,
	 	                    no: schedule.no,
	 	                   	attendees: attendees,
	 	                   	room_name: schedule.room_name
	                };
	                	              
	                // 모달 열기
	                if(filter == 'A'){
	                	loadModal("item", "Info", params);
	                }else if(filter == 'R'){
	                	loadModal("room", "Info", params);
	                }else{
		                loadModal("calender", "Info", params);	                	
	                }
	            } else {
	                alert(response.message || "일정 정보를 가져오는 데 실패했습니다.");
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("일정 상세 조회 실패:", error);
	        }
	    });
	}
	   
 	// 데이터 주입 함수 수정
    function setModalData(type, data) {
        console.log('셋모달데이타 : ',data);
        if (type === 'Input') {
            // 일정 추가 모드: 입력 필드 초기화
            console.log("일정 추가 모드: 데이터 없음",data);
            document.getElementById("calendar_subject_input").value = '';
            document.getElementById("calendar_content_input").value = '';
            document.getElementById("calendar_start_date_input").value = '';
            document.getElementById("calendar_end_date_input").value = '';
            document.getElementById("calendar_username_input").textContent = '${username}'; // 작성자 자동 입력
        } else if (type === 'Info') {
            // 일정 상세 보기 모드: 데이터 주입
            console.log("일정 상세 보기 모드: 데이터 주입", data);
   			                       
           	if(data.type == 'C' || data.type == 'T' || data.type == 'P'){
           		
           		if(data.username == '${pageContext.request.userPrincipal.name}'){
                	document.getElementById('amendSchedule').style.display = 'block';
                	document.getElementById('deleteSchedule').style.display = 'block';
                }
           		
	        	if(data.type == 'C'){
	        		document.getElementById("detail").textContent = '공지 상세정보';
	        	}else if(data.type == 'T'){
	        		document.getElementById("detail").textContent = '팀 상세정보';
	        	}else{
	        		document.getElementById("detail").textContent = '일정 상세정보';
	        	}
	            
	            document.getElementById("subject").textContent = data.subject;
	            $("#content").html(data.content);
	            document.getElementById("start_date").textContent = new Date(data.start_date).toLocaleString();
	            document.getElementById("end_date").textContent = new Date(data.end_date).toLocaleString();
	            document.getElementById("username").textContent = data.name;
	            document.getElementById("event_id").value = data.idx;          		
           	}else if(data.type == 'A'){
	            // 물품
           		document.getElementById("subject").textContent = data.subject;
                document.getElementById("content").textContent = data.content;
                document.getElementById("start_date").textContent = new Date(data.start_date).toLocaleString();
                document.getElementById("end_date").textContent = new Date(data.end_date).toLocaleString();
                document.getElementById("username").textContent = data.name;
                if(data.selection == 'car'){
               		document.getElementById("select").textContent = '차량';
                }else if(data.selection == 'note'){
                	document.getElementById("select").textContent = '노트북';
                }else{
                	document.getElementById("select").textContent = '빔 프로젝터';
                }
                document.getElementById("model").textContent = data.item_name;
                document.getElementById("event_id").value = data.idx;
                document.getElementById("event_no").value = data.no;                   		
           	}else{
	            //회의
           		document.getElementById("subject").textContent = data.subject;
	            document.getElementById("content").textContent = data.content;
	            document.getElementById("start_date").textContent = new Date(data.start_date).toLocaleString();
	            document.getElementById("end_date").textContent = new Date(data.end_date).toLocaleString();
	            document.getElementById("username").textContent = data.name;
	            document.getElementById("count").textContent = data.count+'명';
	            document.getElementById("room_name").textContent = data.room_name;
	            document.getElementById("event_id").value = data.idx;
	            document.getElementById("event_no").value = data.no;
	            
	         	// 참석자 목록 표시
	            var attendeesList = document.getElementById("people");
	            attendeesList.innerHTML = ''; // 기존 내용 초기화
	            var selectedEmployees = [];

	            if(data.attendees && data.attendees.length > 0){
	                data.attendees.forEach(function(attendee) {
	                    var cont = '<p style="margin: 0;" data-id="' + attendee.username + '">'
	                             + attendee.dept.text + ' ' 
	                             + attendee.name + ' ' 
	                             + attendee.position_content + '</p>';
	                    attendeesList.insertAdjacentHTML('beforeend', cont);
	                    selectedEmployees.push(attendee.username); // 참석자 ID 배열에 저장
	                });
	            } else {
	                attendeesList.insertAdjacentHTML('beforeend', '<p>참석자가 없습니다.</p>');
	            }          		
           	}
        } else if (type === 'Edit') {
        	
            // 일정 수정 모드: 데이터 주입
            console.log("일정 수정 모드: 데이터 주입", data);       
            document.getElementById("edit_calendar_event_id").value = data.idx;
            document.getElementById("calendar_subject_edit").value = data.subject;
            document.getElementById("calendar_content_edit").value = data.content;
            document.getElementById("calendar_start_date_edit").value = data.start_date;
            document.getElementById("calendar_end_date_edit").value = data.end_date;
            document.getElementById("calendar_type_edit").value = data.type
            document.getElementById("edit_calendar_event_username").value = data.name;
        }
    }

    function handleAmendSchedule() {
    	 // 현재 상세보기 모달에서 데이터 수집
        var eventId = $('#event_id').val();
    	console.log('수집할때 받아와?',eventId);
        var subject = $('#subject').text();
        var content = $('#content').text();
        var start_date = $('#start_date').text();
        var end_date = $('#end_date').text();
        var username = $('#username').text(); // 필요에 따라 사용

        // 수정 모달에 전달할 데이터 객체 생성
        var editData = {
            idx: eventId,
            subject: subject,
            content: content,
            start_date: start_date,
            end_date: end_date,
            username: username
        };

        // 현재 모달 닫기
        $('#modalBox').hide();
        $('#modalBox .modal-content').html('');

        // 수정 모달 열기
        loadModal('calender', 'Edit', editData);
	}
    
    function handleSaveEditSchedule() {
    	// 수정 모달에서 데이터 수집
        var idx = $('#edit_calendar_event_id').val();
    	console.log('idx 받아옴?',idx);
        var subject = $('#calendar_subject_edit').val();
        var content = $('#calendar_content_edit').val();
        var startDate = $('#calendar_start_date_edit').val();
        var endDate = $('#calendar_end_date_edit').val();
        var type = $('#calendar_type_edit').val();
        var username = '${pageContext.request.userPrincipal.name}';
        console.log('수정자 이름 받아옴?',username);

        // 데이터 유효성 검사
        if (!subject || !startDate || !endDate) {
        	layerPopup("항목을 모두 입력해주세요.", "확인", false, secondBtn1Act, secondBtn1Act);
            return;
        }

        // 서버로 전송할 데이터 객체 생성 (id는 URL의 일부로 사용)
        var params = {
        	username: username,
            subject: subject,
            content: content,
            start_date: startDate,
            end_date: endDate,
            type: type
        };

        // AJAX PUT 요청을 통해 일정 수정 (Path Variable 사용)
        $.ajax({
            type: 'PUT',
            url: '/calenderUpdate/' + idx, // 수정 엔드포인트에 id 포함
            data: JSON.stringify(params),
            contentType: 'application/json; charset=UTF-8',
            dataType: 'JSON',
            beforeSend: function(xhr) {
                var csrfToken = document.querySelector('meta[name="_csrf"]').content;
                var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
                xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 설정
            },
            success: function(response) {
                if(response.success){
                    // 모달 닫기
                    $('#modalBox').hide();
                    $('#modalBox .modal-content').html('');

                    // 캘린더 갱신
                    applyFilter();
                }
            },
            error: function(e){
                console.log('수정 AJAX 에러 => ', e);
                alert("일정 수정에 실패했습니다.");
            }
        });
	}
    
    // 삭제 버튼 클릭 시 삭제 실행
    function handleDeleteSchedule() {
    	var idx = $('#event_id').val();
    	console.log('삭제할때 받아와?',idx);
    	layerPopup("정말 삭제 하시겠습니까?", "확인", "취소", function() {deleteSchedule(idx)}, secondBtn1Act);
	}
    
    function deleteSchedule(idx) {
    	httpAjax('DELETE', '/calenderDelete/'+idx);
    	removeAlert();
	}
    
    
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function setupModalEvents(modal) {
        var closeModal = modal.querySelector("#closeModal");
        var cancelButton = modal.querySelector("#cancelModal");
        var closeModal1 = modal.querySelector("#closeModal1");
        var cancelButton1 = modal.querySelector("#cancelModal1");
               
        // 닫기 버튼 클릭 이벤트
        if (closeModal) {
            closeModal.addEventListener("click", function () {
                modal.style.display = "none";
            });
        }

        // 취소 버튼 클릭 이벤트
        if (cancelButton) {
            cancelButton.addEventListener("click", function () {
                modal.style.display = "none";
            });
        }
        
     	// 닫기 버튼 클릭 이벤트
        if (closeModal1) {
            closeModal1.addEventListener("click", function () {
                modal.style.display = "none";
            });
        }

        // 취소 버튼 클릭 이벤트
        if (cancelButton1) {
            cancelButton1.addEventListener("click", function () {
                modal.style.display = "none";
            });
        }
    }


  	
	
	
</script>
</html>