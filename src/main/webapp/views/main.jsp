<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="/resources/js/common.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">
	
	<link rel="stylesheet" href="/resources/css/common.css">

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
            <button type="submit" class="login-button" id="loginBtn">로그인하세요.</button>
        </form>
        <c:if test="${param.error == 'true'}">
            <p class="error-message">아이디/비밀번호를 확인하세요.</p>
        </c:if>
    </div>
    <div class="">
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center" id="pagination"></ul>
		</nav>
	</div>

</body>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
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
	
	var data = {
			  "option" : "optTest",
			  "search": "example",
			}
	pageCall(2, 15, '/pageListCall', data);
	
	function pringList(response){
		console.log(response);
	}
</script>
</html>
