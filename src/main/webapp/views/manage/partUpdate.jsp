<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공통 레이아웃 CSS</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

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
					<div class="buttons">							
						<button class="btn btn-outline-primary" id="home"  onclick="location.href='/ad/spotManage'">매장관리 홈</button>
						<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/partSchdule'">스케줄 관리</button>
					</div>
					
					<ul>
						<li class="active"><a href="/ad/part/List">아르바이트 관리</a></li>
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
			         <form action="/ad/part/Update" method="post">
			          <input type="hidden" name="_csrf" value="${_csrf.token}" />
                     <table>
                        <tr>
                           <th class="align-l">이름</th>
                           <td ><input class="form-control sor-1 "  name="name" type="text" placeholder="이름을 입력해주세요." value="${info.name}" required="required"/></td>
                           <td ><input class="form-control sor-1 "  name="part_idx" type="text" placeholder="이름을 입력해주세요." value="${info.part_idx}"  hidden="" required="required"/></td>
                        </tr>
                        <tr>
                           <th class="align-l">생년월일</th>
                           <td ><input class="form-control sor-1 short"  name="birth" type="date" value="${info.birth}"  required="required"/></td>
                        </tr>
                         <tr>
                           <th class="align-l">입사일</th>
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
                          <td ><input class="form-control sor-1 " name="id" type="text" placeholder="직영점코드을 입력해주세요." value="${info.id}" required="required"/></td>
                        </tr>
                        <tr>
                           <th class="align-l">전화번호</th>
                          <td ><input class="form-control sor-1 " name="phone"  type="text" placeholder="전화번호를 입력해주세요." value="${info.phone}" required="required"/></td>
                        </tr>
                        <tr>
                           <th class="align-l">시급</th>
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
					    <th class="align-l">근무 요일</th>
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
								<button type="submit" class="btn btn-primary">수정</button>
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


	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
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
	
	function thirdBtn1Act(){
		console.log('세번째 팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function thirdBtn2Act(){
		console.log('세번째 팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}


</script>

</html>