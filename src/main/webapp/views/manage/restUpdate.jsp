<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>휴점 등록</title>
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		  href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon"
		  href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBA
	AAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPS
	JXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpucz
	ptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHR
	wOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0a
	W9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEu
	MC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5z
	OnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtc
	D0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYW
	RvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwL
	zEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmO
	lBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoP
	SIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZm
	Y6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xv
	ck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGl
	meURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFU
	MTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgI
	CAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWd
	uZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZ
	jpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1
	ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9ma
	ORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec
	8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCz
	eo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBg
	nRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v
	+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L
	/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVI
	Y1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9u
	Q04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1en
	MYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYi
	nwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3t
	E3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12Eg
	jPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7
	us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+O
	Neqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
		  type="image/png">


	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

	<style >

		.tit-area{
			display: flex;
		}

		td div.inline-layout{
			display: flex;
			align-items: center;
			flex-wrap: nowrap;
			white-space: nowrap;
			gap: 10px;
		}

		.required-value{
			color: var(--bs-danger);
		}

		.dateFont{
			font-weight: 500;
		}

		td div input[type="date"]{
			width: 150px;
		}

		#home, #schedule{
			width: 200px;
			margin-top: 10px;
			margin-bottom: 10px;
		}

		#nameTableTd{
			float: left;
			margin-left: 10px;
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

		<div class="page-content">
			<section id="menu">
				<h4 class="menu-title">매장관리</h4>
				<button class="btn btn-outline-primary" id="home" onclick="location.href='/ad/spotManage'">매장관리 홈</button>
				<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/rest/Write'">휴점 등록</button>

				<ul>
					<li class="active"><a href="/ad/part/List">아르바이트 관리</a></li>
					<li><a href="/ad/rest/List">휴점수정</a></li>

				</ul>
			</section>
			<section class="cont">
				<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
				<div class="tit-area">
					<h5>휴점 등록</h5>
				</div>
				<div class="cont-body">
					<div class="row">
						<div class="col-12 col-lg-12">
							<form>
								<input type="hidden" name="username" value="${username}"/>
								<input type="hidden" name="rest_idx" value="${getRest.rest_idx}"/>
								<input type="hidden" name="creater" value="${getRest.creater}"/>
								<input type="hidden" name="board_idx" value="${getRest.board_idx}">
								<input type="hidden" name="schedule_idx" value="${getRest.schedule_idx}"/>
								<table>
									<tr class="table-sun" id="user-name-insert">
										<th>작성자</th>
										<td colspan="3" id="nameTableTd">${getRest.username} ${getRest.position}</td>
									</tr>
									<tr class="table-sun">
										<th>휴점명<span class="required-value">*</span> </th>
										<td colspan="3"><input class="form-control" name="subject" type="text" value="${getRest.subject}" data-required="true"></td>
									</tr>
									<tr>
										<th>브랜드</th>
										<td>${getRest.dept_name}</td>
										<th>직영점 명</th>
										<td>
											${getRest.store_name}
											<input type="hidden" name="id" value="${getRest.id}"/>
										</td>
									</tr>
									<tr>
										<th class="table-text table-text-text" style="vertical-align: top;">휴점일정</th>
										<td colspan="3">
											<div class="inline-layout">
												<span class="dateFont">시작일</span><span class="required-value">*</span> <input class="form-control" type="date" id="start_date" name="start_date" value="${getRest.start_date}" data-required="true"/> <span class="dateFont"> ~ </span>
												<span class="dateFont">종료일</span><span class="required-value">*</span> <input class="form-control" type="date" id="end_date" name="end_date" value="${getRest.end_date}" data-required="true"/>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="editor-area">
												<textarea name="contents" id="summernote" maxlength="10000"></textarea>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="row">
							<div class="col-sm-5"></div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-primary btn-write" onclick="layerPopup('휴점 정보를 수정하시겠습니까?','등록','취소', restUpdate, removeAlert)">등록</button>
								<button type="button" class="btn btn-outline-primary btn-delete">취소</button>
							</div>
							<div class="col-sm-5"></div>
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

<script src='/resources/js/textEaditor.js'></script>
<script src='/resources/js/common.js'></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function (){
		$('#summernote').summernote({
			height: 300
		});

		const content = '${getRest.content}';

		$('#summernote').summernote('code', content);
	});

	console.log(('input[name="hidden"]').val());

	function validateForm(){
		const requireFidlds = document.querySelectorAll('[data-required="true"]');
		let isValid = true;

		requireFidlds.forEach(function (field){
			if(!field.value.trim()){
				field.classList.add('is-invalid');
				isValid = false;
			}else {
				field.classList.remove('is-invalid');
			}
		});

		return isValid;
	}

	function restUpdate(){

		let isFormValid = validateForm();

		if(isFormValid){
			// 함수 실행
			textEaditorWrite('/ma/rest/update');

		}else{
			layerPopup("필수값을 입력해주세요.", "확인", false, removeAlert, removeAlert);
		}

	}

	function fileSuccess(response){
		removeAlert();

		console.log(response);
		if(response.status == 200){
			layerPopup(response.message, "확인", false, function() {
				location.href = '/us/rest/detail/' + response.idx;
			});

		}else{
			layerPopup(response.message, "확인", false, function() {
				location.href = '/us/rest/list'
			});
		}
	}

</script>

</html>