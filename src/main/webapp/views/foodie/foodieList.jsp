<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	
	<!-- rating.js(별점) -->
	<link rel="stylesheet"
		href="/resources/assets/extensions/rater-js/lib/style.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">
	
	
	<!-- 카카오맵 키 -->
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d1b7cd884610b0da5809195298922af8&libraries=services"></script>
	<meta name="_csrf" content="${_csrf.token}">
 	<meta name="_csrf_header" content="${_csrf.headerName}"> 
</head>
<style>
	.btn-write {
 	    width: 163px;
	    height: 40px;
	    text-align: center;
	    margin-top: 30px;
	 }
	
	#modal .foodie-write {
	    width: 600px;
	    height: 530px;
	    top: 200px;
	}
	
 	.item:hover {
		background-color: #f0f0f0; /* 연한 회색 */
	    cursor: pointer;          /* 클릭 가능한 상태 */
	    transition: background-color 0.2s ease; /* 부드러운 색상 변화 효과 */
	}
	
	#review {
		width: 100%;
	    height: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 996;
	    background: rgba(0, 0, 0, 0.6);
	    display: block;
	}
	
	.review-modal {
	    position: absolute;
	    left: 50%;
	    top: 160px;
	    transform: translateX(-50%);
	    width: 600px;
	    height: 650px;
	    padding: 30px;
	    background: #fff;
	    border: none;
	    border-radius: 8px;
	}
	
	.content-review {
		text-align: left;
	}
	
	.trash {
		text-align: right;
	}
	
	.review-write-modal {
	    border: 1px solid #d3d3d3;
	    position: absolute;
	    left: 50%;
	    top: 246px;
	    transform: translateX(-50%);
	    width: 550px;
	    height: 400px;
	    padding: 30px;
	    background: #fff;
	    border-radius: 8px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}
	
	#review-write {
		width: 100%;
	    height: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 996;
	    display: block;
	}
	
	.custom-infowindow {
	    padding: 10px;
	    border-radius: 10px;
	    background: var(--bs-primary);
	    color: white;
	    font-weight: bold;
	    border: 2px solid #007BFF;
	    text-align: center;
	    box-shadow: 0 2px 10px rgba(0,0,0,0.2);
	}

	.foodie-filter-div {
	    position: absolute;
	    top: 27%;
	    left: 37%;
	    transform: translate(-50%, -50%);
	    z-index: 500;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    gap: 10px;
	    }
	
	.custom-infowindow:hover {
	    background: #0056b3;
	    border-color: #0056b3;
	}
	
	.radio-filter {
	    display: none;
	}
	
	.radio-btn {
        display: inline-block;
        padding: 10px 20px;
        border: 2px solid #435ebe;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        background-color: white;
        color: #007BFF;
        text-align: center;
        margin: 5px;
        transition: all 0.3s;
    }
    
    .radio-group input[type="radio"]:checked + .radio-btn {
        background-color: #435ebe;
        color: white;
        border-color: #435ebe;
    }

    .radio-btn:hover {
        background-color: #e7f1ff;
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
	            <h4 class="menu-title">맛집 지도</h4>
				<a onclick="foodie-write()" class="btnModal btn btn-primary btn-write">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit">
						<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
						<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
					</svg>
					맛집 등록
				</a>
	         </section>
	         <section class="cont">
	            <div class="col-12 col-lg-12">
	               <div class="tit-area">
	                  <h5>맛집 리스트</h5>
	               </div>
	               <div class="cont-body"> 
	                  	<div id="map" style="width: 100%; height: 600px;"></div>

	                  	
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	
	                  	<!-- 등록 모달 -->
		               <div id="modal" class="modal store-write" style="display: none;">
							<div class="modal-cont foodie-write">
								<span class="close">×</span>
								<div id="modal-body">
									<div>
										<h4 class="menu-title" style="text-align: center;">맛집 등록</h4>
									</div>
									<div>
										<form id="foodie-write-form">
											<table class="table-style-table">
												<colgroup>
													<col width="20%" />
													<col width="80%" />
												</colgroup>
												<tbody>
													<tr>
														<th>카테고리</th>
														<td style="text-align: left;">
															<input class="form-check-input" type="radio" name="flexRadioDefault" checked value="점심">&nbsp;점심
															&nbsp;&nbsp;
															<input class="form-check-input" type="radio" name="flexRadioDefault" value="저녁">&nbsp;저녁
															&nbsp;&nbsp;
															<input class="form-check-input" type="radio" name="flexRadioDefault" value="회식">&nbsp;회식
														</td>
													</tr>
													<tr>
														<th>상호명</th>
														<td style="position: relative;">
													        <input type="text" class="form-control" id="keyword" placeholder="상호명을 입력하세요.">
													        <div id = "placesList" style="position: absolute; height: auto; max-height: 200px; overflow-y: auto; border: 1px solid gray; background: white; width: 400px; border-radius: 3px; display: none;"></div>
													    	<input type="hidden" id="store_name">
															<input type="hidden" id="store_address">
															<input type="hidden" id="store_longitude">
															<input type="hidden" id="store_latitude">
													    </td>
													</tr>
													<tr>
														<th>작성자</th>
														<td style="text-align: left;">${userName}</td>
													</tr>
												</tbody>
											</table>
											<div style="padding: 10px 0px;">
												<input type="text" class="form-control" id="content" placeholder="후기를 등록하세요." style="height: 50px;">
											</div>
											<div style="text-align: center; padding: 20px 0px;"><h3>당신의 별점은?</h3></div>
											<div style="text-align: center;">
												<div id="basic"></div>
											</div>
											<div style="text-align: center;">
										    	<button type="button" class="btn btn btn-primary" onclick="storeWrite()">등록</button>
												<a class="btn btn-outline-primary" onclick="storedelete()">취소</a>
											</div>
										</form>
										<sec:authentication var="loggedInUser" property="principal.username" />
									</div>
								</div>
							</div>
						</div>
						
						<div id="review" class="modal" style="display: none;">
							<div class="modal-cont review-modal">
								<div id="modal-body">
									<div>
										<h4 class="menu-title review_name" style="text-align: center;">
										</h4>
									</div>
									<div style="text-align: center;" class="review-star-num">
									</div>
									<div style="height: 441px; overflow-y: auto; overflow-x: hidden; margin: 0 -10px;">
										<table class="review-table">
											<colgroup>
												<col width="20%" />
												<col width="60%" />
												<col width="20%" />
											</colgroup>
											<tbody class="review-body">
												
											</tbody>
										</table>
									</div>
									<div style="text-align: center;">
										<a class="btn btn-primary review-write-yes" onclick="reviewWrite()">리뷰등록</a>
										<a class="btn btn-outline-primary review-modal-close">돌아가기</a>
									</div>
								</div>
							</div>
						</div>
						
						<div id="review-write" class="modal" style="display: none;">
							<div class="modal-cont review-write-modal">
								<div id="modal-body">
									<div>
										<h4 class="menu-title" style="text-align: center;">후기 등록</h4>
									</div>
									<div>
										<table class="review-table">
											<colgroup>
												<col width="20%" />
												<col width="80%" />
											</colgroup>
											<tbody>
												<tr>
													<th>작성자</th>
													<td style="text-align: left;">${userName}</td>
												</tr>
											</tbody>
										</table>
										<div style="padding: 10px 0px;">
											<input type="text" class="form-control" id="content-reivew" placeholder="후기를 등록하세요." style="height: 50px;">
										</div>
									</div>
									<div>
										<div style="text-align: center; padding: 20px 0px;"><h3 style="font-size: 19px;">당신의 별점은?</h3></div>
										<div class="basic-star" style="text-align: center;">
										    <div id="basic-st" class="star-rating star-width" style="width: 160px; height: 32px; background-size: 32px;" title="0/5">
											    <div class="star-value" style="background-size: 32px; width: 0%;"></div>
											</div>
										</div>
									</div>
									<div style="text-align: center;">
										<a class="btn btn-primary" onclick="setReview()">등록</a>
										<a class="btn btn-outline-primary review-modal-modal-close">닫기</a>
									</div>
								</div>
							</div>
						</div>
						
						
							<div class="foodie-filter-div">
								<div class="radio-group">
							        <input class="radio-filter" type="radio" id="option1" name="options" value="" checked="checked">
							        <label for="option1" class="radio-btn">전체</label>
							    </div>
								<div class="radio-group">
							        <input class="radio-filter" type="radio" id="option2" name="options" value="점심">
							        <label for="option2" class="radio-btn">점심</label>
							    </div>
							    <div class="radio-group">
							        <input class="radio-filter" type="radio" id="option3" name="options" value="저녁">
							        <label for="option3" class="radio-btn">저녁</label>
							    </div>
							    <div class="radio-group">
							        <input class="radio-filter" type="radio" id="option4" name="options" value="회식">
							        <label for="option4" class="radio-btn">회식</label>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- rating.js(별점)  -->
<script src="/resources/assets/extensions/rater-js/index.js?v=2"></script>
<script src="/resources/assets/static/js/pages/rater-js.js"></script>
<script>
	
	function reviewWrite(store_idx) {
		console.log('매장값 :', store_idx);
		$('#review-write').show();
		$('#review-write').data('store-idx', store_idx); 

	    // 별점 클릭 이벤트 설정
	    var starContainer = document.getElementById('basic-st');
	    var starElement = starContainer.querySelector('.star-value');

	    starContainer.addEventListener('click', function (event) {
	        var clickX = event.offsetX;
	        var containerWidth = starContainer.clientWidth;
	        
	        // 클릭한 위치에 따라 별점 계산 (1~5)
	        var ratingValue = Math.ceil((clickX / containerWidth) * 5);
	        var starPercentage = (ratingValue / 5) * 100;

	        // 별점 UI 업데이트 및 데이터 저장
	        starElement.style.width = starPercentage + '%';
	        $('#review-write').data('star-value', ratingValue); // 별점 값 저장
	        console.log('선택한 별점:', ratingValue);
	    });
	}
	
	function setReview() {
	    var store_idx = $('#review-write').data('store-idx'); // store_idx 가져오기
	    var starValue = $('#review-write').data('star-value'); // star 값 가져오기
	    var content = $('#content-reivew').val();
	    var loggedInUser = '${loggedInUser}';

	    console.log('등록할 매장 ID:', store_idx);
	    console.log('선택한 별점:', starValue);
	    console.log('후기 내용:', content);
	    console.log('후기 내용:', loggedInUser);

	    if (!content.trim()) {
	    	layerPopup(
		            '후기를 등록해주세요.',
		            '확인',
		            null,
		            function () {
		                removeAlert();
		            },
		            function () {}
		        );
		        return;
	    }

	    if (!starValue || starValue <= 0) {
	    	layerPopup(
		            '별점을 선택해주세요.',
		            '확인',
		            null,
		            function () {
		                removeAlert();
		            },
		            function () {}
		        );
		        return;
	    }

	    var url = '/review/write';
	    var params = {
	        store_idx: store_idx,
	        review_star: starValue,
	        content: content,
	        username: loggedInUser
	    };
	    httpAjax('POST', url, params);
	}

	function openModal(data) {
		var url = '/getReviewList';
		var data = {store_idx: data};
		$.ajax({
            type: 'GET',
            url: url,
            data: data,
            datatype: 'JSON',
            success: function(response) {
                reviewList(response);
                $('#review').show();
            },
            error: function(xhr, status, error) {
                console.error("알림 데이터를 가져오는 데 실패했습니다:", error);
            }
        });
	}
	
	function reviewList(response) {
		console.log('dd', response);
		$('.review-body').empty();
		var loggedInUser = '${loggedInUser}';
		var content = '';
		var reviewstar = '';
		var review_name = '';
		if (response.length > 0) {
	        var total = response[0].total_review_star; 
	        var totals = (total / 5) * 100;
	        
	        reviewstar = '<div id="review-star" class="star-rating" style="width: 160px; height: 32px; background-size: 32px;" data-rating="' + total + '" title="' + total + '/5">' +
	            '<div class="star-value" style="background-size: 32px; width: ' + totals + '%;"></div>' +
	            '</div>';
	        $('.review-star-num').html(reviewstar); 
	        $('.review-write-yes[onclick^="reviewWrite"]').attr('onclick', 'reviewWrite(' + response[0].store_idx + ')');
	    }
		
		if(response.length > 0) {
			var store_name = response[0].store_name;
			review_name = '<img src="https://cdn-icons-png.flaticon.com/512/5134/5134814.png" width="50" height="50" alt="" title="" class="img-small"><span style="margin: 0 20px;">' + store_name + '</span><img src="https://cdn-icons-png.flaticon.com/512/5134/5134814.png" width="50" height="50" alt="" title="" class="img-small">';
			$('.review_name').html(review_name);
		}
		
		response.forEach(function(item){
			const starPercentage = (item.review_star / 5) * 100;
			content += '<tr>';
			content += '<th>' + item.name + '</th>';
			content += '<td class="content-review">' + item.content + '</td>';
			if (loggedInUser === item.username) {
			    content += '<td class="trash"><i class="bi bi-trash btn-popup bi-icon" style="color:gray; cursor: pointer;" onclick="deleteReview(' + item.review_idx + ')"></i></td>';
			} else {
				content += '<td class="trash">' +
		        '<div class="star-rating" style="width: 91px; height: 17px; background-size: 18px;" data-rating="' + item.review_star + '" title="' + item.review_star + '/5">' +
		        '<div class="star-value" style="background-size: 18px; width: ' + starPercentage + '%;"></div>' +
		        '</div>' +
		        '</td>';
			}
			content += '</tr>';
		});
		
		$('.review-body').append(content);
	}

	
	function deleteReview(data) {
		layerPopup(
	            '리뷰를 삭제하시겠습니까?',
	            '확인',
	            '취소',
	            deleteRe.bind(null, data),
	            function () {
	            	removeAlert();
	            }
	        );
	        return;
	}
	
	function deleteRe(data) {
		console.log(data);
		var url = '/review/delete';  
	    var params = { review_idx: data };
	    httpAjax('DELETE', url, params);
	}
	
	
	
	
	
	$(document).ready(function () {
	    var url = '/foodie/list';
		
	    getAjax(url, 'JSON', '');
	    
	    $('.radio-filter').on('change', function () {
	        var selectedValue = $(this).val(); 
	        console.log("선택된 필터: " + selectedValue);
			var data = {filter: selectedValue };
	        getAjax(url, 'JSON', data);
	    });
	    
	    $(document).on('reloadStoreList', function () {
	        getAjax(url, 'JSON', data);
	    });
	});
	
	// AJAX 성공 시 호출되는 함수
	function getSuccess(response) {
	    displayMap(response);  // 받아온 데이터를 지도에 표시
	}
	
	// 지도에 마커를 표시하는 함수
	function displayMap(data) {
	    console.log('받은 데이터:', data);
	
	    var container = document.getElementById('map');
	    var options = { // 지도를 생성할 때 필요한 기본 옵션
	        center: new kakao.maps.LatLng(37.47650, 126.8799), // 지도의 중심좌표 (초기값)
	        level: 3 // 지도의 레벨(확대, 축소 정도)
	    };
	
	    // 지도 생성
	    var map = new kakao.maps.Map(container, options); // 지도 생성
	    
	    // 매장별 마커 생성
	    data.forEach(function(store) {
	        var markerPosition = new kakao.maps.LatLng(store.store_latitude, store.store_longitude); 
	
	        // 마커 생성
	        var marker = new kakao.maps.Marker({
	            position: markerPosition
	        });
	        var starValue = store.total_review_star ? parseFloat(store.total_review_star).toFixed(1) : '0.0';

		     // 백분율 계산 (5점 기준)
		     var starPercentage = (starValue / 5) * 100;
	        // 마커를 지도에 표시
	        marker.setMap(map);
			
	        // 인포윈도우 표시 내용 (매장 이름)
	        var iwContent = 
	        	'<div class="custom-infowindow" onclick="openModal(' + store.store_idx + ')" style="background: white; border: 2px solid var(--bs-primary); padding: 10px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.3); cursor: pointer; transition: background 0.3s ease, border 0.3s ease;" ' +
	            'onmouseover="this.style.background=\'#cdd7fb\'; this.style.color=\'white\'; this.style.border=\'2px solid #0056b3\'" ' +
	            'onmouseout="this.style.background=\'white\'; this.style.color=\'#333\'; this.style.border=\'2px solid var(--bs-primary)\'">' +

	                // 매장 이름
	                '<div class="info-header" style="font-weight: bold; color: var(--bs-primary); font-size: 18px;">' + store.store_name + '</div>' +

	                // 별점 + 총 리뷰 점수 표시
	                '<div class="info-body" style="margin-top: 3px; color: #333;">' +
	                    '<div class="star-rating" style="width: 91px; height: 17px; background-size: 18px;" title="' + starValue + '/5">' +
	                        '<div class="star-value" style="background-size: 18px; width: ' + starPercentage + '%; position: relative;"></div>' +
	                    '<p style="font-size: 12px; color: #ababab;">' + starValue + '</p>' +
	                    '</div>' +
	                '</div>' +
	            '</div>';

	        var customOverlay = new kakao.maps.CustomOverlay({
	            position: markerPosition,
	            content: iwContent,
	            xAnchor: 0.5,
	            yAnchor: 1.2
	        });

	        // 마커 표시 시 기본적으로 커스텀 인포윈도우 열기
	        customOverlay.setMap(map);
	    });
	}
	
	
	
	$('.btnModal').on('click', function () {
	    $('#modal').show();
	});

	$('#modal .close').on('click', function () {
	    $('#modal').hide();
	});
	
	$('.review-modal-close').on('click', function() {
		$('#review').hide();
	})
	
	$('.review-modal-modal-close').on('click', function() {
		$('#review-write').hide();
	})
	
	
	$('#keyword').on('input', function(){
	    searchPlaces();
	});

	var ps = new kakao.maps.services.Places(); 

	var listEl = document.getElementById('placesList');

	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        removeAllChildNods(listEl);
	        return false;
	    }

	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	function placesSearchCB(data, status, pagination) {
		removeAllChildNods(listEl);

	    if (status === kakao.maps.services.Status.OK && data.length > 0) {
	        displayPlaces(data);
	    } else {
	        listEl.style.display = 'block';
	        
	        // ✅ "검색 결과가 없습니다." 메시지 표시
	        var noResultItem = document.createElement('li');
	        noResultItem.textContent = '검색 결과가 없습니다.';
	        noResultItem.style.padding = '10px';
	        noResultItem.style.textAlign = 'center';
	        noResultItem.style.color = 'gray';
	        listEl.appendChild(noResultItem);
	    }
	}

	function displayPlaces(places) {
	    var fragment = document.createDocumentFragment(); 
	    removeAllChildNods(listEl);
	    
	    for (var i = 0; i < places.length; i++) {
	        var itemEl = getListItem(i, places[i]);
	        
	        // ✅ 장소의 모든 정보를 클로저로 캡처
	        (function(name, roadAddress, addressName, latitude, longitude){
	            itemEl.onclick = function(){
	                var key = document.getElementById('keyword');
	                
	                // ✅ 입력창에 장소 이름 표시
	                key.value = name;

	                // ✅ hidden input에 저장
	                document.getElementById('store_name').value = name;
	                document.getElementById('store_address').value = roadAddress || '';
	                document.getElementById('store_longitude').value = longitude;
	                document.getElementById('store_latitude').value = latitude;
	                // ✅ 콘솔에 값 출력
	                console.log('✅ 장소 이름:', name);
	                console.log('✅ 도로명 주소:', roadAddress);
	                console.log('✅ 위도:', latitude);
	                console.log('✅ 경도:', longitude);

	                // ✅ 검색 결과 닫기
	                removeAllChildNods(listEl);   
	                listEl.style.display = 'none';
	            };
	        })(places[i].place_name, places[i].road_address_name, places[i].address_name, places[i].y, places[i].x);
	        
	        fragment.appendChild(itemEl);
	    }

	    listEl.appendChild(fragment);
	}

	function storedelete() {
		$('.store-write').hide();
	}

	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <span class = "info-title"><b>' + places.place_name + '</b></span>';

	    if (places.road_address_name) {
	        itemStr += '    <br><span class = "info-address"><small>' + places.road_address_name + '</small></span><hr style="margin: 0px;">'
	    } else {
	        itemStr += '    <br><span class = "info-address"><small>' +  places.address_name  + '</small></span><hr style="margin: 0px;">'; 
	    }        
	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

	function storeWrite() {
	    var category = document.querySelector('input[name="flexRadioDefault"]:checked').value;
	    var storename = document.getElementById('store_name').value;
	    var storeAddress = document.getElementById('store_address').value;
	    var storeLongitude = document.getElementById('store_longitude').value;
	    var storeLatitude = document.getElementById('store_latitude').value;
	    var content = document.getElementById('content').value;
	    var starElement = document.querySelector("#basic .star-value");
	    var starWidth = parseFloat(starElement.style.width); // 'px' 제거 후 숫자만 추출
	    var ratingValue = Math.round((starWidth / 100) * 5);
	    var loggedInUser = '${loggedInUser}';
	    
	    if (ratingValue <= 0) {
	    	layerPopup(
		            '별점을 선택해주세요.',
		            '확인',
		            null,
		            function () {
		                removeAlert();
		            },
		            function () {}
		        );
		        return;
	    }
	    
	    if (content == null || content.trim() === "") {
	        layerPopup(
	            '리뷰를 적어주세요.',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
	    }

	    var url = '/foodie/write';
	    var params = {
	    	store_category: category,
	    	store_name: storename,
	        store_address: storeAddress,
	        store_longitude: storeLongitude,
	        store_latitude: storeLatitude,
	        content: content,
	        review_star: ratingValue,
	        username: loggedInUser
	    };
	    console.log(JSON.stringify(params, null, 2));
		httpAjax('POST', url, params);
	}
	
	function httpSuccess(response) {
		console.log(response);
		if (response.message === '매장등록') {
			$('.store-write').hide();
			$(document).trigger('reloadStoreList');
		}
		
		if(response.message === '매장중복') {
			layerPopup(
	            '이미 등록된 매장입니다!',
	            '확인',
	            null,
	            function () {
	                removeAlert();
	            },
	            function () {}
	        );
	        return;
		}
		
		if(response.message === '성공') {
			console.log('성공');
			$('#review-write').hide(); // 모달 닫기
			openModal(response.store_idx);
		}		
		
		if(response.message === '삭제성공') {
			console.log('성공');
			removeAlert();
			openModal(response.store_idx);
		}		
	}
	
	

	
</script>
</html>