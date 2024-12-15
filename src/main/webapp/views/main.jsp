<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/ajax.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background-color: #F4F4F4;
        font-family: Arial, sans-serif;
    }

    a {
        text-decoration: none;
        color: black;
    }

    .login-container {
        background: #ffffff;
        width: 500px;
        height: 380px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }

    .logo-section {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        margin-top: -20px;
    }

    .logo-section img {
        margin-right: 10px;
    }

    .logo-section span {
        font-size: 30px;
        font-weight: bold;
        color: #333;
    }

    .form-group {
        display: flex;
        align-items: center;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 8px; /* 높이를 줄이기 위해 패딩 조정 */
        margin: 10px 0;
        background-color: #fff; /* 입력 필드 배경색 */
        transition: border-color 0.3s ease, box-shadow 0.3s ease; /* 부드러운 전환 효과 */
    }

	.login-form{
		width: 70%
	}


    .form-group input {
        border: none;
        outline: none;
        flex: 1;
        padding: 5px; /* 높이를 줄이기 위해 패딩 조정 */
        font-size: 14px;
        background: transparent;
        color: #333;
    }

    .form-group input:focus {
        border: none; /* 기본 테두리 제거 */
        outline: none;
    }
    
    .login-form input::placeholder {
	    font-size: 12px; /* 텍스트 크기를 줄임 */
	    color: #aaa; /* 연한 회색으로 설정 */
	}

    .form-group:focus-within {
        border-color: #007BFF; /* 클릭 시 테두리를 파란색으로 변경 */
        box-shadow: 0 0 4px rgba(0, 123, 255, 0.5); /* 부드러운 강조 효과 */
    }

    .form-group .icon {
        margin-right: 10px;
        font-size: 18px;
        color: #aaa;
    }

    .login-options {
        display: flex;
        align-items: center;
        justify-content: space-between;
        font-size: 13px;
        margin-top: 10px;
        width: 100%;
    }

    .checkbox-group {
        display: flex;
        align-items: center;
    }

    .checkbox-group input[type="checkbox"] {
        margin-right: 5px;
    }

    .login-button {
        width: 100%;
        padding: 10px;
        background-color: #4B72E3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 25px;
        font-size: 16px;
    }

    .login-button:hover {
        background-color: #3D64D6;
    }

    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 10px;
    }
</style>

</head>
<body>

    <div class="login-container">
        <div class="logo-section">
            <img src="/resources/img/google.png" width="80px" />
            <span>P&amp;S</span>
        </div>
        <form class="login-form" action="<c:url value='/login' />" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div class="form-group">
                <span class="icon">
                    <i class="bi bi-person"></i>
                </span>
                <input type="text" name="username" placeholder="Username" />
            </div>
            <div class="form-group">
                <span class="icon">
                    <i class="bi bi-shield-lock"></i>
                </span>
                <input type="password" name="password" placeholder="Password" />
            </div>
            <div class="login-options">
                <div class="checkbox-group">
                    <input type="checkbox" id="rememberId" />
                    <label for="rememberId">아이디 저장</label>
                </div>
                <a href="#">아이디/비밀번호 찾기</a>
            </div>
            <button type="submit" class="login-button" id="loginBtn">로그인</button>
        </form>
        <c:if test="${param.error == 'true'}">
            <p class="error-message">아이디/비밀번호를 확인하세요.</p>
        </c:if>
    </div>

</body>
<script>
	$(document).ready(function () {
	    // 로컬 스토리지에서 아이디를 가져옴
	    var storedId = localStorage.getItem("username");
	
	    // 저장된 아이디가 있다면 아이디 필드에 값 입력 및 체크박스 체크
	    if (storedId) {
	        $("input[name='username']").val(storedId);
	        $("#rememberId").prop("checked", true);
	    }
	
	    // 로그인 버튼 클릭 시
	    $("#loginBtn").click(function () {
	        if ($("#rememberId").is(":checked")) { // 체크박스 체크 시
	            localStorage.setItem("username", $("input[name='username']").val()); // 로컬 스토리지에 저장
	        } else {
	            localStorage.removeItem("username"); // 로컬 스토리지에서 제거
	        }
	        document.form.submit(); // 폼 제출
	    });
	});

</script>
</html>
