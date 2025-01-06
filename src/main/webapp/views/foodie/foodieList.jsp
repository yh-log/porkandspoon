<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<style>
	.btn-write {
 	    width: 200px;
	    height: 40px;
	    text-align: center;
	    margin-top: 30px;
	 }
	
	#modal .foodie-write {
	    width: 600px;
	    height: 500px;
	    top: 200px;
	}
	
 	.item:hover {
		background-color: #f0f0f0; /* 연한 회색 */
	    cursor: pointer;          /* 클릭 가능한 상태 */
	    transition: background-color 0.2s ease; /* 부드러운 색상 변화 효과 */
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
	            <div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked="">
					<label class="form-check-label" for="flexRadioDefault2">점심</label>
				</div>
	            <div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
					<label class="form-check-label" for="flexRadioDefault1">저녁</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
					<label class="form-check-label" for="flexRadioDefault1">회식</label>
				</div>
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
		               <div id="modal" class="modal" style="display: none;">
							<div class="modal-cont foodie-write">
								<span class="close">×</span>
								<div id="modal-body">
									<div>
										<h4 class="menu-title" style="text-align: center;">맛집 등록</h4>
									</div>
									<div>
										<table>
											<colgroup>
												<col width="20%" />
												<col width="80%" />
											</colgroup>
											<tbody>
											
												<tr style="margin-bottom: 10px; display: block;">
													<th>카테고리</th>
													<td style="text-align: center;">
														<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked="">&nbsp;점심
														&nbsp;&nbsp;
														<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >&nbsp;저녁
														&nbsp;&nbsp;
														<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >&nbsp;회식
													</td>
												</tr>
												<tr style="margin-bottom: 10px; display: block;">
													<th>상호명</th>
													<td style="position: relative;">
												        <input type="text" class="form-control" id="keyword" placeholder="상호명을 입력하세요.">
												        <div id = "placesList" style="position: absolute; height: auto; max-height: 200px; overflow-y: auto; border: 1px solid gray; background: white; width: 400px; border-radius: 3px; display: none;"></div>
												    	<input type="hidden" id="placeName">
														<input type="hidden" id="roadAddress">
														<input type="hidden" id="jibunAddress">
														<input type="hidden" id="longitude">
														<input type="hidden" id="latitude">
												    </td>
												</tr>
												<tr style="margin-bottom: 10px; display: block;">
													<th>작성자</th>
													<td style="text-align: left;">${userName}</td>
												</tr>
												<tr style="margin-bottom: 10px; display: block;">
													<td colspan="2">
														<input type="text" class="form-control" id="basicInput" placeholder="후기를 등록하세요.">
													</td>
												</tr>
											</tbody>
										</table>
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
<script src='/resources/js/daumApi.js'></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.47650, 126.8799), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var markerPosition  = new kakao.maps.LatLng(37.47650, 126.8799); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
		
	
	var iwContent = '<div style="width: auto;">현 위치<br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(markerPosition); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 

	$('.btnModal').on('click', function () {
	    $('#modal').show();
	});

	$('#modal .close').on('click', function () {
	    $('#modal').hide();
	});
	
	
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
	                document.getElementById('placeName').value = name;
	                document.getElementById('roadAddress').value = roadAddress || '';
	                document.getElementById('jibunAddress').value = addressName || '';
	                document.getElementById('longitude').value = longitude;
	                document.getElementById('latitude').value = latitude;

	                // ✅ 콘솔에 값 출력
	                console.log('✅ 장소 이름:', name);
	                console.log('✅ 도로명 주소:', roadAddress);
	                console.log('✅ 지번 주소:', addressName);
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


	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <span class = "info-title"><b>' + places.place_name + '</b></span>';

	    if (places.road_address_name) {
	        itemStr += '    <br><span class = "info-address"><small>' + places.road_address_name + '</small></span>'
	    } else {
	        itemStr += '    <br><span class = "info-address"><small>' +  places.address_name  + '</small></span>'; 
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



	
</script>
</html>