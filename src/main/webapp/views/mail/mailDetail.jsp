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

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">

<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
.mailDetail .tit-area {
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.mailDetail .tit-area .left {
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.mailDetail .tit-area .left button{
	background: none;
	border: none;
}

.mailDetail .tab {
	margin-left: 14px;
}

.mailDetail .tab .bar {
	display: inline-block;
	width: 1px;
	height: 14px;
	background: #ddd;
}

.mailDetail .tab button {
	color: #888;
}

.mailDetail .tab button.selected {
	color: #333;
}

.mailDetail table tr:hover {
	background: #f7f7f7;
}


.mailDetail .search-area {
	display: flex;
	gap: 4px;
}

.mailDetail input[name="search-data"] {
	width: 300px;
	height: 38px;
	margin: 14px 0;
	border: 1px solid #DFE3E7;
}

.mailDetail .search-area select {
	margin: 14px 0;
    height: 38px;
}

.mailDetail .search-area .btn-sch {
	margin: 14px 0;
    height: 38px;
}

.mailDetail .util-area {
	display: flex;
	justify-content: space-between;
    padding: 20px 40px;
    border-bottom: 1px solid #ddd;
}

.mailDetail .util-area .left > * {
	margin-right: 10px;
}


.mailDetail .list-area .mail-item {
	display: flex;
	justify-content: space-between;
    padding: 16px 40px;
    border-bottom: 1px solid #ddd;
}
.mailDetail .list-area .mail-item .left > *{
	margin-right: 10px;
}
.mailDetail .list-area .mail-item .name {
	margin-right: 30px;
}

/* file */
#attachView {
	width: 100%;
	margin: 6px 0;
	border:1px solid #ddd;
	border-radius: 4px;
}
div.attach_file {
}
div.attach_file ul.file_wrap {
	margin:0; 
	padding: 0;
	background:#f5f5f5;
}
div.attach_file ul.file_wrap > li {
	display: flex;
    padding: 5px 14px;
}
div.attach_file ul.file_wrap > li > span {
	margin-right: 6px;
}
div.attach_file .preview {
	display: inline-block;
	width: 26px;
	height: 26px;
	margin-right: 8px;
	border-radius: 4px;
	overflow: hidden;
}
div.attach_file .size {
	color: var(--bs-grayfont-color);
}
div.attach_file .bi-download {
	margin-left: 4px;
	cursor: pointer;
	color: var(--bs-grayfont-color);
}
div.attach_file div.attach_file_header {
	position:relative; 
	background:#f7f7f7; 
	border-bottom:1px solid #e6e6e6;
	padding: 8px 14px;
}
div.attach_file div.attach_file_header span.subject span.ic_file_s {
	vertical-align:top; 
	margin-top:0;
}
div.attach_file div.attach_file_header span.subject span.num {
	margin-left:-1px;
}
div.attach_file div.attach_file_header span.subject span.etc {
	font-size:11px; 
	color:#777; 
	letter-spacing:-1px;
}
div.attach_file div.attach_file_header span.subject span.etc strong {
	color:red; 
	font-weight:normal; 
	letter-spacing:0;
}
div.attach_file span.btn_area {
	position:absolute; 
	top: 9px; 
	right: 12px; 
	margin-left:20px; 
	text-align:right;
}
div.attach_file span.btn_area span.btn_wrap {
	font-size: 13px;
}

.mailDetail .mail-cont {
	margin: 30px 0 80px;
}
.mailDetail .line {
	display: flex;
	margin-bottom: 16px;
}
.mailDetail .line label {
	width : 72px;
    flex-shrink: 0;
}
.mailDetail .title {
	margin-top: 10px;
	margin-bottom: 24px;
	font-size: 24px;
	font-weight: 600;
}
.mailDetail .line .tag {
	display: inline-block;
	margin: 0px 6px 6px 0;
    padding: 2px 4px;
    background-color: var(--bs-bg);
    border: 1px solid #dae0eb;
    border-radius: 4px;
    font-size: 14px;
}
.mailDetail #bookmark {
	font-size: 22px;
	margin-right: 2px;
	margini-top: -4px;
	cursor: pointer;
}
.mailDetail .bi-star {
	color: #8D959F;
}
.mailDetail .bi-star-fill{
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

			<div class="page-content mailDetail">
				<section id="menu">
					<h4 class="menu-title">사내메일</h4>
					<ul>
						<li class="active"><a href="#">받은메일함</a></li>
						<li><a href="#">보낸메일함</a></li>
						<li><a href="#">임시보관함</a></li>
						<li><a href="#">중요메일함</a></li>
						<li><a href="#">휴지통</a></li>
					</ul>
					<div class="btn btn-primary full-size">메일쓰기</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<div class="left">
								<h5>메일보기</h5>
							</div>
						</div>
						<div class="util-area">
							<div class="left">
								<buttton>답장</buttton>
								<buttton>전달</buttton>
								<buttton>삭제</buttton>
								<buttton>안읽음</buttton>
							</div>
						</div>

						<div class="cont-body">
							<p class="title">
							 <c:if test="${is_bookmark eq 'Y'}"><i id="bookmark" class="bi bi-star-fill"></i></c:if> 
							 <c:if test="${is_bookmark eq 'N'}"><i id="bookmark" class="bi bi-star"></i></c:if> 
								${mailInfo.title}
							</p>
							<div class="line">
								<label class="fw-600">보낸 사람</label>
								<span class="tag">${mailInfo.sender}/${mailInfo.position_name}/${mailInfo.dept_name} &lt;${mailInfo.name}&gt;</span>
							</div>
							<div class="line receivers">
								<label class="fw-600">받는 사람</label>
								<div class="tag-area"></div>
							</div>
							<div class="line">
								<label class="fw-600">전송 일시</label>
								<span>${mailInfo.send_date_str}</span>
							</div>
							<div class="line">
								<div id="attachView">
									<div class="attach_file" style="display:">
										<div class="attach_file_header">
											<span class="subject">
												<span class="ic ic_file_s"></span>
												<strong>첨부파일</strong>
												<span class="num">0</span>개
												<span class="size">(0.0Byte)</span>
											</span>
										</div>
										<ul class="file_wrap" id="file_wrap">
<%-- 										<c:forEach items="${fileList}" var="file">
											<li>
												<span class="preview"></span>
												<span>${file.ori_filename}</span>
												<span class="size">${file.file_size}</span>
												<i class="bi bi-download"></i>
											</li> 
										</c:forEach> --%>
										</ul>
									</div>
								</div>					
							</div>
							<div class="mail-cont">
								${mailInfo.content}
							</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

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

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>

<script src='/resources/js/common.js'></script>
<script src='/resources/js/textEaditor.js'></script>

<script>

	var receivers = '${mailInfo.username}';
	var receiverArray = receivers.split(',');
	var receiverCont = '';
	for (var receiver of receiverArray) {
	  	var encodedReceiver = receiver.replace(/</g, "&lt;").replace(/>/g, "&gt;");
		receiverCont += '<span class="tag">'+encodedReceiver+'</span>';
	}
	//console.log("receivers",receivers);
	//console.log("receiverCont",receiverCont);
	$('.receivers .tag-area').append(receiverCont);
	
	// 파일
	var fileCont = "";
	<c:forEach items="${fileList}" var="file">
		//파일 사이즈 표시(1MB보다크면 MB단위 아니면 KB단위)
		var fileSizeMB = '${file.file_size/1024/1024}';
		var fileSizeKB = '${file.file_size/1024}' ;
		var fileSize;
        if (fileSizeMB > 1) {
            fileSize = Math.round(fileSizeMB * 10) / 10  + " MB"; 
        } else {
            fileSize = Math.round(fileSizeKB * 10) / 10  + " KB";
        }
        
        //미리보기 아이콘(이미지인경우/아닌경우)
        var imgPath;
        if('${file.type}'.includes('image')){
        	imgPath = '/photo/${file.new_filename}';
        }else{
        	imgPath = '/resources/img/ico/ico_file.png';
        }
		fileCont += '<li>';
		fileCont += '<span class="preview" style="background: url('+imgPath+') no-repeat center/cover"></span>';
		fileCont += '<span>${file.ori_filename}</span>';
		fileCont += '<span class="size">('+fileSize+')</span>';
		fileCont += '<i class="bi bi-download" onclick="download(\'${file.ori_filename}\', \'${file.new_filename}\')"></i>';
		fileCont += '</li> ';
	</c:forEach> 
	$('#file_wrap').append(fileCont);
	console.log("fileList","${fileList}");
	console.log("fileCont",fileCont);

	// 즐겨찾기
	var isBookmark='${is_bookmark}';
	console.log("[첫]isBookmark : ",isBookmark);
	console.log("bookel",document.getElementById('bookmark'));
	document.getElementById('bookmark').addEventListener('click', function() {
		console.log("[전송직전]isBookmark : ",isBookmark);
		var params = {
				'idx' : '${mailInfo.idx}',
				'is_bookmark' : isBookmark
		}
		httpAjax('PUT','/mail/bookmark',params);
		//location.reload();
	});

	function httpSuccess(response){
		$('#bookmark').toggleClass('bi-star-fill bi-star');
		console.log("[success1]isBookmark : ",isBookmark);
		isBookmark = isBookmark == 'Y' ? 'N' : 'Y';
		console.log("[success2]isBookmark : ",isBookmark);
	} 
</script>

</html>