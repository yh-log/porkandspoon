<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직원 리스트</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet" href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">



<style>
	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 120px;
	}
	.form-control{
		width: 350px;
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
					<h4 class="menu-title">직원관리</h4>
					<ul>
						
						<li class="active" id="firstMenu"><a href="/ad/user/listView">직원 리스트</a></li>
						<li id="secondMenu"><a href="#">퇴사자 리스트</a></li>
					</ul>
					<div class="btn btn-primary full-size" onclick="location.href='/ad/user/writeView'"><i class="bi bi-plus-lg"></i> 직원 등록</div>
				</section>
				<!-- 등록하기 버튼 추가 필요 -->
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직원 리스트</h5>
						</div>
						<div class="cont-body"> 
							<div class="row">
								<div class="col-5 col-lg-5"></div>
								<div id="searchLayout" class="col-7 col-lg-7">
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
									<thead>
										<tr>
											<th>사번</th>
											<th>부서</th>
											<th>이름</th>
											<th>직위</th>
											<th>사내번호</th>
											<th>입사일</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody id="userList">
										
									</tbody>
								</table>
							</div>
							<div class="">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center" id="pagination"></ul>
								</nav>
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
<script>


var firstPage = 1;
var paginationInitialized = false;
var currentOption = 'all'; // 현재 활성화된 메뉴를 저장 (default: all)

// 페이지 로드 시 초기 데이터 호출
$(document).ready(function () {
    pageCall(firstPage);
});

// 직원 리스트 클릭 이벤트
$('#firstMenu').on('click', function() {
    // '직원 리스트' 활성화
    $('#firstMenu').addClass('active');
    $('#secondMenu').removeClass('active');
    currentOption = 'all'; // 현재 메뉴 설정

    // 기본 데이터 호출
    firstPage = 1;
    paginationInitialized = false;
    pageCall(firstPage, { userYn: '' }); // userYn 기본값 비움
    $('input[name="search"]').val('');
    $('#subMenuSubject').text($('#firstMenu').text());
});

// 퇴사자 리스트 클릭 이벤트
$('#secondMenu').on('click', function() {
    // '퇴사자 리스트' 활성화
    $('#secondMenu').addClass('active');
    $('#firstMenu').removeClass('active');
    currentOption = 'resigned'; // 현재 메뉴 설정

    // 퇴사자 데이터 호출
    firstPage = 1;
    paginationInitialized = false;
    pageCall(firstPage, { userYn: 'N' }); // userYn 값 전달
    $('input[name="search"]').val('');
    $('#subMenuSubject').text($('#secondMenu').text());
});

// 검색 버튼 클릭 이벤트
$('#searchBtn').on('click', function(event) {
    event.preventDefault(); // 기본 폼 동작 중지
    firstPage = 1;
    paginationInitialized = false;

    // 검색 데이터 설정
    var extraData = {};
    if (currentOption === 'resigned') {
        extraData.userYn = 'N'; // 퇴사자 필터링 유지
    }
    pageCall(firstPage, extraData); // 검색 호출


});

// 페이지 호출 함수
function pageCall(page = 1, extraData = {}) {
    var option = $('#searchOption').val();
    var keyword = $('input[name="search"]').val(); // 검색어

    // 기본 데이터 설정
    var requestData = {
        page: page || 1,    // 현재 페이지
        cnt: 10,            // 한 페이지당 항목 수
        option: option,     // 검색 옵션
        keyword: keyword    // 검색 키워드
    };

    // 추가 데이터 병합
    requestData = { ...requestData, ...extraData };


    $.ajax({
        type: 'GET',
        url: '/ad/user/list',
        data: requestData,
        datatype: 'JSON',
        success: function(response) {
            console.log("응답 데이터:", response);

            // 데이터 처리
            if (response && response.length > 0) {
                getSuccess(response); // 검색 결과를 테이블에 렌더링
            } else {
                $('#userList').html('<tr><td colspan="7">검색 결과가 없습니다.</td></tr>');
            }

			// 페이지네이션 초기화
			var totalpage = response[0]?.totalpage || 1;
			console.log('받은 totalpage:', totalpage);

			var totalPages = Math.ceil(totalpage / 10);
			console.log('계산된 총 페이지 수:', totalPages);

            if (!paginationInitialized || keyword !== '') {
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    startPage: page,
                    totalPages: totalpage,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    onPageClick: function (evt, page) {

						// 클릭 시마다 현재 모드에 맞춰 extraData를 세팅
						var extraData = {};
						if (currentOption === 'resigned') {
							extraData.userYn = 'N';
						}
                        console.log('클릭된 페이지:', page);
                        pageCall(page, extraData);
                    }
                });
                paginationInitialized = true;
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}


function getSuccess(response){
	console.log(response);

	$('#userList').empty();

	var content = '';
	response.forEach(function(item){
		content += '<tr>';
		content += '<td>' + item.person_num + '</td>';
		content += '<td>' + item.dept_name + '</td>';
		content += '<td><a href="/ad/user/detailView/' + item.username +'">' + item.name + '</a></td>';
		content += '<td>' + item.position_content + '</td>';
		content += '<td>' + item.company_num + '</td>';
		content += '<td>' + item.join_date + '</td>';

		if(item.user_yn === 'Y'){
			content += '<td><span style="color: var(--bs-primary);">재직</span></td>';
		}else{
			content += '<td><span style="color: #8C8C8C;">퇴사</span></td>';
		}

		content += '</tr>';
	});

	$('#userList').append(content);

}




</script>

</html>