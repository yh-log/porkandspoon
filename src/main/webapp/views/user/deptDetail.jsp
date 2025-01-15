<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>브랜드 상세</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">



<style>
	#selectBox{
		display: flex;
		gap: 10px;
		align-items: center;
		margin-top: 15px;
	}
	
	.form-select{
	 	width: 20%;
	}
	.cont-body .row .col-6.col-lg-6:last-of-type{
	    display: flex;
	    justify-content: flex-end;
	    gap: 10px;
	}
	
	#deptLogo{
		width: 200px;
    	height: 200px;
	}
	
	#listBtn{
		float: right;
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
					<h4 class="menu-title">부서 리스트</h4>
					<ul>
						<li class="active" id="firstMenu"><a href="/ma/dept/listView">브랜드 리스트</a></li>
						<li id="secondMenu"><a href="/ma/store/list">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">브랜드 상세</h5>
						</div>
						<div class="cont-body"> 
							<form>
								<table>
									<tr>
										<td rowspan="3" class="filebox">
											<img src="" id="deptLogo"/>
										</td>
										<th>브랜드 명</th>
										<td>${deptInfo.text}</td>
										<th>브랜드 코드</th>
										<td>${deptInfo.id}</td>
									</tr>
									<tr>
										<th>활성</th>
										<td>
											<span id="deptUseYN"></span>
										</td>
										<th>시행일자</th>
										<td>${deptInfo.use_date}</td>
									</tr>
									
									<tr class="custom-height-row">
										<th>소속직원</th>
										<td colspan="3">${deptInfo.user_name}</td>
									</tr>
									<tr><th colspan="5">설명</th></tr>
									<tr>
										<td colspan="5">${deptInfo.content}
										</td>
									</tr>
								</table>
								<sec:authorize access="hasAnyRole('ADMIN', 'SUPERADMIN')">
									<button type="button" class="btn btn-primary" onclick="location.href='/ad/dept/update/${deptInfo.id}'">수정</button>
								</sec:authorize>
								<button type="button" class="btn btn-outline-primary" id="listBtn" onclick="location.href='/ma/dept/listView'">목록</button>
							</form>
						</div> <!-- cont-body -->
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
	
<script src='/resources/js/common.js'></script>
<script>

	$(document).ready(function() {
	    
	    var logofile = '${deptInfo.logo}';
	    
	    if(logofile){
	    	document.getElementById('deptLogo').src = '/photo/' + logofile;
	    }else{
	    	 document.getElementById('deptLogo').src = '/resource/img/logo.jpg';
	    }
	    
	    var use_yn = '${deptInfo.use_yn}';
	    
	    if(use_yn === 'Y'){
	    	$('#deptUseYN').text('활성');
	    }else{
	    	$('#deptUseYN').text('비활성');
	    }
	    
		
	});


</script>

</html>