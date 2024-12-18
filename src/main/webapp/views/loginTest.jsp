<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h2>로그인 성공 ★</h2>
	
	<form method="post" action="/logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	    <button type="submit">Logout</button>
	</form>
	
	<a href="/sa/saTest">super admin</a> <br/>
	<a href="/a/aTest">admin</a> <br/>
	<a href="/m/mTest">manager</a> <br/>
	<a href="/u/uTest">user (text page)</a> <br/>
	<!-- <a href="/chart">chart</a> -->
</body>

<script src='/resources/js/common.js'></script>
<script>

</script>
</html>