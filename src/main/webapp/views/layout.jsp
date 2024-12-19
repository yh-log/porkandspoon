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

<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">

		<!-- 사이드바 -->
		<jsp:include page="sidebar.jsp" />

		<div id="main">
			<!-- 헤더 -->
			<jsp:include page="header.jsp" />

			<div class="page-content">
				<section id="menu">
					<h4 class="menu-title">사내메일</h4>
					<ul>
						<li class="active"><a href="#">받은메일함</a></li>
						<li><a href="#">보낸메일함</a></li>
						<li><a href="#">임시보관함</a></li>
						<li><a href="#">중요메일함</a></li>
						<li><a href="#">휴지통</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>받은메일함</h5>
						</div>
						<div class="cont-body">

							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-12 order-md-1 order-last">
											<h3>제목 폰트</h3>

											<h2>h2태그 사용(32px)</h2>
											<h3>h3태그 사용(28px)</h3>
											<h4>h4태그 사용(24px) - 메뉴바 "[h4
												class="menu-title"]사내메일[/h4]"</h4>
											<h5>h5태그 사용(20px)</h5>

											<p>(본문은 기본 16px)</p>
										</div>
									</div>
								</div>
							</div>
							<hr />


							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-12 order-md-1 order-last">
											<h3>컬러</h3>
											<h5>normal</h5>
											<div class="row">
												<div class="col">
													<div
														style="background: var(--bs-primary); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-primary)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-bg); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-bg)</span>
												</div>
												<div class="col"></div>
												<div class="col"></div>
												<div class="col"></div>
												<div class="col"></div>
											</div>
											<div class="row">
												<div class="col">
													<div
														style="background: var(--bs-secondary); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-secondary)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-success); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-success)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-info); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-info)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-warning); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-warning)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-danger); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-danger)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-dark); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-dark)</span>
												</div>
											</div>
											<h5>light</h5>
											<div class="row">
				
												<div class="col">
													<div
														style="background: var(--bs-light-secondary); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-light-secondary)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-light-success); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-light-success)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-light-info); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-light-info)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-light-warning); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-light-warning)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-light-danger); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-light-danger)</span>
												</div>
												<div class="col">
													<div
														style="background: var(--bs-light-dark); width: 60px; height: 60px; margin-right: 10px; border-radius: 50%;"></div>
													<span style="font-size: 15px;">var(--bs-light-dark)</span>
												</div>
											</div>
											
											<br/><br/>
											<h4>@폰트 색상</h4>
											<br/>
											<h5>제목 폰트 색상 :  var(--bs-heading-color)</h5>
											<h5 style="color: var(--bs-body-color)">본문 기본 폰트 색상 :  var(--bs-body-color)</h5>
											<h5 style="color: #7D8187">본문 gray 폰트 색상 :  var(--bs-body-color)</h5>
											
											

										</div>
									</div>
								</div>
							</div>
							<hr />



							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-6 order-md-1 order-last">
											<h3>알림팝업</h3>


											<!--    onclick="layerPopup('문구','버튼1 텍스트','버튼2 텍스트')"
	        								+ btn1Act()와  btn2Act() 함수 생성하여 각 버튼 클릭시 이벤트 넣기(422번줄 참고)   -->
											<a href="#" class="btn btn-primary"
												onclick="layerPopup('~~~하시겠습니까?','다음으로','취소')">팝업</a>
											<div class="btn btn-primary btn-popup">팝업2</div>
										</div>
									</div>
								</div>
							</div>
							<hr />





							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-6 order-md-1 order-last">
											<h3>모달</h3>


											<!--    onclick="layerPopup('문구','버튼1 텍스트','버튼2 텍스트')"
	        								+ btn1Act()와  btn2Act() 함수 생성하여 각 버튼 클릭시 이벤트 넣기(422번줄 참고)   -->
											<button class="btnModal btn btn-primary">모달 열기</button>

											<!-- 모달 -->
											<div id="modal" class="modal">
												<div class="modal-cont">
													<span class="close">&times;</span>
													<div id="modal-body">
														<h4 class="menu-title">타이틀</h4>
													</div>
												</div>
											</div>


										</div>
									</div>
								</div>
							</div>
							<hr />










							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>Badge</h3>
										<p class="text-subtitle text-muted">Examples for badges,
											our small count and labeling component.</p>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
												<li class="breadcrumb-item active" aria-current="page">Badge</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
							<section class="section">
								<div class="row">
									<div class="col-12 col-md-6 col-lg-6">
										<div class="card">
											<div class="card-header">
												<h4>Variation</h4>
											</div>
											<div class="card-body">
												<div class="badges">
													<span class="badge bg-primary">Primary</span> <span
														class="badge bg-secondary">Secondary</span> <span
														class="badge bg-success">Success</span> <span
														class="badge bg-danger">Danger</span> <span
														class="badge bg-warning">Warning</span> <span
														class="badge bg-info">Info</span> <span
														class="badge bg-dark">Dark</span>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-header">
												<h4>Light</h4>
											</div>
											<div class="card-body">
												<div class="badges">
													<span class="badge bg-light-primary">Primary</span> <span
														class="badge bg-light-secondary">Secondary</span> <span
														class="badge bg-light-success">Success</span> <span
														class="badge bg-light-danger">Danger</span> <span
														class="badge bg-light-warning">Warning</span> <span
														class="badge bg-light-info">Info</span> <span
														class="badge bg-light-dark">Dark</span>
												</div>
											</div>
										</div>


									</div>
									<div class="col-12 col-md-6 col-lg-6">
										<div class="card">
											<div class="card-header">
												<h4>Button</h4>
											</div>
											<div class="card-body">
												<div class="buttons">
													<div class="section-title mt-0">Simple</div>
													<button type="button" class="btn btn-primary">
														Notifications <span class="badge bg-transparent">4</span>
													</button>
													<button type="button" class="btn btn-danger">
														Notifications <span class="badge bg-transparent">4</span>
													</button>
													<button type="button" class="btn btn-warning">
														Notifications <span class="badge bg-transparent">4</span>
													</button>
													<button type="button" class="btn btn-success">
														Notifications <span class="badge bg-transparent">4</span>
													</button>
													<button type="button" class="btn btn-dark">
														Notifications <span class="badge bg-transparent">4</span>
													</button>
													<div class="section-title">Icons</div>
													<button type="button"
														class="btn btn-primary btn-icon icon-left">
														<i class="fas fa-plane"></i> Notifications <span
															class="badge bg-transparent">4</span>
													</button>
													<button type="button"
														class="btn btn-danger btn-icon icon-left">
														<i class="fas fa-plane"></i> Notifications <span
															class="badge bg-transparent">4</span>
													</button>
													<button type="button"
														class="btn btn-warning btn-icon icon-left">
														<i class="fas fa-plane"></i> Notifications <span
															class="badge bg-transparent">4</span>
													</button>
													<button type="button"
														class="btn btn-success btn-icon icon-left">
														<i class="fas fa-plane"></i> Notifications <span
															class="badge bg-transparent">4</span>
													</button>
												</div>
											</div>
										</div>
										<div class="card">
											<div class="card-header">
												<h4>Link</h4>
											</div>
											<div class="card-body">
												<div class="badges">
													<a href="#" class="badge bg-primary">Primary</a> <a
														href="#" class="badge bg-secondary">Secondary</a> <a
														href="#" class="badge bg-success">Success</a> <a href="#"
														class="badge bg-danger">Danger</a> <a href="#"
														class="badge bg-warning">Warning</a> <a href="#"
														class="badge bg-info">Info</a> <a href="#"
														class="badge bg-light">Light</a> <a href="#"
														class="badge bg-dark">Dark</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<hr />


							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-6 order-md-1 order-last">
											<h3>Button</h3>
											<p class="text-subtitle text-muted"></p>
										</div>
										<div class="col-12 col-md-6 order-md-2 order-first">
											<nav aria-label="breadcrumb"
												class="breadcrumb-header float-start float-lg-end">
												<ol class="breadcrumb">
													<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
													<li class="breadcrumb-item active" aria-current="page">Button</li>
												</ol>
											</nav>
										</div>
									</div>
								</div>
								<section class="section">

									<div class="row">
										<div class="col-6">
											<div class="card">
												<div class="card-header">
													<h4>Basic Buttons</h4>
												</div>
												<div class="card-body">
													<h6>Default</h6>
													<p class="text-muted">
														Use the
														<code>.btn .btn-{color}</code>
														classes.
													</p>
													<div class="buttons">
														<a href="#" class="btn btn-primary">Primary</a> <a
															href="#" class="btn btn-outline-primary">Primary</a> <a
															href="#" class="btn btn-outline-secondary">Secondary</a>
													</div>



												</div>
											</div>
										</div>



										<div class="col-6 col-md-6 col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4>buttons 정렬</h4>
													<p>
														버튼 여러개함께 넣을 경우 [div class="buttons"]안에 버튼 태그들 넣기!<br />
														왼쪽정렬 [div class="buttons align-l"]<br /> 가운데정렬 [div
														class="buttons align-c"]<br /> 우측정렬 [div class="buttons
														align-r"]
													</p>
												</div>
												<div class="card-body">
													<div class="buttons align-l">
														<a href="#" class="btn btn-sm btn-primary">Small</a> <a
															href="#" class="btn btn-primary">Normal</a> <a href="#"
															class="btn btn-lg btn-primary">Large</a>
													</div>
													<div class="buttons align-c">
														<a href="#" class="btn btn-sm btn-outline-primary">Small</a>
														<a href="#" class="btn btn-outline-primary">Normal</a> <a
															href="#" class="btn btn-lg btn-outline-primary">Large</a>
													</div>
													<div class="buttons align-r">
														<a href="#" class="btn btn-sm btn-outline-secondary">Small</a>
														<a href="#" class="btn btn-outline-secondary">Normal</a> <a
															href="#" class="btn btn-lg btn-outline-secondary">Large</a>
													</div>
												</div>
											</div>




										</div>

										<div class="row">
											<div class="col-12 col-md-6 col-lg-6">
												<div class="card">
													<div class="card-header">
														<h4>Button Sizes</h4>
													</div>
													<div class="card-body">
														<p class="text-muted">
															large - 꼭 필요한 경우:
															<code>.btn-lg</code>
															<br /> normal - 대부분의 경우:
															<code>별도의 사이즈 추가 클래스 필요없음</code>
															<br /> small - 알림 팝업, 테이블 내에 들어가는 버튼의 경우:
															<code>.btn-sm</code>
														</p>
														<div class="buttons align-c">
															<a href="#" class="btn btn-sm btn-primary">Small</a> <a
																href="#" class="btn btn-primary">Normal</a> <a href="#"
																class="btn btn-lg btn-primary">Large</a>
														</div>
														<div class="buttons align-l">
															<a href="#" class="btn btn-sm btn-outline-primary">Small</a>
															<a href="#" class="btn btn-outline-primary">Normal</a> <a
																href="#" class="btn btn-lg btn-outline-primary">Large</a>
														</div>
														<div class="buttons align-r">
															<a href="#" class="btn btn-sm btn-outline-secondary">Small</a>
															<a href="#" class="btn btn-outline-secondary">Normal</a>
															<a href="#" class="btn btn-lg btn-outline-secondary">Large</a>
														</div>
													</div>
												</div>
											</div>
											<div class="col-12 col-md-6 col-lg-6">
												<div class="card">
													<div class="card-header">
														<h4>버튼 상태</h4>
													</div>
													<div class="card-body">
														<p class="text-muted">
															비활성화 버튼의 경우
															<code>.disabled</code>
															클래스 추가

														</p>
														<div class="buttons">
															<a href="#" class="btn btn-primary">Normal</a> <a
																href="#" class="btn disabled btn-primary">Disabled</a>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6 col-lg-6">
													<div class="card">
														<div class="card-header">
															<h4>Icon Button</h4>
														</div>
														<div class="card-body">
															<p class="text-muted">
																Use the
																<code>.icon</code>
																and
																<code>.icon-left</code>
																classes.
															</p>
															<div class="buttons">
																<a href="#" class="btn icon icon-left"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-user">
																<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
																<circle cx="12" cy="7" r="4"></circle></svg> Default</a> <a
																	href="#" class="btn icon icon-left btn-primary"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-edit">
																<path
																			d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
																<path
																			d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
																	Primary</a> <a href="#"
																	class="btn icon icon-left btn-secondary"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-user">
																<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
																<circle cx="12" cy="7" r="4"></circle></svg> Secondary</a> <a
																	href="#" class="btn icon icon-left btn-info"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-info">
																<circle cx="12" cy="12" r="10"></circle>
																<line x1="12" y1="16" x2="12" y2="12"></line>
																<line x1="12" y1="8" x2="12.01" y2="8"></line></svg> Info</a> <a
																	href="#" class="btn icon icon-left btn-warning"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-alert-triangle">
																<path
																			d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path>
																<line x1="12" y1="9" x2="12" y2="13"></line>
																<line x1="12" y1="17" x2="12.01" y2="17"></line></svg> Warning</a>
																<a href="#" class="btn icon icon-left btn-danger"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-alert-circle">
																<circle cx="12" cy="12" r="10"></circle>
																<line x1="12" y1="8" x2="12" y2="12"></line>
																<line x1="12" y1="16" x2="12.01" y2="16"></line></svg> Danger</a>
																<a href="#" class="btn icon icon-left btn-success"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-check-circle">
																<path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
																<polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
																	Success</a> <a href="#"
																	class="btn icon icon-left btn-light"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-star">
																<polygon
																			points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
																	Light</a> <a href="#" class="btn icon icon-left btn-dark"><svg
																		xmlns="http://www.w3.org/2000/svg" width="24"
																		height="24" viewBox="0 0 24 24" fill="none"
																		stroke="currentColor" stroke-width="2"
																		stroke-linecap="round" stroke-linejoin="round"
																		class="feather feather-file">
																<path
																			d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path>
																<polyline points="13 2 13 9 20 9"></polyline></svg> Dark</a>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 col-md-6 col-lg-6">
													<div class="card">
														<div class="card-header">
															<h4>Only Icon Button</h4>
														</div>
														<div class="card-body">
															<p class="text-muted">
																Use the
																<code>.icon</code>
																class.
															</p>
															<div class="buttons">
																<a href="#" class="btn icon btn-primary"><i
																	class="bi bi-pencil"></i></a> <a href="#"
																	class="btn icon btn-secondary"><i
																	class="bi bi-person"></i></a> <a href="#"
																	class="btn icon btn-info"><i
																	class="bi bi-info-circle"></i></a> <a href="#"
																	class="btn icon btn-warning"><i
																	class="bi bi-exclamation-triangle"></i></a> <a href="#"
																	class="btn icon btn-danger"><i class="bi bi-x"></i></a>
																<a href="#" class="btn icon btn-success"><i
																	class="bi bi-check"></i></a> <a href="#"
																	class="btn icon btn-light"><i class="bi bi-star"></i></a>
																<a href="#" class="btn icon btn-dark"><i
																	class="bi bi-file"></i></a>
															</div>
															<p class="text-muted mt-2">Sizes.</p>
															<div class="buttons">
																<a href="#" class="btn icon btn-sm btn-warning"><i
																	class="bi bi-exclamation-triangle"></i></a> <a href="#"
																	class="btn icon btn-danger"><i class="bi bi-x"></i></a>
																<a href="#" class="btn icon btn-lg btn-success"><i
																	class="bi bi-check"></i></a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-md-6 col-lg-6">
													<div class="card">
														<div class="card-header">
															<h4>Button Group</h4>
														</div>
														<div class="card-body">
															<div class="btn-group mb-3" role="group"
																aria-label="Basic example">
																<button type="button" class="btn btn-secondary">Left</button>
																<button type="button" class="btn btn-secondary">Middle</button>
																<button type="button" class="btn btn-secondary">Right</button>
															</div>
															<div class="btn-group mb-3" role="group"
																aria-label="Basic example">
																<button type="button" class="btn btn-danger">Left</button>
																<button type="button" class="btn btn-warning">Middle</button>
																<button type="button" class="btn btn-success">Right</button>
															</div>
															<div class="btn-group mb-3 btn-group-sm" role="group"
																aria-label="Basic example">
																<button type="button" class="btn btn-danger">Left</button>
																<button type="button" class="btn btn-danger">Middle</button>
																<button type="button" class="btn btn-danger">Right</button>
															</div>
															<div class="clearfix"></div>
															<div class="btn-group btn-group-lg" role="group"
																aria-label="Basic example">
																<button type="button" class="btn">Left</button>
																<button type="button" class="btn btn-primary">Middle</button>
																<button type="button" class="btn">Right</button>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 col-md-6 col-lg-6">
													<div class="card">
														<div class="card-header">
															<h4>Vertical Variation</h4>
														</div>
														<div class="card-body">
															<div class="btn-group-vertical" role="group"
																aria-label="Basic example">
																<button type="button" class="btn btn-secondary">Left</button>
																<button type="button" class="btn btn-secondary">Middle</button>
																<button type="button" class="btn btn-secondary">Right</button>
																<button type="button" class="btn btn-secondary">Justify</button>
															</div>
														</div>
													</div>
												</div>
											</div>
								</section>
							</div>
							<hr />


							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-6 order-md-1 order-last">
											<h3>Dropdown</h3>
											<p class="text-subtitle text-muted">Multi-purpose
												dropdown component with tons of variations.</p>
										</div>
										<div class="col-12 col-md-6 order-md-2 order-first">
											<nav aria-label="breadcrumb"
												class="breadcrumb-header float-start float-lg-end">
												<ol class="breadcrumb">
													<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
													<li class="breadcrumb-item active" aria-current="page">Dropdown</li>
												</ol>
											</nav>
										</div>
									</div>
								</div>
								<section id="basic-dropdown">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Basic</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-primary dropdown-toggle me-1"
																	type="button" id="dropdownMenuButton"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Primary</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButton">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-secondary dropdown-toggle me-1"
																	type="button" id="dropdownMenuButtonSec"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Secondary</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButtonSec" style="">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-success dropdown-toggle me-1"
																	type="button" id="dropdownMenuButton2"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Success</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButton2">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-info dropdown-toggle me-1"
																	type="button" id="dropdownMenuButton3"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Info</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButton3">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-danger dropdown-toggle me-1"
																	type="button" id="dropdownMenuButton4"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Danger</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButton4">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-warning dropdown-toggle me-1"
																	type="button" id="dropdownMenuButton5"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Warning</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButton5">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
														<div class="btn-group mb-1">
															<div class="dropdown">
																<button class="btn btn-dark dropdown-toggle"
																	type="button" id="dropdownMenuButton7"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Dark</button>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuButton7">
																	<a class="dropdown-item" href="#">Option 1</a> <a
																		class="dropdown-item" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Basic Dropdown End -->


								<!-- Dropdown Direction Starts -->
								<section id="dropdown-directions">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Directions</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<p>
															Add
															<code>.dropdown-menu-end</code>
															to a
															<code>.dropdown-menu</code>
															to right align the dropdown menu. Trigger dropdown menus
															at the up / right / left of the elements by adding
															<code>.dropup | .dropright | .dropleft </code>
															to the parent element.
														</p>
														<div class="direction-dropdown-default mt-1">
															<div class="btn-group me-1 mb-1">
																<div class="dropdown">
																	<button type="button"
																		class="btn btn-secondary dropdown-toggle"
																		data-bs-toggle="dropdown" aria-haspopup="true"
																		aria-expanded="false">Drop bottom right</button>
																	<div class="dropdown-menu dropdown-menu-end">
																		<h6 class="dropdown-header">Header</h6>
																		<a class="dropdown-item active" href="#">Option 1</a>
																		<a class="dropdown-item disabled" href="#">Option
																			2</a> <a class="dropdown-item" href="#">Option 3</a>
																	</div>
																</div>
															</div>
															<div class="btn-group dropup me-1 mb-1">
																<button type="button"
																	class="btn btn-secondary dropdown-toggle"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Drop up</button>
																<div class="dropdown-menu">
																	<h6 class="dropdown-header">Header</h6>
																	<a class="dropdown-item active" href="#">Option 1</a> <a
																		class="dropdown-item disabled" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
															<div class="btn-group dropend me-1 mb-1">
																<button type="button"
																	class="btn btn-secondary dropdown-toggle"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Drop right</button>
																<div class="dropdown-menu">
																	<h6 class="dropdown-header">Header</h6>
																	<a class="dropdown-item active" href="#">Option 2</a> <a
																		class="dropdown-item disabled" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
															<div class="btn-group dropstart mb-1">
																<button type="button"
																	class="btn btn-secondary dropdown-toggle"
																	data-bs-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">Drop left</button>
																<div class="dropdown-menu">
																	<h6 class="dropdown-header">Header</h6>
																	<a class="dropdown-item active" href="#">Option 1</a> <a
																		class="dropdown-item disabled" href="#">Option 2</a> <a
																		class="dropdown-item" href="#">Option 3</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Dropdown Direction End -->

								<!-- Dropdown Sizes Starts -->
								<section id="dropdown-sizes">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Sizes</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<p>Button dropdowns work with buttons of all sizes,
															including default and split dropdown buttons.</p>
														<div class="row">
															<div class="col-md-6 col-sm-12">
																<div class="btn-group me-1 mb-1">
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-primary btn-lg dropdown-toggle"
																			data-bs-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false">Large</button>
																		<div class="dropdown-menu">
																			<a class="dropdown-item" href="#">Option 1</a> <a
																				class="dropdown-item" href="#">Option 2</a> <a
																				class="dropdown-item" href="#">Option 3</a>
																		</div>
																	</div>
																</div>
																<div class="btn-group me-1 mb-1">
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-primary dropdown-toggle"
																			data-bs-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false">Default</button>
																		<div class="dropdown-menu">
																			<a class="dropdown-item" href="#">Option 1</a> <a
																				class="dropdown-item" href="#">Option 2</a> <a
																				class="dropdown-item" href="#">Option 3</a>
																		</div>
																	</div>
																</div>
																<div class="btn-group mb-1">
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-primary btn-sm dropdown-toggle"
																			data-bs-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false">Small</button>
																		<div class="dropdown-menu">
																			<a class="dropdown-item" href="#">Option 1</a> <a
																				class="dropdown-item" href="#">Option 2</a> <a
																				class="dropdown-item" href="#">Option 3</a>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-md-6 col-sm-12">
																<div class="btn-group dropdown me-1 mb-1">
																	<button type="button" class="btn btn-primary btn-lg">
																		Large</button>
																	<button type="button"
																		class="btn btn-primary btn-lg dropdown-toggle dropdown-toggle-split"
																		data-bs-toggle="dropdown" aria-haspopup="true"
																		aria-expanded="false">
																		<span class="sr-only">Toggle Dropdown</span>
																	</button>
																	<div class="dropdown-menu">
																		<a class="dropdown-item" href="#">Option 1</a> <a
																			class="dropdown-item" href="#">Option 2</a> <a
																			class="dropdown-item" href="#">Option 3</a>
																	</div>
																</div>
																<div class="btn-group dropdown me-1 mb-1">
																	<button type="button" class="btn btn-primary">
																		Default</button>
																	<button type="button"
																		class="btn btn-primary dropdown-toggle dropdown-toggle-split"
																		data-bs-toggle="dropdown" aria-haspopup="true"
																		aria-expanded="false">
																		<span class="sr-only">Toggle Dropdown</span>
																	</button>
																	<div class="dropdown-menu">
																		<a class="dropdown-item" href="#">Option 1</a> <a
																			class="dropdown-item" href="#">Option 2</a> <a
																			class="dropdown-item" href="#">Option 3</a>
																	</div>
																</div>
																<div class="btn-group dropdown mb-1">
																	<button type="button" class="btn btn-primary btn-sm">
																		Small</button>
																	<button type="button"
																		class="btn btn-primary btn-sm dropdown-toggle dropdown-toggle-split"
																		data-bs-toggle="dropdown" aria-haspopup="true"
																		aria-expanded="false">
																		<span class="sr-only">Toggle Dropdown</span>
																	</button>
																	<div class="dropdown-menu">
																		<a class="dropdown-item" href="#">Option 1</a> <a
																			class="dropdown-item" href="#">Option 2</a> <a
																			class="dropdown-item" href="#">Option 3</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Dropdown Sizes Ends -->

								<!-- Dropdown options Starts -->
								<section id="dropdown-options">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Options</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<p>
															Use
															<code>data-offset</code>
															or
															<code>data-reference</code>
															attributes to change the location of the dropdown.
														</p>
														<div class="btn-group dropdown me-1 mb-1">
															<button type="button"
																class="btn btn-secondary dropdown-toggle"
																id="dropdownMenuOffset" data-bs-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false"
																data-offset="5,20">Offset</button>
															<div class="dropdown-menu"
																aria-labelledby="dropdownMenuOffset">
																<a class="dropdown-item" href="#">Action</a> <a
																	class="dropdown-item" href="#">Another action</a> <a
																	class="dropdown-item" href="#">Something else here</a>
															</div>
														</div>

														<div class="btn-group dropdown mb-1">
															<button type="button" class="btn btn-secondary">
																Reference</button>
															<button type="button"
																class="btn btn-secondary dropdown-toggle dropdown-toggle-split"
																id="dropdownMenuReference" data-bs-toggle="dropdown"
																aria-haspopup="true" aria-expanded="false"
																data-reference="parent">
																<span class="sr-only">Toggle Dropdown</span>
															</button>
															<div class="dropdown-menu"
																aria-labelledby="dropdownMenuReference">
																<a class="dropdown-item" href="#">Action</a> <a
																	class="dropdown-item" href="#">Another action</a> <a
																	class="dropdown-item" href="#">Something else here</a>
																<div class="dropdown-divider"></div>
																<a class="dropdown-item" href="#">Separated link</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Dropdown options Ends -->

								<!-- Dropdown variations Starts -->
								<section id="dropdown-variations">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Variations</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<p>
															To create a dropdown with groups you can use
															<c6de>.dropdown-header</c6de>
															for the header of groups and for separation of group you
															can use
															<code>.dropdown-divider</code>
															.
														</p>
														<p>
															To create a dropdown with icons use class
															<code>.dropdown-icon-wrapper</code>
															with
															<code>.dropdown</code>
															.
														</p>
														<div class="btn-group dropup me-1 mb-1">
															<button class="btn btn-primary dropdown-toggle"
																type="button" id="dropdownMenuButton902"
																data-bs-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">Groups</button>
															<div class="dropdown-menu"
																aria-labelledby="dropdownMenuButton902">
																<h6 class="dropdown-header">Group 1</h6>
																<a class="dropdown-item" href="#">Option 1</a> <a
																	class="dropdown-item" href="#">Option 2</a>
																<div class="dropdown-divider"></div>
																<h6 class="dropdown-header">Group 2</h6>
																<a class="dropdown-item" href="#">Option 1</a> <a
																	class="dropdown-item" href="#">Option 2</a>
																<div class="dropdown-divider"></div>
																<h6 class="dropdown-header">Group 3</h6>
																<a class="dropdown-item" href="#">Option 1</a> <a
																	class="dropdown-item" href="#">Option 2</a>
															</div>
														</div>
														<div
															class="btn-group dropup dropdown-icon-wrapper me-1 mb-1">
															<button type="button" class="btn btn-primary">Icons</button>
															<button type="button"
																class="btn btn-primary dropdown-toggle dropdown-toggle-split"
																data-bs-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">
																<i class="bi bi-wifi dropdown-icon"></i>
															</button>
															<div class="dropdown-menu">
																<span class="dropdown-item"> <i
																	class="bi bi-wifi-off"></i>
																</span> <span class="dropdown-item"> <i
																	class="bi bis-volume"></i>
																</span> <span class="dropdown-item"> <i
																	class="bi bis-volume-full"></i>
																</span> <span class="dropdown-item"> <i
																	class="bi bi-bell"></i>
																</span> <span class="dropdown-item"> <i
																	class="bi bi-bell-off"></i>
																</span> <span class="dropdown-item"> <i
																	class="bi bi-phone"></i>
																</span>
															</div>
														</div>
														<div class="btn-group dropup mb-1">
															<button type="button"
																class="btn btn-primary dropdown-toggle"
																data-bs-toggle="dropdown" aria-haspopup="true"
																aria-expanded="false">Form</button>
															<div class="dropdown-menu">
																<form class="px-2 py-2">
																	<div class="form-group">
																		<label for="exampleDropdownFormEmail1">Email
																			address</label> <input type="email" class="form-control"
																			id="exampleDropdownFormEmail1" placeholder="Email">
																	</div>
																	<div class="form-group">
																		<label for="exampleDropdownFormPassword1">Password</label>
																		<input type="password" class="form-control"
																			id="exampleDropdownFormPassword1"
																			placeholder="Password">
																	</div>
																	<div class="form-group">
																		<div class="checkbox">
																			<input type="checkbox" class="checkbox-input"
																				id="dropdownCheck1"> <label
																				for="dropdownCheck1">Remember me</label>
																		</div>
																	</div>
																	<button type="submit" class="btn btn-primary">
																		Sign in</button>
																</form>
																<div class="dropdown-divider"></div>
																<a class="dropdown-item" href="#">New around here?
																	Sign up</a> <a class="dropdown-item" href="#">Forgot
																	password?</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Dropdown variations Ends -->
							</div>
							<hr />


							<div class="col-md-12">
								<div class="card">
									<div class="card-header">
										<h4>Pagination with Icon</h4>
									</div>
									<div class="card-body">
										<p>Change prev and next button into icon</p>


									</div>
									<div class="">
										<nav aria-label="Page navigation">
											<ul class="pagination justify-content-center" id="pagination"></ul>
										</nav>
									</div>
								</div>
							</div>
							<hr />



							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-6 order-md-1 order-last">
											<h3>Input</h3>
											<p class="text-subtitle text-muted">Give textual form
												controls like input upgrade with custom styles, sizing,
												focus states, and more.</p>
										</div>
										<div class="col-12 col-md-6 order-md-2 order-first">
											<nav aria-label="breadcrumb"
												class="breadcrumb-header float-start float-lg-end">
												<ol class="breadcrumb">
													<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
													<li class="breadcrumb-item active" aria-current="page">Input</li>
												</ol>
											</nav>
										</div>
									</div>
								</div>
								<section class="section">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">Basic Inputs</h4>
										</div>

										<div class="card-body">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label for="basicInput">Basic Input</label> <input
															type="text" class="form-control" id="basicInput"
															placeholder="Enter email">
													</div>


												</div>
											</div>
										</div>
									</div>
								</section>


								<!-- Horizontal Input start -->
								<section id="horizontal-input">
									<div class="row">
										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Horizontal Input</h4>
												</div>

												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<p>
																To make label in center of form-control, use
																<code>.col-form-label</code>
																class with
																<code>&lt;label&gt;</code>
																element. This is default bootstrap class.
															</p>
														</div>
														<div class="col-md-6">
															<div class="form-group row align-items-center">
																<div class="col-lg-2 col-3">
																	<label class="col-form-label" for="first-name">First</label>
																</div>
																<div class="col-lg-10 col-9">
																	<input type="text" id="first-name" class="form-control"
																		name="fname" placeholder="First Name">
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group row align-items-center">
																<div class="col-lg-2 col-3">
																	<label class="col-form-label" for="last-name">Last</label>
																</div>
																<div class="col-lg-10 col-9">
																	<input type="text" id="last-name" class="form-control"
																		name="fname" placeholder="Last Name">
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Horizontal Input end -->

								<!-- Basic File Browser start -->
								<!-- 
								<section id="input-file-browser">
									<div class="row">
										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">File Input</h4>
												</div>

												<div class="card-body">
													<div class="row">
														<div class="col-lg-6 col-md-12">
															<div class="mb-3">
																<label for="formFile" class="form-label">Default
																	file input example</label> <input class="form-control"
																	type="file" id="formFile">
															</div>
															<div class="mb-3">
																<label for="formFileMultiple" class="form-label">Multiple
																	files input example</label> <input class="form-control"
																	type="file" id="formFileMultiple" multiple="">
															</div>

														</div>
													</div>
												</div>
											</div>
										</div>
								</section>
								 -->
								<!-- Basic File Browser end -->

								<!-- Input with Icons start -->
								<section id="input-with-icons">
									<div class="row match-height">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Input with Icons</h4>
												</div>

												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<p>
																For Input Box with icon use
																<code>.position-relative</code>
																class with
																<code>.form-group</code>
																and use class
																<code>.has-icon-left</code>
																or
																<code>.has-icon-right</code>
																class for icon on left side.
															</p>
														</div>
														<div class="col-sm-6">
															<h6>Left Icon</h6>
															<div class="form-group position-relative has-icon-left">
																<input type="text" class="form-control is-invalid"
																	placeholder="Input with icon left">
																<div class="form-control-icon">
																	<i class="bi bi-person"></i>
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Input with Icons end -->

								<!-- Input Sizing start -->
								<section id="input-sizing">
									<div class="row match-height">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Control Sizing Option</h4>
												</div>

												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<p>
																For different sizes of Input, Use classes like
																<code>.form-control-lg</code>
																&amp;
																<code>.form-control-sm</code>
																for Large, Small input box.
															</p>
														</div>
														<div class="col-sm-4">
															<h6>Large(로그인 등 특수한 경우만)</h6>
															<input class="form-control form-control-lg" type="text"
																placeholder="Large Input">
														</div>
														<div class="col-sm-4">
															<h6>Default(일반)</h6>
															<input class="form-control" type="text"
																placeholder="Default Input">
														</div>
														<div class="col-sm-4">
															<h6>Small(모달 등 꼭 작아야 할 경우만)</h6>
															<input class="form-control form-control-sm" type="text"
																placeholder="Small Input">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Input Sizing end -->

								<!-- validations start -->
								<section id="input-validation">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Input Validation States (유효성검사
														라이브러리 Parsley사용시)</h4>
												</div>

												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<p>
																You can indicate invalid and valid form fields with
																<code>.is-invalid</code>
																and
																<code>.is-valid</code>
																. Note that
																<code>.invalid-feedback</code>
																is also supported with these classes.
															</p>
														</div>
														<div class="col-sm-6">
															<label for="valid-state">Valid State</label> <input
																type="text" class="form-control is-valid"
																id="valid-state" placeholder="Valid" value="Valid"
																required="">
															<div class="valid-feedback">
																<i class="bx bx-radio-circle"></i> This is valid state.
															</div>
														</div>
														<div class="col-sm-6">
															<label for="invalid-state">Invalid State</label> <input
																type="text" class="form-control is-invalid"
																id="invalid-state" placeholder="Invalid" value="Invalid"
																required="">
															<div class="invalid-feedback">
																<i class="bx bx-radio-circle"></i> This is invalid
																state.
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- validations end -->

							</div>
							<hr />




							<div class="page-heading">
								<div class="page-title">
									<div class="row">
										<div class="col-12 col-md-6 order-md-1 order-last">
											<h3>Select</h3>
											<p class="text-subtitle text-muted">Customize the native
												&laquo;select&raquo; with custom CSS that changes the
												elementâs initial appearance.</p>
										</div>
										<div class="col-12 col-md-6 order-md-2 order-first">
											<nav aria-label="breadcrumb"
												class="breadcrumb-header float-start float-lg-end">
												<ol class="breadcrumb">
													<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
													<li class="breadcrumb-item active" aria-current="page">Select</li>
												</ol>
											</nav>
										</div>
									</div>
								</div>

								<section class="bootstrap-select">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Bootstrap Select</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<div class="row">
															<div class="col-md-6 mb-4">
																<h6>Basic Select</h6>
																<p>
																	Use
																	<code>.form-select</code>
																	class for basic select control.
																</p>
																<fieldset class="form-group">
																	<select class="form-select" id="basicSelect">
																		<option>IT</option>
																		<option>Blade Runner</option>
																		<option>Thor Ragnarok</option>
																	</select>
																</fieldset>
															</div>


														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Bootstrap Select end -->



								<!-- Basic choices start -->
								<section class="basic-choices">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Choices</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<div class="row">
															<div class="col-md-12">
																<div class="alert alert-light-primary">
																	<a href="https://github.com/Choices-js/Choices"
																		target="_blank">Click here</a> for more information
																</div>
															</div>
															<div class="col-md-6 mb-4">
																<h6>Basic Choices</h6>
																<p>
																	Use
																	<code>.choices</code>
																	class for basic choices control.
																</p>
																<div class="form-group">
																	<select class="choices form-select">
																		<option value="square">Square</option>
																		<option value="rectangle">Rectangle</option>
																		<option value="rombo">Rombo</option>
																		<option value="romboid">Romboid</option>
																		<option value="trapeze">Trapeze</option>
																		<option value="traible">Triangle</option>
																		<option value="polygon">Polygon</option>
																	</select>
																</div>
															</div>


														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Basic choices end -->

								<!-- Multiple choices start -->
								<section class="multiple-choices">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title">Multiple choices</h4>
												</div>
												<div class="card-content">
													<div class="card-body">
														<div class="row">


															<div class="col-md-6 mb-4">
																<h6>Multiple Select with Remove Button</h6>
																<p>
																	Use
																	<code>.multiple-remove</code>
																	attribute for multiple select box with remove button.
																</p>
																<div class="form-group">
																	<select class="choices form-select multiple-remove"
																		multiple="multiple">
																		<optgroup label="Figures">
																			<option value="romboid">Romboid</option>
																			<option value="trapeze" selected>Trapeze</option>
																			<option value="triangle">Triangle</option>
																			<option value="polygon">Polygon</option>
																		</optgroup>
																		<optgroup label="Colors">
																			<option value="red">Red</option>
																			<option value="green">Green</option>
																			<option value="blue" selected>Blue</option>
																			<option value="purple">Purple</option>
																		</optgroup>
																	</select>
																</div>
															</div>


														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</section>
								<!-- Multiple choices end -->
							</div>


						</div>
						<hr />




						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>Radio</h3>
										<p class="text-subtitle text-muted">Choose one from a list
											with radio buttons.</p>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
												<li class="breadcrumb-item active" aria-current="page">Radio</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>

							<section class="section">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Default Radio</h4>
											</div>
											<div class="card-body">
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="flexRadioDefault" id="flexRadioDefault1"> <label
														class="form-check-label" for="flexRadioDefault1">
														Default radio </label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="flexRadioDefault" id="flexRadioDefault2" checked="">
													<label class="form-check-label" for="flexRadioDefault2">
														Default checked radio </label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="flexRadioDisabled" id="flexRadioDisabled"
														disabled=""> <label class="form-check-label"
														for="flexRadioDisabled"> Disabled radio </label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio"
														name="flexRadioDisabled" id="flexRadioCheckedDisabled"
														checked="" disabled=""> <label
														class="form-check-label" for="flexRadioCheckedDisabled">
														Disabled checked radio </label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>

							<section class="section">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Switches</h4>
											</div>
											<div class="card-body">
												<p>
													A switch has the markup of a custom checkbox but uses the
													<code>.form-switch</code>
													class to render a toggle switch. Switches also support the
													disabled attribute.
												</p>
												<div class="form-check form-switch">
													<input class="form-check-input" type="checkbox"
														id="flexSwitchCheckDefault"> <label
														class="form-check-label" for="flexSwitchCheckDefault">Default
														switch checkbox input</label>
												</div>
												<div class="form-check form-switch">
													<input class="form-check-input" type="checkbox"
														id="flexSwitchCheckChecked" checked=""> <label
														class="form-check-label" for="flexSwitchCheckChecked">Checked
														switch checkbox input</label>
												</div>
												<div class="form-check form-switch">
													<input class="form-check-input" type="checkbox"
														id="flexSwitchCheckDisabled" disabled=""> <label
														class="form-check-label" for="flexSwitchCheckDisabled">Disabled
														switch checkbox input</label>
												</div>
												<div class="form-check form-switch">
													<input class="form-check-input" type="checkbox"
														id="flexSwitchCheckCheckedDisabled" checked="" disabled="">
													<label class="form-check-label"
														for="flexSwitchCheckCheckedDisabled">Disabled
														checked switch checkbox input</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>

						</div>
						<hr />



						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>Checkbox</h3>
										<p class="text-subtitle text-muted">For users to check
											their lists.</p>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
												<li class="breadcrumb-item active" aria-current="page">Checkbox</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>

							<section id="basic-checkbox">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Basic Checkboxes</h4>
											</div>
											<div class="card-content">
												<div class="card-body">
													<ul class="list-unstyled mb-0">
														<li class="d-inline-block me-2 mb-1">
															<div class="form-check">
																<div class="checkbox">
																	<input type="checkbox" id="checkbox1"
																		class="form-check-input" checked=""> <label
																		for="checkbox1">Touch me!</label>
																</div>
															</div>
														</li>
														<li class="d-inline-block me-2 mb-1">
															<div class="form-check">
																<div class="checkbox">
																	<input type="checkbox" class="form-check-input"
																		id="checkbox2"> <label for="checkbox2">Touch
																		me!</label>
																</div>
															</div>
														</li>
														<li class="d-inline-block me-2 mb-1">
															<div class="form-check">
																<div class="checkbox">
																	<input type="checkbox" id="checkbox3"
																		class="form-check-input" disabled="" checked="">
																	<label for="checkbox3">Disabled Checked
																		Checkbox</label>
																</div>
															</div>
														</li>
														<li class="d-inline-block mb-1">
															<div class="form-check">
																<div class="checkbox">
																	<input type="checkbox" id="checkbox4"
																		class="form-check-input" disabled=""> <label
																		for="checkbox4">Disabled Unchecked Checkbox</label>
																</div>
															</div>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- Basic Checkbox end -->


							<!-- Checkbox Sizes start -->
							<section id="checkbox-sizes">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Checkboxes Sizes</h4>
											</div>
											<div class="card-content">
												<div class="card-body">
													<p>
														To add a checkBox with different sizes, we have the
														<code>.form-check-sm</code>
														class for small Checkboxes. Add it alongwith
														<code>.form-check</code>
														class.
													</p>
													<ul class="list-unstyled mb-0">
														<li class="d-inline-block mb-1 me-2">
															<div class="form-check form-check-sm">
																<div class="custom-control custom-checkbox">
																	<input type="checkbox"
																		class="form-check-input form-check-primary form-check-glow"
																		checked="" name="customCheck" id="checkboxSize1">
																	<label class="form-check-label" for="checkboxSize1">Small</label>
																</div>
															</div>
														</li>
														<li class="d-inline-block mb-1 me-2">
															<div class="form-check">
																<input type="checkbox"
																	class="form-check-input form-check-primary form-check-glow"
																	checked="" name="customCheck" id="checkboxSize2">
																<label class="form-check-label" for="checkboxSize2">Default</label>
															</div>
														</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- Checkbox Sizes end -->
						</div>
						<hr />







						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 order-md-1 order-last">
										<div class="card">
											<h3>table</h3>
											<table>
												<colgroup>
													<col />
													<col width="50%" />
													<col />
													<col />
													<col />
												</colgroup>
												<thead>
													<tr>
														<th>신청회원</th>
														<th class="align-l">제목</th>
														<th>성별</th>
														<th>신청일자</th>
														<th>신청처리</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>김열무</td>
														<td class="align-l elipsis">긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴
															제목은 왼쪽정렬 긴 제목은 왼쪽정렬 긴 제목은 왼쪽정렬</td>
														<td>남</td>
														<td>2024.11.20</td>
														<td>승인</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr />





						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>File Uploader</h3>
										<p class="text-subtitle text-muted">Javascript enhanced
											uploaders for easier file handling.</p>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
												<li class="breadcrumb-item active" aria-current="page">File
													Uploader</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
							<section class="section">
								<div class="row">
									<div class="col-12 col-md-12">
										<div class="card">
											<div class="card-header">
												<h5 class="card-title">Basic File Uploader</h5>
											</div>
											<div class="card-content">
												<div class="card-body">
													<p class="card-text">
														Using the basic file uploader up, upload here to see how
														<code>.basic-filepond</code>
														look.
													</p>
													<!-- Basic file uploader -->
													<input type="file" class="basic-filepond">
												</div>
											</div>
										</div>
									</div>

									<div class="col-12 col-md-12">
										<div class="card">
											<div class="card-header">
												<h5 class="card-title">Multiple Files</h5>
											</div>
											<div class="card-content">
												<div class="card-body">
													<p class="card-text">
														Using the basic table up, upload here to see how
														<code>.multiple-files-filepond</code>
														-based basic file uploader look. You can use
														<code>allowMultiple</code>
														or
														<code>multiple</code>
														attribute too to implement multiple upload.
													</p>
													<!-- File uploader with multiple files upload -->
													<input type="file" class="multiple-files-filepond" multiple>
												</div>
											</div>
										</div>
									</div>
									<div class="col-12 col-md-12">
										<div class="card">
											<div class="card-header">
												<h5 class="card-title">With Validation (파일 max 사이즈 설정)</h5>
											</div>
											<div class="card-content">
												<div class="card-body">
													<p class="card-text">
														Using the basic table up, upload here to see how
														<code>.with-validation-filepond</code>
														-based basic file uploader look. You can use <a
															href="https://pqina.nl/filepond/docs/patterns/plugins/file-validate-size/#properties"
															target="_blank">see here</a> or
														<code>required (to make your input required),
															data-max-file-size (to limit your input file size),
															data-max-files (to limit your uploaded files), etc (start
															with data-)</code>
														attribute too to implement validation.
													</p>
													<!-- File uploader with validation -->
													<input type="file" class="with-validation-filepond"
														required multiple data-max-file-size="1MB"
														data-max-files="3">
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<hr />






						<div class="page-heading">
							<div class="page-title">
								<div class="row">
									<div class="col-12 col-md-6 order-md-1 order-last">
										<h3>별점 Rating.js</h3>
										<p class="text-subtitle text-muted">
											Rating with <a href="">rater-js</a> - a pure javascript
											rating library.
										</p>
									</div>
									<div class="col-12 col-md-6 order-md-2 order-first">
										<nav aria-label="breadcrumb"
											class="breadcrumb-header float-start float-lg-end">
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
												<li class="breadcrumb-item active" aria-current="page">Rating</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
							<section class="section">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">Basic Rating</h4>
											</div>
											<div class="card-body">
												<div id="basic"></div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<section class="section">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">5 Star Rating with Step</h4>
											</div>
											<div class="card-body">
												<div id="step"></div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<hr />

					</div>
			</div> <!-- 여기까지 삭제하고 별도 콘텐츠 작성 -->

			</section>
		</div>

	</div>
	</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>

<!-- Need: Apexcharts(차트) -->
<script src="/resources/assets/extensions/apexcharts/apexcharts.min.js"></script>
<script src="/resources/assets/static/js/pages/dashboard.js"></script>

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

<!-- rating.js(별점)  -->
<script src="/resources/assets/extensions/rater-js/index.js?v=2"></script>
<script src="/resources/assets/static/js/pages/rater-js.js"></script>

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
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

	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		layerPopup("두번째", "체크", false, secondBtn1Act, secondBtn2Act);
	}

	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}

	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}

	$('.btn-popup').on(
			'click',
			function() {
				layerPopup('~~~하시겠습니까?222', '확인2', '취소2', secondBtn1Act,
						secondBtn2Act);
			});

	/* 모달(임시) */
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
</script>

</html>