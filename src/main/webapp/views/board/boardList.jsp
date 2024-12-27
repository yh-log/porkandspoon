<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	               	  <div class="row">
	               	  	<div class="col-sm-6"></div>
	               	  	<div class="col-sm-1">
	               	  		<select class="form-select" id="basicSelect">
								<option>제목</option>
								<option>부서명</option>
								<option>작성자</option>
							</select>
						</div>
	               	  	<div class="col-sm-4"><input class="form-control" type="text" placeholder="검색"></div>
	               	  	<div class="col-sm-1"><button class="btn btn-primary"><i class="bi bi-search"></i></button></div>
	               	  </div>
	                  <div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 order-md-1 order-last">
										<div class="card">
											<table>
												<colgroup>
													<col width="6%" />
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
														<th>체크</th>
														<th>별</th>
														<th>글번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>조회수</th>
														<th>작성일시</th>
														<th>수정</th>
														<th>삭제</th>
													</tr>
												</thead>
												<tbody>
													<!-- <tr class="td-link">
														<td><input type="checkbox" id="checkbox1" class="form-check-input"></td>
														<td>별</td>
														<td>1</td>
														<td onclick="window.location.href='/boarddetail/View';" class="align-l elipsis">긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬</td>
														<td>김순무</td>
														<td>19</td>
														<td>2024.12.19</td>
														<td><i class="bi bi-pencil-square btn-popup-update bi-icon"></i></td>
														<td><i class="bi bi-trash btn-popup bi-icon"></i></td>
													</tr>
													<tr onclick="window.location.href='#';" class="td-link">
														<td><input type="checkbox" id="checkbox1" class="form-check-input"></td>
														<td>별</td>
														<td>2</td>
														<td class="align-l elipsis">긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬</td>
														<td>김순무</td>
														<td>19</td>
														<td>2024.12.19</td>
														<td><i class="bi bi-pencil-square btn-popup-update bi-icon"></i></td>
														<td><i class="bi bi-trash btn-popup bi-icon"></i></td>
													</tr>
													<tr onclick="window.location.href='#';" class="td-link">
														<td><input type="checkbox" id="checkbox1" class="form-check-input"></td>
														<td>별</td>
														<td>3</td>
														<td class="align-l elipsis">긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬</td>
														<td>김순무</td>
														<td>19</td>
														<td>2024.12.19</td>
														<td><i class="bi bi-pencil-square btn-popup-update bi-icon"></i></td>
														<td><i class="bi bi-trash btn-popup bi-icon"></i></td>
													</tr>
													<tr onclick="window.location.href='#';" class="td-link">
														<td><input type="checkbox" id="checkbox1" class="form-check-input"></td>
														<td>별</td>
														<td>4</td>
														<td class="align-l elipsis">긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬</td>
														<td>김순무</td>
														<td>19</td>
														<td>2024.12.19</td>
														<td><i class="bi bi-pencil-square btn-popup-update bi-icon"></i></td>
														<td><i class="bi bi-trash btn-popup bi-icon"></i></td>
													</tr> -->
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div>
							<nav aria-label="Page navigation">
					            <ul class="pagination justify-content-center" id="pagination">
					                <!-- 페이지 번호가 여기에 생성됨 -->
					            </ul>
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
<script>
$(document).ready(function () {
    // 페이지네이션 초기화
    $('#pagination').twbsPagination({
        startPage: 1,         // 첫 번째 페이지
        totalPages: 10,       // 전체 페이지 (초기값)
        visiblePages: 10,     // 한 번에 보이는 페이지 개수
        onPageClick: function (event, page) {
            console.log('페이지 클릭: ', page);
            pageCall(
                page,          // 현재 페이지
                10,            // 한 페이지에 보여줄 게시물 수
                '/board/list', // 요청 URL
                {
                    option: $('#basicSelect').val(),        // 필터 옵션 (제목, 작성자, 부서명 등)
                    search: $('.form-control').val()       // 검색어 (검색이 있을 때만 사용)
                }
            );
        }
    });

    // 페이지 초기 로드 (검색 없이 전체 게시글 목록만 불러오기)
    pageCall(
        1,             // 첫 페이지
        10,            // 한 페이지에 보여줄 게시물 수
        '/board/list', // 요청 URL
        {
            option: '',  // 필터 옵션 (없음)
            search: ''   // 검색어 (없음)
        }
    );
});

// 페이지 요청 함수 (검색 처리 및 페이지네이션)
function pageCall(page, cnt, url, filters) {
    $.ajax({
        url: url,
        type: 'POST',  // POST 방식으로 요청
        contentType: 'application/json', // 요청의 데이터 형식
        headers: {
            // CSRF 토큰을 요청 헤더에 추가
            [ $("meta[name='_csrf_header']").attr("content") ]: $("meta[name='_csrf']").attr("content")
        },
        data: JSON.stringify({
            page: page,
            cnt: cnt,
            option: filters.option,  // 검색 옵션
            search: filters.search   // 검색어
        }),
        success: function(response) {
            // 서버에서 받은 데이터를 테이블에 업데이트
            updateTable(response.data);   // 게시물 목록 업데이트
            updatePagination(response.totalPages, page); // 페이지네이션 업데이트
        },
        error: function(xhr, status, error) {
            console.log("AJAX 요청 실패: ", error);
        }
    });
}

// 게시물 목록을 업데이트하는 함수
function updateTable(data) {
    let tbody = $('table tbody');
    tbody.empty(); // 기존 행을 지운다.

    // 데이터를 기반으로 테이블을 동적으로 생성
    data.forEach(item => {
        let row = `
            <tr class="td-link">
                <td><input type="checkbox" class="form-check-input"></td>
                <td>${item.board_idx}</td>
                <td onclick="window.location.href='/boarddetail/View?id=${item.board_idx}';" class="align-l elipsis">${item.subject}</td>
                <td>${item.username}</td>
                <td>${item.count}</td>
                <td>${item.create_date}</td>
            </tr>
        `;
        tbody.append(row);
    });
}

// 페이지네이션을 업데이트하는 함수
function updatePagination(totalPages, currentPage) {
    $('#pagination').twbsPagination('destroy'); // 기존 페이지네이션 제거
    $('#pagination').twbsPagination({
        totalPages: totalPages,    // 전체 페이지 수
        startPage: currentPage,    // 현재 페이지
        visiblePages: 10,          // 한 번에 보이는 페이지 개수
        onPageClick: function (event, page) {
            pageCall(page, 10, '/board/list', {
                option: $('#basicSelect').val(),
                search: $('.form-control').val()  // 검색어
            });
        }
    });
}

	/* 페이지네이션 prev,next 텍스트 제거 */
	// $('.page-item.prev, .page-item.first, .page-item.next, .page-item.last').find('.page-link').html('');
	$('.page-item.prev').find('.page-link').html(
			'<i class="bi bi-chevron-left"></i>');
	$('.page-item.next').find('.page-link').html(
			'<i class="bi bi-chevron-right"></i>');
	$('.page-item.first').find('.page-link').html(
			'<i class="bi bi-chevron-double-left"></i>');
	$('.page-item.last').find('.page-link').html(
			'<i class="bi bi-chevron-double-right"></i>');
	
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

	
	
	
	
	
	
	
	
	
	
	
	// 게시글 삭제 버튼
	function secondBtn1Act() {
		console.log('게시글 삭제 하기');
		removeAlert();
	}

	// 게시글 삭제 취소버튼
	function secondBtn2Act() {
		console.log('게시글 삭제 취소');
		removeAlert();
	}
	
	// 게시글 삭제 팝업
	$('.btn-popup').on(
			'click',
			function() {
				layerPopup('게시글을 삭제하시겠습니까?', '예', '아니오', secondBtn1Act,
						secondBtn2Act);
			});

	// 모달창 열기
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});
	
	//모달창 닫기
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	// 게시글 수정 버튼
	function secondBtn1Actupdate() {
		console.log('게시글 수정 하기');
		window.location.href='/boardupdate/View';
		removeAlert();
	}

	// 게시글 수정 취소버튼
	function secondBtn2Actupdate() {
		console.log('게시글 수정 취소');
		removeAlert();
	}
	
	// 게시글 수정 팝업
	$('.btn-popup-update').on(
			'click',
			function() {
				layerPopup('게시글을 수정하시겠습니까?', '예', '아니오', secondBtn1Actupdate,
						secondBtn2Actupdate);
			});
	
	// 모달창 열기
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	// 모달창 닫기
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
</script>

</html>