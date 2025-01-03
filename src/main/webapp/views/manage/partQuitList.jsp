<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<style >
	.tit-area{
		display: flex; 
	}
	
	#home,#schedule{
		width: 200px;
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
						<li ><a href="/ad/spotManage">매장관리 홈</a></li>
						<li ><a href="/ad/partSchdule">스케줄관리</a></li>
						<li class="active"><a href="/ad/partQuit">아르바이트 관리</a></li>
						<li><a href="/ad/rest/List">휴점신청</a></li>
					</ul>
					<div class="buttons">							
						<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/part/Write'">등록하기</button>
					</div>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>아르바이트 관리</h5>
						</div>
						<div class="cont-body">
							<div class="row">
								<h5><a onclick="location.href='/ad/part'">재직자 리스트 보러가기</a></h5>
								<div class="col-5 col-lg-5"></div>
								<div id="searchLayout"  class="col-7 col-lg-7">
									<select id="searchOption" class="form-select selectStyle">
										<option value="name">이름</option>
									</select>
									<input type="text" id="searchKeyword" name="search" class="form-control search" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary"><i class="bi bi-search"></i></button>
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
										<th>퇴사일</th>
										<th></th>
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
var url = '/ad/part/QuitList'; // 서버 요청 URL
var paginationInitialized = false;

$(document).ready(function () {
    pageCall(show); // 초기 페이지 호출

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
});

function pageCall(pg) {
	console.log(pg);
    var keyword = $('#searchKeyword').val(); // 검색어
    var opt = $('#searchOption').val(); // 검색 옵션

    var requestData = {
        pg: pg,
        count: count,
        opt: opt,
        keyword: keyword
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
            content += '<td><a href="/ad/part/Detail/'+view.part_idx + '" style="text-decoration: none; color: #000000; cursor: pointer;">' + view.name + '</a></td>';
            content += '<td>' + view.birth + '</td>';
            content += '<td>' + view.spotName + '</td>';
            content += '<td>' + view.quit_date + '</td>';
            content += '<td><i class="bi bi-trash" ></i></td>';
            content += '</tr>';
        }
    }
    $('#list').html(content);
}
	


</script>

</html>