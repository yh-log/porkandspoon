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
	    /* 기본 모달 스타일 */
	.modal {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 1100;
	}
	
	/* 모달 내부 콘텐츠 */
	.modal-content {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    width: 400px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	/* 모달 헤더 */
	.modal-header {
	    display: flex;
	    justify-content: end;
	    align-items: center;
	    border-bottom: 1px none #ddd;
	    margin-bottom: 15px;
	}

	/* 닫기(x) 버튼 */
	.modal-close {
	    font-size: 20px;
	    cursor: pointer;
	}
	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}
	
	.form-label {
	    display: block;
	    font-size: 14px;
	    margin-bottom: 5px;
	}
	
	.form-input {
	    width: 100%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	/* 모달 푸터 */
	.modal-footer {
	    display: flex;
	    justify-content: center;
	    gap: 10px;
	}
	
	/* 버튼 스타일 */
	.btn {
	    padding: 8px 12px;
	    font-size: 14px;
	    border: none;
	    cursor: pointer;
	    border-radius: 4px;
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
	
	<!-- 모달 예시 -->
	<button onclick='loadModal("cabinet", "Input", {content: "회의실 예약 내용입니다."});'>모달 열기!!</button>
	<div id="modalBox" class="modal" style="display: none;">
	    <div class="modal-content"></div>
	</div>
	
	<!-- 모달 데이터 없을 경우 -->
	<!-- 모달 예시 -->
	<button onclick='loadModal("cabinet", "Input");'>데이터 없이 모달 열기</button>
	<div id="modalBox" class="modal" style="display: none;">
	    <div class="modal-content"></div>
	</div>
	
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

// 필요에 따라 사용! 
function setModalData(data) {
	if (!data) data = {};

    // 예약 내용 설정
    if (data.content) {
        var contentField = document.getElementById("cabinet_content");
        if (contentField) contentField.value = data.content;
    }
}
	
</script>
</html>