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
	#home,#schedule{
		width: 200px;
	}

	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
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
    justify-content: flex-start; /* 가로 정렬 문제 수정 */
    gap: 10px; /* 요소 간 간격 */
	}
	#searchLayout{
	margin-left: 180px;
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
					<h4 class="menu-title">아르바이트 관리</h4>		
					<ul>
						<li><a href="/us/spotManage">매장관리 홈</a></li>	
						<li ><a href="/us/partSchedule">스케줄 관리</a></li>	
						<li class="active"><a href="/us/part">아르바이트 관리</a></li>
						<li><a href="/us/rest/listView">휴점신청</a></li>						
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>아르바이트 수정</h5>
						</div>
						<div class="cont-body">
						<div class="row">

			         <div class="col-12 col-lg-12">
			         <form action="/us/part/Update" method="post">
			          <input type="hidden" name="_csrf" value="${_csrf.token}" />
                     <table>
                        <tr>
                           <th class="align-l">이름<span class="required-value">*</span></th>
                           <td ><input class="form-control sor-1 "  name="name" type="text" placeholder="이름을 입력해주세요." value="${info.name}" required="required"/></td>
                           <td ><input class="form-control sor-1 "  name="part_idx" type="text" placeholder="이름을 입력해주세요." value="${info.part_idx}"  hidden="" required="required"/></td>
                        </tr>
                        <tr>
                           <th class="align-l">생년월일<span class="required-value">*</span></th>
                           <td ><input class="form-control sor-1 short"  name="birth" type="date" value="${info.birth}"  required="required"/></td>
                        </tr>
                         <tr>
                           <th class="align-l">입사일<span class="required-value">*</span></th>
                           <td ><input class="form-control sor-1 short"  name="join_date" type="date" value="${info.join_date}" required="required"/></td>
                        </tr>
                        
                        <tr>
                           <th class="align-l">성별</th>
                          <td ><div class="card-body">
									<div class="form-check">
									    <input class="form-check-input" type="radio" name="gender" value="M" id="flexRadioDefault1"
									        ${info.gender == 'M' ? 'checked' : ''}>
									    <label class="form-check-label" for="flexRadioDefault1">남자</label>
									</div>
									<div class="form-check">
									    <input class="form-check-input" type="radio" name="gender" value="W" id="flexRadioDefault2"
									        ${info.gender == 'W' ? 'checked' : ''}>
									    <label class="form-check-label" for="flexRadioDefault2">여자</label>
									</div>
								</div>	
							</td>
                        </tr>
                        <tr>
                           <th class="align-l">상태</th>
                          <td ><div class="card-body">
									<div class="form-check">
									    <input class="form-check-input" type="radio" name="is_quit"  value="N" id="flexRadioDefault1"
									        ${info.is_quit == 'N' ? 'checked' : ''}>
									    <label class="form-check-label" for="statusWorking">재직</label>
									</div>
									<div class="form-check">
									    <input class="form-check-input" type="radio" name="is_quit" value="Y" id="flexRadioDefault2"
									        ${info.is_quit == 'Y' ? 'checked' : ''}>
									    <label class="form-check-label" for="statusQuit">퇴사</label>
									</div>
								</div>	
							</td>
                        </tr>
                        <tr>
                           <th class="align-l">직영점 코드</th>
                          <td >${mto.spotName}</td>
                          <td ><input class="form-control sor-1 " name="id"  type="text" placeholder="전화번호를 입력해주세요." value="${mto.id}" required="required" hidden=""/></td>
                        </tr>
                        <tr>
                           <th class="align-l">전화번호<span class="required-value">*</span></th>
                          <td ><input class="form-control sor-1 " name="phone"  type="text" placeholder="전화번호를 입력해주세요." value="${info.phone}" required="required"/></td>
                        </tr>
                        <tr>
                           <th class="align-l">시급<span class="required-value">*</span></th>
                          <td ><input class="form-control sor-1 " name="pay"  type="text" placeholder="시급를 입력해주세요." value="${info.pay}" required="required"/></td>
                        </tr>
                        <tr>
                           <th class="align-l">주소</th>
                          	<td >
	                          	<div class="inline-layout">
									<input type="text" name="address" class="form-control" id="roadAddress" value="${info.address}" readonly="readonly"/>
									<button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch()"><i class="bi bi-geo-alt-fill"></i></button>
								</div>
							</td>
                        </tr>
                     <tr>
					    <th class="align-l">근무 요일<span class="required-value">*</span></th>
					    <td>
					        <div id="workDayContainer">
					            <c:forEach var="schedule" items="${list}" varStatus="status">
					                <div id="searchLayout" class="col-7 col-lg-7">
					                    <select class="form-select selectStyle" name="work_date[]">
					                        <option value="월" ${schedule.work_date == '월' ? 'selected' : ''}>월</option>
					                        <option value="화" ${schedule.work_date == '화' ? 'selected' : ''}>화</option>
					                        <option value="수" ${schedule.work_date == '수' ? 'selected' : ''}>수</option>
					                        <option value="목" ${schedule.work_date == '목' ? 'selected' : ''}>목</option>
					                        <option value="금" ${schedule.work_date == '금' ? 'selected' : ''}>금</option>
					                        <option value="토" ${schedule.work_date == '토' ? 'selected' : ''}>토</option>
					                        <option value="일" ${schedule.work_date == '일' ? 'selected' : ''}>일</option>
					                    </select>
					                    <input type="time" class="form-control start_date" name="start_time[]" value="${schedule.start_time}" />
					                    <p class="title">~</p>
					                    <input type="time" class="form-control end_date" name="end_time[]" value="${schedule.end_time}" />
					                    <c:choose>
					                        <c:when test="${status.first}">
					                            <!-- 첫 번째 항목에는 + 버튼 -->
					                            <button type="button" class="btn btn-outline-primary add-time-btn">+</button>
					                        </c:when>
					                        <c:otherwise>
					                            <!-- 나머지 항목에는 - 버튼 -->
					                            <button type="button" class="btn btn-outline-danger remove-time-btn">-</button>
					                        </c:otherwise>
					                    </c:choose>
					                </div>
					            </c:forEach>
					        </div>
					    </td>
					</tr>


                     </table>
							<div id="btn-gap">							
								<button type="button" class="btn btn-primary btn-popup">수정</button>
								<button class="btn btn-outline-primary" onclick="location.href ='/us/part/Detail/'+${info.part_idx}">취소</button>
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

<!-- rating.js(별점)  -->
<script src="/resources/assets/extensions/rater-js/index.js?v=2"></script>
<script src="/resources/assets/static/js/pages/rater-js.js"></script>

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script>
$(document).ready(function () {
    // "+" 버튼 클릭 이벤트
    $(document).on('click', '.add-time-btn', function () {
        const workDayContainer = $('#workDayContainer');
        const newEntry = `
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
                <input type="time" class="form-control start_date" name="start_time[]" />
                <p class="title">~</p>
                <input type="time" class="form-control end_date" name="end_time[]" />
                <button type="button" class="btn btn-outline-danger remove-time-btn">-</button>
            </div>
        `;

        // 새로운 항목 추가
        workDayContainer.append(newEntry);

        // "+" 버튼 고정 업데이트
        updateAddButton();
    });

    // "-" 버튼 클릭 이벤트
    $(document).on('click', '.remove-time-btn', function () {
        // 클릭된 항목 제거
        $(this).closest('#searchLayout').remove();

        // "+" 버튼 고정 업데이트
        updateAddButton();
    });

    // "+" 버튼 고정 로직
    function updateAddButton() {
        // 모든 "+" 버튼 제거
        $('.add-time-btn').remove();

        // 첫 번째 항목에만 "+" 버튼 추가
        const firstEntry = $('#workDayContainer #searchLayout').first();
        if (firstEntry.length > 0) {
            firstEntry.append(`<button type="button" class="btn btn-outline-primary add-time-btn">+</button>`);
        }
    }

    // 초기 상태에서 "+" 버튼 업데이트 호출
    updateAddButton();
});


$('.btn-popup').on(
		'click',
		function() {
			layerPopup('아르바이트 정보를 수정 하시겠습니까?', '확인', '취소', btn1Act,
					btn2Act);
		});

/* 알림 팝업 */
function btn1Act() {
    removeAlert(); // 기존 팝업 닫기

    // 입력 필드 값 가져오기
    var name = $('input[name="name"]').val();
    var birth = $('input[name="birth"]').val();
    var join_date = $('input[name="join_date"]').val();
    var phone = $('input[name="phone"]').val();
    var pay = $('input[name="pay"]').val();

    // 근무 요일 및 시간 값 검사
    let isComplete = true;

    $('select[name="work_date[]"], input[name="start_time[]"], input[name="end_time[]"]').each(function () {
        if (!$(this).val()) {
            isComplete = false;
        }
    });

    // 필수 항목 체크
    if (!name || !birth || !join_date || !phone || !pay || !isComplete) {
        layerPopup("필수 항목을 모두 입력해주세요.", "확인", false, thirdBtn1Act, thirdBtn1Act);
        return;
    }

    // 모든 값이 올바르게 입력된 경우
    layerPopup("수정이 완료되었습니다.", "확인", false, secondBtn1Act, secondBtn1Act);
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

function thirdBtn1Act() {
	// 두번째팝업 2번버튼 클릭시 수행할 내용
	console.log('두번째팝업 3번 버튼 동작');
	removeAlert(); // 팝업닫기
	
}


</script>

</html>