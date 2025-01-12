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
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


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
					<ul>
						<li id="firstMenu" ><a href="/us/spotManage">매장관리 홈</a></li>
						<li id="secondMenu"  ><a href="/us/partSchedule">스케줄 관리</a></li>
						<li id="secondMendu"><a href="/us/part">아르바이트 관리</a></li>
						<li id="secondMenud" class="active"><a href="/us/rest/listView">휴점</a></li>
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

									<button type="button" class="btn btn-primary" onclick="location.href='/us/rest/write'" style="float: left;">등록</button>
						
							
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