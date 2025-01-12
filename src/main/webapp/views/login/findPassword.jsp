<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

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
	
	#emailMessage{
		display: none;
		font-size: 12px;
		color: red;
		margin-top: -5px;
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
							<input type="hidden" name="idx" value=""/>
							<input type="hidden" name="type" value="pw"/>
							<div class="form-group position-relative has-icon-left">
								<p class="textLayout">아이디</p>
								<input type="text" name="username" class="form-control" placeholder="아이디를 입력하세요"  id="findIdUserName"/>
								<div class="form-control-icon">
									<i class="bi bi-person"></i>
								</div>
							</div>
							<div class="form-group position-relative has-icon-left">
								<p class="textLayout">이름</p>
								<input type="text" name="name" class="form-control" placeholder="이름을 입력하세요"  id="findIdName"/>
								<div class="form-control-icon">
									<i class="bi bi-justify"></i>
								</div>
							</div>
							<div>
							</div>
							<div class="form-group position-relative has-icon-left">
								<p class="textLayout">이메일</p>
								<div class="input-wrapper">
									<input type="email" name="email" class="form-control" placeholder="이메일을 입력하세요"  id="findIdEmail"/>
									<button class="btn btn-sm btn-outline-primary" onclick="certificationSubmit()" id="certificationBtn">인증</button>
								</div>
								<div class="form-control-icon">
									<i class="bi bi-envelope"></i>
								</div>
							</div>
							<div id="emailMessage">※ 잘못된 이메일 형식입니다. 다시 확인해주세요.</div>
							<div class="form-group position-relative has-icon-left" id="certificationChackBox" style="display: none">
								<p class="textLayout">인증번호</p>
								<div class="input-wrapper">
									<input type="text" name="certification" class="form-control" placeholder="인증번호를 입력하세요" id="certificationCode"/>
									<span id="timeChack">0:00</span>
								</div>
								<div class="form-control-icon">
									<i class="bi bi-person-fill-lock"></i>
								</div>
							</div>
							<div>
								<button class="btn btn-lg btn-primary disabled" type="button" id="findIdBtn" onclick="findUserInfo()">비밀번호 변경</button>
							</div>
							<div>
								<a href="/findUserId">아이디 찾기</a> | <a href="/">로그인</a>
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
<script src='/resources/js/user.js'></script>
<script>




</script>

</html>