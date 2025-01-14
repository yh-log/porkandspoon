<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인사이동 리스트</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/chartModal.css">
<link rel="stylesheet" href="/resources/css/common.css">



	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
<style>
	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 100px;
	}
	.form-control{
		width: 350px;
	}
	
	#filterBox{
		display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
		margin-top: 15px;
	    margin-left: 12px;
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
					<h4 class="menu-title">인사이동</h4>
					<ul>
						
						<li class="active" id="firstMenu"><span> <!-- onclick="transferCall(1, '/ad/employeeTransferList')" -->인사이동</span></li>
						<li id="secondMenu"><span onclick="transferCall(1, '/ad/storeTransferList')">직영점 이동</span></li>
						<li id="thirdMenu"><span onclick="transferCall(1, '/ad/notTransferList')">미발령 직원</span></li>
					</ul>
					<div class="btn btn-primary full-size" onclick="modelTransferOpen()"><i class="bi bi-plus-lg"></i> 인사이동</div>
				</section>
				<!-- 등록하기 버튼 추가 필요 -->
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject"></h5>
						</div>
						<div class="cont-body"> 
							<div class="row">
								<div class="col-6 col-lg-6">
									<div class="inline-layout">
										<input type="date" name="start_date" class="form-control" /> ~ <input type="date" name="end_date" class="form-control" />
										<input type="checkbox" name="all" id="dateAll" class="form-check-input form-check-primary form-check-glow"> 
									</div>
								</div>
								<div class="col-1 col-lg-1"></div>
								<div id="searchLayout" class="col-5 col-lg-5">
									<select class="form-select selectStyle" id="searchOption">
										<option value="dept">부서</option>
										<option value="name">이름</option>
										<option value="position">직위</option>
									</select>
									<input type="text" name="search" class="form-control" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary" id="searchBtn"><i class="bi bi-search"></i></button>
								</div>
							</div>
							<div class="col-12 col-lg-12">
								<table>
									<thead id="transferHead">
										
									</thead>
									<tbody id="transferLIst">
										
									</tbody>
								</table>
								
								
							</div>
							<div class="">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center" id="pagination"></ul>
								</nav>
							</div>

							<div id="chartModalBox" class="modal" style="display: none;">
						    	<div id="chartTransferModal" class="modal-template">
									<div class="chartHeadBox"> <!-- 조직도 상단 -->
										<span class="modal-close" id="closeModal">&times;</span>
									</div>
									<div class="col-12 col-lg-12">
									<div class="row">
										<div class="col-4 col-lg-4">
												<div class="card">
													<table>
														<thead>
															<tr>
																<td class="chart-btn-td chart-td"><button class="chart-btn chart-btn-style">조직도</button></td>
															</tr>
														
														</thead>
														<tbody class="tbody-style">
															<tr>
																<td colspan="2" class="chart-search">
																	<input class="form-control form-control-sm input-test" type="text"  id="" placeholder="이름/부서/직급으로 검색 가능합니다." style="width: 270px;"/>
																</td>
															</tr>
															<tr>
																<!-- 조직도 호출 -->
																<td colspan="2" class="chart-scroll">
																	<div class="jstree chart-list-style jstreeselect" id="jstree"></div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
										</div>
										<div class="col-1 col-lg-1"></div>
										<div class="col-7 col-lg-7">
											<div id="transferBox">
												<div id="transferBoxInner">
													<span>발령일자</span><span style="color: red;">*</span>
													<input type="date" name="transfer_date" class="form-control" style="width: 150px;"/>
												</div>
												<div id="transferCheckBox">
													<span style="color: red;">*</span>
													<button class="btn btn-sm btn-outline-primary" id="employee">인사이동</button>
													<button class="btn btn-sm btn-outline-primary" id="store">직영점이동</button>
													<button class="btn btn-sm btn-outline-primary" id="leave">퇴사처리</button>
												</div>
											</div>
											<div class="card user-list-style">
												<table id="customTable">
										            <thead id="orgHeaderTransfer">

										            </thead>
										            <tbody id="orgBodyTransfer" class="scrollable-tbody">

										            </tbody>
										            <tfoot id="orgFooterTransfer">
														<tr>
															<th></th>
										                </tr>
										            </tfoot>
										        </table>
											</div>
										</div>
									</div>
										<div class="btn-button">
											<button type="button" class="btn btn-primary btn-line-write btn-user-write" id="addModal" onclick="transferAdd()">등록</button>
											<button type="button" class="btn btn-outline-primary btn-line-write btn-user-delete" id="cancelModal">취소</button>
										</div>
									</div>
								</div>
    						</div>
						</div> <!-- cont-body -->
					</div>
				</section>	
			</div>
		</div>
	</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	
<script src='/resources/js/common.js'></script> 
<script src='/resources/js/menu.js'></script>
<script src='/resources/js/charjstree.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<script>

var currentUrl = '/ad/employeeTransferList'; // 초기 URL
var firstPage = 1;
var paginationInitialized = false;

$(document).ready(function () {
    // 체크박스 초기 설정
    $('#dateAll').prop('checked', true);
    handleDateAllState();

    // 메뉴 클릭 이벤트
    $('#firstMenu').on('click', function () {
        currentUrl = '/ad/employeeTransferList';
		$('input[name="search"]').val('');
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });

    $('#secondMenu').on('click', function () {
        currentUrl = '/ad/storeTransferList';
		$('input[name="search"]').val('');
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });

    $('#thirdMenu').on('click', function () {
        currentUrl = '/ad/notTransferList';
		$('input[name="search"]').val('');
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });

    // 검색 버튼 클릭 이벤트
    $('#searchBtn').on('click', function (event) {
        event.preventDefault(); // 기본 동작 중지
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청

    });

	$('#firstMenu').trigger('click');
});

window.addEventListener("DOMContentLoaded", () => {
	// 오늘 날짜를 yyyy-MM-dd 형식으로 얻기
	const today = new Date().toISOString().split("T")[0];
	document.querySelector("input[name='transfer_date']").value = today;
});

// 페이지네이션 초기화 및 데이터 요청
function resetPaginationAndFetchData() {
    firstPage = 1; // 첫 페이지로 초기화
    paginationInitialized = false; // 페이지네이션 초기화
    transferCall(firstPage, currentUrl); // 데이터 요청
}

// 데이터 요청 함수
function transferCall(page = 1, url = currentUrl) {
    var option = $('#searchOption').val(); // 검색 옵션
    var keyword = $('input[name="search"]').val(); // 검색어
    var start_date = $('input[name="start_date"]').val(); 
    var end_date = $('input[name="end_date"]').val();

    $.ajax({
        type: 'GET',
        url: url,
        data: {
            page: page || 1,
            cnt: 10,
            option: option,
            keyword: keyword,
            start_date: start_date,
            end_date: end_date
        },
        datatype: 'JSON',
        success: function (response) {
            console.log("응답 데이터:", response);

            if (response && response.length > 0) {
                getSuccess(response);
            } else {
                console.log('검색 결과가 없습니다.');
                getSuccess([]);
            }

            var totalpage = response[0]?.totalpage || 1;
            console.log('받은 totalpage:', totalpage);

            var totalPages = Math.ceil(totalpage / 10);
            console.log('계산된 총 페이지 수:', totalPages);

            if (!paginationInitialized) {
                $('#pagination').twbsPagination('destroy'); // 기존 페이지네이션 초기화
                $('#pagination').twbsPagination({
                    startPage: page,
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    onPageClick: function (evt, page) {
                        console.log('클릭된 페이지:', page);
                        transferCall(page, currentUrl);
                    }
                });
                paginationInitialized = true;
            }
        },
        error: function (e) {
            console.log('인사이동 페이지네이션 에러 ', e);
        }
    });
}

// 체크박스 상태 처리
function handleDateAllState() {
    const dateAllCheckbox = document.getElementById('dateAll');
    const startDateInput = document.querySelector('input[name="start_date"]');
    const endDateInput = document.querySelector('input[name="end_date"]');

    if (dateAllCheckbox.checked) {
        startDateInput.value = '2015-01-01';
        endDateInput.value = '2025-12-31';
        startDateInput.disabled = true;
        endDateInput.disabled = true;
    } else {
        startDateInput.value = '';
        endDateInput.value = '';
        startDateInput.disabled = false;
        endDateInput.disabled = false;
    }
}

document.getElementById('dateAll').addEventListener('change', handleDateAllState);


// 데이터 조회 후 진행 함수
function getSuccess(response){
	console.log(response);
	
	var result = response[0];
	

	$('#transferHead').empty();
	$('#transferLIst').empty();

	if(result.type === 'E'){
	
		var headContent = '<tr><th>no</th><th>직원명</th><th>기존 부서</th><th>기존 직급</th><th>발령 부서</th><th>발령 직급</th><<th>발령일</th>/tr>';
		$('#transferHead').append(headContent);
		var content = '';  // content를 정의

	    response.forEach(function(item) {
	        content += '<tr>';
	        content += '<td>' + item.idx + '</td>';
	        content += '<td>' + item.name + '</td>';
	        content += '<td>' + item.old_department + '</td>';
	        content += '<td>' + item.old_position + '</td>';
	        content += '<td>' + item.new_department + '</td>';
	        content += '<td>' + item.new_position + '</td>';
	        content += '<td>' + item.transfer_date + '</td>';
	        content += '</tr>';
	    });

	    $('#transferLIst').append(content); 

	}else if(result.type === 'S'){ // 직영점 이동 

		var headContent = '<tr><th>no</th><th>직원명</th><th>브랜드</th><th>기존 직영점</th><th>발령 직영점</th><th>발령일</th></tr>';
		$('#transferHead').append(headContent);

		 var content = ''; // 변수 정의 및 초기화

		    response.forEach(function(item){
		        content += '<tr>';  // content에 HTML 추가
		        content += '<td>' + item.idx + '</td>';
		        content += '<td>' + item.name + '</td>';
		        content += '<td>' + item.old_department + '</td>';
		        content += '<td>' + item.old_position + '</td>';
		        content += '<td>' + item.new_position + '</td>';
		        content += '<td>' + item.transfer_date + '</td>';
		        content += '</tr>';
		    });

		    $('#transferLIst').append(content); 

	}
	 else{ // 미발령 직원
		var headContent = '<tr><th>사번</th><th>직원명</th><th>생년월일</th><th>입사일</th></tr>';
		$('#transferHead').append(headContent);

		var content = '';
		response.forEach(function(item){
			content += '<tr>';
			content += '<td>'+ item.person_num +'</td>';
			content += '<td><a href="#'+ item.username +'"/>'+ item.name +'</a></td>';
			content += '<td>' + item.birth + '</td>';
			content += '<td>'+ item.join_date +'</td>';
			content += '</tr>';
		});
		$('#transferLIst').append(content);
	} 


}

//전역 변수 선언
let lastClickedButtonId = null;

// 클릭 이벤트 등록
document.querySelectorAll('.btn-outline-primary').forEach(button => {
    button.addEventListener('click', function () {
        // 현재 클릭된 버튼의 id를 전역 변수에 저장
        lastClickedButtonId = this.id;
        console.log('최근 클릭된 버튼 ID:', lastClickedButtonId);
    });
});

// 나중에 전역 변수 사용
function useLastClickedButton() {
    if (lastClickedButtonId) {
        console.log('저장된 버튼 ID를 사용:', lastClickedButtonId);
        // 원하는 작업 수행
    } else {
        console.log('아직 클릭된 버튼이 없습니다.');
    }
}

var modal = document.getElementById("chartModalBox");

const selectedEmployeeIds = [];

function modelTransferOpen(){
	 modal.style.display = "block"; // 모달 열기

	 loadOrgChartData(); // 데이터 로드 함수 호출


	$('#employee').on('click', function (){
		console.log('클릭 되었어요!! ');
		$('#orgHeaderTransfer').empty();
		$('#orgHeaderTransfer').append('<tr><th>사번</th><th>이름</th><th>부서</th><th>직위</th><th><i class="bi bi-trash3"></i></th></tr>');

		document.getElementById('employee').classList.add('btn-primary');
		document.getElementById('employee').classList.remove('btn-outline-primary');
		document.getElementById('leave').classList.remove('btn-primary');
		document.getElementById('store').classList.remove('btn-primary');
		document.getElementById('store').classList.add('btn-outline-primary');
		document.getElementById('leave').classList.add('btn-outline-primary');

		$('#orgBodyTransfer').empty();

		selectedEmployeeIds.splice(0, selectedEmployeeIds.length);


	});

	$('#store').on('click', function (){
		$('#orgHeaderTransfer').empty();
		$('#orgHeaderTransfer').append('<tr><th>사번</th><th>이름</th><th>부서</th><th>직영점</th><th><i class="bi bi-trash3"></i></th></tr>');

		document.getElementById('store').classList.add('btn-primary');
		document.getElementById('store').classList.remove('btn-outline-primary');
		document.getElementById('leave').classList.remove('btn-primary');
		document.getElementById('employee').classList.remove('btn-primary');
		document.getElementById('employee').classList.add('btn-outline-primary');
		document.getElementById('leave').classList.add('btn-outline-primary');

		$('#orgBodyTransfer').empty();

		selectedEmployeeIds.splice(0, selectedEmployeeIds.length);
	});

	$('#leave').on('click', function (){
		console.log('클릭 되었어요!! ');
		$('#orgHeaderTransfer').empty();
		$('#orgHeaderTransfer').append('<tr><th>사번</th><th>이름</th><th>부서</th><th>직위</th><th><i class="bi bi-trash3"></i></th></tr>');

		document.getElementById('leave').classList.add('btn-primary');
		document.getElementById('leave').classList.remove('btn-outline-primary');
		document.getElementById('employee').classList.remove('btn-primary');
		document.getElementById('store').classList.remove('btn-primary');
		document.getElementById('employee').classList.add('btn-outline-primary');
		document.getElementById('store').classList.add('btn-outline-primary');

		$('#orgBodyTransfer').empty();

		selectedEmployeeIds.splice(0, selectedEmployeeIds.length);
	});

	$('#employee').trigger('click');
}



// 선택된 ID를 rows에 추가하는 함수
function addSelectedIdToRows(selectedId) {

	// 중복 확인
	if (selectedEmployeeIds.includes(selectedId)) {
		layerPopup("이미 선택된 직원입니다.", "확인", false, removeAlert, removeAlert);
		return; // 중복된 경우 함수 종료
	}

	// 중복이 아닌 경우 ID를 추가
	selectedEmployeeIds.push(selectedId);

	console.log(selectedId);
	// 인사이동, 퇴사 처리
	if(lastClickedButtonId === 'employee' || lastClickedButtonId === 'leave'){
		$.ajax({
			type: 'GET',
			url: '/ad/userTransferInfo',
			data: { selectedId: selectedId },
			success: function(response){

				console.log(response);

				var userResult = response[0];

				// `person_num`이 null인 경우 표시하지 않음
				if (!userResult.person_num) {
					console.warn("person_num이 null인 데이터는 추가되지 않습니다.");
					return;
				}

				if(lastClickedButtonId === 'employee' && userResult.old_position === 'po7'){
					layerPopup("직영점주는 선택 불가능합니다.", '확인', false, removeAlert, removeAlert);
					return;
				}
				var uniqueId = userResult.person_num;

				var hiddenInput =
						'<input type="hidden" name="old_position_' + uniqueId + '" value="' + userResult.old_position + '"/>' +
						'<input type="hidden" name="old_department_' + uniqueId + '" value="' + userResult.old_department + '"/>' +
						'<input type="hidden" name="username_' + uniqueId + '" value="' + userResult.username + '"/>';

				$('#orgBodyTransfer').append(hiddenInput);

				var deptSelect = document.createElement('select');
				deptSelect.className = 'form-select selectStyle';

				// `response` 데이터를 순회하며 `<option>` 추가
				response.forEach(function(item) {
					if (item.parent !== null && item.parent !== '' && item.text !== null && item.text !== '') {
						var option = document.createElement('option');
						option.value = item.parent;
						option.textContent = item.text;

						console.log(userResult.old_department,'는');

						if (item.parent === userResult.old_department) {
							console.log('동일한 ', item.parent);
							option.setAttribute('selected', 'selected');
						}
						deptSelect.appendChild(option);
					}
				});

				var positionSelect = document.createElement('select');
				positionSelect.className = 'form-select selectStyle';

				response.forEach(function(item){
					if(item.position !== null && item.position !== '' && item.title !== null && item.title !== '') {
						var option = document.createElement('option');
						option.value = item.position;
						option.textContent = item.title;
						positionSelect.appendChild(option);

						if(item.position === userResult.old_position){
							option.setAttribute('selected', 'selected');
						}

					}
				});

				if (lastClickedButtonId === 'leave') {
					deptSelect.setAttribute('disabled', 'disabled');
					positionSelect.setAttribute('disabled', 'disabled');
				}

				console.log("부서 선택:", deptSelect.outerHTML);
				console.log("직위 선택:", positionSelect.outerHTML);
				var cencleUser = '<div onclick="chartTableDelete(this, \'' + userResult.person_num + '\')"><i class="bi bi-trash3"></i></div>';

				var content = '<tr>' +
						'<td>' + userResult.person_num + '</td>' +
						'<td>' + userResult.name + '</td>' +
						'<td>' + deptSelect.outerHTML + '</td>' +
						'<td>' + positionSelect.outerHTML + '</td>' +
						'<td>' + cencleUser + '</td>' +
						'</tr>';

				$('#orgBodyTransfer').append(content);

			},error: function(e){
				console.log(e);
			}
		});

	}else{
		$.ajax({
			type: 'GET',
			url: '/ad/storeTransferInfo',
			data: { selectedId: selectedId },
			success: function(response){

				console.log(response);

				var userResult = response[0];
				var deptResult = response[1];

				// `person_num`이 null인 경우 표시하지 않음
				if (!userResult.person_num) {
					console.warn("person_num이 null인 데이터는 추가되지 않습니다.");
					return;
				}

				if(userResult.old_department === '' ||  userResult.old_department === null){
					layerPopup("직영점주만 선택 가능합니다.", '확인', false, removeAlert, removeAlert);
					return;
				}

				var uniqueId = userResult.person_num;

				var hiddenInput =
						'<input type="hidden" name="old_position_' + uniqueId + '" value="' + userResult.old_position + '"/>' +
						'<input type="hidden" name="old_department_' + uniqueId + '" value="' + userResult.old_department + '"/>' +
						'<input type="hidden" name="username_' + uniqueId + '" value="' + userResult.username + '"/>';

				$('#orgBodyTransfer').append(hiddenInput);

				var positionSelect = document.createElement('select');
				positionSelect.className = 'form-select selectStyle';

				// `response` 데이터를 순회하며 `<option>` 추가
				response.forEach(function(item) {
					if (item.title !== null && item.title !== '' && item.dept_name !== null && item.dept_name !== '') {
						var option = document.createElement('option');
						option.value = item.title;
						option.textContent = item.dept_name;

						console.log(userResult.old_department,'는');

						if (item.owner === userResult.username) {
							option.setAttribute('data-owner', item.owner);
						}
						var ownerInput =
								'<input type="hidden" name="owner_' + uniqueId + '_' + item.title + '" value="' + item.owner + '"/>';

						$('#orgBodyTransfer').append(ownerInput);

						if (item.title === userResult.old_position) {
							console.log('동일한 ', item.dept_name);
							option.setAttribute('selected', 'selected');
						}
						positionSelect.appendChild(option);
					}
				});

				console.log("부서 선택:", positionSelect.outerHTML);
				var cencleUser = '<div onclick="chartTableDelete(this, \'' + userResult.person_num + '\')"><i class="bi bi-trash3"></i></div>';

				var content = '<tr>' +
						'<td>' + userResult.person_num + '</td>' +
						'<td>' + userResult.name + '</td>' +
						'<td>' + deptResult.text + '</td>' +
						'<td>' + positionSelect.outerHTML + '</td>' +
						'<td>' + cencleUser + '</td>' +
						'</tr>';

				$('#orgBodyTransfer').append(content);

			},error: function(e){
				console.log(e);
			}
		});

	}

}

	 // 선택된 ID를 받아서 처리
	 getSelectId(function (selectedId) {
	     addSelectedIdToRows(selectedId);
	 });
	 
	 
	 function chartTableDelete(element, personNum) {
		    console.log('삭제 요청된 person_num:', personNum);

		    // 클릭된 버튼의 부모 행을 삭제
		    const row = element.closest('tr');
		    if (row) {
		        row.remove(); // DOM에서 행 제거
		        console.log(`DOM에서 person_num: ${personNum}인 행 삭제 완료`);
		    }

		    // exampleData.rows에서도 삭제
		    exampleData.rows = exampleData.rows.filter(function (row) {
		        return row[0] !== personNum; // row[0]은 person_num에 해당
		    });

		    console.log('삭제 후 데이터:', exampleData.rows);
		}


function transferAdd() {
	const userDto = [];

	$('#orgBodyTransfer tr').each(function () {
		const personNum = $(this).find('td:eq(0)').text().trim();
		const name = $(this).find('td:eq(1)').text().trim();
		const newDepartment = $(this).find('td:eq(2) select').val();
		const newPosition = $(this).find('td:eq(3) select').val();

		const oldPosition = $('input[name="old_position_' + personNum + '"]').val(); // 숨겨진 old_position 값
		const oldDepartment = $('input[name="old_department_' + personNum + '"]').val(); // 숨겨진 old_department 값
		const username = $('input[name="username_' + personNum + '"]').val(); // 숨겨진 username 값
		const transferDate = $('input[name="transfer_date"]').val(); // 발령일자
		const create = 'admin'; // todo - 고정 값 (로그인 사용자 정보로 수정 가능)

		const owner = $('input[name="owner_' + personNum + '_' + newPosition + '"]').val();



		userDto.push({
			person_num: personNum,
			old_position: oldPosition,
			old_department: oldDepartment,
			transfer_date: transferDate,
			username: username,
			name: name,
			new_department: newDepartment,
			new_position: newPosition,
			create: create,
			owner: owner,
		});
	});

	console.log('가공된 데이터:', userDto);

	if (lastClickedButtonId === 'employee') {
		httpVariousAjax('PUT', '/ad/setEmployeeTransfer', JSON.stringify(userDto), 'application/json');
	} else if (lastClickedButtonId === 'store') {
		console.log('여기');
		httpVariousAjax('PUT', '/ad/setStoreTransfer', JSON.stringify(userDto), 'application/json');
	} else {
		httpVariousAjax('DELETE', '/ad/userQuitDelete', JSON.stringify(userDto), 'application/json');
	}
}

function hideAndClearModal() {
	const modal = document.getElementById("chartModalBox");

	// 모달 숨기기
	modal.style.display = "none";

	selectedEmployeeIds.splice(0, selectedEmployeeIds.length);
	console.log("모달이 닫혀서 선택된 직원 목록 초기화:", selectedEmployeeIds);

	$('#orgBodyTransfer').empty();
}

// 닫기 버튼과 취소 버튼 클릭 이벤트 설정
document.getElementById("closeModal").addEventListener("click", hideAndClearModal);
document.getElementById("cancelModal").addEventListener("click", hideAndClearModal);

function httpVariousSuccess(response){
	console.log('성공 후 - ', response);
	if(response){
		layerPopup('인사이동이 완료되었습니다.', '확인', false, removeAlert, removeAlert);
		console.log('성공');
		const modal = document.getElementById("chartModalBox");
		modal.style.display = "none";
	}
}

// 시작일과 종료일 요소 가져오기
const startDateInput = document.querySelector('input[name="start_date"]');
const endDateInput = document.querySelector('input[name="end_date"]');

// 유효성 검사 함수
function validateDateRange() {
	// 두 값이 모두 있을 때만 비교
	if (startDateInput.value && endDateInput.value) {
		const startDate = new Date(startDateInput.value);
		const endDate = new Date(endDateInput.value);

		if (endDate < startDate) {
			layerPopup('시작일 이후로 입력해주세요.', '확인', false, removeAlert, removeAlert);
			endDateInput.value = ""; // 종료일 초기화
		}
	}
}

// 시작일, 종료일 둘 다 바뀔 때마다 검사
startDateInput.addEventListener("change", validateDateRange);
endDateInput.addEventListener("change", validateDateRange);

</script>

</html>