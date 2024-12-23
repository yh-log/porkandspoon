<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>브랜드 상세</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
	#selectBox{
		display: flex;
		gap: 10px;
		align-items: center;
		margin-top: 15px;
	}
	
	.form-select{
	 	width: 20%;
	}
	.cont-body .row .col-6.col-lg-6:last-of-type{
	    display: flex;
	    justify-content: flex-end;
	    gap: 10px;
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
					<h4 class="menu-title">부서 리스트</h4>
					<ul>
						<li class="active" id="firstMenu"><a href="#">브랜드 리스트</a></li>
						<li id="secondMenu"><a href="#">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">브랜드 상세</h5>
						</div>
						<div class="cont-body"> 
							<form>
								<div class="row">
									<div class="col-6 col-lg-6">
										<div id="selectBox">
											활성
											<select class="form-select selectStyle"> 
												<option>활성</option>
												<option>비활성</option>
											</select>
											상태
											<select class="form-select selectStyle">
												<option>승인</option>
												<option>반려</option>
												<option>대기</option>
											</select>
										</div>
									</div>
									<div class="col-6 col-lg-6">
										<button class="btn btn-primary">수정</button>
										<button class="btn btn-outline-secondary">리스트</button>
									</div>
								</div>
								<table>
									<tr>
										<td rowspan="2">로고</td>
										<th>문서 제목</th>
										<td><span id="subject-value"></span>브랜드 확장을 위한 개설 요청의 건</td>
										<th>기안자</th>
										<td><span id="username-value"></span>홍길동</td>
									</tr>
									<tr>
										<th>결재 일자</th>
										<td><span id="approval_date-value"></span>2024. 12. 19.(목)</td>
										<th>작성 부서</th>
										<td><span id="department_id-value"></span>홍보2팀</td>
									</tr>
									<tr>
										<th>브랜드 명</th>
										<td colspan="2"><span id="name-value"></span>애슐리하우스</td>
										<th>브랜드 코드</th>
										<td><span id="id-value"></span>AD101</td>
									</tr>
									<tr>
										<th>소속 직원</th>
										<td colspan="2"><span id="-value"></span>김김김 부장, 이이이 차장, 박박박 과장, 홍길동 대리</td>
										<th>시행일자</th>
										<td><span id="form_date-value"></span>2025. 1. 1.(수)</td>
									</tr>
									<tr><th colspan="5">설명</th></tr>
									<tr>
										<td colspan="5">
											<!-- 썸머노트 코드 불러와서 넣기 -->
											<span id=""></span>
											<img src="/resources/img/logo.jpg" width="130px" /> <br/>
											애슐리(Ashley)는 대한민국 이랜드이츠가 운영하는 뷔페 패밀리 레스토랑 체인이다. 애슐리는 매 분기마다 새로운 콘셉트의 새 메뉴를 제공하며, 또한 고급화 매장인 애슐리 W, 애슐리 W+, 테이크아웃 전문 매장인 애슐리 투고 등 다양한 서브 브랜드를 운영하고 있다.
											애슐리는 2003년 3월 25일 2001아울렛 분당점을 시작으로 본격적으로 영업을 시작하였다.[1] 2019년 현재 대한민국 내에서 운영되는 매장은 110여 개로 CJ푸드빌에서 운영하는 빕스의 61개 매장에 대비 50여개 더많다.
											애슐리(Ashley)는 대한민국 이랜드이츠가 운영하는 뷔페 패밀리 레스토랑 체인이다. 애슐리는 매 분기마다 새로운 콘셉트의 새 메뉴를 제공하며, 또한 고급화 매장인 애슐리 W, 애슐리 W+, 테이크아웃 전문 매장인 애슐리 투고 등 다양한 서브 브랜드를 운영하고 있다.
											애슐리는 2003년 3월 25일 2001아울렛 분당점을 시작으로 본격적으로 영업을 시작하였다.[1] 2019년 현재 대한민국 내에서 운영되는 매장은 110여 개로 CJ푸드빌에서 운영하는 빕스의 61개 매장에 대비 50여개 더많다.
											애슐리(Ashley)는 대한민국 이랜드이츠가 운영하는 뷔페 패밀리 레스토랑 체인이다. 애슐리는 매 분기마다 새로운 콘셉트의 새 메뉴를 제공하며, 또한 고급화 매장인 애슐리 W, 애슐리 W+, 테이크아웃 전문 매장인 애슐리 투고 등 다양한 서브 브랜드를 운영하고 있다.
											애슐리는 2003년 3월 25일 2001아울렛 분당점을 시작으로 본격적으로 영업을 시작하였다.[1] 2019년 현재 대한민국 내에서 운영되는 매장은 110여 개로 CJ푸드빌에서 운영하는 빕스의 61개 매장에 대비 50여개 더많다.										
										
										</td>
									</tr>
								</table>
							</form>
						</div> <!-- cont-body -->
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


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/menu.js'></script>
<script>




</script>

</html>