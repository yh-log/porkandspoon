
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직영점 리스트</title>

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
	.rowContainer{
		--bs-gutter-x: 1.5rem;
		--bs-gutter-y: 0;
		display: flex;
		flex-wrap: nowrap;
		margin-top: calc(-1* var(--bs-gutter-y));
		margin-right: calc(-.5* var(--bs-gutter-x));
		margin-left: calc(-.5* var(--bs-gutter-x));
		align-items: center;
	}

	.searchLayout{
		display: flex;
		align-items: center; /* 세로 중앙 정렬 */
		justify-content: end; /* 가로 중앙 정렬 */
		gap: 10px; /* 요소 간 간격 */
		margin-left: 150px;
	}
	
	.selectStyle{
		width: 120px;
	}
	.form-control{
		width: 350px;
	}
	
	#filterLayout{
		display: flex;
	    align-items: end;
	    gap: 20px;
	    margin-bottom: 10px;
		font-weight: 500;
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
						<li id="firstMenu"><a href="/ma/dept/listView">브랜드 리스트</a></li>
						<li id="secondMenu" class="active" i><a href="/ma/store/list">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직영점</h5>
						</div>
						<div class="cont-body"> 
							<div class="rowContainer">
								<div class="col-5 col-lg-5" id="filterLayout">
									<sec:authorize access="hasAnyRole('ADMIN', 'SUPERADMIN')">
										<span onclick="listCall('/ma/store/getList')">리스트</span>
										<span onclick="listCall('/ad/store/createList')">생성요청</span>
										<span onclick="listCall('/ad/store/deleteList')">삭제요청</span>
									</sec:authorize>
								</div>
								<div class="searchLayout" class="col-7 col-lg-7">
									<select class="form-select selectStyle" id="searchOption">
										<option value="dept">직영점명</option>
										<option value="name">이름</option>
									</select>
									<input type="text" name="search" class="form-control" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary" id="searchBtn"><i class="bi bi-search"></i></button>
								</div>
							</div>
							<div class="col-12 col-lg-12">
								<table>
									<thead id="listHead">
										
									</thead>
									<tbody id="listBody">
										
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
<script src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	
<script src='/resources/js/common.js'></script>
<script>

var firstPage = 1;
var paginationInitialized = false;
var currentUrl = ''; // 현재 URL을 저장하는 전역 변수
var currentOption = 'all';

$(document).ready(function () {
    // 페이지 로드 시 첫 번째 메뉴 클릭 트리거
	listCall('/ma/store/getList');
});


// URL 변경 및 페이지 호출
function listCall(url) {
    currentUrl = url; // 전역 변수에 URL 저장
    console.log("listCall 호출 URL:", currentUrl);

	// 페이징 초기화 (기존 페이징 제거)
	firstPage = 1; // 첫 페이지로 초기화
	paginationInitialized = false; // 페이징 초기화
	$('#pagination').twbsPagination('destroy');

	$('input[name="search"]').val('');

    pageCall(firstPage); // 첫 페이지 호출
}

// 검색 폼 제출 시 AJAX 호출
$('#searchBtn').on('click', function(event) {
    event.preventDefault(); // 기본 동작 중지
    firstPage = 1;
    paginationInitialized = false;

    if (!currentUrl) {
        console.error("현재 URL이 설정되지 않았습니다.");
        return;
    }

    pageCall(firstPage); // 저장된 currentUrl로 페이지 호출
});

// 페이지 호출 함수
function pageCall(page = 1) {
    var option = $('#searchOption').val(); // 검색 옵션 (부서/이름)
    var keyword = $('input[name="search"]').val(); // 검색어

    if (!currentUrl) {
        console.error('URL이 설정되지 않았습니다.');
        return;
    }

    $.ajax({
        type: 'GET',
        url: currentUrl, // 항상 전역 변수의 URL 사용
        data: {
            'page': page || 1, // 페이지 기본값 설정
            'cnt': 10,         // 한 페이지당 항목 수
            'option': option,
            'keyword': keyword // 검색어
        },
        datatype: 'JSON',
        success: function(response) {
            console.log("응답 데이터:", response);

            // 데이터 처리
            if (response && response.length > 0) {
                getSuccess(response); // 검색 결과를 테이블에 렌더링
            } else {
                console.log('검색 결과가 없습니다.');
                getSuccess(response);
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
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    onPageClick: function(evt, page) {
                        console.log('클릭된 페이지:', page);
                        pageCall(page); // 클릭한 페이지 호출
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

function getSuccess(response) {
    console.log(response);

    // 기존 내용 초기화
    $('#listHead').empty(); // 헤더 초기화
    $('#listBody').empty(); // 바디 초기화

    if (response && response.length > 0) {
        var typeCheck = response[0];

        // 브랜드 리스트 출력
        if (typeCheck.type === "S") {
            console.log('직영점리스트');

            var headContent = '<tr><th>직영점코드</th><th>직영점명</th><th>직영점주</th><th>시행일</th><th>휴점</th><th>활성</th></tr>';
            $('#listHead').append(headContent);
            
            var content = '';

            // 테이블 데이터 추가
            response.forEach(function (item) {
                content += '<tr>';
                content += '<td>' + item.id + '</td>';
                content += '<td><a href="/ma/store/detail/'+item.id+'"/>' + item.text + ' ' + item.name + '</a></td>';
                content += '<td>' + item.owner + '</td>';
                content += '<td>' + item.use_date + '</td>';
                
                if (item.is_close === "N") {
                    content += '<td><span style="color: #10620A;">운영</span></td>';
                } else {
                    content += '<td><span style="color: #8C8C8C;">휴점</span></td>';
                }

                if (item.use_yn === "Y") {
                    content += '<td><span style="color: #10620A;">활성</span></td>';
                } else {
                    content += '<td><span style="color: #8C8C8C;">비활성</span></td>';
                }

                content += '</tr>';
            });
            $('#listBody').append(content);
        } else{
        	var headContent = '<tr><th>no</th><th colspan="2">문서제목</th><th>브랜드명</th><th>작성자</th><th>결재일</th></tr>';
            $('#listHead').append(headContent);
            var content = '';

            // 테이블 데이터 추가
            response.forEach(function (item) {
            	content += '<tr>';
                content += '<td>' + item.draft_idx + '</td>';
                content += '<td colspan="2"><a href="/ad/store/write/'+item.draft_idx+'"/>' + item.subject + '</a></td>';
                content += '<td>' + item.name + '</td>';
                content += '<td>' + item.user_name + ' ' + item.content + '</td>';
                
                var date = item.approval_date ? item.approval_date.split(' ')[0] : '-';
                
                content += '<td>' + date + '</td>';
                content += '</tr>';
            });
            
            $('#listBody').append(content);
        }
        
        
        
    } else {
        // 검색 결과가 없는 경우
        var noResultContent = '<tr><td colspan="6" class="text-center">검색 결과가 없습니다.</td></tr>';
        $('#listBody').append(noResultContent);
    }
}



</script>

</html>