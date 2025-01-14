<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구내식당</title>

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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
	.tit-area{
		display: flex; 
	}
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.content{
		align-content: cetner;
		border: 1px solid black;
	}
	
	.tit-area {
    display: flex;
    justify-content: space-between;
    align-items: center;
	}
	
	.align-right {
	    display: flex;
	    justify-content: flex-end;
	    align-items: center;
	    gap: 10px; /* 요소 간 간격 */
	}
	.cont-body {
    display: flex; /* 플렉스 컨테이너로 설정 */
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 세로 정렬 (필요 시) */
    flex-wrap: wrap; /* 내용이 넘치면 줄 바꿈 */
    padding: 24px 40px; /* 기존 패딩 유지 */
}

.ticket-container {
    display: grid;
    grid-template-columns: repeat(5, 1fr); /* 한 줄에 5개 */
    gap: 20px; /* 항목 간 간격 */
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    max-width: 1200px; /* 최대 너비 설정 */
}
	.ticket-item {
	    border: 1px solid #ddd; /* 테두리 */
	    border-radius: 8px; /* 둥근 모서리 */
	    padding: 15px;
	    text-align: center; /* 중앙 정렬 */
	    background-color: #fff; /* 배경색 */
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	    width: 200px; /* 고정된 너비 */
	}
	
	.ticket-item img {
	    max-width: 100%; /* 이미지 크기 조정 */
	    height: auto;
	    margin-bottom: 10px;
	}
	
	.ticket-item h4 {
	    font-size: 16px;
	    margin: 10px 0 5px;
	}
	
	.ticket-item h5 {
	    font-size: 14px;
	    color: #555;
	    margin-bottom: 10px;
	}
	
	.ticket-item .btn {
	    padding: 8px 12px;
	    font-size: 14px;
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
					<h4 class="menu-title">구내식당</h4>
					<ul>
						<li class="active"><a href="/mealTicket">식권구매</a></li>
						<li><a href="/mealMenu">식단표</a></li>
						
						<!-- 관리자 메뉴: role 값이 'admin' 또는 'superadmin'일 때만 표시 -->
					    <c:if test="${role == 'admin' || role == 'superadmin'}">
					        <li><a href="/ad/mealMenu/Write">식단등록</a></li>
					        <li><a href="/ad/mealTicket/Write">식권등록</a></li>
					        <li><a href="/ad/meal/List">상품리스트</a></li>
					    </c:if>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
					<div class="tit-area justify-end">
					    <h5>식권구매</h5>
					    <div class="align-right">
					        <h5 class="count"> 나의 식권 보유량 : ${count} 장</h5> <!-- 로그인한 id에서 식권 보유량 찾아서 가져오기 -->
					        <a href="/myPageBuy" class="btn btn-primary count">사용/구매 내역 보러가기</a>
					    </div>
					</div>
						<div class="cont-body">
							<div class="row">
							<div class="col-12 col-lg-2">
								<div class="ticket-container">
								    <c:forEach var="ticket" items="${list}">
								    <c:if test="${not empty ticket.name}">
								        <div class="ticket-item">
								            <!-- filedto와 new_filename이 null인지 확인하여 기본 이미지 설정 -->
								            <c:choose>
								                <c:when test="${not empty ticket.filedto and not empty ticket.filedto.new_filename}">
								                    <img src=" /photo/${ticket.filedto.new_filename}" alt="상품 이미지">
								                    
								                </c:when>
								                <c:otherwise>
								                    <img src="/resources/img/default.jpg" alt="기본 이미지">
								                </c:otherwise>
								            </c:choose>
								            <!-- 티켓 이름과 장수 표시 -->
								            <h4 id="meal_idx" data-meal_idx="${ticket.meal_idx}" hidden="">${ticket.meal_idx}</h4>
								            <h4 id="name" data-name="${ticket.name}">${ticket.name}</h4>
								            <h5 id="count" data-count="${ticket.count}">${ticket.count}장</h5>
											<h5 id="cost" data-cost="${ticket.cost}">${ticket.cost}</h5>
											<a href="#" class="btn btn-primary btn-pay-ready" 
											   data-name="${ticket.name}" data-cost="${ticket.cost}" data-count="${ticket.count}" data-meal_idx="${ticket.meal_idx}"
											   >구매</a>
											   <!-- onclick="layerPopup('${ticket.name} ${ticket.count}장을 구매하시겠습니까?', '구매', '취소')" -->
								        </div>
								        
								        
								        
								        
								    </c:if>
								</c:forEach>
								<%@ page session="true" %>
								<%
								    String successMessage = (String) session.getAttribute("successMessage");
								    if (successMessage != null) {
								        session.removeAttribute("successMessage"); // 메시지를 세션에서 제거
								%>
								<script>
								    // 특수 문자를 이스케이프 처리하여 JavaScript에서 안전하게 사용
								    var successMessage = "<%= successMessage.replaceAll("\"", "\\\\\"").replaceAll("\n", "\\\\n") %>";
								    layerPopup(successMessage, "확인", "닫기");
								</script>
								<%
								    }
								%>
								
								
								</div>
							</div>

						</div>
					</div> 
				</section>
			</div>
		</div>
	</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>


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


<script>

$(document).ready(function () {
    // 구매 버튼 클릭 이벤트
    $('.btn-pay-ready').on('click', function (e) {
        e.preventDefault(); // 기본 동작 방지

        // 클릭된 버튼(this)
        const clickedButton = $(this);

        // 데이터 가져오기
        const name = clickedButton.data("name");
        const cost = clickedButton.data("cost");
        const meal_idx = clickedButton.data("meal_idx");
        const count = clickedButton.data("count");
        console.log(name);
        console.log(cost);
        console.log(meal_idx);
        console.log(count);
        // 팝업 호출
        layerPopup('정말로 구매하시겠습니까?', '확인', '취소', function () {
            btn1Act(name,cost,meal_idx,count); // 확인 버튼 클릭 시 동작
        }, btn2Act);
    });
});



	
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	/* 알림 팝업 */
	function btn1Act(name,cost,meal_idx,count) {
		
		$.ajaxSetup({
		    beforeSend: function (xhr) {
		        const token = $('meta[name="_csrf"]').attr('content');
		        const header = $('meta[name="_csrf_header"]').attr('content');
		        xhr.setRequestHeader(header, token);
		    },
		});
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');
		//e.preventDefault();
/* 
	    const name = $("#name").data("name");
	    const cost = $("#cost").data("cost");
	    const meal_idx = $("#meal_idx").data("meal_idx");
	    const count = $("#count").data("count");
 */
	    
	    
	    console.log(name);
	    console.log(cost);
	    

	    $.ajax({
	        type: "POST",
	        url: "/mealTicket/payReady",
	        contentType: 'application/json', // JSON 형식의 Content-Type
	        data: JSON.stringify({ // 데이터를 JSON 문자열로 변환
	        	meal_idx:meal_idx,
	        	count:count,
	        	name: name,
	        	cost: cost,
	        }),
	        success: function (response) {
	            window.location.href = response.next_redirect_pc_url;
	        },
	        error: function (xhr, status, error) {
	            console.error("결제 준비 실패:", error);
	            alert("결제 준비에 실패했습니다. 다시 시도해주세요.");
	        },
	    });
		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		
	}
	
	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	

</script>

</html>