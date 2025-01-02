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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}"> 
</head>
<style>

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
	 
	 .btn-div-write {
	 	text-align: right;
	 }
	 
	.user-photo {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
	}	 
	
	#userList tbody tr {
	    height: 50px;
	}
	
	.scl {
		overflow: auto;
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
                  <h5>게시글</h5>
               </div>
               <div class="cont-body"> 
               <p id="currentUser" style="display:none;"><sec:authentication property="principal.username"/></p>
               	  <div class="row">
	                  <table>
						<colgroup>
							<col width="60%" />
						</colgroup>
						<thead>
						</thead>
						<tbody>
							<tr class="table-sun">
								<td class="table-text table-text-text"><h5>${boardInfo.subject}</h5></td>
							</tr>
							<tr class="table-sun">
								<td class="table-text table-text-text">
									<c:choose>
								        <c:when test="${photoInfo != null && photoInfo.new_filename != null}">
								            <img class="table-img" src="/photo/${photoInfo.new_filename}" alt="사람 이미지">
								        </c:when>
								        <c:otherwise>
								            <img class="table-img" src="/resources/img/person.png" alt="기본 이미지" style="background-color: gray;">
								        </c:otherwise>
								    </c:choose>
									&nbsp;&nbsp;${boardInfo.text}&nbsp;${boardInfo.newname}
								
								</td>
							</tr>
							<tr></tr>
							<tr>
								<td>
									<div class="row">
								        <c:if test="${not empty fileInfo}">
										    <c:forEach var="file" items="${fileInfo}">
										        <div style="display: flex; gap: 10px; align-items: center; border: 1px solid #d1d1d1; width: auto; margin-bottom: 5px;">
										            <span>
										                <c:choose>
										                    <c:when test="${file.new_filename.endsWith('.jpg') || file.new_filename.endsWith('.png')}">
										                        <img src="/photo/${file.new_filename}" style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;" alt="이미지">
										                    </c:when>
										                    <c:when test="${file.new_filename.endsWith('.pdf')}">
										                        <i class="bi bi-file-earmark-pdf" style="font-size: 24px; color: red;"></i>
										                    </c:when>
										                    <c:otherwise>
										                        <i class="bi bi-file-earmark" style="font-size: 24px;"></i>
										                    </c:otherwise>
										                </c:choose>
										                ${file.ori_filename}
										            </span>
										            <br>
										            <a href="/photo/${file.new_filename}" class="btn btn-primary" download>
										                다운로드
										            </a>
										            <c:choose>
										                <c:when test="${file.new_filename.endsWith('.jpg') || file.new_filename.endsWith('.png')}">
										                    <button class="btn btn-outline-primary" onclick="showImg('/photo/${file.new_filename}')">
										                        미리보기
										                    </button>
										                </c:when>
										                <c:when test="${file.new_filename.endsWith('.pdf')}">
										                    <button class="btn btn-outline-primary" onclick="showPdf('/photo/${file.new_filename}')">
										                        미리보기
										                    </button>
										                </c:when>
										            </c:choose>
										        </div>
										    </c:forEach>
										</c:if>
										<c:if test="${empty fileInfo}">
										    <p>첨부된 파일이 없습니다.</p>
										</c:if>
									</div>
							    </td>
							</tr>
							<tr class="table-sun">
								<td style="text-align: left;">
									${boardInfo.content}
								</td>
							</tr>
							<tr class="table-sun">
								<td class="table-text table-text-text">
									<i class="bi bi-chat"></i>&nbsp;<span>댓글 ${boardInfo.reviewrow}개</span>&nbsp;|&nbsp;<span class="btnModal user-list" onclick="checklist('${boardInfo.board_idx}')"><i class="bi bi-person-fill"></i>${boardInfo.listrow}</span>&nbsp;|&nbsp;조회&nbsp;<span>${boardInfo.count}</span>
									<!-- 유저 리스트 모달 -->
									<div id="modal" class="modal">
										<div class="modal-cont modal-user-list">
											<span class="close">&times;</span>
											<div id="modal-body">
												<h4 class="menu-title">확인한 직원 리스트</h4>
												<div class="scl">
													<table id="userList">
														<colgroup>
															<col width="30%" />
															<col />
														</colgroup>
														<tbody>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>									
								</td>
							</tr>
						</tbody>
					</table>
					<div id="previewModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5); z-index: 1000;">
					    <div style="position: relative; margin: 50px auto; width: 80%; height: 80%; background: #fff; border-radius: 8px; padding: 10px; overflow: hidden;">
					        <!-- 닫기 버튼 -->
					        <button class="btn btn-outline-secondary" style="position: absolute; top: -7px; right: 26px;" onclick="closePreview()">닫기</button>
					        <!-- 미리보기 내용 -->
					        <div id="previewContent" style="width: 100%; height: 100%; overflow: auto; text-align: center;"></div>
					    </div>
					</div>
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
							    <c:forEach var="parentComment" items="${reviewInfo}">
								    <!-- 부모 댓글 -->
								    <c:if test="${parentComment.parent == null}">
								        <tr class="table-sun">
								            <td class="table-text table-text-text" id="userphoto">
								                <!-- 부모 댓글 프로필 이미지 -->
								                <c:choose>
								                    <c:when test="${not empty parentComment.new_filename}">
								                        <img src="/photo/${parentComment.new_filename}" alt="프로필" class="user-photo">
								                    </c:when>
								                    <c:otherwise>
								                        <img src="/resources/img/person.png" alt="기본 이미지" class="user-photo" style="background-color: gray;">
								                    </c:otherwise>
								                </c:choose>
								            </td>
								            <td style="text-align: left;">
											    ${parentComment.text} ${parentComment.name}
											    <button class="btn-review" onclick="showReplyInput(${parentComment.review_idx}, ${parentComment.board_idx})">댓글달기</button>&nbsp;&nbsp;
											    <span style="color: gray; font-size: 14px;">${parentComment.rereview_date}</span>
											</td>
								            <td>
								                <c:if test="${parentComment.username == pageContext.request.userPrincipal.name && parentComment.use_yn == 'Y'}">
											        <button class="btn icon btn-secondary btn-update" onclick="updateReview(${parentComment.review_idx})">
											            <i class="bi bi-pencil"></i>
											        </button>
											    </c:if>
											    <c:if test="${parentComment.use_yn == 'Y'}">
											        <sec:authorize access="(#parentComment.username == principal.username) or hasRole('admin') or hasRole('superadmin')">
											            <button class="btn icon btn-secondary btn-delete" onclick="deleteReview(${parentComment.review_idx})">
											                <i class="bi bi-trash"></i>
											            </button>
											        </sec:authorize>
											    </c:if>
								            </td>
								        </tr>
								        <tr>
								            <td></td>
								            <td class="table-text table-text-text" id="reviewcontent-${parentComment.review_idx}">
								                <c:choose>
								                    <c:when test="${parentComment.use_yn == 'Y'}">
								                        <p class="comment-content">${parentComment.review_content}</p>
								                    </c:when>
								                    <c:otherwise>
								                        <p style="color: gray;">삭제된 댓글입니다.</p>
								                    </c:otherwise>
								                </c:choose>
								            </td>
								        </tr>
								
								        <!-- 자식 댓글 -->
								        <c:forEach var="childComment" items="${reviewInfo}">
								            <c:if test="${childComment.parent == parentComment.review_idx}">
								                <tr class="table-sun">
								                    <td><i class="bi bi-arrow-return-right" style="color: gray;"></i></td>
								                    <td class="table-text table-text-text">
								                        <!-- 자식 댓글 프로필 이미지 -->
								                        <c:choose>
								                            <c:when test="${not empty childComment.new_filename}">
								                                <img src="/photo/${childComment.new_filename}" alt="프로필" class="user-photo">
								                            </c:when>
								                            <c:otherwise>
								                                <img src="/resources/img/person.png" alt="기본 이미지" class="user-photo" style="background-color: gray;">
								                            </c:otherwise>
								                        </c:choose>
								                        &nbsp;&nbsp;&nbsp;&nbsp;
								                        ${childComment.text} ${childComment.name}&nbsp;&nbsp;
								                        <span style="color: gray; font-size: 14px;">${childComment.rereview_date}</span>
								                    </td>
								                    <td>
								                        <c:if test="${childComment.username == pageContext.request.userPrincipal.name && childComment.use_yn == 'Y'}">
													        <button class="btn icon btn-secondary btn-update" onclick="updateReview(${childComment.review_idx})">
													            <i class="bi bi-pencil"></i>
													        </button>
													    </c:if>
													    <c:if test="${childComment.use_yn == 'Y'}">
													        <sec:authorize access="(#childComment.username == principal.username) or hasRole('admin') or hasRole('superadmin')">
													            <button class="btn icon btn-secondary btn-delete" onclick="deleteReview(${childComment.review_idx})">
													                <i class="bi bi-trash"></i>
													            </button>
													        </sec:authorize>
													    </c:if>
								                    </td>
								                </tr>
								                <tr>
								                    <td></td>
								                    <td class="table-text table-text-text" id="reviewcontent-${childComment.review_idx}">
								                        <c:choose>
								                            <c:when test="${childComment.use_yn == 'Y'}">
								                                <p class="comment-content" style="padding-left: 63px;">${childComment.review_content}</p>
								                            </c:when>
								                            <c:otherwise>
								                                <p style="color: gray; padding-left: 63px;">삭제된 댓글입니다.</p>
								                            </c:otherwise>
								                        </c:choose>
								                    </td>
								                </tr>
								            </c:if>
								        </c:forEach>
								    </c:if>
								</c:forEach>
							</tbody>
						</table>
						<br>
							<div class="review-group btn-div-write">
								<div class="row">
				               	  	<div class="col-sm-11"><input class="form-control review-write" type="text" placeholder="댓글을 입력하세요."></div>
				               	  	<div class="col-sm-1"><button type="button" class="btn btn-primary btn-review-write" onclick="reviewWrite()"><span>등록</span></button></div>
		               	  		</div>
							</div>
						<hr>
							<div class="row">
								<div class="col-sm-2">
									<c:if test="${boardInfo.username == pageContext.request.userPrincipal.name}">
									    <button class="btn btn-outline-primary btn-update board-update" onclick="updateboard(${boardInfo.board_idx}, '${boardInfo.username}')">수정</button>
									    <button class="btn btn-outline-secondary btn-delete board-delete" onclick="deleteboard(${boardInfo.board_idx})">삭제</button>
									</c:if>
								</div>
								<div class="col-sm-9"></div>
								<div class="col-sm-1"><a href="/board/View" class="btn btn-primary">목록</a></div>
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
	const username = document.getElementById("currentUser").textContent.trim();
	console.log(username);
	function checklist(data) {
		console.log();
		var params = {board_idx: data};
		$.ajax({
	        type: 'GET', 
	        url: '/check/list', 
	        data: params, 
	        dataType: 'json', 
	        success: function(response) {
	            listSuccess(response);
	        },
	        error: function(error) {
	            console.error('AJAX 호출 실패:', error);
	        }
	    });
	}
	
	function listSuccess(response) {
		console.log(response);
		console.log('체크');
		let users = $('#userList tbody');
		users.empty();
		
		response.forEach(function(item) {
		    let photo = item.new_filename
		        ? '<img src="/photo/' + item.new_filename + '" alt="사진" class="user-photo">'
		        : '<img src="/resources/img/person.png" alt="기본 사진" class="user-photo" style="background-color: gray;">';
		    let text = item.text ? item.text : '';
		    let newname = item.newname ? item.newname : '탈퇴한 회원';
		    let row = '<tr><td>' + photo + '</td><td>' + text + '  ' + newname + '</td></tr>';
		    users.append(row);
		});
	}
	
	function reviewWrite() {
		const review = document.querySelector('.review-write');
		const reviewText = review.value.trim(); // 입력 값에서 공백 제거
	    if (!reviewText) {
	    	layerPopup( '댓글을 입력하세요.','확인',null,
	                function () {
	                    removeAlert();
	                },
	                function () {
	    		    }
	            );
	        return;
	    };
		const board_idx = '${boardInfo.board_idx}';
		const board_username = '${boardInfo.username}';
		const subject = '${boardInfo.subject}';
		const username = document.getElementById("currentUser").textContent.trim();
		const data = {board_idx: board_idx, username: username, review_content: reviewText, board_username: board_username, subject: subject};
		httpAjax('POST', '/board/review/write', data);
	}
	
	function deleteReview(data) {
		console.log(data);
    	layerPopup( '댓글을 삭제하시겠습니까?','예','아니오',
	        function () {
	            const url = '/review/delete';
	            const params = {review_idx: data};
	            httpAjax('POST', url , params);
	            removeAlert();
	        },
	        function () {
	        	removeAlert();
			}
        );
    };
    
    // 성공 콜백
    function httpSuccess(response) {
        console.log('AJAX 호출 성공: ', response);
    	
        // 댓글 삭제
    	if(response.status === 'delete') {
	        location.reload();
    	}
    	
        // 댓글 작성
    	if(response.status === 'write') {
    		location.reload();
    	}
        
    	// 댓글 수정
    	if(response.status === 'update') {
    		console.log('수정 완료');
    	}
    	
    	// 대댓글 작성
    	if(response.status === 'rewrite') {
    		location.reload();
    	}
    	
    	// 게시글 삭제
    	if(response.status === 'deleteboard') {
    		window.location.href = '/board/View';
    	}
        
    }
    
    let activeReviewId = null; // 현재 활성화된 리뷰 ID

	 // 수정 버튼 클릭 시 호출
	 function updateReview(reviewId) {
	     const reviewCell = document.getElementById('reviewcontent-' + reviewId);
	     const reviewParagraph = reviewCell.querySelector('.comment-content');
	
	     // 기존 활성화된 input이 있다면 복원
	     if (activeReviewId !== null && activeReviewId !== reviewId) {
	         revertUpdateMode(activeReviewId);
	     }
	
	     // 현재 상태가 input인지 확인
	     if (reviewCell.querySelector('input')) {
	         revertUpdateMode(reviewId);
	     } else {
	         const currentContent = reviewParagraph.textContent.trim();
	
	         // 기존 내용을 숨기고 input 생성
	         reviewParagraph.style.display = 'none';
	         const input = document.createElement('input');
	         input.type = 'text';
	         input.value = currentContent;
	         input.classList.add('form-control');
	         input.style.width = '80%';
	
	         // 저장 버튼 생성
	         const saveButton = document.createElement('button');
	         saveButton.textContent = '저장';
	         saveButton.className = 'btn btn-primary btn-save';
	         saveButton.style.marginLeft = '10px';
	         saveButton.onclick = function () {
	             saveReviewContent(reviewId, input.value);
	         };
	
	         // 취소 버튼 생성
	         const cancelButton = document.createElement('button');
	         cancelButton.textContent = '취소';
	         cancelButton.className = 'btn btn-secondary btn-cancel';
	         cancelButton.style.marginLeft = '5px';
	         cancelButton.onclick = function () {
	             revertUpdateMode(reviewId);
	         };
	
	         // input과 버튼 추가
	         reviewCell.appendChild(input);
	         reviewCell.appendChild(saveButton);
	         reviewCell.appendChild(cancelButton);
	
	         // input에 포커스 및 커서 설정
	         input.focus();
	         input.setSelectionRange(currentContent.length, currentContent.length); // 커서를 끝으로 이동
	
	         // 활성화된 리뷰 ID 저장
	         activeReviewId = reviewId;
	     }
	 }
	
	 // 수정 취소
	 function revertUpdateMode(reviewId) {
	     const reviewCell = document.getElementById('reviewcontent-' + reviewId);
	     const input = reviewCell.querySelector('input');
	     const saveButton = reviewCell.querySelector('.btn-save');
	     const cancelButton = reviewCell.querySelector('.btn-cancel');
	     const reviewParagraph = reviewCell.querySelector('.comment-content');
	
	     // input과 버튼 제거, 원래 텍스트 복원
	     if (input) input.remove();
	     if (saveButton) saveButton.remove();
	     if (cancelButton) cancelButton.remove();
	     reviewParagraph.style.display = 'block';
	
	     // 활성화된 리뷰 ID 초기화
	     activeReviewId = null;
	 }
	
	 // 저장 버튼 클릭 시 호출
	 function saveReviewContent(reviewId, newContent) {
		 if (!newContent.trim()) {
		        layerPopup(
		            '내용을 입력하세요.',
		            '확인',
		            null,
		            function () {
		                removeAlert();
		            },
		            function () {}
		        );
		        return;
		    }
		 const params = {review_idx: reviewId, review_content: newContent};
		 const url = '/review/update';
		 httpAjax('POST', url, params);
	
	     // 업데이트된 내용 반영
	     const reviewParagraph = document.getElementById('reviewcontent-' + reviewId).querySelector('.comment-content');
	     reviewParagraph.textContent = newContent;
	
	     // 수정 모드 종료
	     revertUpdateMode(reviewId);
	 }
    
	 function showReplyInput(reviewIdx, boardIdx) {
		    // 기존에 열려있는 댓글 입력 창 제거
		    const existingInput = document.querySelector('.reply-input');
		    if (existingInput) {
		        existingInput.remove();
		    }

		    // 대상 댓글의 content 영역 찾기
		    const targetContent = document.querySelector('#reviewcontent-' + reviewIdx);
		    if (targetContent) {
		        // 대댓글 입력 창 생성
		        const replyDiv = document.createElement('div');
		        replyDiv.className = 'reply-input';
		        replyDiv.innerHTML = '' +
		            '<div class="input-group" style="margin-top: 10px; display: flex; gap: 10px;">' +
		                '<input type="text" class="form-control" placeholder="댓글을 입력하세요." id="reply-input-' + reviewIdx + '" style="border-radius: 5px;">' +
		                '<button class="btn btn-primary" onclick="submitReply(' + reviewIdx + ', ' + boardIdx + ')" style="border-radius: 5px;">등록</button>' +
		                '<button class="btn btn-secondary" onclick="cancelReply()" style="border-radius: 5px;">취소</button>' +
		            '</div>';

		        // content 아래에 입력 창 추가
		        targetContent.appendChild(replyDiv);
		    } else {
		        console.error('댓글 ID ' + reviewIdx + '에 해당하는 content를 찾을 수 없습니다.');
		    }
		}

		function submitReply(parentReviewIdx, boardIdx) {
		    // 입력된 대댓글 내용 가져오기
		    const replyInput = document.getElementById('reply-input-' + parentReviewIdx);
		    const replyContent = replyInput.value.trim();
		    const username = document.getElementById("currentUser").textContent.trim();

		    if (!replyContent) {
		        layerPopup(
		            '내용을 입력하세요.',
		            '확인',
		            null,
		            function () {
		                removeAlert();
		            },
		            function () {}
		        );
		        return;
		    }

		    console.log('작성한 유저: ' + username);
		    console.log('댓글 idx: ' + parentReviewIdx);
		    console.log('게시글 idx: ' + boardIdx);
		    console.log('댓글 내용: ' + replyContent);

		    // AJAX 호출로 대댓글 저장
		    const params = {
		        parent: parentReviewIdx,
		        board_idx: boardIdx,
		        review_content: replyContent,
		        username: username
		    };
		    const url = '/reReview/write';

		    httpAjax('POST', url, params);
		}

		function cancelReply() {
		    // 댓글 입력 창 제거
		    const existingInput = document.querySelector('.reply-input');
		    if (existingInput) {
		        existingInput.remove();
		    }
		}
    
    
    
    
	function showImg(fileUrl) {
		console.log(fileUrl);
	    const modal = document.getElementById("previewModal");
	    const content = document.getElementById("previewContent");
	
	    content.innerHTML = '<img src="' + fileUrl + '" style="max-width: 100%; max-height: 100%; object-fit: contain;" alt="이미지 미리보기">';
	    modal.style.display = "block";
	}
	
	// PDF 미리보기
	function showPdf(fileUrl) {
		console.log(fileUrl);
	    const modal = document.getElementById("previewModal");
	    const content = document.getElementById("previewContent");
	
	    content.innerHTML = '<iframe src="' + fileUrl + '" style="width: 90%; height: 100%; border: none;"></iframe>';
	    modal.style.display = "block";
	}
	
	// 모달 닫기
	function closePreview() {
	    const modal = document.getElementById("previewModal");
	    modal.style.display = "none";
	    document.getElementById("previewContent").innerHTML = "";
	}
    
    
    
    
    
    
    
    
    
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
	
	
	

	
	
	// 모달창 열기
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});
	
	//모달창 닫기
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
</script>
</html>