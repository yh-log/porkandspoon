<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- rating.js(별점) -->
<link rel="stylesheet"
	href="/resources/assets/extensions/rater-js/lib/style.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


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
	.card-body{
		display: flex;	
	}
	#flexRadioDefault2{
		margin-left: 20px;
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
	.required-value {
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
					<h4 class="menu-title">식권등록</h4>
					<ul>
						<li><a href="/mealTicket">식권구매</a></li>
						<li><a href="/mealMenu">식단표</a></li>
						<li ><a href="/ad/mealMenu/Write">식단등록</a></li>
						<li class="active"><a href="/ad/mealTicket/Write">식권등록</a></li>
						<li><a href="/ad/meal/List">상품리스트</a></li>
					</ul>
				</section>
				<section class="cont">
					 <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>식단등록</h5>
						</div>
						<div class="cont-body">
							<div class="row">
					         <div class="col-12 col-lg-12">
					         <form action="/ad/mealTicket/Write" method="post" enctype="multipart/form-data">
		                     <input type="hidden" name="_csrf" value="${_csrf.token}" />
			                     <table>
			                        <tr>
			                           <th class="align-l">상품명<span class="required-value">*</span></th>
			                           <td ><input class="form-control sor-1 "  name="name" type="text" placeholder="상품명을 입력해주세요." required="required"/></td>
			                        </tr>
			                        <tr>
			                           <th class="align-l">상품가격<span class="required-value">*</span></th>
			                           <td ><input class="form-control sor-1 "  name="cost" type="text" placeholder="상품가격을 입력해주세요." required="required"/></td>
			                        </tr>
			                        <tr>
			                           <th class="align-l">상품수량<span class="required-value">*</span></th>
			                          <td ><input class="form-control sor-1 "  name="count" type="text" placeholder="상품수량을 입력해주세요." required="required"/></td>
			                        </tr>
			                        <tr>
			                           <th class="align-l">파일첨부</th>
			                          <td ><div class="filepond--root basic-filepond filepond--hopper" data-style-button-remove-item-position="left" data-style-button-process-item-position="right" data-style-load-indicator-position="right" data-style-progress-indicator-position="right" data-style-button-remove-item-align="false" style="height: 76px;">
										<input class="filepond--browser" type="file" id="filepond--browser-rd9ou40mc" name="filepond" aria-controls="filepond--assistant-rd9ou40mc" aria-labelledby="filepond--drop-label-rd9ou40mc" accept="">
											<div class="filepond--drop-label" style="transform: translate3d(0px, 0px, 0px); opacity: 1;">
												<label for="filepond--browser-rd9ou40mc" id="filepond--drop-label-rd9ou40mc" aria-hidden="true">Drag &amp; Drop your files or 
													<span class="filepond--label-action" tabindex="0">Browse</span>
												</label>
											</div>
											<div class="filepond--list-scroller" style="transform: translate3d(0px, 0px, 0px);">
												<ul class="filepond--list" role="list"></ul>
											</div>
											<div class="filepond--panel filepond--panel-root" data-scalable="true">
												<div class="filepond--panel-top filepond--panel-root"></div>
												<div class="filepond--panel-center filepond--panel-root" style="transform: translate3d(0px, 8px, 0px) scale3d(1, 0.6, 1);"></div>
												<div class="filepond--panel-bottom filepond--panel-root" style="transform: translate3d(0px, 68px, 0px);"></div>
											</div>
												<span class="filepond--assistant" id="filepond--assistant-rd9ou40mc" role="status" aria-live="polite" aria-relevant="additions"></span>
													<fieldset class="filepond--data"></fieldset>
													<div class="filepond--drip"></div>
											</div>
										</td>
			                        </tr>
			                        <tr>
			                           <th class="align-l">활성여부</th>
			                          <td ><div class="card-body">
												<div class="form-check">
													<input class="form-check-input" type="radio" name="use_yn" value="Y" id="flexRadioDefault1" checked="checked"> <label class="form-check-label" for="flexRadioDefault1">
														활성 </label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="use_yn" value="N" id="flexRadioDefault2" >
													<label class="form-check-label" for="flexRadioDefault2">
														비활성 </label>
												</div>
											</div>	
										</td>
			                        </tr>
			                     </table>
									<div id="btn-gap">							
										<button type="button" class="btn btn-primary btn-popup">등록</button>
										<button class="btn btn-outline-primary">취소</button>
									</div>
					         </form>
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

	//FilePond 초기화
	FilePond.create(document.querySelector('input[type="file"]'), {
	    server: {
	        process: '/ad/mealTicket/Write', // 파일 업로드를 처리할 서버 URL
	        revert: null, // 업로드 취소 처리를 위해 필요 (선택 사항)
	        headers: {
	            'X-CSRF-TOKEN': '${_csrf.token}' // CSRF 토큰 추가
	        }
	    }
	});
	
	$('.btn-popup').on(
			'click',
			function() {
				layerPopup('메뉴를 등록하시겠습니까?', '확인', '취소', btn1Act,
						btn2Act);
			});
	
	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		layerPopup("등록이 완료 되었습니다.", "확인", "취소", secondBtn1Act, secondBtn2Act);
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