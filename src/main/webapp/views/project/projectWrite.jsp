<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<!-- 부트스트랩 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">


<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/chartModal.css">
	<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
	/* 조직도 모달 */
	#chartModalBox .chart-td.active {
		border-bottom: 2px solid #333;
	}
	#chartModalBox .left thead {
		margin-bottom: 10px;
	}
	#chartModalBox .bookmark {
	    transform: translateY(10px);
	}
	#chartModalBox .bookmark tr {
		border: none;
	}
	#chartModalBox .bookmark td {
		padding: 8px 16px;
	    text-align: left;
   		font-weight: 500;
   		cursor: pointer;
	}
	
	
	/* 모달 */
	/* 기본 모달 스타일 */
	.modal-dialog {
    	position: static;
    }
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
	#modalBox .modal-close {
    	font-size: 30px;
    }
	#modalBox h5 {
		padding-bottom: 16px;
	}
	#modalBox .form-control {
		display: inline-block;
	}
	#modalBox .input-row {
	    display: flex;
		margin: 6px 0;
	}
	#modalBox .item-tit {
		width: 88px;
	    flex-shrink: 0;
		margin-top: 4px;
	}
	#modalBox input {
		padding-left: 10px;
	}
 	#modalBox .btn{ 
	 	margin: 16px 5px 0;
	}
	 
	 
	 


	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content:start; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 230px;
	}
	#selectedUserTable {
    border-collapse: collapse; /* 테이블 테두리를 한 줄로 만듦 */
    border: none; /* 테이블 전체 테두리 제거 */
	}
	
	#selectedUserTable th,
	#selectedUserTable td {
	    border: none; /* 각 셀의 테두리 제거 */
	}
	
	#selectedUserTable thead th {
	    border-bottom: 2px solid #ddd; /* 필요하면 헤더에만 밑줄 추가 */
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
		width: 300px;
	}
	
	
	.jstree-container {
    width: 100%;
    height: 280px; /* 조직도가 보일 충분한 높이 설정 */
    border: 1px solid #cdcdcd;
    overflow: auto;
}
.chart-scroll {
    width: 100%;
    height: 100%;
    overflow-y: auto;
}
.required-value{
		color: var(--bs-danger);
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
					<h4 class="menu-title">프로젝트</h4>
					<ul>
						<li><a href="/project/List">프로젝트 리스트</a></li>
						<li class="active"><a href="/project/Write">프로젝트 등록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>프로젝트 등록</h5>
						</div>
						<div class="cont-body">

						<div class="row">

			         <div class="col-12 col-lg-12">
			         <form action="/project/Write" method="post">
			         <input type="hidden" name="_csrf" value="${_csrf.token}" />
                     <table>
                        <tr>
                           <th class="align-l">프로젝트 명<span class="required-value">*</span></th>
                           	<td>
                           		
                           		<input class="form-control sor-1 " name="name"  type="text" placeholder="프로젝트 명을 입력해주세요." required="required"/>
                           		
                        </tr>
                        <tr>
                           <th class="align-l">일정<span class="required-value">*</span></th>
                           <td >
	                           <div id="searchLayout" >
		                           	<input class="form-control sor-1 short"  id="start_date" name="start_date" type="date"  required="required"/>
		                           	~
		                           	<input class="form-control sor-1 short" id="end_date"  type="date" name="end_date"  required="required"/>
	                           </div>
                           </td>
                        </tr>
                        <tr>
                           <th class="align-l">공개설정 <span class="required-value">*</span></th>
                           	<td>
                         		<div class="card-body">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="is_open" value="Y" id="flexRadioDefault1" checked="checked"> <label class="form-check-label" for="flexRadioDefault1">
										공개 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="is_open" value="N" id="flexRadioDefault2" >
									<label class="form-check-label" for="flexRadioDefault2">
										비공개 </label>
								</div>
								</div>	
                           	</td>
                        </tr>
                     	</table>
							<div id="btn-gap">							
								<button type="button" class="btn btn-primary btn-popup" >등록</button>
								<button class="btn btn-outline-primary" onclick="location.href = '/project/Write'">초기화</button>
							</div>
			         </form>
                  		</div>
							</div>
						</div> 
				</section>
			</div>
		</div>
	</div>
<!-- 조직도 모달 사용 시 추가 -->
	<div id="chartModalBox" class="modal" style="display: none;">
    	<div class="chartModal-content"></div>
	</div>
	
	
	
</body>
<!-- 조직도 노드 -->
<script src='/resources/js/common.js'></script>
<script src='/resources/js/charjstree.js'></script>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>
<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>
<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>



<script>

 
 
 
 
 $('.btn-popup').on(
			'click',
			function() {
				layerPopup('프로젝트를 등록하시겠습니까?', '확인', '취소', btn1Act,
						btn2Act);
			});
	
 function btn1Act() {
	    // 1번버튼 클릭시 수행할 내용
	    console.log('1번 버튼 동작');
	    removeAlert(); // 팝업닫기
	    // 각 필드의 값 가져오기
	   var name = $('input[name="name"]').val(); // 프로젝트 명
	    var start_date = $('#start_date').val(); // 시작 날짜
	    var end_date = $('#end_date').val(); // 종료 날짜
	    var is_open = $('input[name="is_open"]:checked').val(); // 공개 설정 (선택된 라디오 버튼의 값)

	    console.log('프로젝트 명:', name);
	    console.log('시작 날짜:', start_date);
	    console.log('종료 날짜:', end_date);
	    console.log('공개 설정:', is_open);

	    // 필수 항목 체크
	    if (!name || !start_date || !end_date || !is_open) {
	        layerPopup("필수 항목을 모두 입력해주세요.", "확인", false, btn2Act, btn2Act);
	        return;
	    }

	    // 모든 값이 올바르게 입력된 경우
	    layerPopup("등록이 완료되었습니다.", "확인", false, secondBtn1Act, btn2Act);
	}

	
	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		
		removeAlert(); // 팝업닫기
	}
	
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		
		 document.querySelector('form').submit();
		
		removeAlert(); // 팝업닫기
		
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
		
	}
	
 
 
</script>

</html>