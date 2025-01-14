<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직영점 등록</title>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/chartModal.css">
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
	
	
	.btnInputBox{
		display: flex;
		align-items: center;
		gap: 10px;
	}

	.custom-height-row th, 
	.custom-height-row td {
	    line-height: 60px;    
	    padding-top: 0;
	    padding-bottom: 0;
	}
	
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
	}
	
	.btn-Layout{
		display: flex;
		gap: 10px;
	    justify-content: center;
	}
	
	.radioLayoutBox{
		display: flex;
	    gap: 20px;
    	font-weight: 500;
	}
	
	#overlayMessage{
	    display: none;
	    margin-bottom: -15px;
	    margin-top: -32px;
	    font-size: 14px;
	    color : var(--bs-primary);
	    float: left;
	}
	
	
	.filebox label {
	    display: inline-block;
	    padding: 10px 20px;
	    color: var(--bs-secondary);
	    vertical-align: middle;
	    background-color: #fff;
	    cursor: pointer;
	    height: 40px;
	    margin-left: 10px;
	}
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
	.priview{
		width: 170px;
		height: 270px;
	}
	
	#dept-logo{
		width: 150px;
    	height: 150px;
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
					<h4 class="menu-title">직영점 리스트</h4>
					<ul>
						<li class="active" id="firstMenu"><a href="/ma/dept/listView">브랜드 리스트</a></li>
						<li id="secondMenu"><a href="/ma/store/list">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직영점 등록</h5>
						</div>
						<div class="cont-body"> 
							<form>
								<table>
									<tr>
										<td rowspan="3" class="filebox">
											<img src="" id="dept-logo"/>
										</td>
										<th>문서 제목</th>
										<td><span id="draft-subject">${storeInfo.subject}</span></td>
										<th>기안자</th>
										<td><span id="draft-username">${storeInfo.user_name}</span></td>
									</tr>
									<tr>
										<th>결재 일자</th>
										<td><span id="draft-approvalDate">${storeInfo.approval_date}</span></td>
										<th>작성 부서(브랜드)</th>
										<td><span id="draft-deptId">${storeInfo.dept_text}</span></td>
									</tr>
									<tr class="custom-height-row">
										<th>직영점 명</th>
										<td><input type="text" name="name"  class="form-control" value="${storeInfo.name}" id="deptCode" data-required="true"/></td>
										<th>직영점 코드</th>
										<td>
											<div class="inline-layout">
												<input type="hidden" name="parent" value="${storeInfo.dept_id}"/>
												<input type="text" name="id" class="form-control" data-required="true"/>
												<button type="button" onclick="deptOverlay()" class="btn btn-sm btn-outline-primary"><i class="bi bi-check-lg"></i></button>
											</div>
											<div id="overlayMessage"></div>
										</td>
									</tr>
									
									<tr class="custom-height-row">
										<th>직영점주</th>
										<td colspan="2">
											<div class="inline-layout">
												<input type="text" name="owner" class="form-control .disable" value="" disabled="disabled" data-required="true"/>
												<input type="hidden" name="user_name">
												<button class="btn btn-primary" type="button" onclick="loadChartModal('chartInputModal')" ><i class="bi bi-diagram-3"></i></button>
											</div>
										</td>
										<th>시행일자</th>
										<td>
											<div class="inline-layout">
												<input type="date" name="use_date" class="form-control" value="${storeInfo.from_date}" data-required="true"/>
											
											</div>
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="2">
											<div class="inline-layout">
												도로명 <input type="text" name="address" class="form-control .disable" value="${storeInfo.address}"/>
											</div>
										</td>
										<td colspan="2">
											<div class="inline-layout">
												상세주소 <input type="text" name="address_detail" class="form-control .disable" value="${storeInfo.address_detail}"/>
											</div>
										</td>
									</tr>
									<tr>
										<th>활성</th>
										<td colspan="2">
											<div class="radioLayoutBox">
												<input type="radio" name="use_yn" value="Y" class="form-check-input" checked/> 활성
	 										    <input type="radio" name="use_yn" value="N" class="form-check-input"> 비활성
	 									    </div>
										</td>
									</tr>
									<tr><th colspan="5">설명</th></tr>
									<tr>
										<td colspan="5">
											<textarea name="postContent" id="summernote" maxlength="10000"></textarea>
										</td>
									</tr>
								</table>
								<div class="btn-Layout">
									<button type="button" class="btn btn-primary" onclick="layerPopup('직영점을 등록하시겠습니까?','등록','취소', storeWrire, removeAlert)">등록</button>
									<button type="button" class="btn btn-outline-primary" onclick="location.href='/ma/store/list'">취소</button>
								</div>
							</form>
						</div> <!-- cont-body -->
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

<script src='/resources/js/common.js'></script>
<script src='/resources/js/charjstree.js'></script>
<%--<script src='/resources/js/deptInfo.js'></script>--%>
<script src='/resources/js/textEaditor.js'></script>

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

$(document).ready(function() {
    // Summernote 초기화
    $('#summernote').summernote({
        height: 300
    });
    
    // 서버에서 전달된 데이터 읽기
    var content = '${storeInfo.content}';
    
    // Summernote에 데이터 삽입
    $('#summernote').summernote('code', content);
    
    var date = '${storeInfo.approval_date}';
    $('#draft-approvalDate').text(date.split(' ')[0]);
    
	var deptCodeOverlay = false;

	var logo_file = '${storeInfo.logo_file}';
	if(logo_file){
		document.getElementById('dept-logo').src = '/photo/' + logo_file;
	}else {
        document.getElementById('dept-logo').src = '/resource/img/logo.jpg';
    }
	
	const parentDate = '${storeInfo.parent_date}'.trim(); // 서버에서 전달받은 parent_date 값
    const useDateInput = document.querySelector('input[name="use_date"]'); // 날짜 입력 필드
    console.log('parentDate:', parentDate);

    // parent_date 값을 `min` 속성으로 설정
    if (parentDate) {
        useDateInput.setAttribute('min', parentDate);
    }

    // 선택한 날짜가 parent_date보다 빠르면 경고 메시지
    useDateInput.addEventListener('change', function () {
        const selectedDate = this.value; // 사용자가 선택한 날짜
        if (selectedDate < parentDate) {
            this.value = ''; // 선택된 날짜 초기화
        }
    });
	
});



/* 조직도노드  */
//초기 데이터
const initialData = {
	headers: ['이름', '부서', '직급', '삭제'],
	rows: [
	],
	footer: '<div></div>'
};
const exampleData = JSON.parse(JSON.stringify(initialData));

// 선택된 ID를 rows에 추가하는 함수
function addSelectedIdToRows(selectedId) {
	console.log("가져온 ID:", selectedId);

	if (exampleData.rows.length >= 1) {
		layerPopup('직영점주 한 명만 선택 가능합니다.', '확인', false, removeAlert, removeAlert);
		return;
	}

	// 현재 데이터 모두 확인
	const isAlreadyAdded = exampleData.rows.some(row => {
		const rowUsername = row[3]?.match(/'([^']+)'/); // row[3]에서 username 값 추출
		return rowUsername && rowUsername[1] === selectedId;
	});

	if (isAlreadyAdded) {
		layerPopup('이미 추가된 직원입니다.', '확인', false, removeAlert, removeAlert);
		return; // 중복된 경우 함수 종료
	}

	let username = {'username':selectedId};

	getAjax('/ad/dept/userAppend', 'JSON', username);

}


// 선택된 ID를 받아서 처리
getSelectId(function (selectedId) {
	addSelectedIdToRows(selectedId);
});

$(document).on('click', '#addModal', function () {
	console.log("등록 버튼 클릭됨!");

	const newUsers = exampleData.rows.map(row => {
		const match = row[3]?.match(/chartTableDelete\(this, '([^']+)', '([^']+)', '([^']+)'\)/); // username과 name 추출
		return match ? { username: match[1], name: match[2], parent: match[3]} : null; // 객체로 반환
	}).filter(user => user !== null); // null 값 제거

	console.log("새롭게 추가된 사용자들의 username:", newUsers);

	if (newUsers.length === 0) {
		console.log("새롭게 추가된 사용자가 없습니다.");
		return;
	}

	// 필요에 따라 추가 작업 수행
	newUsers.forEach(user => {
		console.log("Username:", user.username, "Name:", user.name, "Parent", user.parent);
	});

	// 초기값을 설정하지 않으면 앞에 undefined 이 붙는다!
	let deptUsername = '';
	let usernames = '';
	for(const user of newUsers){
		if(user.parent !== 'NO1000'){
			layerPopup("미발령 직원만 선택 가능합니다.", '확인', false, removeAlert, removeAlert);
			break;
		}else{
			deptUsername += user.name + ' ';
			usernames += user.username + ' ';
			const modal = document.querySelector("#chartModalBox");
			modal.style.display = "none";

		}
	}
	console.log(deptUsername);
	console.log(usernames);
	$('input[name="owner"]').val(deptUsername);
	$('input[name="user_name"]').val(usernames);

});

function getSuccess(response){

	console.log(response);

	if(response.status === 202){
		deptCodeOverlay = true;
		$('#overlayMessage').show();
		$('#overlayMessage').text(response.message);
		$('#overlayMessage').css('color', 'var(--bs-primary)');
	}else if(response.status === 400 || response.status === 500){
		deptCodeOverlay = false;
		$('#overlayMessage').show();
		$('#overlayMessage').text(response.message);
		$('#overlayMessage').css('color', 'var(--bs-danger)');
	}else if(response.status === 200){
		if(response.position !== '직영점주'){
			layerPopup("직영점주만 선택 가능합니다.", '확인', false, removeAlert, removeAlert);
			return;
		}else if(response.parent !== 'NO1000'){
			layerPopup("미발령 직원만 선택 가능합니다.", '확인', false, removeAlert, removeAlert);
			return;
		}

		let newRow = [response.name, response.dept_name, response.position,  '<div onclick="chartTableDelete(this, \'' + response.username + '\', \'' + response.name + '\', \'' + response.parent + '\')"><i class="bi bi-trash3"></i></div>'];

		// 기존 rows에 추가
		exampleData.rows.push(newRow);

		// 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
		updateTableData('customTable', exampleData);

	}
}


function deptOverlay(){
	var deptCode = $('input[name="id"]').val();
	var regex = /^[A-Z]{2}[0-9]{4}$/;

	if(regex.test(deptCode)){
		var dto = {'id' : deptCode};
		getAjax('/ad/user/deptCodeOverlay', 'JSON', dto);
		$('#overlayMessage').hide();
	}else {
		$('#overlayMessage').show();
		$('#overlayMessage').text('대문자 2, 숫자 4 형태로 입력하세요');
		$('#overlayMessage').css('color', 'var(--bs-danger)');
	}
}


function storeWrire(){
	var isFormValid = validateForm();

	if (isFormValid) {
		console.log('폼이 유효합니다.');

		var deptCode = document.getElementById("deptCode");

		if(!deptCodeOverlay){
			$('#overlayMessage').show();
			$('#overlayMessage').css('color', 'var(--bs-danger)');
			$('#overlayMessage').text('부서 코드 중복을 확인해주세요');

			deptCode.classList.add('is-invalid');

		}else{
			deptCode.classList.remove('is-invalid');
			textEaditorWrite('/ad/store/write');
		}

	}else {
		removeAlert();
		layerPopup('필수정보를 입력해주세요.', '확인', false, removeAlert, removeAlert);

	}
}

function fileSuccess(response){
	removeAlert();
	console.log('결과', response);
	if(response.status === 200){
		layerPopup(response.message, "확인", false, function() {
			location.href = '/ma/store/detail/' + response.id;
		});
	}
}


// 선택된 username 삭제
function chartTableDelete(element, username, name, dept) {
	console.log('삭제 실행 ', username);

	// 1. 해당 버튼의 부모 tr 요소 찾기
	const row = element.closest('tr'); // 호출된 버튼을 기준으로 tr 찾기

	// 2. 행 삭제
	if (row) {
		row.remove(); // 테이블에서 해당 행 삭제
	}

	// 3. exampleData.rows에서 해당 username에 해당하는 데이터 제거
	exampleData.rows = exampleData.rows.filter(function (row) {
		return row[3].indexOf(username) === -1; // username과 일치하지 않는 데이터만 남김
	});

	// 4. 테이블 데이터 업데이트
	updateTableData('customTable', exampleData);

	console.log('삭제 완료!');
}


</script>

</html>