<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기안문 수정</title>

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

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">

<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	.draftDetail table{
		border: 1px solid #ddd;
		table-layout: auto;
	}
	.draftDetail table th, .draftDetail table td{
		padding: 4px 10px;
		border-right: 1px solid #ddd;
		border-width: 1px;
	}
	.draftDetail input{
		width: 100%;
	    height: 100%;
	    border: none;
    }
    .draftDetail .form-group {
	    margin-bottom: 0;
	}
	.draftDetail select {
		border: none;
	}
	.draftDetail input[type=date].form-control {
		line-height: 1.5;
	}
	.draftDetail .top-area {
		display: flex;
	    justify-content: space-between;
	}
	.draftDetail .top-area > table {
		width: 340px;
	}
	.draftDetail table.user_info th{
		width: 120px;
	}
	.draftDetail table.user_info input {
		width: 100%;
		border: none;
	}
	.draftDetail table.user_info input:focus {
		outline: none;
	}
	.draftDetail table.appr_line {
		width: 410px;
	}
	.draftDetail table.appr_line th{
		width: 44px;
	}
	.draftDetail table.appr_line tr:nth-child(2) td p{
		margin-top: 1rem;
	}
	.draftDetail table.appr_line .date{
		font-size: 13px;
	}
	.draftDetail table.appr_line .date > td {
		height: 28px;
	}
	.draftDetail .buttons {
	    border-bottom: 1px solid #ddd;
	    padding: 4px 40px;
    }
	.draftDetail .buttons .btn {
	    margin: 14px 2px;
	}
	.draftDetail h4.doc-subject{
		margin: 20px 0 50px;
		text-align: center;
	}
	
	.draftDetail .btm-area {
		display: flex;
		flex-wrap: wrap;
		border-left: 1px solid #ddd;
	 	border-top: 1px solid #ddd;
	 	margin-top : 40px;
	}

	.draftDetail .btm-area .line {
		display: flex;
		width: 50%;
	}
	.draftDetail .btm-area #addr-area {
		display: flex;
    	width: 100%;
	}
	.draftDetail .btm-area #addr-area .line {
		width: 100%;
	}
	.draftDetail .btm-area #addr-area .left {
		width: 100%;
	}
	.draftDetail .btm-area #addr-area input[type="button"]{
		width: 120px;
	}
	
	.draftDetail .btm-area .line > div {
	    border-right: 1px solid #ddd;
	    border-bottom: 1px solid #ddd;
	}
	
	.draftDetail .btm-area .tit {
		width: 120px;
	    border-width: 1px;
	    background: #f5f5f5;
	    padding: 7px 16px;
	    font-weight: 600;
	    text-align: center;
	}

	.draftDetail .btm-area .txt {
		width: calc(100% - 120px);
	}
	
	.editor-area .note-editor {
		width: 100% !important;
		margin-top: 20px;
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

			<div class="page-content draftDetail">
				<section id="menu">
					<h4 class="menu-title">문서함</h4>
					<ul>
						<li class="active"><a href="#" onclick="setForm('brand','open',this)">브랜드 등록</a></li>
						<li><a href="#" onclick="setForm('brand','close',this)">브랜드 폐점</a></li>
						<li><a href="#" onclick="setForm('direct','open',this)">직영점 등록</a></li>
						<li><a href="#" onclick="setForm('direct','close',this)">직영점 폐점</a></li>
					</ul>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>기안 수정페이지</h5>
						</div>
						<div class="buttons">
							<button href="#" class="btn btn-primary" onclick="saveTemp()">수정</button>
							<button href="#" class="btn btn-outline-primary">결재 정보</button>
							<button href="#" class="btn btn-outline-primary">취소</button>
						</div>
						<div class="cont-body">  
							<h4 class="doc-subject">업무 기안 (<span class="change-tit">브랜드 등록</span>)</h4>
							<form id="formDraft">
								<input type="hidden" name="draft_idx" value="${DraftInfo.target_type}"/>
								<input type="hidden" name="target_type" value="${DraftInfo.target_type}"/>
								<input type="hidden" name="action_type" value="${DraftInfo.action_type}"/>
								<div class="top-area">
									<table class="user_info">
										<tr>
											<th>기안자</th>
											<td>
												<input type="hidden" name="username" value="${DraftInfo.username}"/>
												<input type="text" name="sender_name" value="${DraftInfo.user_name}" readonly/>
											</td>
										</tr>
										<tr>
											<th>기안일</th>
											<td>
												<c:if test="${DraftInfo.status == 'sd'}">
													<input type="text" name="today" value="${DraftInfo.create_date}" readonly/>
												</c:if>
												<c:if test="${DraftInfo.status == 'sv'}">
													<input type="text" name="today" value="-" readonly/>
												</c:if>
											</td>
										</tr>
										<tr>
											<th>소속</th>
											<td>
												<input type="hidden" name="dept_id" value="${DraftInfo.dept_id}" readonly/>
												<input type="text" name="team_name" value="${DraftInfo.dept_id}" readonly/>
											</td>
										</tr>
									</table>
									
									<table class="appr_line">
										<tr>
											<th rowspan="3">결재</th>
											<td>사원</td>
											<td>차장</td>
											<td>부장</td>
											<td>대표</td>
										</tr>
										<tr>
											<td>
												<input type="hidden" name="appr_user" value="wjsaus123"/>
												<p>홍길동</p>
											</td>
											<td>
												<input type="hidden" name="appr_user" value="jwbak"/>
												<p>김길동</p>
											</td>
											<td>
												<input type="hidden" name="appr_user" value="qtgks9"/>
												<p>박길동</p>
											</td>
											<td>
												<input type="hidden" name="appr_user" value="qwre"/>
												<p>고길동</p>
											</td>
										</tr>
										
										<tr class="date">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										
									</table>
									
								</div>
								
								<div class="btm-area">
									<div class="line">
										<div class="tit"><span class="ico-required">*</span>제목</div>
										<div class="txt"><input class="form-control" type="text" name="subject" value="${DraftInfo.subject}" required/></div>
									</div>
									<div class="line">
										<div class="tit"><span class="ico-required">*</span>협조부서</div>
										<div class="txt">
											<fieldset class="form-group">
												<select class="form-select" id="basicSelect" name="cooper_dept_id">
													<c:forEach items="${deptList}" var="dept">
														<option value="${dept.id}"
															<c:if test="${dept.id == DraftInfo.cooper_dept_id}">selected</c:if>>
															${dept.text}
														</option>
													</c:forEach>
												</select>
											</fieldset>
										</div>
									</div>
									<div class="line">
										<div class="tit"><span class="ico-required">*</span>브랜드명</div>
										<div class="txt"><input class="form-control" type="text" name="name" value="${DraftInfo.name}" required/></div>
									</div>
									<div class="line">
										<div class="tit"><span class="ico-required">*</span>시행일자</div>
										<div class="txt"><input class="form-control" type="date" name="from_date" value="${DraftInfo.name}" required/></div>
									</div>
									
								</div>
								<div class="editor-area">
									<textarea name="content" id="summernote" maxlength="10000"></textarea>
									
								</div>
								
								<h5>파일 첨부</h5>
								<input type="file" class="with-validation-filepond" multiple data-max-file-size="10MB">
								
								<input type="hidden" name="status"/>
							</form>

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

	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/textEaditor.js'></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

// 기안일
/* const today = new Date();   
const year = today.getFullYear(); 
const month = today.getMonth() + 1; 
const date = today.getDate();  
document.querySelector('input[name="today"]').value = year + '-' + month + '-' + date; */

var target = '${DraftInfo.target_type}' == 'df001' ?  '브랜드' : '직영점';
console.log('target: '+target);
var action = '${DraftInfo.action_type}' == 'df011' ?  '등록' : '폐점';
console.log('action: '+action);

$('.change-tit').text(target+' ' +action);


console.log('ApprLine: '+ '${ApprLine}');
console.log('DraftInfo: '+ '${DraftInfo}');

// 기안문 종류에 따른 양식
function setForm(type1, type2, element){
	document.querySelectorAll('.change-tit').forEach(function(titEl) {
		titEl.innerText = element.innerText; // 클릭한 텍스트로 변경
	});
	
	// 브랜드 기안의 경우
	if(type1 == 'brand'){
		//document.getElementsByClassName('addr-area')[0].style.display = 'none';
		document.querySelector('input[name="target_type"]').value = 'df001';
		// 주소칸 제거
		if($("#addr-area").length >= 1){
			$("#addr-area").remove();
		}
	// 직영점 기안의 경우
	}else if(type1 == 'direct'){
		document.querySelector('input[name="target_type"]').value = 'df002';
		// 주소칸 추가
		if($("#addr-area").length == 0){
	
			let addressForm = `
			    <div id="addr-area">
			        <div class="left">
			            <div class="line addr">
			                <div class="tit"><span class="ico-required">*</span>주소</div>
			                <div class="txt">
			                    <input class="form-control" type="text" id="sample6_address" name="address" required/>
			                </div>
			            </div>
			            <div class="line addr">
			                <div class="tit"><span class="ico-required">*</span>상세주소</div>
			                <div class="txt">
			                    <input class="form-control" type="text" id="sample6_detailAddress" name="address" required/>
			                </div>
			            </div>
			        </div>
			        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			    </div>
		    `;
	
			document.getElementsByClassName('btm-area')[0].insertAdjacentHTML('beforeend', addressForm);
		}
	}
	


</script>

</html>