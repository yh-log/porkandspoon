<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
		
	
		
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">	
	<link rel="stylesheet" href="/resources/css/chartModal.css">
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
		
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
	
	.detail-res{
		border-top: 1px solid #dee2e6;
	}
	
	.detail-p{
		margin-top: 20px;
    	margin-left: 70px;
	}
	.item-list{
		overflow-y: auto;
		height: 300px; 
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
            <h4 class="menu-title">회의실 예약</h4>
			<div>				
				<ul class="item-list">
					<c:forEach items="${room}" var="item">
						<li onclick="detail('${item.no}')" style="cursor: pointer;">${item.room_name}</li>
					</c:forEach>
				</ul>
			</div>			
            
            <div class="detail-res" id="list">
            	
            </div>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area" style="display: flex; justify-content: space-between; align-items: center;">
                  <h5>예약</h5>
                  <div class="btn btn-primary" style="margin: 0;">예약하기</div>
               </div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
					<div id="calendarBox">
						<div id='calendar'></div>
					</div>
					
					<div id="modalBox" class="modal" style="display: none; z-index: 1000;">
					   <div class="modal-content"></div>
					</div>   
					
					<!-- 조직도 모달 사용 시 추가 -->
					<div id="chartModalBox" class="modal" style="display: none; z-index: 1100;">
						<div class="chartModal-content"></div>
    				</div>
					<input type="hidden" id="selectedNodeInput" value="">				
               </div>
            </div>
         </section>   
         
      </div>
    </div>
	</div>
	
	
	
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<!-- 부트스트랩 -->
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calenderJH.js'></script>

<script src='/resources/js/charjstree.js'></script>

<script>

	var section= 'room';
	
	 

	$(document).ready(function(){
		
	    getAjax('/roomList','JSON');
	    dataSetting('room', 'Input');
	    
	});

	function detail(no) {
		console.log("등장",no);
		
		var data = {
				no: no
		}
		
		$.ajax({
	        type: 'GET',
	        url: '/roomDetail',
	        data: data,
	        dataType: 'JSON',
	        success: function(response) {
	            detailList(response);
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	}
		
	function detailList(response){
		console.log(response);
		var content = '';
		content +='<p class="detail-p">상세정보</p>';
		content +='<p>회의실 명 : '+response.list.room_name+'</p>';
		content +='<p>수용인원 : '+response.list.count+'</p>';
		content +='<p>내용 : '+response.list.content+'</p>';
		content +='<p>등록일 : '+response.list.reCreate_date+'</p>';
		$('#list').html(content);
	}
	
	// 카테고리별 물품 목록을 서버에서 불러오는 함수
	function fetchCategoryItems() {
	    // AJAX 요청을 통해 서버로부터 물품 목록을 가져옵니다.
	    
	    $.ajax({
	        type: 'GET',
	        url: '/selectRoomList', // 백엔드 엔드포인트
	        data: {},
	        dataType: 'JSON',
	        beforeSend: function(xhr) {
	            const csrfToken = document.querySelector('meta[name="_csrf"]').content;
	            const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
	            xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 설정
	        },
	        success: function(response) {
	        	 console.log('서버 응답:', response.list);
	             populateCategoryItems(response.list);

	        },
	        error: function(err) {
	            console.error('물품 목록 불러오기 실패:', err);
	            alert('물품 목록을 불러오는 데 실패했습니다.');
	        }
	    });
	}
	
	// 물품 목록을 select 요소에 채우는 함수
	function populateCategoryItems(items) {
		console.log('여기? : ',items);
	    var category_item = $('#category_items_room');
	    //category_item.empty().append('<option value="">-- 선택하세요 --</option>');
	    console.log('옵션 초기화');
	    
	    items.forEach(function(item) {
	    	console.log('포이치 돌아가?',item.no,item.room_name);
	    	category_item.append('<option value="'+item.no+'">'+item.room_name+'</option>');
	    });
	    
	    console.log('populateCategoryItems 함수 종료');
	}
	
	function handleAddSchedule() {
		console.log('예약 등록 클릭');
		
		var selection = $('#calendar_type').val();
	    var no = $('#category_items').val();
	    console.log('선택된놈 no',no);
	    var username = '${pageContext.request.userPrincipal.name}'; 
	    var start_date = $('#calendar_start_date_input').val();
	    var end_date = $('#calendar_end_date_input').val();
	    var subject = $('#calendar_subject_input').val();
	    var content = $('#calendar_content_input').val();
	    
	    var data = {
	            no: no, // 물품 번호 (int 타입)
	            username: username,
	            start_date: start_date,
	            end_date: end_date,
	            subject: subject,
	            content: content
	        };
	    
	    // 서버 요청
        httpAjax('POST', '/itemWrite', data);

        // 모달 닫기 및 초기화
        initializeModal(['calendar_content', 'calendar_start_date', 'calendar_end_date']);
	}
		
	// 일정 등록 ajax
	function httpAjax(type, url, data) {
	    var csrfToken = document.querySelector('meta[name="_csrf"]').content;
	    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

	    $.ajax({
	        type: type,
	        url: url,
	        data: JSON.stringify(data), // JSON 형식으로 변환
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

	function httpSuccess(response){
	    loadCalender(section);    
	    var arr = ['calendarModal', 'calendar_content', 'calendar_start_date'];
	    initializeModal(arr);
	}
	
	// 예약 상세보기
	function scheduleDetail(idx) {
	    $.ajax({
	        type: 'GET',
	        url: '/resDetail/'+idx, // 컨트롤러의 상세 조회 엔드포인트
	        dataType: 'JSON',
	        success: function(response) {
	            if (response.success) {
	                var schedule = response.schedule;
	                console.log('상세보기 파람스 주입 : ',schedule.idx);
	                var params = {
	                		idx: schedule.idx,
	                		subject: schedule.subject,
	 	                    content: schedule.content,
	 	                    start_date: schedule.start_date,
	 	                    end_date: schedule.end_date,
	 	                    username: schedule.username,
	 	                    selection: schedule.selection,
	 	                    item_name: schedule.item_name,
	 	                    name: schedule.name,
	 	                    no: schedule.no
	                };
	
	                // 모달 열기
	                loadModal("item", "Info", params);
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
	
	// 데이터 주입 함수 수정
    function setModalData(type, data) {
        console.log('셋모달데이타 실행 : ',data);
        fetchCategoryItems();
        if (type === 'Input') {
            // 일정 추가 모드: 입력 필드 초기화
            console.log("일정 추가 모드: 데이터 없음");
            document.getElementById("calendar_subject_input").value = '';
            document.getElementById("calendar_content_input").value = '';
            document.getElementById("calendar_start_date_input").value = '';
            document.getElementById("calendar_end_date_input").value = '';          
            document.getElementById("category_items_room").value = '';
            document.getElementById("calendar_username_input").textContent = '${info.name}'; // 작성자 자동 입력
        } else if (type === 'Info') {
            // 일정 상세 보기 모드: 데이터 주입
            console.log("일정 상세 보기 모드: 데이터 주입", data);
          
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
        } else if (type === 'Edit') {
            // 일정 수정 모드: 데이터 주입
            console.log("일정 수정 모드: 데이터 주입", data);       
            document.getElementById("edit_calendar_event_id").value = data.idx;
            document.getElementById("calendar_subject_edit").value = data.subject;
            document.getElementById("calendar_content_edit").value = data.content;
            document.getElementById("calendar_start_date_edit").value = data.start_date;
            document.getElementById("calendar_end_date_edit").value = data.end_date;
            document.getElementById("calendar_type").value = data.selection;
            document.getElementById("category_items").value = data.item_name;
            document.getElementById("calendar_username_edit").textContent = '${info.name}';
            console.log("이름 받다", '${info.name}');  
            fetchCategoryItems(data.no);
        }
    }
	
	function handleAmendSchedule() {
   	// 현재 상세보기 모달에서 데이터 수집
    	var eventId = $('#event_id').val();
    	var eventNo = $('#event_no').val();
   		console.log('수집할때 받아와?',eventId);
       	var subject = $('#subject').text();
       	var content = $('#content').text();
       	var start_date = $('#start_date').text();
       	var end_date = $('#end_date').text();
       	var username = $('#username').text(); 
    	var selection = $('#select').text(); 
    	var item_name = $('#model').text();
    	
    	var categoryMap = {
    	        '노트북': 'note',
    	        '빔 프로젝터': 'project',
    	        '차량': 'car'
    	    };
    	
    	var categoryValue = categoryMap[selection] || '';

       	// 수정 모달에 전달할 데이터 객체 생성
       	var editData = {
	    	idx: eventId,
	    	no: eventNo,
	        subject: subject,
	        content: content,
	        start_date: start_date,
	        end_date: end_date,
	        username: username,
	        selection: categoryValue,
	        item_name: item_name
       	};

       	// 현재 모달 닫기
       	$('#modalBox').hide();
       	$('#modalBox .modal-content').html('');

	    // 수정 모달 열기
	    loadModal('item', 'Edit', editData);
	}
	   
   	function handleSaveEditSchedule() {
		// 수정 모달에서 데이터 수집
       	var idx = $('#edit_calendar_event_id').val();
       	var selection = $('#calendar_type').val();
	    var no = $('#category_items').val();
	    console.log('선택된놈 no',no);
	    var username = '${pageContext.request.userPrincipal.name}'; 
	    var start_date = $('#calendar_start_date_edit').val();
	    var end_date = $('#calendar_end_date_edit').val();
	    var subject = $('#calendar_subject_edit').val();
	    var content = $('#calendar_content_edit').val();
	          	      	       		
       	// 서버로 전송할 데이터 객체 생성 (id는 URL의 일부로 사용)
       	var params = {
       		idx: idx,
       		username: username,
           	subject: subject,
           	content: content,
           	start_date: start_date,
           	end_date: end_date,
           	selection: selection,
           	no: no
       	};
	
       	// AJAX PUT 요청을 통해 일정 수정 (Path Variable 사용)
       	$.ajax({
       		type: 'PUT',
           	url: '/itemUpdate/' + idx, // 수정 엔드포인트에 id 포함
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
                   	loadCalender(section);
              	 }
           	},
           	error: function(e){
               	console.log('수정 AJAX 에러 => ', e);
               	alert("일정 수정에 실패했습니다.");
           	}
       	});
	}

	
   	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
    // 삭제 버튼 클릭 시 삭제 실행
    function handleDeleteSchedule() {
    	var idx = $('#event_id').val();
    	console.log('삭제할때 받아와?',idx);
    	httpAjax('DELETE', '/itemDelete/'+idx);
	}
	
	
	// 조직도 부분
	//초기 데이터
	const initialData = {
	    headers: ['이름','부서','직위', '삭제'],
	    rows: [
	    	['${info.name}', '${info.dept.text}', '${info.position_content}', '<button class="btn btn-primary">삭제</button>'],
	    ],
	    footer: ''
	};
	
	var exampleData = JSON.parse(JSON.stringify(initialData));
	
	var userName = "";
	var userPosition = "";
	var userDept = "";
	 // 선택된 ID를 rows에 추가하는 함수
	 function addSelectedIdToRows(selectedId) {
	     console.log("가져온 ID:", selectedId);
	     
	     $.ajax({
	         type: 'GET',
	         url: '/getUserInfo/'+selectedId,
	         data: {},
	         dataType: "JSON",
	         success: function(response) {
	        	 console.log("유저이름: ",response.name);
	        	 console.log("유저정보: ",response.position_content);
	        	 console.log("유저정보: ",response.dept.text);
	        	 
	        	 userName = response.name;
	        	 userPosition = response.position_content;
	        	 userDept = response.dept.text;
	
	     // 새로운 row 데이터 생성
	     const newRow = [userName, userDept, userPosition, '<button class="btn btn-primary">삭제</button>'];
	
	     // 기존 rows에 추가
	     exampleData.rows.push(newRow);
	
	     // 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
	     updateTableData('customTable', exampleData);
		 },
	     error: function(e) {
	         console.log(e);
	     }
	});
 }
	 // 선택된 ID를 받아서 처리
	 getSelectId(function (selectedId) {
	     addSelectedIdToRows(selectedId);
	 });
	
	
	
	
	
</script>
</html>