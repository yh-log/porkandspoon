<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장관리</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">


<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<style >
	#home,#schedule{
		width: 200px;
	}

	#searchLayout {
	    display: flex;
	    align-items: center; /* 수직 정렬 */
	    gap: 10px; /* 요소 간 간격 */
	    margin-bottom: 10px; /* 항목 간 간격 */
	}
	
	.selectStyle{
		width: 230px;
	}

	.tit-area{
		display: flex; 
	}
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.card-body{
		display: flex;	
	}
	#flexRadioDefault2{
		margin-left: 20px;
	}
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
	}
	
	.content{
		display: flex; 
		align-content: cetner;
		border: 1px solid black;
	}
	buttons{
		align-content: cetner;
	}
	.art{
		height: 280px;
	}
	.align-l{
		width: 300px;
		text-align: center
	}
	#btn-gap{
		display: flex;
		gap: 30px;
		align-items: center;
		justify-content: center;
	}
	.short{
		width: 200px;
	}
	#workDayContainer .d-flex {
   display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
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
					<h4 class="menu-title">아르바이트 관리</h4>
					<ul>
						<li ><a href="/us/spotManage">매장관리 홈</a></li>
						<li ><a href="/us/partSchedule">스케줄관리</a></li>
						<li class="active"><a href="/us/part">아르바이트 관리</a></li>
						<li><a href="/us/rest/listView">휴점신청</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>아르바이트 등록</h5>
						</div>
						<div class="cont-body">
						<div class="row">

				         <div class="col-12 col-lg-12">
				         
				      
		                     <table>
		                        <tr>
		                           <th class="align-l">이름</th>
		                           <td >${info.name}</td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">생년월일</th>
		                           <td >${info.birth}</td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">입사일</th>
		                           <td >${info.join_date}</td>
		                        </tr>
		                        <c:if test="${info.is_quit == 'Y'}">
								    <tr>
								        <th class="align-l">퇴사일</th>
								        <td>${info.quit_date}</td>
								    </tr>
								</c:if>
		                        <tr>
		                           <th class="align-l">성별</th>
		                          <td > 
									<c:choose>
							            <c:when test="${info.gender == 'M'}">남자</c:when>
							            <c:when test="${info.gender == 'W'}">여자</c:when>
							            <c:otherwise>알 수 없음</c:otherwise>
							        </c:choose>                        
		                          </td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">상태</th>
		                          <td >
		                           <c:choose>
							            <c:when test="${info.is_quit == 'N'}">재직</c:when>
							            <c:when test="${info.is_quit == 'Y'}">퇴사</c:when>
							            <c:otherwise>알 수 없음</c:otherwise>
							        </c:choose>
		                          
		                          </td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">지점명 코드</th>
		                          <td >${mto.spotName}</td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">전화번호</th>
		                          <td >"${info.phone}"</td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">시급</th>
		                          <td >${info.pay}</td>
		                        </tr>
		                       <tr>
								    <th class="align-l">주소</th>
								    <td>
								        <c:choose>
								            <c:when test="${info.address != null && !info.address.isEmpty()}">
								                ${info.address}
								            </c:when>
								            <c:otherwise>
								                미등록
								            </c:otherwise>
								        </c:choose>
								    </td>
								</tr>
			                  <tr>
								    <th class="align-l">근무 요일</th>
								    <td>
								        <table style="width: 100%; border-collapse: collapse; border: none !important;">
								            <c:forEach items="${list}" var="report">
								                <tr style="border: none !important;">
								                    <td style="padding: 5px; border: none !important;">${report.work_date}</td>
								                    <td style="padding: 5px; border: none !important;">${report.start_time} ~ ${report.end_time}</td>
								                </tr>
								            </c:forEach>
								        </table>
								    </td>
								</tr>
                     	</table>
		                 
							<div id="btn-gap">							
								<button type="button" class="btn btn-primary" onclick="location.href='/us/part/Update/${info.part_idx}'">수정</button>
								<button class="btn btn-outline-primary" 
							    onclick="location.href = '/us/part'">
							    취소
							</button>
							</div>
				         
	                  		</div>
							</div>
						</div> 
				</section>
			</div>
		</div>
	</div>
</body>






<script src='/resources/js/common.js'></script>
<script src='/resources/js/daumApi.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- Need: Apexcharts(차트) -->
<script src="/resources/assets/extensions/apexcharts/apexcharts.min.js"></script>
<script src="/resources/assets/static/js/pages/dashboard.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>

<!-- 파일업로더 -->
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="/resources/assets/extensions/filepond/filepond.js"></script>
<script src="/resources/assets/static/js/pages/filepond.js"></script>


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script>


	
	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		layerPopup("결제방법", "결제하기", "취소", secondBtn1Act, secondBtn2Act);
	}
	
	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
		layerPopup("QR", "결제하기", "취소", thirdBtn1Act, thirdBtn2Act);
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
		
	}
	
	

	

</script>

</html>