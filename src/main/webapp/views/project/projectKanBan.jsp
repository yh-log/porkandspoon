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


<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
#home,#schedule{
		width: 200px;
	}

	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 230px;
	}

	.tit-area{
		display: flex; 
	}
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.card-body{
		display: flex;	
	}
	#flexRadioDefault2{
		margin-left: 20px;
	}
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
	}
	
	.content{
		display: flex; 
		align-content: cetner;
		border: 1px solid black;
	}
	buttons{
		align-content: cetner;
	}
	.art{
		height: 280px;
	}
	.align-l{
		width: 300px;
		text-align: center
	}
	#btn-gap{
		display: flex;
		gap: 30px;
		align-items: center;
		justify-content: center;
	}
	.short{
		width: 200px;
	}
	#start_date{
		margin-left: 800px;
	}
	.list-form{
		border: 1px solid #E4E6E8;
		border-radius: 6px;
		padding: 10px;
		width: 49%;
    	margin-top: 20px;
    	display: flex;
    	justify-content: space-between;
    	height: 250px;
	}
	.list-row{
		display: flex;
		justify-content: space-between;
    	flex-wrap: wrap;
	}
	.update{
		display: flex;
    	flex-direction: column;
    	justify-content: space-between;
    	align-items: flex-end;
	}
	p{
		margin-bottom: 0px;
	}
	#first{
		margin-top: 88px;
	}
	#bar{
		margin-top: 10px;
	}
		.container {
  display: flex;
  justify-content: space-between; /* 각 칸을 동일한 간격으로 나눔 */
  gap: 20px; /* 각 칸 사이의 간격 */
}

.column {
  flex: 1; /* 각 칸을 동일한 너비로 설정 */
  padding: 20px;
  background-color: #f7f7f7; /* 임시 배경색 */
  border-radius: 10px; /* 모서리를 둥글게 */
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}
.grid-container {
  display: grid;
  grid-template-columns: repeat(3, 1fr); /* 3등분 */
  gap: 20px; /* 각 칸 사이의 간격 */
}

.grid-item {
  padding: 20px;
  background-color: #f7f7f7; /* 임시 배경색 */
  border-radius: 10px; /* 모서리를 둥글게 */
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
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
					<h4 class="menu-title">프로젝트</h4>
					<ul>
						<li class="active"><a href="/ad/project/List">프로젝트 리스트</a></li>
						<li><a href="/ad/project/Write">프로젝트 등록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>프로젝트 리스트</h5>
						</div>
						<div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                  <div class="container">
					  <div class="column">처리 전</div>
					  <div class="column">진행 중</div>
					  <div class="column">완료</div>
				</div>
                  <div class="grid-container">
				  <div class="grid-item">처리 전</div>
				  <div class="grid-item">진행 중</div>
				  <div class="grid-item">완료</div>
				</div>
                  <div class="row list-row">
                  		<div class="list-form">
	                  		<div>
	                  			<h4 onclick="location.href='/ad/education/Update'">황금돼지를 잡아라!</h4>
	                  			<p id="first">참여인원 : </p>
	                  			<p>일정 : </p>
	                  			<p>진행률 </p>
								<div id="bar" style="width: 260%; background-color: #fff; border: 1px solid var(--bs-primary);">
							    <div style="width: 75%; background-color: var(--bs-primary); color: white; text-align: center;">
							        75%
							    </div>
							</div>
                  			</div>
                  			<div class="update">
	                  			<div><i class="bi bi-trash" ></i></div>
	                  			<button class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</button>
                  			</div>
                  		</div>
                  		<div class="list-form">
	                  		<div>
	                  			<h4>황금돼지를 잡아라!</h4>
	                  			<p id="first">참여인원 : </p>
	                  			<p>일정 : </p>
	                  			<p>진행률 </p>
								<div id="bar" style="width: 260%; background-color: #fff; border: 1px solid var(--bs-primary);">
							    <div style="width: 75%; background-color: var(--bs-primary); color: white; text-align: center;">
							        75%
							    </div>
							</div>
                  			</div>
                  			<div class="update">
	                  			<div><i class="bi bi-trash" ></i></div>
	                  			<button class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</button>
                  			</div>
                  		</div>
                  		
                  		
                  		
                  		<div class="list-form">
	                  		<div>
	                  			<h4 >황금돼지를 잡아라!</h4>
	                  			<p id="first">참여인원 : </p>
	                  			<p>일정 : </p>
	                  			<p>진행률 </p>
								<div id="bar" style="width: 260%; background-color: #fff; border: 1px solid var(--bs-primary);">
							    <div style="width: 75%; background-color: var(--bs-primary); color: white; text-align: center;">
							        75%
							    </div>
							</div>
                  			</div>
                  			<div class="update">
	                  			<div><i class="bi bi-trash" ></i></div>
	                  			<button class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</button>
                  			</div>
                  		</div>
                  		<div class="list-form">
	                  		<div>
	                  			<h4>황금돼지를 잡아라!</h4>
	                  			<p id="first">참여인원 : </p>
	                  			<p>일정 : </p>
	                  			<p>진행률 </p>
								<div id="bar" style="width: 260%; background-color: #fff; border: 1px solid var(--bs-primary);">
							    <div style="width: 75%; background-color: var(--bs-primary); color: white; text-align: center;">
							        75%
							    </div>
							</div>
                  			</div>
                  			<div class="update">
	                  			<div><i class="bi bi-trash" ></i></div>
	                  			<button class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</button>
                  			</div>
                  		</div>
                  		<div class="list-form">
	                  		<div>
	                  			<h4 >황금돼지를 잡아라!</h4>
	                  			<p id="first">참여인원 : </p>
	                  			<p>일정 : </p>
	                  			<p>진행률 </p>
								<div id="bar" style="width: 260%; background-color: #fff; border: 1px solid var(--bs-primary);">
							    <div style="width: 75%; background-color: var(--bs-primary); color: white; text-align: center;">
							        75%
							    </div>
							</div>
                  			</div>
                  			<div class="update">
	                  			<div><i class="bi bi-trash" ></i></div>
	                  			<button class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</button>
                  			</div>
                  		</div>
                  		<div class="list-form">
	                  		<div>
	                  			<h4>황금돼지를 잡아라!</h4>
	                  			<p id="first">참여인원 : </p>
	                  			<p>일정 : </p>
	                  			<p>진행률 </p>
								<div id="bar" style="width: 260%; background-color: #fff; border: 1px solid var(--bs-primary);">
							    <div style="width: 75%; background-color: var(--bs-primary); color: white; text-align: center;">
							        75%
							    </div>
							</div>
                  			</div>
                  			<div class="update">
	                  			<div><i class="bi bi-trash" ></i></div>
	                  			<button class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</button>
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
	
	
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		layerPopup("결제방법", "결제하기", "취소", secondBtn1Act, secondBtn2Act);
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
		layerPopup("QR", "결제하기", "취소", thirdBtn1Act, thirdBtn2Act);
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
		
	}
	
	function thirdBtn1Act(){
		console.log('세번째 팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function thirdBtn2Act(){
		console.log('세번째 팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}


</script>

</html>