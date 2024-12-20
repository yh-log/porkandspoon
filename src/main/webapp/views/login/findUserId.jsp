<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<style>
    .login-container {
        background: #ffffff;
        width: 500px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 40px 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }
    
    p.findText{
    	margin-bottom: 2px;
    	font-size: 13px; 
    	text-align: center;
    }
    
    p.textLayout{
    	align-self: flex-start;
    	margin-bottom: 2px;
    	margin-left: 2px;
    	font-size: 15px;
    }
    
    input::placeholder{
    	font-size: 14px;
    }
    
    a{
    	font-size: 14px;
    }
    .form-group .form-control-icon{
    	top: 50%;
   		transform: translateY(calc(-50% + 11px));
    }
	
	div > .btn.btn-lg.btn-primary{
	   width: 16rem;
	}
	
	.logo-section {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        margin-top: 0px;
    }
    
    .form-group .btn.btn-sm.btn-outline-primary{
    	position: absolute;
    }
    
	.input-wrapper {
	    position: relative; /* 부모 요소 기준으로 버튼 배치 */
	    display: flex; /* 가로 정렬 */
	    align-items: center;
	}
	
	.input-wrapper .form-control {
	    flex: 1; /* 남은 공간을 차지 */
	}
	
	.form-group.position-relative.has-icon-left .btn.btn-sm.btn-outline-primary {
	    position: absolute; /* 부모 요소 내 절대 위치 */
	    right: -25%; /* 입력 필드 오른쪽 끝에서 10px 떨어짐 */
	    top: 50%; /* 세로 중앙 정렬 */
	    transform: translateY(-50%);
	    height: calc(100% - 4px); /* 버튼 높이를 입력 필드와 일치 */
	    margin: 0px;
	}
	#timeChack{
		font-size: 12px;
		color: red;
		margin-left: 15px;
		width: 35px;
	}
	#certificationChackBox{
		left: 22px;
	}
	
</style>


</head>

<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">
		<div id="main">
			<div class="page-content">
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="login-container"> 
							<div class="row">
								<div class="logo-section">
									<img src="/resources/img/logo.jpg" width="130px" /> 
								</div>
							</div>
							<div style="margin-bottom: 10px;">
								<p class="text-subtitle text-muted findText">등록하신 이메일 주소로 인증 번호를 발송해 드립니다.</p>
								<p class="text-subtitle text-muted findText">직원 등록 시 입력한 정확한 이메일 주소를 입력해주세요.</p>
							</div>
							<div class="form-group position-relative has-icon-left">
								<p class="textLayout">이름</p>
								<input type="text" name="name" class="form-control" placeholder="이름을 입력하세요"/>
								<div class="form-control-icon">
									<i class="bi bi-justify"></i>
								</div>
							</div>
							<div>
							</div>
							<div class="form-group position-relative has-icon-left">
								<p class="textLayout">이메일</p>
								<div class="input-wrapper">
									<input type="email" name="email" class="form-control" placeholder="이메일을 입력하세요"/>
									<button class="btn btn-sm btn-outline-primary" onclick="findUserId()" id="certificationBtn">인증</button>
								</div>
								<div class="form-control-icon">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
							<div class="form-group position-relative has-icon-left" id="certificationChackBox" style="display: none">
								<p class="textLayout">인증번호</p>
								<div class="input-wrapper">
									<input type="text" name="certification" class="form-control" placeholder="인증번호를 입력하세요"/>
									<span id="timeChack">0:00</span>
								</div>
								<div class="form-control-icon">
									<i class="bi bi-person-fill-lock"></i>
								</div>
							</div>
							<div>
								<button class="btn btn-lg btn-primary disabled" id="findIdBtn">아이디 찾기</button>
							</div>
							<div>
								<a href="#">비밀번호 찾기</a> | <a href="#">로그인</a>
							</div>
							<div style="margin-top: 10px;">
								<p class="text-subtitle text-muted findText">*이용 시 불편한 점이나 궁금한 사항이 있으시면 </p>
								<p class="text-subtitle text-muted findText">담당자(Tel : 02-6209-4259 / E-mail : hy2@gmail.com) 에게 문의해 주시기 바랍니다.</p>
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

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
	
<script src='/resources/js/common.js'></script>
<script>

	var time; // 2분
	
	function formatTime(seconds){
		var minutes = Math.floor(seconds/60); // 분 계산 
		var secs = seconds % 60; // 초 계산 (초를 60으로 나눈 나머지)
		
		
		return minutes + ' : ' + secs;
		
	};

	function findUserId(){
		time = 120;
		var params = {'name' : $('input[name="name"]').val(), 'email' : $('input[name="email"]').val()};
		
		$('#certificationChackBox').show();
		document.getElementById('findIdBtn').classList.remove('disabled');
		document.getElementById('certificationBtn').classList.add('disabled');
		
		var showTime = document.getElementById('timeChack');
		
		var count = setInterval(() => {
			
			time--;
			
			showTime.innerHTML = formatTime(time);
			
			if(time == 0){
				clearInterval(count);
				document.getElementById('findIdBtn').classList.add('disabled');
				document.getElementById('certificationBtn').classList.remove('disabled');
				
			}
		}, 100)
	}
		



</script>

</html>