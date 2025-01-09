<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문서함</title>

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

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<style>
.mailList .tit-area {
	display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 3px 40px;
}

.mailList .tit-area .left {
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.mailList .tit-area .left button{
	background: none;
	border: none;
}
.mailList .tit-area .mail-count {
	color: var(--bs-primary);
	margin-left: 4px;
}
.mailList .tab {
	margin-left: 14px;
}

.mailList .tab .bar {
	display: inline-block;
	width: 1px;
	height: 14px;
	background: #ddd;
}

.mailList .tab button {
	color: #888;
}

.mailList .tab button.selected {
	color: #333;
}

.mailList table tr:hover {
	background: #f7f7f7;
}


.mailList .search-area {
	display: flex;
	gap: 4px;
}

.mailList input[name="search-data"] {
	width: 300px;
	height: 34px;
	margin: 14px 0;
	border: 1px solid #DFE3E7;
}

.mailList .search-area select {
	margin: 14px 0;
    height: 34px;
}

.mailList .search-area #searchBtn {
    padding: 0px 12px;
	margin: 14px 0;
    height: 34px;
}

.mailList .util-area {
	display: flex;
	justify-content: space-between;
	align-items: center;
    padding: 16px 40px;
    border-bottom: 1px solid #ddd;
}

.mailList .util-area {
	
}

.mailList .util-area .left {
	display: flex;
    align-items: center;
}

.mailList .util-area .left > * {
    margin: 0 10px 0 0;
}

.mailList .cont-body {
	padding: 0;
}

.mailList .list-area.recv {
	color: #656C74;
}
.mailList .list-area .mail-item {
	display: flex;
	justify-content: space-between;
    padding: 12px 40px;
    border-bottom: 1px solid #ddd;
}
.mailList .list-area .mail-item.no-read {
	font-weight: 500;
    color: var(--bs-body-color);
}
.mailList .list-area .mail-item .left > *{
	margin-right: 24px;
}
.mailList .list-area .mail-item .name {
	display: inline-block;
	width: 70px;
	margin-right: 30px;
}
.mailList .list-area .mail-item .bi-paperclip {
	font-size: 17px;
    color: #888;
    margin-left: 7px;
}
.mailList .list-area .mail-item .title {
	cursor: pointer;
}
.mailList .list-area .mail-item #bookmark {
	cursor: pointer;
}
.mailList .btn-refresh{
	cursor: pointer;
}

.mailList .bi-star {
	color: #8D959F;
}
.mailList .bi-star-fill{
	color: var(--bs-warning);
}
</style>

</head>

<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">

		<!-- 사이드바 -->
		<jsp:include page="../sidebar.jsp" />

		<div id="main">
			<!-- 헤더 -->
			<jsp:include page="../header.jsp" />

			<div class="page-content mailList">
				<section id="menu">
					<h4 class="menu-title">사내메일</h4>
					<ul>
						<li <c:if test="${listType eq 'recv'}">class="active"</c:if>><a href="/mail/listView/recv">받은메일함</a></li>
						<li <c:if test="${listType eq 'sd'}">class="active"</c:if>><a href="/mail/listView/sd">보낸메일함</a></li>
						<li <c:if test="${listType eq 'sv'}">class="active"</c:if>><a href="/mail/listView/sv">임시보관함</a></li>
						<li <c:if test="${listType eq 'bk'}">class="active"</c:if>><a href="/mail/listView/bk">중요메일함</a></li>
						<li <c:if test="${listType eq 'del'}">class="active"</c:if>><a href="/mail/listView/del">휴지통</a></li>
					</ul>
					<div class="btn btn-primary full-size" onclick="location.href='/mail/write'">메일쓰기</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<div class="left">
								<h5>
									<c:choose>
										<c:when test="${listType eq 'sd'}">보낸 메일함</c:when>
										<c:when test="${listType eq 'recv'}">받은 메일함</c:when>
										<c:when test="${listType eq 'sv'}">임시 보관함</c:when>
										<c:when test="${listType eq 'bk'}">중요 메일함</c:when>
										<c:when test="${listType eq 'del'}">휴지통</c:when>
									</c:choose>
									<span class="mail-count"></span>
								</h5>
								<c:if test="${listType eq 'recv'}">
									<div class="buttons filter-btns clearfix">
										<div class="tab">
											<button class="selected" data-filter="all" ><i class="bi bi-filter-left"></i> 전체</button>
											<span class="bar"></span>
											<button data-filter="noread">안읽은 메일</button>
										</div>
									</div>
								</c:if>
							</div>
							<div class="search-area">
								<select name="search" class="form-select form-select-sm">
									<option value="subject">제목</option>
								</select> <input type="text" name="search-data" class="form-control form-control-sm"
									placeholder="검색내용을 입력하세요" width="80%" />
								<button id="searchBtn" class="btn btn-primary">
									<i class="bi bi-search"></i>
								</button>
							</div>
						</div>
						<div class="util-area">
							<div class="left">
								<input type="checkbox" class="form-check-input" id="checkbox2">
								<c:choose>
									<c:when test="${listType eq 'recv'}">
										<buttton class="btn btn-outline-primary btn-sm" onclick="changeToRead()">읽음</buttton>
										<buttton class="btn btn-outline-primary btn-sm" onclick="layerPopup('해당 메일을 삭제하시겠습니까?', '삭제', '취소', moveToTrash, btn1Act)">삭제</buttton>
										<buttton class="btn btn-outline-primary btn-sm" onclick="toggleBookmark()">중요</buttton>
									</c:when>
									<c:when test="${listType eq 'bk'}">
										<buttton class="btn btn-outline-primary btn-sm" onclick="changeToRead()">읽음</buttton>
										<buttton class="btn btn-outline-primary btn-sm" onclick="toggleBookmark()">중요해제</buttton>
										<buttton class="btn btn-outline-primary btn-sm">중요</buttton>
									</c:when>
									<c:when test="${listType eq 'sd'}">
										<buttton class="btn btn-outline-primary btn-sm" onclick="layerPopup('해당 메일을 삭제하시겠습니까?', '삭제', '취소', moveToTrash, removeAlert)">삭제</buttton>
										<buttton class="btn btn-outline-primary btn-sm" onclick="layerPopup('해당 메일을 재전송하시겠습니까?', '재전송', '취소', resend, removeAlert)">다시보내기</buttton>
										<buttton class="btn btn-outline-primary btn-sm" onclick="toggleBookmark()">중요</buttton>
									</c:when>
									<c:when test="${listType eq 'sv'}">
										<buttton class="btn btn-outline-primary btn-sm" onclick="layerPopup('해당 메일을 삭제하시겠습니까?', '삭제', '취소', moveToTrash, btn1Act)">삭제</buttton>
										<buttton class="btn btn-outline-primary btn-sm">전송</buttton>
										<buttton class="btn btn-outline-primary btn-sm" onclick="toggleBookmark()">중요</buttton>
									</c:when>
									<c:when test="${listType eq 'del'}">
										<buttton class="btn btn-outline-primary btn-sm">영구삭제</buttton>
										<buttton class="btn btn-outline-primary btn-sm">삭제취소</buttton>
									</c:when>
						
								</c:choose>
							</div>
							<div class="btn-refresh" onclick="location.reload();"><i class="bi bi-arrow-clockwise"></i></div>
						</div>

						<div class="cont-body">
						
							<div class="list-area">
							
							</div>
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center" id="pagination"></ul>
							</nav>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<script src='/resources/js/common.js'></script>

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>

<script>
var listType = '${listType}';
if(listType == 'recv'){
	$('.list-area').addClass('recv');
}
console.log("listType : ",listType);
var show = 1;
var paginationInitialized = false;


var totalCount = 0;
var pageSize = 15;  // 한 페이지당 게시글 수  //check!!! cnt를 얘로??
var totalPage = 0;


pageCall(show, listType);

function pageCall(page, listType) {
	var option = document.querySelector('select[name="search"]').value;
	var search = document.querySelector('input[name="search-data"]').value;
	var filterElem = document.querySelector('.filter-btns button.selected');
	var filter = null;
	if(filterElem){		
		filter = filterElem.getAttribute('data-filter');
		console.log("filter!!!! ",filter );
	}
	console.log("option",option);
	console.log("search",search);
	
	$.ajax({
		type:'GET',
		url:'/mail/list/'+listType,
		data:{
			'page':page,
			'cnt':15,
			'search' : search,
			'option' : option,
			'filter': filter,
			'listType': listType
		},
		datatype:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.mailList);

			if(data.mailList.length > 0){
				totalCount = data.mailList[0].total_count;  // 총 게시글 수
	            totalPage = Math.ceil(totalCount / pageSize);  // 총 페이지 수 계산
			}
			console.log("totalCount",totalCount,"totalPage",totalPage);
            
            
			 /* 페이지네이션 */       
			 if(!paginationInitialized){
					$('#pagination').twbsPagination('destroy');
					$('#pagination').twbsPagination({
						startPage:1, 
		           		totalPages: totalPage, 
		           		visiblePages:10,
		           		onPageClick:function(evt,page){
		           			console.log('evt',evt); 
		           			console.log('page',page); 
		           			pageCall(page, listType);
		           		}
					});
					paginationInitialized = true;
	            }
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list) {
	// 총 메일 수
	$('.tit-area .mail-count').text(totalCount);
	var content ='';
	if(totalCount == 0){
		content +='<tr><td colspan="8">조회된 데이터가 없습니다.</td></tr>';
		$('.list tbody').html(content);
		return false;
	}
	for (var view of list) {
		/* if(view.approval_date != null){
			approvalDate = view.approval_date.split(' ')[0];
		}else{
			approvalDate = '-';
		} */
		
		if(listType == 'recv' && view.is_read == 'N'){
			content +='<div class="mail-item no-read" data-idx="'+view.idx+'" data-mailtype="'+view.mail_type+'">';
		}else{
			content +='<div class="mail-item" data-idx="'+view.idx+'" data-mailtype="'+view.mail_type+'">';
		}
		content +='<div class="left">';
		content +='<input type="checkbox" class="form-check-input" id="checkbox2">';
		if(view.is_bookmark == 'N'){
			content +='<i id="bookmark" class="bi bi-star" data-bookmark="N"></i>';
		}else{
			content +='<i id="bookmark" class="bi bi-star-fill" data-bookmark="Y"></i>';
		}
		content +='<span class="name">'+view.name+'</span>';
		content +='<span class="title" onclick="location.href=\'/mail/detail/'+view.idx+'\'">'+view.title;
		if(view.fileYn != null){
			content +='<i class="bi bi-paperclip"></i>';
		}	
		content +='</span>';
		content +='</div>';
		content +='<span>'+view.send_date_str+'</span>';
		content +='</div>';
		
	  }
     $('.list-area').html(content);
     console.log("content :::",content);
}

/* $(document).on('click','.list td.delete',function(){
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
}); */

	// 검색이벤트
	$('#searchBtn').on('click', function() {
	    show = 1;
	    paginationInitialized = false;
	    pageCall(show, listType);  // 검색어가 추가된 상태에서 호출
	});

	// 필터링
 	$('.filter-btns button').on('click', function() {
		$(this).siblings().removeClass('selected');
		$(this).addClass('selected');
		show = 1;
	    paginationInitialized = false;
	    pageCall(show, listType);  // 검색어가 추가된 상태에서 호출
	}); 
	
	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
	var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
	
	function btn1Act() {
		location.reload();
		removeAlert(); 
	}
	

	
	// 다중 읽음 처리
	function changeToRead() {
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		
		$.ajax({
        	type : 'PUT',
	        url : '/mail/changeToRead',
	        data: JSON.stringify({ 
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json', 
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	location.reload();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	
	// 다중 삭제 처리(휴지통)
	function moveToTrash() {
		removeAlert();
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		
		$.ajax({
        	type : 'PUT',
	        url : '/mail/moveToTrash',
	        data: JSON.stringify({
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json',
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	location.reload();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	// 다중 북마크 토글
	function toggleBookmark(){
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedList = [];
		for (var checkedEl of checkedEls) {
			console.log('book마크태그',$(checkedEl).siblings('#bookmark'));
			console.log('book마크여부',$(checkedEl).siblings('#bookmark').data('bookmark'));
			var mailInfo = {};
			mailInfo.idx = $(checkedEl).parents('.mail-item').data('idx');
			mailInfo.is_bookmark = $(checkedEl).siblings('#bookmark').data('bookmark');
			checkedList.push(mailInfo);
		}
		toggleBookmarkAjax(checkedList);
	}
	
	function toggleBookmarkAjax(checkedList){
		$.ajax({
        	type : 'PUT',
	        url : '/mail/toggleBookmark',
	        data: JSON.stringify({
	        	'checkedList': checkedList 
        	}), 
	        contentType: 'application/json',
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	location.reload();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	// 개별 북마크 토글
	$(document).on('click', '#bookmark', function() {
		var checkedList = [
			{idx : $(this).parents('.mail-item').data('idx'),
			is_bookmark : $(this).data('bookmark')}
		];
		toggleBookmarkAjax(checkedList);
    });
	
	// 다시보내기 (재전송)
	function resend() {
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		
		$.ajax({
        	type : 'POST',
	        url : '/mail/resend',
	        data: JSON.stringify({ 
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json', 
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	location.reload();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	
	// 삭제 팝업 (취소버튼)
	function btn1Act(){
		removeAlert();
	}


</script>

</html>