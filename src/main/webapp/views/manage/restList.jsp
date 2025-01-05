<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>휴점 목록</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHR
	YTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN
	6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENv
	cmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi
	1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0c
	ovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmY
	vMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIH
	htbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYW
	RvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVH
	lwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2l
	vbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlb
	d0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6W
	VJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJz
	UkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZ
	XRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPg
	ogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZm
	aW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgIC
	A8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldG
	E+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hIS
	NGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ
	2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2
	IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0Snq
	slRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvu
	SSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBG
	IefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT
	/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psG
	TWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCR
	IYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29px
	bpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8iv
	YAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B
	4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW
	8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png"> <!-- todo - base 64 디코더 추후 검토 -->


<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<style >
	.tit-area{
		display: flex; 
	}

	#home, #schedule{
		width: 200px;
		margin-top: 10px;
		margin-bottom: 10px;
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
		width: 15%;
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
					<h4 class="menu-title">매장관리</h4>
					<button class="btn btn-outline-primary" id="home" onclick="location.href='/ad/spotManage'">매장관리 홈</button>
					<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/rest/Write'">휴점 등록</button>
					<ul>
						<li><a href="/ad/part/List">아르바이트 관리</a></li>
						<li class="active"><a href="/ad/rest/List">휴점신청</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>휴점 리스트</h5>
						</div>
						<div class="cont-body">
							<div class="row">
								<div class="col-5 col-lg-5"></div>
								<div id="searchLayout" class="col-7 col-lg-7">
									<select class="form-select selectStyle" id="searchOption">
										<option value="dept">부서</option>
										<option value="name">이름</option>
										<option value="subject">제목</option>
									</select>
									<input type="text" name="search" class="form-control" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary" id="searchBtn"><i class="bi bi-search"></i></button>
								</div>
							</div>
							<div class="row">
								<div class="col-12 col-lg-12">
									<table>

										<thead>
											<tr>
												<th style="width: 10%;">no</th>
												<th colspan="2">직영점명</th>
												<th>직영점주</th>
												<th colspan="2">휴점 명</th>
												<th colspan="2">휴점기간</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody id="restContent">

										</tbody>
									</table>
									<div class="">
										<nav aria-label="Page navigation">
											<ul class="pagination justify-content-center" id="pagination"></ul>
										</nav>
									</div>
						
							
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

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<script src='/resources/js/common.js'></script>
<script>
	var firstPage = 1;
	var paginationInitialized = false;

	// 페이지 로드 시 초기 데이터 호출
	$(document).ready(function () {
		pageCall(firstPage);
	});

	$('#searchBtn').on('click', function(event) {
		event.preventDefault(); // 기본 동작 중지
		firstPage = 1;
		paginationInitialized = false;

		pageCall(firstPage); // 저장된 currentUrl로 페이지 호출
	});

	function pageCall(page = 1) {
		var option = $('#searchOption').val();
		var keyword = $('input[name="search"]').val(); // 검색어

		// 기본 데이터 설정
		var requestData = {
			page: page || 1,    // 현재 페이지
			cnt: 10,            // 한 페이지당 항목 수
			option: option,     // 검색 옵션
			keyword: keyword    // 검색 키워드
		};

		$.ajax({
			type: 'GET',
			url: '/us/rest/list',
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
				var totalPages = response[0]?.totalpage || 1; // 서버에서 받은 totalpage

				var totalPage = Math.ceil(totalPages / 10);

				console.log('총 페이지 수:', totalPage);

				if (!paginationInitialized || keyword !== '') {
					$('#pagination').twbsPagination('destroy');
					$('#pagination').twbsPagination({
						startPage: page,
						totalPages: totalPage,
						visiblePages: 5,
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


	function getSuccess(response) {
		console.log(response);

		$('#restContent').empty();

		var content = '';
		response.forEach(function (item) {
			content += '<tr>';
			content += '<td>' + item.rest_idx + '</td>';
			content += '<td colspan="2"><a href="/us/rest/detail/' + item.rest_idx + '">' + item.dept_name + item.store_name + '</a></td>';
			content += '<td>' + item.name + '</td>';
			content += '<td colspan="2"><a href="/us/rest/detail/' + item.rest_idx + '">' + item.subject + '</a></td>';
			content += '<td colspan="2">' + item.start_date + ' ~ ' + item.end_date + '</td>';
			content += '<td>' + item.type + '</td>';
			content += '</tr>';
		});

		$('#restContent').append(content);

	}

</script>

</html>