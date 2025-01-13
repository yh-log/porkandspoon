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
		href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
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
	.item-list{
		overflow-y: auto;
		height: 300px; 
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
<script src="/resources/assets/static/js/components/dark.js"></script>
<script src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calenderJH.js'></script>

<script src='/resources/js/charjstree.js'></script>
<!-- jQuery DateTimePicker JS (CDN) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<!-- 한국어 로케일 파일 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/i18n/jquery.datetimepicker.ko.js"></script>

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
	function fetchCategoryItems(no) {
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
	             populateCategoryItems(response.list,no);

	        },
	        error: function(err) {
	            console.error('물품 목록 불러오기 실패:', err);
	            alert('물품 목록을 불러오는 데 실패했습니다.');
	        }
	    });
	}
	
	// 물품 목록을 select 요소에 채우는 함수
	function populateCategoryItems(items,no) {
		console.log('여기? : ',items);
	    var category_item = $('#category_items_room');
	    console.log('category_item? : ',category_item);
	    category_item.empty().append('<option value="">-- 선택하세요 --</option>');
	    console.log('옵션 초기화');
	    
	    items.forEach(function(item) {
	    	console.log('포이치 돌아가?',item.no,item.room_name);
	    	category_item.append('<option value="'+item.no+'">'+item.room_name+'</option>');
	    });
	    
	    if(no){
	    	console.log('조건 걸려?',no);
	    	category_item.val(no);
	    }
	    
	    console.log('populateCategoryItems 함수 종료');
	}
	
	// 조직도 부분
	//초기 데이터
	const initialData = {
	    headers: ['이름','부서','직위', '삭제'],
	    rows: [	    	
	    	
	    ],
	    footer: ''
	};
	
	var exampleData = JSON.parse(JSON.stringify(initialData));
	
	var userName = "";
	var userPosition = "";
	var userDept = "";
	// 선택된 직원 목록을 저장할 배열
	var selectedEmployees = [];
	 // 선택된 ID를 rows에 추가하는 함수
	 
	 function addSelectedIdToRows(selectedId) {
	     console.log("가져온 ID:", selectedId);
	  	// 중복 체크
	     if(selectedEmployees.includes(selectedId)) {
	    	 layerPopup( "이미 등록된 참석자입니다.","확인",false,removeAlert,removeAlert);
	         return;
	     }
	     selectedEmployees.push(selectedId);
	     console.log("가져온 selectedEmployees:", selectedEmployees);
	     $.ajax({
	         type: 'GET',
	         url: '/getUserInfo/'+selectedId,
	         data: {},
	         dataType: "JSON",
	         success: function(response) {
	        	 console.log("전체: ",response);
	        	 console.log("유저이름: ",response.name);
	        	 console.log("유저정보: ",response.position_content);
	        	 console.log("유저정보: ",response.dept.text);
	        	 
	        	 console.log('담겨? : ',selectedEmployees);
	        	 userName = response.name;
	        	 userPosition = response.position_content;
	        	 userDept = response.dept.text;
	        	               	 
			     // 새로운 row 데이터 생성
			     const newRow = [userName, userDept, userPosition, 
			    	 '<button class="btn btn-primary remove-employee" data-id="' + response.username + '" onclick="removeEmployee()" >삭제</button>'];
	
			     // 기존 rows에 추가
			     initialData.rows.push(newRow);
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
	 
	function removeEmployee() {		
		$(document).on('click', '.remove-employee', function() {
		    var employeeId = $(this).data('id');
		    console.log('삭제할 직원 ID:', employeeId);
	
		    // 1. selectedEmployees 배열에서 해당 직원 제거
		    selectedEmployees = selectedEmployees.filter(function(id) {
		         return id !== employeeId;
		    });
	
		    // 2. exampleData.rows에서 해당 직원의 행 제거
		    exampleData.rows = exampleData.rows.filter(function(row) {
		       // row[3]에는 "삭제" 버튼 HTML이 포함되어 있음.
		       // 이 HTML 내에 data-id 속성으로 employeeId가 포함되어 있는지 검사
		       return row[3].indexOf('data-id="' + employeeId + '"') === -1;
		    });
	
		    // 3. 테이블 UI 갱신
		    updateTableData('customTable', exampleData);
	
		    // 4. 선택된 조직도 노드 해제 (필요한 경우)
		    $('#jstree').jstree('deselect_node', employeeId);
	
		    console.log("업데이트된 selectedEmployees:", selectedEmployees);
		});
	}

	 	
	function addBtnFn() {
        console.log('조직도 인원 저장');
        $('#selected_employees').empty();
        exampleData.rows = []; // 테이블 데이터 초기화
    
        // 선택된 직원 ID 배열을 이용하여 직원 정보를 다시 가져오기
        selectedEmployees.forEach(function(employeeId){
            console.log('뭐지', employeeId);
            $.ajax({
                type: 'GET',
                url: '/getUserInfo/' + employeeId,
                dataType: 'JSON',
                success: function(response) {
                    var deptText = (response.dept && response.dept.text) ? response.dept.text : '부서 없음';
                    var employeeTag = $('<div class="employee-tag" data-id="' + response.username + '"></div>');
                    employeeTag.append('<span>' + deptText + ' ' + response.name + ' ' + response.position_content + '</span>');
                    $('#selected_employees').append(employeeTag);
    
                    // 테이블에 참석자 정보 추가
                    const newRow = [
                        response.name, 
                        deptText, 
                        response.position_content, 
                        '<button class="btn btn-primary remove-employee" data-id="' + response.username + '" onclick="removeEmployee()" >삭제</button>'
                    ];
                    exampleData.rows.push(newRow);
                    updateTableData('customTable', exampleData);
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
            
        // 조직도 모달 닫기
        $('#chartModalBox').hide();
    }
	  
	 function handleAddSchedule() {
			console.log('예약 등록 클릭',selectedEmployees);
						
		    var no = $('#category_items_room').val();
		    console.log('선택된놈 no',no);
		    var username = '${info.username}'; 
		    var start_date = $('#calendar_start_date_input').val();
		    var end_date = $('#calendar_end_date_input').val();
		    var subject = $('#calendar_subject_input').val();
		    var content = $('#calendar_content_input').val();
		    
		    if(!start_date || !end_date || !subject || !content || !no){
		    	layerPopup("항목을 입력해주세요", "확인", false, removeAlert, removeAlert);
		    	return false;
		    }

		    console.log('선택된놈 attendees',selectedEmployees);
		    
		    var data = {
		            no: no, // 물품 번호 (int 타입)
		            username: username,
		            start_date: start_date,
		            end_date: end_date,
		            subject: subject,
		            content: content,
		            attendees: selectedEmployees // 참석자 ID 배열 추가
		        };
		    
		    // 서버 요청
	        httpAjax('POST', '/roomReservation', data);

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
		        url: '/roomReservationDetail/'+idx, // 컨트롤러의 상세 조회
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
		 	                   	room_name: schedule.room_name,
		 	                    name: schedule.name,
		 	                    count: schedule.count,
		 	                    no: schedule.no,
		 	                   	attendees: attendees
		                };
		
		                // 모달 열기
		                loadModal("room", "Info", params);
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
	        //fetchCategoryItems();
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
	            fetchCategoryItems();
	            console.log("일정 추가 모드: 데이터 없음");
	            document.getElementById("calendar_subject_input").value = '';
	            document.getElementById("calendar_content_input").value = '';
	            document.getElementById("calendar_start_date_input").value = '';
	            document.getElementById("calendar_end_date_input").value = '';          
	            document.getElementById("category_items_room").value = '';
	            document.getElementById("selected_employees").textContent = '';
	            document.getElementById("calendar_username_input").textContent = '${info.name}'; // 작성자 자동 입력
	            
	            
	        } else if (type === 'Info') {
	            // 일정 상세 보기 모드: 데이터 주입
	            console.log("일정 상세 보기 모드: 데이터 주입", data);
	          
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
	            selectedEmployees = [];

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
	            
	            
	        } else if (type === 'Edit') {
	            // 일정 수정 모드: 데이터 주입
	            console.log("이ㅏ건?",data.attendees);
	            console.log("일정 수정 모드: 데이터 주입", data); 
	            fetchCategoryItems(data.no);
	            document.getElementById("edit_calendar_event_id").value = data.idx;
	            document.getElementById("calendar_subject_edit").value = data.subject;
	            document.getElementById("calendar_content_edit").value = data.content;
	            document.getElementById("calendar_start_date_edit").value = data.start_date;
	            document.getElementById("calendar_end_date_edit").value = data.end_date;
	            document.getElementById("category_items_room").value = data.room_name;
	            document.getElementById("calendar_username_edit").textContent = '${info.name}';
	                  
	            // 기존 참석자 로드 및 selectedEmployees 설정
	            $('#selected_employees_edit').empty();
	            selectedEmployees = [];
	            exampleData.rows = []; // 테이블 데이터 초기화
	            var editList = document.getElementById("selected_employees");
	            if(data.attendees && data.attendees.length > 0){
	                data.attendees.forEach(function(attendeeUsername) {
	                    $.ajax({
	                        type: 'GET',
	                        url: '/getUserInfo/' + attendeeUsername,
	                        dataType: 'JSON',
	                        success: function(response) {
	                        	console.log("조직도 모달", response);
	                            var deptText = (response.dept && response.dept.text) ? response.dept.text : '부서 없음';
	                            var cont = '<p style="margin: 0;" data-id="' + response.username + '">'
	                                     + deptText + ' ' 
	                                     + response.name + ' ' 
	                                     + response.position_content + '</p>';
	                            editList.insertAdjacentHTML('beforeend', cont);
	                            selectedEmployees.push(response.username); // 참석자 ID 배열에 저장
	                            
	                         	// 테이블에 참석자 정보 추가
	                            const newRow = [
	                                response.name, 
	                                deptText, 
	                                response.position_content, 
	                                '<button class="btn btn-primary remove-employee" data-id="' + response.username + '" onclick="removeEmployee()">삭제</button>'
	                            ];
	                            exampleData.rows.push(newRow);
	                            updateTableData('customTable', exampleData);
	                        },
	                        error: function(e) {
	                            console.log(e);
	                           
	                        }
	                    });
	                });
	            } else {
	                attendeesList.insertAdjacentHTML('beforeend', '<p>참석자가 없습니다.</p>');
	            }
	            
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
	    	var room_name = $('#room_name').text();
	    	
	    	// 참석자 목록에서 data-id 값을 추출하여 배열에 저장
	        var attendeesList = document.getElementById("people");
	        var attendeeElements = attendeesList.querySelectorAll('p[data-id]');
	        selectedEmployees = Array.from(attendeeElements).map(function(elem) {
	            return elem.getAttribute('data-id');
	        });
	        
	        console.log('Selected Attendee IDs:', selectedEmployees);
	    	
	       	// 수정 모달에 전달할 데이터 객체 생성
	       	var editData = {
		    	idx: eventId,
		    	no: eventNo,
		        subject: subject,
		        content: content,
		        start_date: start_date,
		        end_date: end_date,
		        username: username,
		        room_name: room_name,
		        attendees: selectedEmployees
	       	};

	       	// 현재 모달 닫기
	       	$('#modalBox').hide();
	       	$('#modalBox .modal-content').html('');

		    // 수정 모달 열기
		    loadModal('room', 'Edit', editData);
		}
		   
	   	function handleSaveEditSchedule() {
			// 수정 모달에서 데이터 수집
	       	var idx = $('#edit_calendar_event_id').val();	       	
		    var no = $('#category_items_room').val();
		    console.log('선택된놈 no',no);
		    var username = '${pageContext.request.userPrincipal.name}'; 
		    var start_date = $('#calendar_start_date_edit').val();
		    var end_date = $('#calendar_end_date_edit').val();
		    var subject = $('#calendar_subject_edit').val();
		    var content = $('#calendar_content_edit').val();
		    
		    var attendees = selectedEmployees; // 올바르게 사용
		    console.log('수정자',attendees);
		    
		    if(!start_date || !end_date || !subject || !content || !no){
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
	           	no: no,
	           	attendees: attendees
	       	};
		
	       	// 요청을 통해 일정 수정
	       	$.ajax({
	       		type: 'PUT',
	           	url: '/roomUpdate/' + idx, // 수정 엔드포인트에 id 포함
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
	    	layerPopup("정말 삭제 하시겠습니까?", "확인", "취소", function(){roomDeleteA(idx)}, removeAlert);
	    	httpAjax('DELETE', '/roomDelete/'+idx);
		}
	    
	    function roomDeleteA(idx) {
	    	console.log('삭제 진행시켜',idx);
	    	httpAjax('DELETE', '/roomDelete/'+idx);
	    	removeAlert();
		}
	 
	 
	
 
	
	
	
	
	
</script>
</html>