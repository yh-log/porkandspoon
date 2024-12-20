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

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 조직도 노드 -->
<script src='/resources/js/jstree.js'></script>

</head>
<style>
	.chart {
		width: 100%;
		height: 600px;
	}
	
	/* 조직도 모달 */
	#modal .modal-cont-chart {
	    width: 800px;
	    height: 500px;
	    top: 20%;
	}
	
	.chart-btn {
		width: 100%;
	    height: 100%;
	    background-color: white;
	    border: white;
	}
	
	.chart-mybtn {
		width: 100%;
	    height: 100%;
	    background-color: white;
	    border: white;
	}
</style>
<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">
	   <jsp:include page="../sidebar.jsp" />
	   <div id="main">
	      <jsp:include page="../header.jsp" />
	      <div class="page-content">
	         <section id="menu">
	            <h4 class="menu-title">조직도</h4>
	         </section>
	         <section class="cont">
	            <div class="col-12 col-lg-12">
	               <div class="tit-area">
	                  <h5>조직도 리스트</h5>
	               </div>
	               <div class="cont-body">
	               <button class="btnModal btn btn-primary">모달 열기</button>
	               <div id="modal" class="modal">
						<div class="modal-cont modal-cont-chart">
							<span class="close">&times;</span>
							<div id="modal-body">
								<h3>조직도</h3>
								<div class="col-12 col-lg-12">
									<div class="row">
										<div class="col-sm-4">
												<div class="card">
													<table>
														<thead></thead>
														<tbody>
															<tr>
																<td class="chart-btn-td"><button class="chart-btn">조직도</button></td>
																<td class="chart-mybtn-td"><button class="chart-mybtn">나의 결재선</button></td>
															</tr>
															<tr>
																<td>
																	<div class="jstree" id="jstree"></div>
																	<div class="myjstree" id="myjstree">테스트</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
										</div>
										<div class="col-sm-8"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
	                     
	               </div>
	            </div>
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

<script>
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
	
	$('.btn-popup').on(
			'click',
			function() {
				layerPopup('~~~하시겠습니까?222', '확인2', '취소2', secondBtn1Act,
						secondBtn2Act);
			});
	
	/* 모달(임시) */
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});
	
	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	/* 처음 조직도 모달창 켰을 때 조직도, 조직도 td 색변경만 보이게 / 나의 결재선 숨김처리 */
	$('#myjstree').hide();
	$('.chart-btn-td').css({'border-bottom': '1px solid gray'});
	
	/* 조직도 버튼 클릭 시 조직도 버튼 show 나의 결재선 hide */
	$('.chart-btn').on('click', function(){
		
		/* 다른 td 스타일 초기화 */
		$('td').css({
	        'border-bottom': 'none', 
	        'font-weight': 'normal'
	    });
		
		$('#jstree').show();
		
		$('#myjstree').hide();
		
		/* 클릭된 버튼의 td 스타일 변경 */
		$(this).closest('td').css({
	        'border-bottom': '1px solid gray', 
	    });
	})
	
	/* 나의 결재선 버튼 클릭 시 나의 결재선 show 조직도 버튼 hide */
	$('.chart-mybtn').on('click', function() {
		
		/* 다른 td 스타일 초기화 */
		$('td').css({
	        'border-bottom': 'none', 
	        'font-weight': 'normal'
	    });
		
		$('#myjstree').show();
		
		$('#jstree').hide();
		
		/* 클릭된 버튼의 td 스타일 변경 */
		$(this).closest('td').css({
	        'border-bottom': '1px solid gray', 
	    });
	})
</script>

</html>