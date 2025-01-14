<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>출장 리스트</title>

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
	
	#filterLayout{
		display: flex;
	    align-items: end;
	    gap: 20px;
	    margin-bottom: 10px;
	}

	a{
		color: white;
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
					<h4 class="menu-title">나의 정보</h4>
					<ul>
						<li id="firstMenu"><a href="/myPageView">나의 정보</a></li>
						<li id="secondMenu" class="active" ><a href="/trip/listView">출장</a></li>
						<li id="secondMendu"><a href="/myPageSign">서명 관리</a></li>
						<li id="secondMenud"><a href="/myPageBuy">구매기록</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">출장</h5>
						</div>
						<div class="cont-body"> 
								<div id="searchLayout">
									<select class="form-select selectStyle" id="searchOption">
										<option value="subject">제목</option>
									</select>
									<input type="text" name="search" class="form-control" placeholder="검색내용을 입력하세요" width="80%"/>
									<button class="btn btn-primary" id="searchBtn"><i class="bi bi-search"></i></button>
								</div>
							<div class="col-12 col-lg-12">
								<table>
									<thead>
										<tr>
											<th>no</th>
											<th colspan="2">제목</th>
											<th>시작 일시</th>
											<th>종료 일시</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody id="tripList">

									</tbody>
								</table>
							</div>
							<div class="">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center" id="pagination"></ul>
								</nav>
							</div>
							<div class="btn-trip"><a href="/trip/write" class="btn btn-primary" style="color: white;">등록</a></div>
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
	
<%--<script src='/resources/js/common.js'></script>--%>
<script>


	var firstnewPage = 1;
	var paginationInitialized = false;

	$(document).ready(function () {
		pageCall(firstnewPage);
	});


	// 검색 버튼 클릭 이벤트
	$('#searchBtn').on('click', function(event) {
		event.preventDefault(); // 기본 폼 동작 중지
		paginationInitialized = false;

		firstnewPage = 1;
		pageCall(firstnewPage); // 검색 호출
	});

	function pageCall(page = 1) {

		console.log('실행');
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
			url: '/trip/list',
			data: requestData,
			datatype: 'JSON',
			success: function(response) {
				console.log("응답 데이터:", response);

				// 데이터 처리
				if (response && response.length > 0) {
					getSuccess(response); // 검색 결과를 테이블에 렌더링
				} else {
					$('#tripList').html('<tr><td colspan="6">검색 결과가 없습니다.</td></tr>');
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

		$('#tripList').empty();

		var content = '';
		response.forEach(function(item){
			content += '<tr>';
			content += '<td>' + item.schedule_idx + '</td>';
			content += '<td colspan="2"><a href="/trip/detail/' + item.schedule_idx+  '" >' + item.subject + '</a></td>';

			let start_date = item.start_date.slice(0, -3);
			let end_date = item.end_date.slice(0, -3);

			content += '<td>' + start_date + '</td>';
			content += '<td>' + end_date + '</td>';

			let create_date = item.create_date.split(" ");

			content += '<td>' + create_date[0] + '</td>';

			content += '</tr>';
		});

		$('#tripList').append(content);

	}

</script>

</html>