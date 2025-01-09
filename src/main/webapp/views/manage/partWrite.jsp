<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h4 class="menu-title">매장관리</h4>
					<ul>
						<li ><a href="/ad/spotManage">매장관리 홈</a></li>
						<li ><a href="/ad/partSchedule">스케줄관리</a></li>
						<li class="active"><a href="/ad/part">아르바이트 관리</a></li>
						<li><a href="/ad/rest/List">휴점신청</a></li>
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
				         
				         <form action="/ad/part/Write" method="post">
				          <input type="hidden" name="_csrf" value="${_csrf.token}" />
		                     <table>
		                        <tr>
		                           <th class="align-l">이름</th>
		                           <td ><input class="form-control sor-1 " name="name" type="text" placeholder="이름을 입력해주세요." required="required"/></td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">생년월일</th>
		                           <td ><input class="form-control sor-1 short"  name="birth" type="date"  required="required"/></td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">입사일</th>
		                           <td ><input class="form-control sor-1 short"  name="join_date" type="date"  required="required"/></td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">성별</th>
		                          <td >
		                          <div class="card-body">
									<div class="form-check">
										<input class="form-check-input" type="radio" name="gender"  value="M" id="flexRadioDefault1" checked="checked"> 
										<label class="form-check-label" for="flexRadioDefault1"> 남자 </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="gender" value="W" id="flexRadioDefault2" >
										<label class="form-check-label" for="flexRadioDefault2"> 여자 </label>
									</div>
										</div>	
									</td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">상태</th>
		                          <td ><div class="card-body">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="is_quit"  value="N" id="flexRadioDefault1" checked="checked"> 
												<label class="form-check-label" for="flexRadioDefault1">재직 </label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="is_quit"  value="Y"  id="flexRadioDefault2" >
												<label class="form-check-label" for="flexRadioDefault2">퇴사 </label>
											</div>
										</div>	
									</td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">지점명 코드</th>
		                          <td >${mto.spotName}</td>
		                          <td ><input class="form-control sor-1 " name="id"  value="${mto.id}" type="text" placeholder="전화번호를 입력해주세요." required="required"/></td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">전화번호</th>
		                          <td ><input class="form-control sor-1 " name="phone"  type="text" placeholder="전화번호를 입력해주세요." required="required"/></td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">시급</th>
		                          <td ><input class="form-control sor-1 " name="pay"  type="text" placeholder="전화번호를 입력해주세요." required="required"/></td>
		                        </tr>
		                        <tr>
		                           <th class="align-l">주소</th>
		                          <td >
		                          	<div class="inline-layout">
										<input type="text" name="address" class="form-control" id="roadAddress" readonly="readonly" data-required="true"/>
										<button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch()"><i class="bi bi-geo-alt-fill"></i></button>
									</div>
								</td>
		                        </tr>
		                        
		                     <tr>
							    <th class="align-l">근무 요일</th>
							    <td>
							        <div id="workDayContainer">
							            <div id="searchLayout" class="col-7 col-lg-7">
							                <select class="form-select selectStyle" name="work_date[]">
							                    <option value="월">월</option>
							                    <option value="화">화</option>
							                    <option value="수">수</option>
							                    <option value="목">목</option>
							                    <option value="금">금</option>
							                    <option value="토">토</option>
							                    <option value="일">일</option>
							                </select>
							                <input type="time" class="form-control start_date" name="start_time[]" placeholder="시작 시간">
							                <p class="title">~</p>
							                <input type="time" class="form-control end_date" name="end_time[]" placeholder="종료 시간">
							                <button type="button" class="btn btn-sm btn-outline-primary" id="addWorkDay">+</button>
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

document.getElementById('addWorkDay').addEventListener('click', function () {
    const workDayContainer = document.getElementById('workDayContainer');
    const newWorkDay = document.createElement('div');

    // 새 항목에 기존 스타일과 동일한 구조 적용
    newWorkDay.innerHTML = `
        <div id="searchLayout" class="col-7 col-lg-7 mt-2">
            <select class="form-select selectStyle" name="work_date[]">
                <option value="월">월</option>
                <option value="화">화</option>
                <option value="수">수</option>
                <option value="목">목</option>
                <option value="금">금</option>
                <option value="토">토</option>
                <option value="일">일</option>
            </select>
            <input type="time" class="form-control start_date" name="start_time[]" placeholder="시작 시간">
            <p class="title">~</p>
            <input type="time" class="form-control end_date" name="end_time[]" placeholder="종료 시간">
            <button type="button" class="btn btn-sm btn-outline-danger removeWorkDay">-</button>
        </div>
    `;
    workDayContainer.appendChild(newWorkDay);

    // "-" 버튼에 이벤트 추가
    newWorkDay.querySelector('.removeWorkDay').addEventListener('click', function () {
        newWorkDay.remove();
    });
});
	
$('.btn-popup').on(
		'click',
		function() {
			layerPopup('아르바이트 정보를 등록 하시겠습니까?', '확인', '취소', btn1Act,
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