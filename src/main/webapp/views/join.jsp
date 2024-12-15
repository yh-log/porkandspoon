<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>등록</h2>
	<form action="/joinWrite" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="username"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="password"/></td>
			</tr>
			<tr>
				<th colspan="2"><button type="submit">등록</button></th>
			</tr>
		</table>
	</form>
</body>
</html>