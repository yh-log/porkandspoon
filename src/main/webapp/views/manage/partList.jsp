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

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

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

<style >
	.tit-area{
		display: flex; 
	}
	
	#home,#schedule{
		width: 185px;
		margin-left: -10px;
	}
	
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.content{
		display: flex; 
		align-content: cetner;
		border: 1px solid black;
	}
	
	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 20%;
	}
	.form-control{
		width: 350px;
	}
	.pagination {
    justify-content: center; /* 페이지네이션 중앙 정렬 */
	}
	
	 .filter-option {
    cursor: pointer;
    padding: 10px 15px;
    transition: all 0.3s ease;
    text-align: left;
    display: inline-block;
    font-weight: normal; /* 기본 글씨 두께 */
}

.filter-option.active {
    font-weight: bold; /* 활성화된 버튼은 두꺼운 글씨 */
    border-radius: 5px; /* 선택된 버튼 스타일 */
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
						<li ><a href="/us/spotManage">매장관리 홈</a></li>
						<li ><a href="/us/partSchedule">스케줄관리</a></li>
						<li class="active"><a href="/us/part">아르바이트 관리</a></li>
						<li><a href="/us/rest/listView">휴점신청</a></li>
					</ul>
					<div class="buttons">							
						<button class="btn btn-primary" id="schedule" onclick="location.href='/us/part/Write'">등록하기</button>
					</div>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>아르바이트 관리</h5>
						</div>
						<div class="cont-body">
							<div class="row">
							
								<div class="col-5 col-lg-5">
								
								 <div style="display: flex; gap: 10px;">								 
									<span class="filter-option active" data-filter="all">전체</span>
								    <span class="filter-option" data-filter="N">재직자</span>
								    <span class="filter-option" data-filter="Y">퇴사자</span>
								 </div>
								</div>
								<div id="searchLayout"  class="col-7 col-lg-7">
										<select id="searchOption" class="form-select selectStyle">
										<option value="name">이름</option>
									</select>
									<input type="text" id="searchKeyword" name="search" class="form-control search" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary"><i class="bi bi-search" ></i></button>
								</div>
							</div>
							<div class="row">
							<div class="col-12 col-lg-12">
							<table>
								<colgroup>
									<col>
									<col >
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>이름</th>
										<th >나이</th>
										<th>직영점이름</th>
										<th>입사일</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody id="list">
									
								</tbody>
								
						             
							</table>
				                <nav aria-label="Page navigation">
				                 <ul class="pagination" id="pagination"></ul>
				                </nav>
							
							</div>
							</div>
						</div> 
					</div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
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





<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script>
var show = 1;
var count = 10; // 한 페이지당 항목 수
var url = '/us/part/List'; // 서버 요청 URL
var paginationInitialized = false;
var currentFilter = "all"; // 초기 필터는 "전체"

$(document).ready(function () {

	    // 필터 버튼 클릭 이벤트
	    $('.filter-option').on('click', function () {
	        $('.filter-option').removeClass('active'); // 모든 필터 버튼에서 active 제거
	        $(this).addClass('active'); // 클릭된 필터 버튼에 active 추가

	        currentFilter = $(this).data('filter'); // 선택된 필터 값 가져오기
	        pageCall(1); // 첫 페이지 호출
	    });

    
    // 검색 버튼 클릭 이벤트 추가
    $('.btn-primary').on('click', function () {
        pageCall(1); // 첫 번째 페이지에서 검색 시작
    });

    // Enter 키로도 검색 가능하도록 처리
    $('#searchKeyword').on('keypress', function (e) {
        if (e.which === 13) { // Enter 키 코드
            pageCall(1);
        }
    });
    
    pageCall(show); // 초기 페이지 호출
    
    
});

function pageCall(pg) {
	console.log(pg);
    var keyword = $('#searchKeyword').val(); // 검색어
    var opt = $('#searchOption').val(); // 검색 옵션
    var isQuit = currentFilter; // 필터 값 그대로 사용 ("all", "N", "Y")
	
    
    console.log("상태값이 뭐냐!!!!1"+isQuit);
    var requestData = {
        pg: pg,
        count: count,
        opt: opt,
        keyword: keyword,
        is_quit: isQuit
    };

    $.ajax({
        type: 'GET',
        url: url,
        data: requestData,
        dataType: 'JSON',
        success: function (data) {
            console.log(data);
            renderList(data.list);

            if (paginationInitialized) {
                $('#pagination').twbsPagination('destroy'); // 기존 페이지네이션 제거
            }

            if (data.totalPages > 0) {
                $('#pagination').twbsPagination({
                    totalPages: data.totalPages,
                    visiblePages: 10,
                    startPage: pg,
                    initiateStartPageClick: false,
                    onPageClick: function (evt, pg) {
                        pageCall(pg);
                    }
                });
                paginationInitialized = true;
            } else {
                paginationInitialized = false;
            }
        },
        error: function (e) {
            console.error(e);
        }
    });
}

function renderList(list) {
    var content = '';
    if (list.length === 0) {
        content = '<tr><td colspan="5" style="text-align: center;">데이터가 없습니다.</td></tr>';
    } else {
        for (var view of list) {
            content += '<tr>';
            content += '<td><a href="/us/part/Detail/'+view.part_idx + '" style="text-decoration: none; color: #000000; cursor: pointer;">' + view.name + '</a></td>';
            content += '<td>' + view.birth + '</td>';
            content += '<td>' + view.spotName + '</td>';
            content += '<td>' + view.join_date + '</td>';
            content += '<td><i class="bi bi-trash" onclick="delPart(' + view.part_idx + ')"></i></td>';

            content += '</tr>';
        }
    }
    $('#list').html(content);
}
	
function delPart(part_idx) {
    const csrfToken = $('meta[name="_csrf"]').attr('content'); // CSRF 토큰 가져오기
    const csrfHeader = $('meta[name="_csrf_header"]').attr('content'); // CSRF 헤더 가져오기

    layerPopup(
        "아르바이트생 정보를 삭제하겠습니까?", // 팝업 내용
        "확인", // 확인 버튼 텍스트
        "취소", // 취소 버튼 텍스트
        function () { // 확인 버튼 클릭 시 실행할 콜백 함수
            $.ajax({
                type: 'DELETE', // 삭제 요청
                url: '/us/part/Delete/' + part_idx, // 삭제 URL (idx 포함)
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(csrfHeader, csrfToken); // CSRF 헤더 설정
                },
                success: function (response) {
                	console.log("삭제성공!");
                   
                    btn1Act();
                    pageCall(1); // 삭제 후 첫 페이지 호출
                },
                error: function (e) {
                    console.error(e);
                    alert('삭제 권한이 없거나, 오류가 발생했습니다.');
                }
            });
        },
        btn2Act // 취소 버튼 클릭 시 실행할 콜백 함수
    );
}


function btn1Act() {
	// 1번버튼 클릭시 수행할 내용
	console.log('1번 버튼 동작');

	// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
	removeAlert(); // 기존팝업닫기
	// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
	layerPopup("삭제 되었습니다.", "확인", false, secondBtn1Act, secondBtn2Act);
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
}

function secondBtn2Act() {
	// 두번째팝업 2번버튼 클릭시 수행할 내용
	console.log('두번째팝업 2번 버튼 동작');
	removeAlert(); // 팝업닫기
}


</script>

</html>