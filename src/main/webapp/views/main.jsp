<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인</title>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<!-- <link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css"> -->
<!-- <link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css"> -->
<link rel="stylesheet" href="/resources/css/chartModal.css">
<link rel="stylesheet" href="/resources/css/common.css">

<!-- FilePond CSS -->
<link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet" />

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<!-- jstree -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<!-- Autocomplete -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- fullcalender -->
<script src='/resources/js/calender/main.js'></script>
<script src='/resources/js/calender/daygridmain.js'></script>
<script src='/resources/js/calender/interactionmain.js'></script>
<script src='/resources/js/calender/timemain.js'></script>

<link href='/resources/css/calender/main.css' rel='stylesheet' />
<link href='/resources/css/calender/daygridmain.css' rel='stylesheet' />
<link href='/resources/css/calender/timemain.css' rel='stylesheet' />

<style>
	*{ 
		box-sizing: border-box;
	}
	.row {}
 	.sec {
 		padding: 20px 12px;
 	}
 	.sec-cont {
 		border-radius: 10px;
 		background: #fff;
	}
	.sec-tit {
		padding: 24px;
	    margin-bottom: 0;
		cursor: pointer;
	}
	.quick-menu {
		padding: 20px 12px;
	
		
	}
	.quick-cont {
		display: flex;
		justify-content: center;
    	align-items: center;
		padding:  20px 24px;
 		border-radius: 10px;
 		background: #fff;
	}
	.quick-menu img{ 
		width: 44px;
		margin-right: 14px;
	}
	.quick-tit {
	    font-weight: 600;
    	color: var(--bs-heading-color);
    	font-size: 1.25rem;
	}
	
	/* 공지사항 */
	.notice .cont-body {
	}
	.notice table {
	    table-layout: unset;
	}
	.notice table tr {
	    border-top: 1px solid #ddd;
	    border-bottom: none;
	}
	.notice table td,
	.notice table th {
		background: none;
    	padding: 12px 8px;
    }
    .notice table th:first-child,
    .notice table td:first-child {
    	max-width: 52px;
    	padding-left: 18px;
    }
    .notice table th:last-child,
    .notice table td:last-child {
    	max-width: 106px;
    	padding-right: 18px;
	}
	.notice table td.align-l {
	    max-width: 160px;
	}
	
	/* 캘린더 */
	    #calendarBox{
        width: 92%;
        padding-left: 8%;
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
	.fc-button{
		padding: 0.25em 0.4em;
	}
</style>

</head>

<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">

		<!-- 사이드바 -->
		<jsp:include page="./sidebar.jsp" />

		<div id="main">
			<!-- 헤더 -->
			<jsp:include page="./header.jsp" />

			<div class="main">
				<section class="row">
					<div class="sec col-8 col-lg-8">
						
						<div class="quick row">
							<a class="quick-menu sec col-3 col-lg-3" href="/mail/listView/recv">
								<div class="quick-cont">
									<img src="/resources/img/main/quick_mail.png"/>
									<span class="quick-tit">사내메일</span>
								</div>
							</a>
							<a class="quick-menu sec col-3 col-lg-3" href="/mail/listView/recv"><!--check!!여기부터  -->
								<div class="quick-cont">
									<img src="/resources/img/main/quick_my.png"/>
									<span class="quick-tit">나의정보</span>
								</div>
							</a>
							<a class="quick-menu sec col-3 col-lg-3" href="/approval/listView/my">
								<div class="quick-cont">
									<img src="/resources/img/main/quick_approval.png"/>
									<span class="quick-tit">문서함</span>
								</div>
							</a>
							<a class="quick-menu sec col-3 col-lg-3" href="/chat/list">
								<div class="quick-cont">
									<img src="/resources/img/main/quick_message.png"/>
									<span class="quick-tit">메신저</span>
								</div>
							</a>
							
						</div>
						<div class="row">
							<!--  -->
							<div class="sec notice col-6 col-lg-6">
								<div class="sec-cont">
									<h5 class="sec-tit" onclick="location.href='/board/View'">공지사항</h5>
						               <div class="cont-body"> 
						               		<p id="currentUser" style="display:none;"><sec:authentication property="principal.username"/></p>
												<div class="page-title">
													<div class="row">
														<div class="col-12 order-md-1 order-last">
																<table>
	<!-- 																<colgroup>
																		<col width="40px" />
																		<col width="30%" />
																		<col width="80px;" />
																		<col width="40px" />
																		<col  />
																	</colgroup> -->
																	<thead>
																		<tr>
																			<th>공지</th>
																			<th>제목</th>
																			<th>작성자</th>
																			<th>조회수</th>
																			<th>작성일시</th>
																		</tr>
																	</thead>
																	<tbody id="boardList">
																	</tbody>
																</table>
														</div>
													</div>
												</div>
										</div>
								</div>
							</div>
							<div class="sec col-6 col-lg-6">
								<div class="sec-cont">
									<h5 class="sec-tit">결재할 문서</h5>
										
									<div class="cont-body">
										<table class="list">
											<colgroup>
												<col>
												<col width="30%">
												<col>
												<col>
												<col>
											</colgroup>
											<thead>
												<tr>
													<th>문서번호</th>
													<th class="align-l">제목</th>
													<th>기안자</th>
													<th>부서</th>
													<th>기안일자</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
			
						
									</div>
								

								</div>
							</div>
						</div>
					</div>
					
					<!-- 사용자 정보 -->
					<div class="sec col-4 col-lg-4">
						<div class="sec-cont">
						 사용자 정보
						</div>
					</div>
				
				</section>
				<section class="row">
					<div class="sec col-4 col-lg-4">
						<div class="sec-cont">
								<h5 class="sec-tit">받은 메일함</h5>
								ffffff<br>
								ffffff<br>
								ffffff<br>
						</div>
					</div>
					<div class="sec col-8 col-lg-8">
						<div class="sec-cont">
								<h5 class="sec-tit" onclick="location.href='/calender'">캘린더</h5>
								
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
					</div>
				</section>
			</div>
		</div>
	</div>
</body>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>

<!-- FilePond JavaScript -->
<script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>

<!-- jQuery -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/charjstree.js'></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>



<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 캘린더 -->
<script src='/resources/js/calenderJH.js'></script>

<script>
	// 공지사항
	var firstPage = 1;
	var paginationInitialized = false;

	$(document).ready(function () {
		noticeCall(firstPage);
	});

	function noticeCall(page = 1) {
	    //var option = $('#searchOption').val();
	    //var keyword = $('input[name="search"]').val();  // 검색어
	
	    $.ajax({
	        type: 'GET',
	        url: '/board/list',
	        data: {
	            'page': page || 1, // 페이지 기본값 설정
	            'cnt': 5        // 한 페이지당 항목 수
	           // 'option': option,
	           // 'keyword': keyword  // 검색어
	        },
	        datatype: 'JSON',
	        success: function(response) {
	            console.log("응답 데이터:", response);
	            // 데이터 처리
	            if (response && response.length > 0) {
	                getBoardSuccess(response); // 검색 결과를 테이블에 렌더링
	            } else {
	                $('#boardList').html('<tr><td colspan="7">검색 결과가 없습니다.</td></tr>');
	            }
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	}

	// 로그인 한 사람의 아이디값 가져오기
	var myId = document.getElementById('currentUser').textContent.trim();
	function getBoardSuccess(response){
		console.log("response: ",response);
		$('#boardList').empty();
		var content = '';
		response.forEach(function(item) {
		    content += '<tr class="td-link">';
		    content += '<td>';
		    if (item.board_notice !== 'Y') {
		        content += '<sec:authorize access="hasRole(\'ADMIN\')">'
		            + '<input type="checkbox" id="checkbox' + item.board_idx + '" class="form-check-input" onclick="toggleNoticeFields()">'
		            + '</sec:authorize>';
		    }else {
		    	content += '<i class="bi bi-star-fill" style="color: gold;"></i>';
		    }
		    content += '</td>';
		    // 제목 (클릭 시 이동)
		    content += '<td class="align-l elipsis" style="cursor: pointer; text-align: center;"';
			if (item.board_state === 'N') {
			    content += 'onclick="checkdept(' + item.board_idx + ')"';
			} else {
			    content += 'onclick="window.location.href=\'/boarddetail/View/' + item.board_idx + '\'"';
			}
			content += '>' + item.subject;
			
			if (item.board_state === 'N') {
			    content += ' <span style="color: gray;">(비공개)</span>';
			}
		    // 작성자
		    content += '<td>' + item.userNick + '</td>';
		    // 조회수
		    content += '<td>' + item.count + '</td>';
		    // 작성일
		    content += '<td>' + item.recreate_date + '</td>';
		    if (myId === item.username) {
		    	content += '<td><i class="bi bi-pencil-square btn-popup-update bi-icon" onclick="updateboard(' + item.board_idx + ')"></i></td>';
			    content += '<td><i class="bi bi-trash btn-popup bi-icon" onclick="deleteboard(' + item.board_idx + ')"></i></td>';
			}
		    content += '</tr>';
		});
		$('#boardList').append(content);
	}
	
	// 권한 글이동
	function checkdept(board_idx) {
		const username = document.getElementById("currentUser").textContent.trim();
		const params = {board_idx: board_idx, username: username};
		const url = '/checkDept';
		$.ajax({
	        type: 'GET', 
	        url: url, 
	        data: params, 
	        dataType: 'json', 
	        success: function(response) {
	        	if (response.status) {
	                // 권한이 있으면 게시글로 이동
	                window.location.href = '/boarddetail/View/' + board_idx;
	            } else {
	                // 권한이 없으면 레이어 팝업 표시
	                layerPopup(
	                    response.msg, // 서버에서 보낸 메시지
	                    '확인',
	                    null,
	                    function () {
	                        removeAlert();
	                    },
	                    function () {}
	                );
	            }
	        },
	        error: function(error) {
	            console.error('AJAX 호출 실패:', error);
	        }
	    });
	}
	
	
	/* 캘린더 */
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
	    $('#filterC, #filterT, #filterP').prop('checked', isChecked);
	    applyFilter();
	}
	
	function handleIndividualFilter() {
	    // 모든 개별 필터가 선택되었는지 확인
	    var allChecked = $('#filterC').is(':checked') && $('#filterT').is(':checked') && $('#filterP').is(':checked');
	    $('#filterAll').prop('checked', allChecked);
	    applyFilter();
	}
	
	// 필터링 기능
	function applyFilter() {
	    // 체크된 필터 값 수집
	    var filters = [];
	    
        filters.push('C', 'P', 'T');

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
	        url: '/calenderDetail/'+idx, // 컨트롤러의 상세 조회 엔드포인트
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
	 	                    type: schedule.type
	                };
	
	                // 모달 열기
	                loadModal("calender", "Info", params);
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
        console.log('셋모달데이타 : ',data);
        if (type === 'Input') {
            // 일정 추가 모드: 입력 필드 초기화
            console.log("일정 추가 모드: 데이터 없음");
            document.getElementById("calendar_subject_input").value = '';
            document.getElementById("calendar_content_input").value = '';
            document.getElementById("calendar_start_date_input").value = '';
            document.getElementById("calendar_end_date_input").value = '';
            document.getElementById("calendar_username_input").textContent = '${pageContext.request.userPrincipal.name}'; // 작성자 자동 입력
        } else if (type === 'Info') {
            // 일정 상세 보기 모드: 데이터 주입
            console.log("일정 상세 보기 모드: 데이터 주입", data);
        	if(data.type == 'C'){
        		document.getElementById("detail").textContent = '공지 상세정보';
        	}else if(data.type == 'T'){
        		document.getElementById("detail").textContent = '팀 상세정보';
        	}else{
        		document.getElementById("detail").textContent = '일정 상세정보';
        	}
            
            document.getElementById("subject").textContent = data.subject;
            document.getElementById("content").textContent = data.content;
            document.getElementById("start_date").textContent = new Date(data.start_date).toLocaleString();
            document.getElementById("end_date").textContent = new Date(data.end_date).toLocaleString();
            document.getElementById("username").textContent = data.username;
            document.getElementById("event_id").value = data.idx;
        } else if (type === 'Edit') {
            // 일정 수정 모드: 데이터 주입
            console.log("일정 수정 모드: 데이터 주입", data);       
            document.getElementById("edit_calendar_event_id").value = data.idx;
            document.getElementById("calendar_subject_edit").value = data.subject;
            document.getElementById("calendar_content_edit").value = data.content;
            document.getElementById("calendar_start_date_edit").value = data.start_date;
            document.getElementById("calendar_end_date_edit").value = data.end_date;
            document.getElementById("calendar_type_edit").value = data.type
            document.getElementById("edit_calendar_event_username").value = data.username;
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
                    loadCalender(section);
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
    	httpAjax('DELETE', '/calenderDelete/'+idx);
	}
    
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}	
	
	
	/* 결재할 문서 */
	//var listType = '${listType}';
	//console.log("listType : ",listType);
	var show = 1;
	//var paginationInitialized = false;
	//var option = '';
	//var search = '';
	//var filter = '';
	
	var totalCount = 0;
    var pageSize = 5;  // 한 페이지당 게시글 수  //check!!! cnt를 얘로??
    var totalPage = 0;
	var filterElem = '';
	
	pageCall(show);
	
	function pageCall(page) {

		
		$.ajax({
			type:'GET',
			url:'/approval/list/tobe',
			data:{
				'page':page,
				'cnt':5,
				'listType': 'tobe'
			},
			datatype:'JSON',
			success:function(data){
				console.log(data);

				if(data.approvalList.length > 0){
					totalCount = data.approvalList[0].total_count;  // 총 게시글 수
		           // totalPage = Math.ceil(totalCount / pageSize);  // 총 페이지 수 계산
				}
				console.log("totalCount",totalCount,"totalPage",totalPage);
				drawList(data.approvalList);
	            
	            
				 
			},
			error:function(e){
				console.log(e);
			}
		});
	}

	function drawList(list) {
		var content ='';
		var approvalDate = '';
		var type1='';
		var type2='';
		if(totalCount == 0){
			content +='<tr><td colspan="8">조회된 데이터가 없습니다.</td></tr>';
			$('.list tbody').html(content);
			return false;
		}
		for (var view of list) {
			if(view.approval_date != null){
				approvalDate = view.approval_date.split(' ')[0];
			}else{
				approvalDate = '-';
			}
			
			content +='<tr>';
			
            content += '<td>'+view.document_number+'</td>';
            content += '<td class="align-l elipsis subject" onclick="location.href=\'/approval/detail/'+view.draft_idx+'\'">'+view.subject+'</td>';
            content +='<td>'+view.name+'</td>';
			content +='<td>'+view.dept_text+'</td>';	
            content += '<td>'+view.create_date+'</td>';
			content +='</tr>';
			console.log("view.draft_idx",view.draft_idx);
		  }
	     $('.list tbody').html(content);
	   }
	
	$(document).on('click','.list td.delete',function(){
		var draftIdx = $(this).data('draftidx');
		layerPopup('해당 기안문을 삭제하시겠습니까?', '삭제', '취소', deleteAct, btn1Act);
		
		// 기안문 삭제
		function deleteAct() {
			console.log("draftIdx값좀 받아와라 : "+draftIdx);
			$.ajax({
		        type : 'PUT',
		        url : '/approval/changeStatusToDelete/'+draftIdx,
		        data : {},
		        dataType : 'JSON',
		        beforeSend: function(xhr) {
		            xhr.setRequestHeader(csrfHeader, csrfToken);
		        },
		        success : function(response){
		        	 if(response.success){
		     		 	removeAlert(); 
		      			layerPopup('삭제 완료되었습니다.', '확인', false, btn1Act, btn1Act);
		     		 }else{
		     		 	removeAlert(); 
		      			layerPopup('삭제 실패하였습니다.', '재시도', '취소', deleteAct, btn1Act);
		     		 }
		        },error: function(e){
		            console.log(e);
		        }
		    });
		}
	});
	
		
		
		var csrfToken = document.querySelector('meta[name="_csrf"]').content;
		var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
		
		function btn1Act() {
			location.reload();
			removeAlert(); 
		}
	
	
</script>

</html>