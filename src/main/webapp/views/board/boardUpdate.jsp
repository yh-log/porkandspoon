<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공통 레이아웃 CSS</title>
	
<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">
	
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/components/dark.js"></script>
	<script src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="/resources/assets/compiled/js/app.js"></script>
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC" type="image/png">

	<!-- select -->
	<link rel="stylesheet" href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">
	
	<!-- summernote bootstrap-->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- rating.js(별점) -->
	<link rel="stylesheet" href="/resources/assets/extensions/rater-js/lib/style.css">
	
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">
	
	<!-- summernote -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}"> 
	
</head>
<style>

	/* 버튼 크기 설정 */
	.btn-write-style {
		width: 90px;
    	height: 40px;
	}
	
	/* 테이블 텍스트 위치 조정 */
	.table-text {
		text-align: left;
	}
	
	/* 테이블 텍스트 굵기 조정 */
	.table-text-text {
		font-weight: bold;
	}
	
	/* 모달창 "예" 버튼 크기 수정 */
	.confirm{
	 	width: 75px;
	}
	
	.editor-area .note-editor {
		width: 1200px !important;
		height: 500px;
		margin-top: 20px;
		text-align: left;
	}
</style>
<body>
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
                  <h5>수정하기</h5>
               </div>
               <div class="cont-body">
               <form id="updateData">
	               <p id="currentUser" style="display:none;"><sec:authentication property="principal.username"/></p>
		                  <table>
							<colgroup>
								<col width="5%" />
								<col width="60%" />
							</colgroup>
							<thead>
							</thead>
							<tbody>
								<tr class="table-sun" id="user-name-insert">
									<th class="table-text table-text-text">작성자</th>
									<td class="table-text">
										<input type="hidden" name="username" value="${boardInfo.username}">
										<input type="hidden" name="board_idx" value="${boardInfo.board_idx}">
										${boardInfo.newname}
									</td>
								</tr>
								<tr class="table-sun">
									<th class="table-text table-text-text">제목</th>
									<td class="table-text"><input class="form-control" name="subject" type="text" placeholder="제목을 입력해주세요." value="${boardInfo.subject}"></td>
								</tr>
								<tr>
									<th class="table-text table-text-text" style="vertical-align: top;">파일첨부</th>
									<td>
										<div class="mb-3">
										 	<input class="form-control" type="file" id="formFileMultiple" name="filepond" multiple="">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="editor-area">
											<textarea name="postContnent" id="summernote" maxlength="10000">${boardInfo.content}</textarea>
										</div>
									</td>
								</tr>
								<tr class="table-sun">
								    <th class="table-text table-text-text">공개 설정</th>
								    <td class="table-text">
								        <input class="form-check-input" type="radio" name="board_state" id="flexRadioDefault1" 
								               value="Y" 
								               <c:if test="${boardInfo.board_state == 'Y'}">checked</c:if>> 공개
								        &nbsp;
								        <input class="form-check-input" type="radio" name="board_state" id="flexRadioDefault2" 
								               value="N" 
								               <c:if test="${boardInfo.board_state == 'N'}">checked</c:if>> 비공개
								    </td>
								</tr>
								<tr class="table-sun" id="departmentRow" style="display: none;">
								    <th class="table-text table-text-text">부서</th>
								    <td class="table-text">
								        <select class="form-select" name="department" id="basicSelect" style="width: 200px;" ${boardInfo.board_state == 'Y' ? 'disabled' : ''}>
								            <option value="AH0101" ${boardInfo.department == 'AH0101' ? 'selected' : ''}>인사팀</option>
								            <option value="AA0104" ${boardInfo.department == 'AA0104' ? 'selected' : ''}>총무팀</option>
								            <option value="AG0102" ${boardInfo.department == 'AG0102' ? 'selected' : ''}>법무팀</option>
								        </select>
								    </td>
								</tr>
							</tbody>
						</table>
						<div class="row">
								<div class="col-sm-5"></div>
					    		<div class="col-sm-2">
									<button type="button" class="btn btn-primary btn-write">등록</button>
									<button type="button" class="btn btn-outline-primary btn-delete">취소</button>
					    		</div>
					    		<div class="col-sm-5"></div>
		               </div>
                     </form>
            	</div>
            </div>
         </section>   
      </div>
   </div>
</div>
</body>
<script src='/resources/js/textEaditor.js'></script>
<script src='/resources/js/common.js'></script>
	
	
<script>

	$('.btn-write').on('click', function () {
	    layerPopup(
	        '게시글을 수정하시겠습니까?',
	        '예',
	        '아니오',
	        reviewupdateY, // 예 버튼 클릭 시
	        reviewupdateN  // 아니오 버튼 클릭 시
	    );
	});
	
	function reviewupdateY() {
        removeAlert(); // 팝업 닫기
        url = '/board/update';
        textEaditorWrite(url);
    }

    // AJAX 성공 콜백
    function fileSuccess(response) {
        console.log('파일 업로드 성공:', response);
        if (response != null) {
        	window.location.href = '/board/View';
        }
    }
    
    // 게시글 등록 취소 버튼 (아니오 버튼 클릭 시)
    function reviewupdateN() {
        console.log('게시글 등록 취소');
        removeAlert(); // 팝업 닫기
    }
    
    // 모달창 열기
    $('.btnModal').on('click', function () {
        $('#modal').show();
    });

    // 모달창 닫기
    $('#modal .close').on('click', function () {
        $('#modal').hide();
    });
    
    // 게시글 등록 취소 팝업
    $('.btn-delete').on('click', function () {
        layerPopup(
            '게시글 수정을 취소하시겠습니까?',
            '예',
            '아니오',
            reviewdeleteY, // 예 버튼 클릭 시
            reviewdeleteN  // 아니오 버튼 클릭 시
        );
    });

    // 게시글 등록 취소 버튼 (예 버튼 클릭 시)
    function reviewdeleteY() {
        console.log('게시글 등록 취소 하기');
        removeAlert(); // 팝업 닫기
        window.location.href = '/board/View';
    }

    // 게시글 등록 취소 안함 버튼 (아니오 버튼 클릭 시)
    function reviewdeleteN() {
        console.log('게시글 등록 취소 안하기');
        removeAlert(); // 팝업 닫기
    }


    // 모달창 열기
    $('.btnModal').on('click', function () {
        $('#modal').show();
    });

    // 모달창 닫기
    $('#modal .close').on('click', function () {
        $('#modal').hide();
    });

















	document.addEventListener('DOMContentLoaded', function () {
	    const radioPublic = document.getElementById('flexRadioDefault1'); 
	    const radioPrivate = document.getElementById('flexRadioDefault2');
	    const departmentRow = document.getElementById('departmentRow'); 
	    const departmentSelect = document.getElementById('basicSelect'); 
	    
	    // 초기 상태 설정
	    if (radioPublic.checked) {
	        departmentRow.style.display = 'none'; 
	        departmentSelect.disabled = true;
	    } else if (radioPrivate.checked) {
	        departmentRow.style.display = ''; 
	        departmentSelect.disabled = false;
	    }
	
	    // 공개 설정 변경 시
	    radioPublic.addEventListener('change', function () {
	        if (radioPublic.checked) {
	            departmentRow.style.display = 'none'; 
	            departmentSelect.disabled = true; 
	        }
	    });
	
	    // 비공개 설정 변경 시
	    radioPrivate.addEventListener('change', function () {
	        if (radioPrivate.checked) {
	            departmentRow.style.display = ''; 
	            departmentSelect.disabled = false; 
	        }
	    });
	});
	
	
	
</script>
</html>