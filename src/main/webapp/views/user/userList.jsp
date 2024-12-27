<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직원 리스트</title>

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


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
						
						<li class="active" id="firstMenu"><a href="#">직원 리스트</a></li>
						<li id="secondMenu"><a href="#">퇴사자 리스트</a></li>
					</ul>
					<div class="btn btn-primary full-size"><i class="bi bi-plus-lg"></i> 직원 등록</div>
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

$(document).ready(function () {
	pageCall(firstPage);
});


// 검색 폼 제출 시 AJAX 호출
$('#searchBtn').on('click', function(event) {
    event.preventDefault();  // 폼 제출 기본 동작 중지
    firstPage = 1;
    paginationInitialized = false;
    pageCall(firstPage);  // 검색어가 추가된 상태에서 호출
});


$('#secondMenu').on('click', function() {
	console.log('실행');
    firstPage = 1;
    paginationInitialized = false;

    // 특정 옵션과 키워드를 설정하여 pageCall 호출
    pageCall(firstPage, {
        option: 'user_yn', // 추가 옵션
        keyword: 'Y'       // 추가 키워드
    });
});


function pageCall(page = 1,  extraData = {}) {
    var option = $('#searchOption').val();
    var keyword = $('input[name="search"]').val();  // 검색어

    $.ajax({
        type: 'GET',
        url: '/ad/user/list',
        data: {
            'page': page || 1, // 페이지 기본값 설정
            'cnt': 10,         // 한 페이지당 항목 수
            'option': option,
            'keyword': keyword  // 검색어
        },
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
            var totalPages = response[0]?.totalpage || 1; // 서버에서 받은 totalpage

            if (!paginationInitialized || keyword !== '') {
                $('#pagination').twbsPagination('destroy');
                $('#pagination').twbsPagination({
                    startPage: page,
                    totalPages: totalPages,
                    visiblePages: 10,
                    initiateStartPageClick: false,
                    onPageClick: function (evt, page) {
                        console.log('클릭된 페이지:', page);
                        pageCall(page);
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
		content += '<td>' + item.name + '</td>';
		content += '<td>' + item.position_content + '</td>';
		content += '<td>' + item.company_num + '</td>';
		content += '<td>' + item.join_date + '</td>';
		
		if(item.user_yn === 'N'){
			content += '<td><p class="btn icon btn-success" style="margin:0px 5px;">재직</p></td>';			
		}else{
			content += '<td><p class="btn icon btn-danger" style="margin:0px 5px;">퇴사</p></td>';						
		}
		
		content += '</tr>';
	});
	
	$('#userList').append(content);
	
}




</script>

</html>