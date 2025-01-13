<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	
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
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
	<!-- jQuery DateTimePicker CSS (CDN) -->
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"/>

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
	
	.detail-res{
		border-top: 1px solid #dee2e6;
	}
	
	.detail-p{
		margin-top: 20px;
    	margin-left: 70px;
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
            <h4 class="menu-title">물품 예약</h4>
			<div>
				<p style="margin: 10px; cursor: pointer;" class="category-title">노트북</p>
				<ul class="item-list" style="display: none;">
					<c:forEach items="${note}" var="item">
	                	<li onclick="detail('${item.no}')" style="cursor: pointer;">${item.item_name}</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<p style="margin: 10px; cursor: pointer;" class="category-title">빔 프로젝터</p>
				<ul class="item-list" style="display: none;">
					<c:forEach items="${project}" var="item">
	                	<li onclick="detail('${item.no}')" style="cursor: pointer;">${item.item_name}</li>
					</c:forEach>
				</ul>
			</div>
			<div>
				<p style="margin: 10px; cursor: pointer;" class="category-title">차량</p>
				<ul class="item-list" style="display: none;">
					<c:forEach items="${car}" var="item">
	                	<li onclick="detail('${item.no}')" style="cursor: pointer;">${item.item_name}</li>
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

<!-- jQuery DateTimePicker JS (CDN) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<!-- 한국어 로케일 파일 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/i18n/jquery.datetimepicker.ko.js"></script>

<script>

	var section= 'item';
	
	$(document).ready(function(){
	    // 카테고리 제목 클릭 시 슬라이드 토글
	    $('.category-title').click(function(){
	        $(this).next('.item-list').slideToggle();
	    });
	    
	    getAjax('/itemList','JSON');
	    dataSetting('item', 'Input');
	    
	    // 이벤트 위임을 사용하여 동적으로 추가된 #calendar_type에도 이벤트 핸들러 적용
	    $(document).on('change', '#calendar_type', function() {
	        var selection = $(this).val();
	        console.log('선택된 카테고리:', selection);
	        if (selection) {
	            fetchCategoryItems(selection);
	        } else {
	            // 카테고리가 선택되지 않은 경우, 물품 목록 숨기기
	            $('#category_items_group').hide();
	            $('#category_items').empty().append('<option value="">-- 선택하세요 --</option>');
	        }
	    });       
	});
	
	function detail(no) {
		console.log("등장",no);
		
		var data = {
				no: no
		}
		
		$.ajax({
	        type: 'GET',
	        url: '/itemDetail',
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
		if (response.list.selection == 'note') {
			content +='<p>분류 : 노트북</p>';
		}else if(response.list.selection == 'project'){
			content +='<p>분류 : 빔 프로젝터</p>';
		}else{
			content +='<p>분류 : 차량</p>';
		}
		
		if (response.list.type == 'G') {
			content +='<p>유형 : 지급 물품</p>';
		}else if(response.list.type == 'S'){
			content +='<p>유형 : 단기 대여</p>';
		}else{
			content +='<p>유형 : 장기 대여</p>';
		}
		content +='<p>물품 명 : '+response.list.item_name+'</p>';
		content +='<p>모델 명 : '+response.list.model_name+'</p>';
		content +='<p>내용 : '+response.list.content+'</p>';
		content +='<p>등록일 : '+response.list.reCreate_date+'</p>';
		$('#list').html(content);
	}
	
	// 카테고리별 물품 목록을 서버에서 불러오는 함수
	function fetchCategoryItems(selection,no) {
	    // AJAX 요청을 통해 서버로부터 물품 목록을 가져옵니다.
	    $.ajax({
	        type: 'GET',
	        url: '/selectList', // 백엔드 엔드포인트
	        data: { selection: selection },
	        dataType: 'JSON',
	        beforeSend: function(xhr) {
	            const csrfToken = document.querySelector('meta[name="_csrf"]').content;
	            const csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
	            xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 토큰 설정
	        },
	        success: function(response) {
	        	 console.log('서버 응답:', response);
	            if (response.list) {
	                populateCategoryItems(response.list,no);
	            } else {
	                alert(response.message || '물품 목록을 불러오는 데 실패했습니다.');
	                $('#category_items_group').hide();
	                $('#category_items').empty().append('<option value="">-- 선택하세요 --</option>');
	            }
	        },
	        error: function(err) {
	            console.error('물품 목록 불러오기 실패:', err);
	            alert('물품 목록을 불러오는 데 실패했습니다.');
	            $('#category_items_group').hide();
	            $('#category_items').empty().append('<option value="">-- 선택하세요 --</option>');
	        }
	    });
	}
	
	// 물품 목록을 select 요소에 채우는 함수
	function populateCategoryItems(items,no) {
	    var category_item = $('#category_items');
	    category_item.empty().append('<option value="">-- 선택하세요 --</option>');
	    
	    items.forEach(function(item) {
	    	category_item.append('<option value="'+item.no+'">'+item.item_name+'</option>');
	    });
	    
	    // 물품 목록 표시
	    $('#category_items_group').show();
	    
	    if(no){
	    	category_item.val(no);
	    }
	    
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
	    console.log('날짜 제대로 받니? 실행 : ',start_date,end_date);
	    
	    if(!selection || !start_date || !end_date || !subject || !content){
	    	layerPopup("항목을 입력해주세요", "확인", false, removeAlert, removeAlert);
	    	return false;
	    }
	    
	    
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
	        	
	        	if(response.success){
	        		httpSuccess(response); // 성공 콜백
	        		 // 모달 닫기 및 초기화
	                initializeModal(['calendar_content', 'calendar_start_date', 'calendar_end_date']);
	        	}else{
	        		layerPopup("이미 예약된 날짜 입니다.", "확인", false, removeAlert, removeAlert);
	        	}
	            
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
	function scheduleDetail(info) {
		var idx = info.event.id;
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
        // 한국어로 로케일 설정
        $.datetimepicker.setLocale('ko');
        // 데이트타임피커 라이브러리
	    $('#calendar_start_date_input, #calendar_end_date_input').datetimepicker({
	        format: 'Y-m-d H:00', // 분은 고정(00)되어 표시
	        step: 60,             // 분 간격을 60분으로 설정하여 분 선택 불가
	        datepicker: true,
	        timepicker: true,
	        minDate: new Date()
	    });
	    $('#calendar_start_date_edit, #calendar_end_date_edit').datetimepicker({
	        format: 'Y-m-d H:00', // 분은 고정(00)되어 표시
	        step: 60,             // 분 간격을 60분으로 설정하여 분 선택 불가
	        datepicker: true,
	        timepicker: true,
	        minDate: new Date()
	    });
	    if(data.username == '${pageContext.request.userPrincipal.name}'){
        	document.getElementById('amendSchedule').style.display = 'block';
        	document.getElementById('deleteSchedule').style.display = 'block';
        }
        if (type === 'Input') {
            // 일정 추가 모드: 입력 필드 초기화
            console.log("일정 추가 모드: 데이터 없음");
            document.getElementById("calendar_subject_input").value = '';
            document.getElementById("calendar_content_input").value = '';
            document.getElementById("calendar_start_date_input").value = '';
            document.getElementById("calendar_end_date_input").value = '';
            document.getElementById("calendar_type").value = '';
            document.getElementById("category_items").value = '';
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
            console.log("이름 받다", '${info}');  
            fetchCategoryItems(data.selection,data.no);
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
	    
	    if(!selection || !start_date || !end_date || !subject || !content){
	    	layerPopup("항목을 입력해주세요", "확인", false, removeAlert, removeAlert);
	    	return false;
	    }
	          	      	       		
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
    	layerPopup("정말 삭제 하시겠습니까?", "확인", "취소", function(){itemDeleteA(idx)}, removeAlert);    	
	}
    
    function itemDeleteA(idx) {
    	console.log('삭제 진행시켜',idx);
    	httpAjax('DELETE', '/itemDelete/'+idx);
    	removeAlert();
	}

    

		
	
	
	
</script>
</html>