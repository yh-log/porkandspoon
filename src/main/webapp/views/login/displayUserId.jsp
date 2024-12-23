<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/css/common.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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

    p.findText {
        margin-bottom: 2px;
        font-size: 13px; 
        text-align: center;
    }

    a {
        font-size: 14px;
    }

    .logo-section {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    
    #usernameResult {
		background-color : #fff;
	 	justify-items: center;
    	align-content: center;
    	font-weight: 700;
    	font-size: 18px;
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
								<p class="text-subtitle text-muted findText">입력된 정보와 일치하는 아이디입니다.</p>
							</div>
							<div class="form-group position-relative">
								<input type="text" name="name" class="form-control" value="${username}" disabled="disabled" id="usernameResult"/>
							</div>
							<div>
								<a href="/findPassword">비밀번호 찾기</a> | <a href="/">로그인</a>
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

<!-- 페이지네이션 -->
<script src='/resources/js/common.js'></script>
<script>
	
</script>
</html>