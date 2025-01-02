
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직영점 리스트</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<style>
	.searchLayout{
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
	
	#filterLayout{
		display: flex;
	    align-items: end;
	    gap: 20px;
	    margin-bottom: 10px;
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
						<li id="firstMenu"><a href="#">브랜드 리스트</a></li>
						<li id="secondMenu" class="active" i><a href="/ad/store/list">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직영점</h5>
						</div>
						<div class="cont-body"> 
							<div class="row">
								<div class="col-5 col-lg-5" id="filterLayout">
									<span onclick="listCall('/ad/store/getList')">리스트</span>
									<span onclick="listCall('/ad/store/createList')">생성요청</span>
									<span onclick="listCall('/ad/store/deleteList')">삭제요청</span>
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
var currentUrl = ''; // 현재 URL을 저장하는 전역 변수
var currentOption = 'all';

$(document).ready(function () {
    // 페이지 로드 시 첫 번째 메뉴 클릭 트리거
	listCall('/ad/store/getList');
});


// URL 변경 및 페이지 호출
function listCall(url) {
    currentUrl = url; // 전역 변수에 URL 저장
    console.log("listCall 호출 URL:", currentUrl);
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
            var totalPages = response[0]?.totalpage || 1; // 서버에서 받은 totalpage
            console.log('총 페이지 수:', totalPages);

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
                content += '<td><a href="/ad/store/detail/'+item.id+'"/>' + item.text + ' ' + item.name + '</a></td>';
                content += '<td>' + item.name + '</td>';
                content += '<td>' + item.use_date + '</td>';
                
                if (item.is_close === "N") {
                    content += '<td><button class="btn icon btn-success" style="margin:0px 5px;">운영</button></td>';
                } else {
                    content += '<td><button class="btn icon btn-light" style="margin:0px 5px;">휴점</button></td>';
                }

                if (item.use_yn === "Y") {
                    content += '<td><button class="btn icon btn-success" style="margin:0px 5px;">활성</button></td>';
                } else {
                    content += '<td><button class="btn icon btn-light" style="margin:0px 5px;">비활성</button></td>';
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