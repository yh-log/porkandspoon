<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">
		
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">

	<!-- 다음 주소 검색 api 사용 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/daumApi.js"></script>


	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<style>

	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}
	
	.art{
    	height: 270px;
    	resize: none;
	}
	
	.btn-room{
		display: flex;
    	justify-content: center;
	}
	
	th{
		width: 20%;
	}
	
	.coutn-dis{
		display: flex;
		align-items: center;
	}

	td div.inline-layout{
		display: flex;
		align-items: center;
		flex-wrap: nowrap;
		white-space: nowrap;
		gap: 10px;
	}

</style>
</head>
<body>
	<!-- 부트스트랩 -->
	<script src="assets/static/js/initTheme.js"></script>
	
	<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
         <section id="menu">
            <h4 class="menu-title">나의 정보</h4>
            <ul>
            	<li id="firstMenu"><a href="#">나의 정보</a></li>
				<li id="secondMenu1" class="active" ><a href="#">출장</a></li>
				<li id="secondMenu2"><a href="#">서명 관리</a></li>
				<li id="secondMenu3"><a href="#">구매기록</a></li>
            </ul>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>출장 등록</h5>
               </div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                  <div class="col-12 col-lg-12">
					  <form>
						  <table class="align-l">
							<tr>
								<th>등록자</th>
								<td class="align-l">
									${userName}
									<input type="hidden" name="username" value="${username}"/>
								</td>
							</tr>
							<tr>
								<th>시작 일시</th>
								<td class="coutn-dis">
									<input class="form-control sor-1" type="datetime-local" name="start_date" style="width: 23%;" data-required="true"/>
								</td>
							</tr>
							<tr>
								<th>종료 일시</th>
								<td class="coutn-dis">
									<input class="form-control sor-1" type="datetime-local" name="end_date" style="width: 23%;" data-required="true"/>
								</td>
							</tr>
							  <tr>
								  <th>출장 명</th>
								  <td><input class="form-control sor-1" type="text" name="subject" data-required="true"/></td>
							  </tr>
							<tr>
								<th>출장 장소</th>
								<td>
									<div class="inline-layout">
										<input type="text" name="address" class="form-control" id="roadAddress" disabled="disabled" data-required="true"/>
										<button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch()"><i class="bi bi-geo-alt-fill"></i></button>
									</div>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea class="form-control art" name="content"></textarea></td>
							</tr>
						  </table>
					  </form>
                  </div>
               	</div>
               	<div class="col-12 col-lg-12">
               		<div class="btn-room">
	           			<div class="btn btn-primary" onclick="layerPopup('출장을 등록하시겠습니까?', '확인', '취소', tripWrite, removeAlert)">등록</div>
	                	<div class="btn btn-outline-secondary" onclick="location.href='/trip/listView'">취소</div>
	           		</div>
           		</div>
           	</div>
         </section>   
         
      </div>
    </div>
	</div>
	
	
	
</body>

<!-- 부트스트랩 -->
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>

<script>

	function validateForm() {
		// data-required="true"가 있는 필드만 선택
		var requiredFields = document.querySelectorAll('[data-required="true"]');
		var isValid = true;

		requiredFields.forEach(function(field) {
			if (!field.value.trim()) { // 값이 없으면
				field.classList.add('is-invalid'); // 클래스 추가
				isValid = false;
			} else {
				field.classList.remove('is-invalid'); // 유효하면 클래스 제거
			}
		});

		return isValid; // 전체 유효성 결과 반환
	}


	function tripWrite(){

		let isFormValid = validateForm();

		if (isFormValid) {
			console.log('폼이 유효합니다.');

			let form = document.querySelector('form');
			let formData = new FormData(form);

			formData.append('address', $('input[name="address"]').val());

			fileAjax('POST', '/trip/write', formData);

		} else {
			removeAlert();
			console.log('폼에 잘못된 값이 있습니다.');
			layerPopup("필수값을 입력해주세요.", "확인", false, removeAlert, removeAlert); // 실패 시 팝업
		}
	}

	function fileSuccess(response){
		if(response.status === 200){
			location.href = '/trip/detail/' + response.schedule_idx;
		}else{
			layerPopup(response.message, '확인', false, removeAlert, removeAlert);
		}
	}




</script>
</html>