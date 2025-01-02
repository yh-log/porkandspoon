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
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHR
	YTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN
	6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENv
	cmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi
	1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0c
	DovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZ
	mYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKIC
gIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYW
RvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZ
S9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQ
iCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiA
gIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2
LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKIC
AgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMT
A6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9
uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3
aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZX
NjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LT
IuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z
+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEX
FL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZL
pEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuS
Sbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxF
BRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqV
q9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnv
NdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRC
PLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN
+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4f
lQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqq
hTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

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
																	<input class="form-control form-control-sm input-test" type="text"  id="" placeholder="이름/부서/직급으로 검색 가능합니다.">
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
													<button class="btn btn-sm btn-outline-primary" id="employee">인사이동</button>
													<button class="btn btn-sm btn-outline-primary" id="store">직영점이동</button>
													<button class="btn btn-sm btn-outline-primary" id="leave">퇴사처리</button>
												</div>
											</div>
											<div class="card user-list-style">
												<table id="customTable">
										            <thead id="orgHeader">
										                <tr>
										                    
										                </tr>
										            </thead>
										            <tbody id="orgBody" class="scrollable-tbody">
										                
										            </tbody>
										            <tfoot id="orgFooter">
										                <tr>
										                    
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
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
	
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
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });

    $('#secondMenu').on('click', function () {
        currentUrl = '/ad/storeTransferList';
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });

    $('#thirdMenu').on('click', function () {
        currentUrl = '/ad/notTransferList';
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });

    // 검색 버튼 클릭 이벤트
    $('#searchBtn').on('click', function (event) {
        event.preventDefault(); // 기본 동작 중지
        resetPaginationAndFetchData(); // 페이지 초기화 및 데이터 요청
    });
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

function modelTransferOpen(){
	 modal.style.display = "block"; // 모달 열기
	 loadOrgChartData(); // 데이터 로드 함수 호출
}

// 인사이동 기능 
const initialData = {
	    headers: ['사번', '이름', '부서', '직위', '<i class="bi bi-trash3"></i>'],
	    rows: [
	    	
	    
	    ],
		footer: '<div></div>',
	};

	var exampleData = JSON.parse(JSON.stringify(initialData));

	 // 선택된 ID를 rows에 추가하는 함수
	 function addSelectedIdToRows(selectedId) {
		 
		 console.log(selectedId);
	     
		 $.ajax({
			 type: 'GET',
			 url: '/ad/userTransferInfo',
			 data: { selectedId: selectedId },
			 success: function(response){
				 
				console.log(response);
				 
				var userResult = response[0];
				 
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
	                    
	                    // 기본 선택값 설정 (old_department와 동일한 값)

	                    deptSelect.appendChild(option);
	                    
	                }
	                
	            });
	            //deptSelect.value = userResult.old_department.trim();
			    	 
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
			     
	            console.log("부서 선택:", deptSelect.outerHTML);
	            console.log("직위 선택:", positionSelect.outerHTML);
	            var cencleUser = '<div onclick="chartTableDelete(this, \'' + userResult.person_num + '\')"><i class="bi bi-trash3"></i></div>';
	            
	            var setUsetInfo = '<input type="hidden" name="old_position" value="'+userResult.old_position+'"/><input type="hidden" name="old_department" value="'+ userResult.old_department +'"/><input type="hidden" name="username" value="'+ userResult.username +'"/>' + userResult.person_num;
				 
			     // 새로운 row 데이터 생성 outerHTML 이거를 추가해줘야 DOM 요소를 HTML 문자열로 변환해준다! 
			     const newRow = [setUsetInfo, userResult.name, deptSelect.outerHTML, positionSelect.outerHTML, cencleUser];
		
			     // 기존 rows에 추가
			     exampleData.rows.push(newRow);
		
			     // 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
			     updateTableData('customTable', exampleData);
				 
			 },error: function(e){
				 console.log(e);
			 }
		 
			 
		 });

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


	 function transferAdd(){
		 
		 const userDto = exampleData.rows.map(row => {
			    const container = document.createElement('div');
			    container.innerHTML = row[0]; // row[0]의 HTML 문자열을 DOM으로 변환

			    const oldPosition = container.querySelector('input[name="old_position"]').value;
			    const oldDepartment = container.querySelector('input[name="old_department"]').value;
			    const userName = container.querySelector('input[name="username"]').value;
			    const personNum = container.textContent.trim(); // HTML 외 텍스트 값(person_num)
			    const transferDate = $('input[name="transfer_date"]').val();

			    return {
			        person_num: personNum,
			        old_position: oldPosition,
			        old_department: oldDepartment,
			        transfer_date: transferDate,
			        username: userName,
			        name: row[1],
			        new_department: $(row[2]).val(),
			        new_position: $(row[3]).val(),
			        type: lastClickedButtonId,
			        create: 'admin',
			    }; // todo - 나중에 로그인한 아이디로 create 넣기
			});
		 
		 console.log('가공', userDto);
		 
		
		// httpVariousAjax('PUT', '/ad/setEmployeeTransfer', JSON.stringify(userDto), 'application/json');
		 httpVariousAjax('DELETE', '/ad/userQuitDelete', JSON.stringify(userDto), 'application/json');
		 
	 }
</script>

</html>