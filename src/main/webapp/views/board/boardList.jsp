<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공통 레이아웃 CSS</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">

<!-- rating.js(별점) -->
<link rel="stylesheet"
	href="/resources/assets/extensions/rater-js/lib/style.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}"> 
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<style>
	 .btn{
	 	margin: 0%;
	 	width: 80px;
	 }
	 
	 .form-select {
	 	width: 90px;
	 }
	 
	 .row {
	 	margin: 1%;
	 }
	 
	 /* 아이콘 색상 변경 및 마우스 올리면 포인터 변환 */
	 .bi-icon {
	 	color: gray;
	 	cursor: pointer;
	 }
	 
	 /* 게시글에 마우스 올렸을 때 색상 부드럽게 바꾸기 */
	 .td-link {
	    transition: background-color 0.3s ease;
	 }
	 
	 /* 마우스 올리면 색상 변경 */
	 .td-link:hover {
	    background-color: #f0f0f0;
	 }
	 
	 /* 글쓰기 버튼 스타일 변경 */
	 .btn-write {
 	    width: 200px;
	    height: 40px;
	    text-align: center;
	    margin-top: 30px;
	 }
	 
	 .board-detail {
	 	cursor: pointer;
	 }
</style>
<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">
	   <jsp:include page="../sidebar.jsp" />
	   <div id="main">
	      <jsp:include page="../header.jsp" />
	      <div class="page-content">
	         <section id="menu">
	            <h4 class="menu-title">공지사항</h4>
	            <ul>
					<li><a href="/board/View">전체 게시글</a>
					<li><a href="/boardmy/View">내가 쓴 게시글</a>
	            </ul>
	            <a href="/boardwrite/View" class="btn icon icon-left btn-primary btn-write">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit">
						<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
						<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
					</svg>
					글쓰기
				</a>
	         </section>
	         <section class="cont">
	            <div class="col-12 col-lg-12">
	               <div class="tit-area">
	                  <h5>전체 게시글</h5>
	               </div>
	               <div class="cont-body"> 
	               <p id="currentUser" style="display:none;"><sec:authentication property="principal.username"/></p>
	               	  <div class="row">
	               	  	<div class="col-sm-4">
	               	  		<div>
		               	  		<input type="date" id="notice_date1" name="notice_date1" class="form-control" style="width: 150px; display: none;">
		               	  		&nbsp;<span id="notice_i" style="display: none;">~</span>&nbsp;
		               	  		<input type="date" id="notice_date2" name="notice_date2" class="form-control" style="width: 150px; display: none;">
	               	  		</div>
               	  		</div>
	               	  	<div class="col-sm-1"><button class="btn btn-primary" id="notice_button" onclick="notice_write()" style="display: none;">공지</button></div>
	               	  	<div class="col-sm-1"></div>
	               	  	<div class="col-sm-1">
	               	  		<select class="form-select" id="searchOption">
								<option value="dept">부서</option>
								<option value="name">이름</option>
								<option value="subject">제목</option>
							</select>
						</div>
	               	  	<div class="col-sm-4"><input name="search" class="form-control" type="text" placeholder="검색"></div>
	               	  	<div class="col-sm-1">&nbsp;&nbsp;<button class="btn btn-primary" id="searchBtn"><i class="bi bi-search"></i></button></div>
	               	  </div>
	                  <div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 order-md-1 order-last">
										<div class="card">
											<table>
												<colgroup>
													<col width="6%" />
													<col />
													<col width="30%" />
													<col />
													<col />
													<col />
													<col width="6%" />
													<col width="6%" />
												</colgroup>
												<thead>
													<tr>
														<th>공지</th>
														<th>글번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>조회수</th>
														<th>작성일시</th>
														<th></th>
														<th></th>
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
						<div class="">
							<nav aria-label="Page navigation">
					            <ul class="pagination justify-content-center" id="pagination"></ul>
					        </nav>
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
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script src='/resources/js/common.js'></script>
<script>
var firstPage = 1;
var paginationInitialized = false;

$(document).ready(function () {
	pageCall(firstPage);
});


// 검색 폼 제출 시 AJAX 호출
$('#searchBtn').on('click', function(event) {
    event.preventDefault();  // 폼 제출 기본 동작 중지
    firstPage = 1;
    paginationInitialized = false;
    pageCall(firstPage);  // 검색어가 추가된 상태에서 호출
});




function pageCall(page = 1) {
    var option = $('#searchOption').val();
    var keyword = $('input[name="search"]').val();  // 검색어

    $.ajax({
        type: 'GET',
        url: '/board/list',
        data: {
            'page': page || 1, // 페이지 기본값 설정
            'cnt': 10,         // 한 페이지당 항목 수
            'option': option,
            'keyword': keyword  // 검색어
        },
        datatype: 'JSON',
        success: function(response) {
            console.log("응답 데이터:", response);

            // 데이터 처리
            if (response && response.length > 0) {
                getSuccess(response); // 검색 결과를 테이블에 렌더링
            } else {
                $('#boardList').html('<tr><td colspan="7">검색 결과가 없습니다.</td></tr>');
            }

            // 페이지네이션 초기화
            var totalPages = response[0]?.totalpage || 1; // 서버에서 받은 totalpage
            console.log('총 페이지 수:', totalPages);

            if (!paginationInitialized || keyword !== '') {
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    startPage: page,
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    onPageClick: function (evt, page) {
                        console.log('클릭된 페이지:', page);
                        pageCall(page);
                    }
                });
                paginationInitialized = true;
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}

	// 로그인 한 사람의 아이디값 가져오기
	var myId = document.getElementById('currentUser').textContent.trim();
	
	function getSuccess(response){
		console.log(response);
		
		$('#boardList').empty();
		
		var content = '';
		response.forEach(function(item) {
		    content += '<tr class="td-link">';
		    content += '<td>';
		    if (item.board_notice !== 'Y') {
		        content += '<sec:authorize access="hasRole(\'admin\')">'
		            + '<input type="checkbox" id="checkbox' + item.board_idx + '" class="form-check-input" onclick="toggleNoticeFields()">'
		            + '</sec:authorize>';
		    }else {
		    	content += '<i class="bi bi-star-fill" style="color: gold;"></i>';
		    }
		    content += '</td>';
		    // 번호
		    content += '<td>' + item.board_idx + '</td>';
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
	
	function toggleNoticeFields() {
		const date1 = document.getElementById('notice_date1');
	    const date2 = document.getElementById('notice_date2');
	    const button = document.getElementById('notice_button');	
	    const notice_i = document.getElementById('notice_i');	
	    
	    let blockType = false;
	    const allCheckboxes = document.querySelectorAll('.form-check-input');

	    // 체크된 체크박스를 확인
	    let checkedCheckbox = null;
	    allCheckboxes.forEach(checkbox => {
	        if (checkbox.checked) {
	            blockType = true;
	            checkedCheckbox = checkbox; // 체크된 체크박스를 저장
	        }
	    });

	    // 날짜 입력란과 버튼 표시/숨김
	    date1.style.display = blockType ? 'inline-block' : 'none';
	    date2.style.display = blockType ? 'inline-block' : 'none';
	    button.style.display = blockType ? 'inline-block' : 'none';
	    notice_i.style.display = blockType ? 'inline-block' : 'none';

	    // 다른 체크박스 숨기기 또는 다시 보이게 하기
	    allCheckboxes.forEach(checkbox => {
	        if (checkbox !== checkedCheckbox) {
	            checkbox.style.display = blockType ? 'none' : 'inline-block';
	        }
	    });
	}
	
	function notice_write() {
	    const checkedCheckbox = document.querySelector('.form-check-input:checked');
	    if (!checkedCheckbox) {
	        layerPopup(
	            '체크된 게시글이 없습니다.',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
	    }
	    const date1 = document.getElementById('notice_date1').value;
	    const date2 = document.getElementById('notice_date2').value;
	    if (!date1 || !date2) {
	        layerPopup(
	            '날짜를 모두 입력하세요.',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
	    }
	    
	    if (date1 === date2) {
	        layerPopup(
	            '종료 날짜는 시작 날짜 이후로 설정해야 합니다.',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
	    }

	    // 오늘 날짜 가져오기
	    const today = new Date();
	    today.setHours(0, 0, 0, 0); // 오늘 날짜를 자정으로 설정

	    const inputDate1 = new Date(date1);
	    const inputDate2 = new Date(date2);

	    if (inputDate1 < today || inputDate2 < today) {
	        layerPopup(
	            '시작, 종료일 날짜는 오늘 이후로 설정해야 합니다.',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
	    }

	    if (inputDate2 < inputDate1) {
	        layerPopup(
	            '종료 날짜는 시작 날짜 이후로 설정해야 합니다.',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
	    }
	    const board_idx = checkedCheckbox.id.replace('checkbox', '');
	    console.log('Board Index:', board_idx);
	    const params = { board_idx: board_idx, notice1: date1, notice2: date2 };
	    const url = '/set/notice';
	    httpAjax('POST', url, params);
	}
	
	function httpSuccess(response) {
		
		if(response.status === 'notice') {
			layerPopup(
                    '공지사항 등록이 완료되었습니다.', // 서버에서 보낸 메시지
                    '확인',
                    null,
                    function () {
                        removeAlert();
                    },
                    function () {}
                );
			location.reload();
		}

		if (response.status === 'deleteboard') {
			location.reload();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
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
	
	
	
	// 페이지 이동 될 때마다 li 에 class="active" 주입
	document.addEventListener('DOMContentLoaded', () => {
        const currentPath = window.location.pathname;
        if (currentPath.includes('/boardmy')) {
            $('.tit-area h5').text('내가 쓴 게시글');
        } else if (currentPath.includes('/board')) {
            $('.tit-area h5').text('전체 게시글');
        }
        const menuItems = document.querySelectorAll('#menu li');
        menuItems.forEach(item => {
            const link = item.querySelector('a');
            if (link && currentPath.includes(link.getAttribute('href'))) {
                item.classList.add('active');
            } else {
                item.classList.remove('active');
            }
        });
    });

	
	
	function deleteboard(data) {
		layerPopup('게시글을 삭제하시겠습니까?', '예', '아니오', function() { secondBtn1Act(data); },
			secondBtn2Act);
		console.log(data);
	}
	
	// 게시글 삭제 버튼
	function secondBtn1Act(data) {
		console.log('받아온idx',data);
		params = {board_idx: data};
		url = '/board/delete';
		httpAjax('POST', url, params);
		removeAlert();
	}

	// 게시글 삭제 취소버튼
	function secondBtn2Act() {
		console.log('게시글 삭제 취소');
		removeAlert();
	}

	// 모달창 열기
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});
	
	//모달창 닫기
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	
	
	
	
	
	
	
	function updateboard(data) {
	    layerPopup(
	        '게시글을 수정하시겠습니까?', 
	        '예', 
	        '아니오', 
	        function() { updateboards(data); }, // "예" 버튼 클릭 시 호출
	        secondBtn2Act // "아니오" 버튼 클릭 시 호출
	    );
	    console.log('수정 요청 idx:', data);
	}

	// 수정 페이지로 리다이렉트
	function updateboards(data) {
	    console.log('수정 페이지 이동:', data);
	    removeAlert(); // 팝업 닫기
	    location.href = '/boardupdate/View/' + data; // 수정 페이지로 이동
	}

	// 취소 버튼
	function secondBtn2Act() {
	    console.log('수정 취소');
	    removeAlert();
	}
</script>

</html>