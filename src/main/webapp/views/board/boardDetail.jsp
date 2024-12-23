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

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<style>

	/* 버튼 크기 설정 */
	.btn-write {
		width: 90px;
    	height: 40px;
	}
	
	/* 테이블 텍스트 위치 조정 */
	.table-text {
		text-align: left;
	}
	
	/* 테이블 하단 선 삭제 */
	.table-sun {
		border-bottom: none;
	}
	
	/* 이미지 조정 */
	.table-img {
		width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    object-fit: cover;
	}
	
	/* 내용창 설정 */
	.table-textarea {
	    width: 100%;
	    height: 450px;
	    border: solid white;
	    text-align: left;
	    resize: none;
	}
	
	/* 사람 아이콘 크기 설정 */
	.bi-person-fill {
		font-size: 22px;
	}
	
	/* 채팅 아이콘 크기 설정 */
	.bi-chat {
		font-size: 20px;
	}
	
	/* 댓글 버튼 스타일 설정 */
	.btn-review {
	    background-color: white;
	    border: none;
	    color: gray;
	}
	
	/* 아이콘 색상 변경 및 마우스 올리면 포인터 변환 */
	 .bi-icon {
	 	color: gray;
	 	cursor: pointer;
	 }
	 
	 /* 글쓰기 input 창 크기 설정 */
	 .review-write {
	 	height: 80px;
	 }
	 
	 /* 조회수에 마우스 올릴 시 커서 변경 */
	 .user-list {
	 	cursor: pointer;
	 }
	 
	 /* 확인한 리스트 모달창 스타일 변경  */
	 #modal .modal-user-list {
 	    top: 27%;
	    width: 300px;
	    height: 450px;
	    overflow: auto;
	 }
	 
	 /* 모달창 "예" 버튼 크기 수정 */
	 .confirm{
	 	width: 75px;
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
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>글쓰기</h5>
               </div>
               <div class="cont-body"> 
					<div class="row">
	               	  	<div class="col-sm-1"><a href="/board/View" class="btn btn-outline-primary btn-write">돌아가기</a></div>
	               	  	<div class="col-sm-1"><button class="btn btn-outline-primary btn-write-update btn-write">수정하기</button></div>
	               	  	<div class="col-sm-1"><button class="btn btn-outline-primary btn-write-delete btn-write">삭제하기</button></div>
	               	  	<div class="col-sm-9"></div>
               	  	</div>
               	  <div class="row">
	                  <table>
						<colgroup>
							<col width="60%" />
						</colgroup>
						<thead>
						</thead>
						<tbody>
							<tr class="table-sun">
								<td class="table-text table-text-text"><h5>김순무 김열무 사귀다.(제목)</h5></td>
							</tr>
							<tr class="table-sun">
								<td class="table-text table-text-text">
									<img class="table-img" src="https://randomuser.me/api/portraits/men/1.jpg" alt="사람 이미지">&nbsp;&nbsp;인사팀 이진형
								</td>
							</tr>
							<tr></tr>
							<tr class="table-sun">
								<td>
									<textarea class="table-textarea">상세내용이 어쩌고 저쩌구...</textarea>
								</td>
							</tr>
							<tr class="table-sun">
								<td class="table-text table-text-text">
									<i class="bi bi-chat"></i>&nbsp;<span>댓글 2개</span>&nbsp;|&nbsp;<span class="btnModal user-list">조회 5</span>&nbsp;|&nbsp;<i class="bi bi-person-fill"></i>&nbsp;<span>5</span>
									<!-- 유저 리스트 모달 -->
									<div id="modal" class="modal">
										<div class="modal-cont modal-user-list">
											<span class="close">&times;</span>
											<div id="modal-body">
												<h4 class="menu-title">확인한 직원 리스트</h4>
												<table>
													<colgroup>
														<col width="30%" />
														<col />
													</colgroup>
													<tbody>
														<tr>
															<td>사진</td>
															<td>이름</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>									
								</td>
							</tr>
							<tr></tr>
						</tbody>
					</table>
					<div>
						<table>
							<colgroup>
								<col width="5%" />
								<col width="75%" />
								<col width="20%" />
							</colgroup>
							<thead>
							</thead>
							<tbody>
								<tr class="table-sun">
									<td class="table-text table-text-text">
										<img class="table-img" src="https://randomuser.me/api/portraits/men/1.jpg" alt="사람 이미지">
									</td>
									<td class="table-text table-text-text">
										인사팀 이경언
										<button class="btn-review"><i class="bi bi-arrow-return-right"></i>댓글</button>&nbsp;&nbsp;<span style="color: gray; font-size: 14px;">2024.12.01</span>
									</td>
									<td>
										<button class="btn icon btn-secondary btn-update"><i class="bi bi-pencil"></i></button>
										<button class="btn icon btn-secondary btn-delete"><i class="bi bi-trash"></i></button>
									</td>
								</tr>
								<tr class="table-sun">
									<td></td>
									<td class="table-text table-text-text">
										<span>대단합니다!!!</span>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="review-group">
							<input class="form-control review-write" type="text" placeholder="댓글을 입력하세요.">
							<button class="btn btn-lg btn-primary"><span>등록</span></button>
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
<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
	
<!-- 파일업로더 -->
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="/resources/assets/extensions/filepond/filepond.js"></script>
<script src="/resources/assets/static/js/pages/filepond.js"></script>
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">
<script>
	/* 페이지네이션 */
	$('#pagination').twbsPagination({
		startPage : 1,
		totalPages : 10,
		visiblePages : 10,
	/* onPageClick:function(evt,page){
		console.log('evt',evt); 
		console.log('page',page); 
		pageCall(page);
	} */
	});

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
	
	// 파일 업로더 텍스트 바꾸기
	FilePond.registerPlugin(
	        FilePondPluginFileValidateSize,
	        FilePondPluginFileValidateType,
	        FilePondPluginImagePreview,
	        FilePondPluginImageExifOrientation,
	        FilePondPluginImageResize
	    );
	
    // 텍스트 변경 설정
    FilePond.setOptions({
        labelIdle: '이 곳에 파일을 드래그 하세요. 혹은 파일 선택(0MB)'
    });

    // FilePond를 모든 input[type="file"]에 적용
    FilePond.create(document.querySelector('input[type="file"]'));
    
 	// 댓글 삭제 버튼
	function reviewdeleteY() {
		console.log('댓글 삭제 하기');
		removeAlert();
	}

	// 댓글 삭제 취소버튼
	function reviewdeleteN() {
		console.log('댓글 삭제 취소');
		removeAlert();
	}
	
	// 댓글 삭제 팝업
	$('.btn-delete').on(
			'click',
			function() {
				layerPopup('댓글을 삭제하시겠습니까?', '예', '아니오', reviewdeleteY,
						reviewdeleteN);
			});

	// 모달창 열기
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});
	
	//모달창 닫기
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	// 댓글 수정 버튼
	function reviewupdateY() {
		console.log('댓글 수정 하기');
		removeAlert();
	}

	// 댓글 수정 취소버튼
	function reviewupdateN() {
		console.log('댓글 수정 취소');
		removeAlert();
	}
	
	// 댓글 수정 팝업
	$('.btn-update').on(
			'click',
			function() {
				layerPopup('댓글을 수정하시겠습니까?', '예', '아니오', reviewupdateY,
						reviewupdateN);
			});
	
	// 모달창 열기
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	// 모달창 닫기
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	// 게시글 삭제 버튼
	function writedeleteY() {
		console.log('게시글 삭제 하기');
		removeAlert();
	}

	// 게시글 삭제 취소버튼
	function writedeleteN() {
		console.log('게시글 삭제 취소');
		removeAlert();
	}
	
	// 게시글 삭제 팝업
	$('.btn-write-delete').on(
			'click',
			function() {
				layerPopup('게시글을 삭제하시겠습니까?', '예', '아니오', writedeleteY,
						writedeleteN);
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
	function writeupdateY() {
		console.log('게시글 수정 하기');
		removeAlert();
	}

	// 게시글 수정 취소버튼
	function writeupdateN() {
		console.log('게시글 수정 취소');
		removeAlert();
	}
	
	// 게시글 수정 팝업
	$('.btn-write-update').on(
			'click',
			function() {
				layerPopup('게시글을 수정하시겠습니까?', '예', '아니오', writeupdateY,
						writeupdateN);
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