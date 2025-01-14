<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>휴점 등록</title>
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		  href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

	<style >

		.tit-area{
			display: flex;
		}

		td div.inline-layout{
			display: flex;
			align-items: center;
			flex-wrap: nowrap;
			white-space: nowrap;
			gap: 10px;
		}

		.required-value{
			color: var(--bs-danger);
		}

		.dateFont{
			font-weight: 500;
		}

		td div input[type="date"]{
			width: 150px;
		}

		#home, #schedule{
			width: 200px;
			margin-top: 10px;
			margin-bottom: 10px;
		}

		#nameTableTd{
			float: left;
			margin-left: 10px;
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
					<li id="firstMenu" ><a href="/us/spotManage">매장관리 홈</a></li>
					<li id="secondMenu"  ><a href="/us/partSchedule">스케줄 관리</a></li>
					<li id="secondMendu"><a href="/us/part">아르바이트 관리</a></li>
					<li id="secondMenud" class="active"><a href="/us/rest/listView">휴점</a></li>
				</ul>
			</section>
			<section class="cont">
				<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
				<div class="tit-area">
					<h5>휴점 등록</h5>
				</div>
				<div class="cont-body">
					<div class="row">
						<div class="col-12 col-lg-12">
							<form>
								<input type="hidden" name="username" value="${username}"/>
								<input type="hidden" name="rest_idx" value="${getRest.rest_idx}"/>
								<input type="hidden" name="creater" value="${getRest.creater}"/>
								<input type="hidden" name="board_idx" value="${getRest.board_idx}">
								<input type="hidden" name="schedule_idx" value="${getRest.schedule_idx}"/>
								<table>
									<tr class="table-sun" id="user-name-insert">
										<th>작성자</th>
										<td colspan="3" id="nameTableTd">${getRest.username} ${getRest.position}</td>
									</tr>
									<tr class="table-sun">
										<th>휴점명<span class="required-value">*</span> </th>
										<td colspan="3"><input class="form-control" name="subject" type="text" value="${getRest.subject}" data-required="true"></td>
									</tr>
									<tr>
										<th>브랜드</th>
										<td>${getRest.dept_name}</td>
										<th>직영점 명</th>
										<td>
											${getRest.store_name}
											<input type="hidden" name="id" value="${getRest.id}"/>
										</td>
									</tr>
									<tr>
										<th class="table-text table-text-text" style="vertical-align: top;">휴점일정</th>
										<td colspan="3">
											<div class="inline-layout">
												<span class="dateFont">시작일</span><span class="required-value">*</span> <input class="form-control" type="date" id="start_date" name="start_date" value="${getRest.start_date}" data-required="true"/> <span class="dateFont"> ~ </span>
												<span class="dateFont">종료일</span><span class="required-value">*</span> <input class="form-control" type="date" id="end_date" name="end_date" value="${getRest.end_date}" data-required="true"/>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="editor-area">
												<textarea name="contents" id="summernote" maxlength="10000"></textarea>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="row">
							<div class="col-sm-5"></div>
							<div class="col-sm-2">
								<button type="button" class="btn btn-primary btn-write" onclick="layerPopup('휴점 정보를 수정하시겠습니까?','수정','취소', restUpdate, removeAlert)">수정</button>
								<button type="button" class="btn btn-outline-primary btn-delete" onclick="location.href='/us/rest/detail/${getRest.rest_idx}'">취소</button>
							</div>
							<div class="col-sm-5"></div>
						</div>

					</div>
				</div>
			</section>
		</div>
	</div>
</div>
</body>


<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<script src='/resources/js/textEaditor.js'></script>
<script src='/resources/js/common.js'></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function (){
		$('#summernote').summernote({
			height: 300
		});

		const content = '${getRest.content}';

		$('#summernote').summernote('code', content);
	});


	function validateForm(){
		const requireFidlds = document.querySelectorAll('[data-required="true"]');
		let isValid = true;

		requireFidlds.forEach(function (field){
			if(!field.value.trim()){
				field.classList.add('is-invalid');
				isValid = false;
			}else {
				field.classList.remove('is-invalid');
			}
		});

		return isValid;
	}

	function restUpdate(){

		let isFormValid = validateForm();

		if(isFormValid){
			// 함수 실행
			textEaditorWrite('/us/rest/update');

		}else{
			removeAlert();
			layerPopup("필수값을 입력해주세요.", "확인", false, removeAlert, removeAlert);
		}

	}

	function fileSuccess(response){
		removeAlert();

		console.log(response);
		if(response.status === 200){
			layerPopup(response.message, "확인", false, function() {
				location.href = '/us/rest/detail/' + response.rest_idx;
			});

		}else{
			layerPopup(response.message, "확인", false, function() {
				location.href = '/us/rest/listView'
			});
		}
	}

	// 오늘 날짜를 'YYYY-MM-DD' 형식으로 반환하는 함수
	function getTodayDate() {
		const today = new Date();
		const year = today.getFullYear();
		const month = String(today.getMonth() + 1).padStart(2, '0');
		const day = String(today.getDate()).padStart(2, '0');
		return year + '-' + month + '-' + day;
	}

	// 시작일과 종료일 요소 가져오기
	const startDateInput = document.querySelector('input[name="start_date"]');
	const endDateInput = document.querySelector('input[name="end_date"]');

	// 시작일과 종료일의 초기 min 값 설정
	startDateInput.min = getTodayDate();
	endDateInput.min = getTodayDate();

	// 시작일 변경 시 종료일의 min 값 업데이트
	startDateInput.addEventListener("change", function () {
		if (startDateInput.value) {
			endDateInput.min = startDateInput.value;
			validateDateRange(); // 날짜 유효성 검사 호출
		}
	});

	// 종료일 변경 시 유효성 검사
	endDateInput.addEventListener("change", validateDateRange);

	// 유효성 검사 함수
	function validateDateRange() {
		const startDate = new Date(startDateInput.value);
		const endDate = new Date(endDateInput.value);

		// 종료일이 시작일보다 이전인 경우 초기화
		if (endDate < startDate) {
			layerPopup('종료일은 시작일 이후로 선택해야 합니다.', '확인', false, removeAlert, removeAlert);
			endDateInput.value = ""; // 종료일 초기화
		}
	}

</script>

</html>