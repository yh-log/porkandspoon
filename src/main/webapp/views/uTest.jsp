<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
<style>
	.priview{
		width: 200px;
	}
</style>
</head>
<body>
	<h1>모든 권한 접근 가능 페이지 (User)</h1>
	<a href="/u/testView">test 페이지로 이동</a> <br/>
	
	<!-- superadmin 만 볼 수 있는 요소 -->
	<sec:authorize access="hasRole('superadmin')">
		<p> 이 영역은 super admin 권한을 가진 사용자만 확인 가능합니다. </p>
	</sec:authorize>
		
	<!-- admin 만 볼 수 있는 요소 -->
	<sec:authorize access="hasRole('admin')">
		<p> 이 영역은 admin 권한을 가진 사용자만 확인 가능합니다. </p>
	</sec:authorize>
	
	<!-- manager 만 볼 수 있는 요소 -->
	<sec:authorize access="hasRole('manager')">
		<p> 이 영역은 manager 권한을 가진 사용자만 확인 가능합니다. </p>
	</sec:authorize>
	
	<!-- user 만 볼 수 있는 요소 -->
	<sec:authorize access="hasRole('user')">
		<p> 이 영역은 user 권한을 가진 사용자만 확인 가능합니다. </p>
	</sec:authorize>
	
	<!-- user 이상만 볼 수 있는 요소 -->
	<sec:authorize access="hasAnyRole('manager', 'admin', 'superadmin')">
		<p> 이 영역은 user 권한을 가진 사람만 확인 불가능합니다. </p>
	</sec:authorize>
	
	<!-- manager 이상만 볼 수 있는 요소 -->
	<sec:authorize access="hasAnyRole('admin', 'superadmin')">
		<p> 이 영역은 user와 manager 권한을 가진 사람만 확인 불가능합니다. </p>
	</sec:authorize>
	
	<!-- 특정 권한이 없는 사용자 -->
	<sec:authorize access="!hasRole('admin')">
	    <p> 이 영역은 admin 이 아닌 사용자만 볼 수 있는 영역입니다.</p>
	</sec:authorize>
	
	
	<sec:authorize access="isAuthenticated()">
	    <p>환영합니다, <strong>${pageContext.request.userPrincipal.name}</strong> 님!</p>
	</sec:authorize>
	
	<br/>
	
	<form>	
		<input type="file" name="files" multiple="multiple" onchange="preview(this)"/>
	</form>
	<div id="imgPreview"></div>
	<button onclick="fileWrite()">파일 등록</button>
	
	<button onclick="getAjax('/u/fileList')">파일 불러오기</button>
	<table>
		<tbody id="fileList"></tbody>
	</table>
	
</body>

<script src='/resources/js/ajax.js'></script>


<script>

function fileWrite(){
	var formData = new FormData($('form')[0]);
	fileAjax('POST', '/fileWrite', formData);
}

function getSuccess(response){
	console.log(response);
	
	var content = '';
	response.result.forEach(function(item){
		content += '<tr>';
		content += '<th> 파일 </th>';
		content += '<td onclick="download(\'' + item.ori_filename + '\', \'' + item.new_filename + '\')">' + item.ori_filename + '</td>';
		content += '</tr>';
	});
	$('#fileList').append(content);
}

	
	
</script>
</html>