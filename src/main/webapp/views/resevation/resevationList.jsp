<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon"
		href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
		type="image/png">
		
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">	
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<style>

    /* 기본 모달 스타일 */
	.modal {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 1100;
	}
	
	/* 모달 내부 콘텐츠 */
	.modal-content {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    width: 400px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	/* 모달 헤더 */
	.modal-header {
	    display: flex;
	    justify-content: end;
	    align-items: center;
	    border-bottom: 1px none #ddd;
	    margin-bottom: 15px;
	}

	/* 닫기(x) 버튼 */
	.modal-close {
	    font-size: 20px;
	    cursor: pointer;
	}
	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}
	
	.form-label {
	    display: block;
	    font-size: 14px;
	    margin-bottom: 5px;
	}
	
	.form-input {
	    width: 100%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	/* 모달 푸터 */
	.modal-footer {
	    display: flex;
	    justify-content: center;
	    gap: 10px;
	}
	
	.write-btn{
		border-bottom: 1px solid #E4E6E8;
	}
	
	.list-form{
		border: 1px solid #E4E6E8;
		border-radius: 6px;
		padding: 17px;
		width: 40%;
    	margin-top: 20px;
    	display: flex;
    	justify-content: space-between;
    	height: 200px;
	}
	
	.list-row{
		padding: 0 16%;
		display: flex;
		justify-content: space-between;
    	flex-wrap: wrap;
	}
	
	.update{
	    display: flex;
	    align-items: flex-end;
	}
	
	a {
    	color: rgba(var(--bs-link-color-rgb), var(--bs-link-opacity, 1));
	}
	/* 이 밑으로 라디오 변형 */
	/* 라디오 버튼 그룹 정렬 */
.radio-button-group {
    display: flex;
    gap: 10px;
}

/* 실제 라디오 버튼 숨기기 */
.radio-button-group input[type="radio"] {
    display: none;
}

/* 라벨을 버튼처럼 스타일링 */
.radio-label {
    display: inline-block;
    padding: 10px 20px;
    border: 2px solid #007BFF;
    border-radius: 5px;
    background-color: #FFFFFF;
    color: #007BFF;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    user-select: none;
    font-size: 16px;
}

/* 마우스를 올렸을 때 스타일 */
.radio-label:hover {
    background-color: #e6f0ff;
}

/* 선택된 라디오 버튼의 라벨 스타일 변경 */
.radio-button-group input[type="radio"]:checked + .btn.btn-sm.btn-outline-primary {
    background-color: var(--bs-btn-hover-bg);
    color: var(--bs-btn-hover-color);
    border-color: var(--bs-btn-hover-border-color);
}
</style>
</head>
<body>
	<!-- 부트스트랩 -->
	<script src="assets/static/js/initTheme.js"></script>
	
	<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
         <section id="menu">
            <h4 class="menu-title">자원 관리</h4>
            <ul>
            	<li class="active" data-category="all" style="cursor: pointer;">전체보기</li>
      			<li data-category="room" style="cursor: pointer;">회의실 리스트</li>
      			<li data-category="article" style="cursor: pointer;">물품 리스트</li>
            </ul>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>전체 보기</h5>
               </div>
               <div class="write-btn">
                  <div class="btn btn-primary" style="margin-left: 23px;" onclick="room()">회의실 등록</div>
                  <div class="btn btn-primary" onclick="item()">물품 등록</div>
               </div>
               <div class="cont-body"> 
               	  <!-- 여기에 내용 작성 -->
                  <div class="row list-row" id="list">

                  </div>
                  <!-- 로딩 인디케이터 -->
				  <div id="loading" style="text-align:center; display:none; margin-top: 25px;">로딩 중...</div>
				  <!-- 더 이상 콘텐츠가 없을 때 표시 -->
				  <div id="endOfContent" style="text-align:center; display:none; margin-top: 25px;">더 이상 정보가 없습니다.</div>
               </div>
            </div>
         </section>   
         
      </div>
    </div>
	</div>
	
	
	
</body>

<!-- 부트스트랩 -->
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>

<script>

    
	$(document).ready(function () {
		
		var page = 1;
		var isLoading = false; // 로딩 상태
	    var hasMore = true; // 추가 데이터 존재 여부
	    var filter = 'all';
	    
	    listCall(page,filter);
	    
	    // 메뉴 클릭 이벤트 핸들러
        $('#menu ul li').click(function() {
            // 활성화된 메뉴 항목의 클래스 제거
            $('#menu ul li').removeClass('active');
            // 클릭한 메뉴 항목에 active 클래스 추가
            $(this).addClass('active');
            
            // 현재 필터 업데이트
            filter = $(this).data('category');
            
            // 페이지 및 상태 초기화
            page = 1;
            isLoading = false;
            hasMore = true;
            
            // 목록 초기화
            $('#list').empty();
            $('#endOfContent').hide();
            
            // 새로운 필터에 맞는 목록 호출
            listCall(page, filter);
        });
	    		
		$(window).scroll(function() {
            if (isLoading || !hasMore) return;

            // 문서 높이와 스크롤 위치 계산
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                page++;
                listCall(page,filter);
            }
        });
			
	});
	
    function listCall(page,filter) {
    	isLoading = true;
        $('#loading').show();
        
        $.ajax({
            type: 'GET',
            url: '/resevationList',
            data:{
            	page: page,
            	size: 6,
            	category: filter
            }, 
            dataType: 'JSON',
            success: function(response) {
            	$('#loading').hide();
                getSuccess(response);
            },
            error: function(e) {
                console.log(e);
            }
        });
  
	}
    
    // 리스트 호출
	function getSuccess(response) {
		var list = response.list;
		console.log("list",list);
		var content = '';
		if (Array.isArray(list) && list.length > 0) {
			list.forEach(function(view,idx){
				if(view.category == 'room'){
					console.log('숫자 받아와?',view.no);
		            content += '<div class="list-form">';
		            content +='<div>';
					content +='<h4><a href="/ad/room/detail/'+view.no+'">'+view.subject+'</a></h4>';
					content +='<p>최대인원 : '+view.count+'</p>';
					content +='<p>등록자 : '+view.name+'</p>';
					if(view.is_active == 'Y'){
						content +='<div class="radio-button-group">'
						content +='<input type="radio" id="option1'+view.no+'" name="options'+view.no+'" checked>'
						content +='<label for="option1'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'roomY\')">활성화</label>'
						content +='<input type="radio" id="option2'+view.no+'" name="options'+view.no+'">'
						content +='<label for="option2'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'roomN\')">비활성화</label>'
						content +='</div>'
					}else{
						content +='<div class="radio-button-group">'
						content +='<input type="radio" id="option1'+view.no+'" name="options'+view.no+'">'
						content +='<label for="option1'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'roomY\')">활성화</label>'
						content +='<input type="radio" id="option2'+view.no+'" name="options'+view.no+'" checked>'
						content +='<label for="option2'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'roomN\')">비활성화</label>'
						content +='</div>'
					}
					content +='</div>';
					content +='<div class="update">';
					content +='<a href="/ad/room/update/'+view.no+'" class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</a>';
					content +='</div>';
					content +='</div>';				
				}else{				
					console.log('숫자 받아와?',view.no);
					content += '<div class="list-form">';
		            content +='<div>';
					content +='<h4><a href="/ad/article/detail/'+view.no+'">'+view.subject+'</a></h4>';
					content +='<p>모델명 : '+view.model_name+'</p>';
					content +='<p>등록자 : '+view.name+'</p>';
					if(view.is_active == 'Y'){
						content +='<div class="radio-button-group">'
						content +='<input type="radio" id="option1/'+view.no+'" name="options/'+view.no+'" checked>'
						content +='<label for="option1/'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'articleY\')">활성화</label>'
						content +='<input type="radio" id="option2/'+view.no+'" name="options/'+view.no+'">'
						content +='<label for="option2/'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'articleN\')">비활성화</label>'
						content +='</div>'
					}else{
						content +='<div class="radio-button-group">'
						content +='<input type="radio" id="option1/'+view.no+'" name="options/'+view.no+'">'
						content +='<label for="option1/'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'articleY\')">활성화</label>'
						content +='<input type="radio" id="option2/'+view.no+'" name="options/'+view.no+'" checked>'
						content +='<label for="option2/'+view.no+'" class="btn btn-sm btn-outline-primary" onclick="useYN('+view.no+',\'articleN\')">비활성화</label>'
						content +='</div>'
					}
					content +='</div>';
					content +='<div class="update">';
					content +='<a href="/ad/article/update/'+view.no+'" class="btn btn-sm btn-outline-primary" style="transform: translate(5px, 15px);">수정</a>';
					content +='</div>';
					content +='</div>';
				}
			});
			$('#list').append(content);
			if (list.length < 6) {
                hasMore = false;
                $('#endOfContent').show();
            }
			
		}else {
            hasMore = false;
            $('#endOfContent').show();
        }
			
		isLoading = false;
	}
	
    // 회의실 등록버튼
	function room() {
		location.href="/ad/room/write";	
	}
	// 물품 등록 버튼
	function item() {
		location.href="/ad/article/write";
	}
	// 상태변경 버튼
	function useYN(no,type) {
		console.log('해당 ',no,type);
		layerPopup("상태를 변경 하시겠습니까?", "변경", "취소", function(){updateYN(no,type)}, secondBtn2Act);
	}
	
	function updateYN(no,type) {
		console.log('변경중 ',no,type);
		
		if(type == 'articleY'){
			console.log('물품 활성');
		}else if(type == 'articleN'){
			console.log('물품 비활성');
		}else if(type == 'roomY'){
			console.log('회의실 활성');
		}else if(type == 'roomN'){
			console.log('회의실 비활성');
		}
		
		var params = {
				no: no,
				filter:type
		}
		
		httpAjax('PUT','/updateYN',params);
	}
		
	function secondBtn2Act() {
		//취소 클릭시 수행할 내용
		console.log('취소 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function httpSuccess(response){
		console.log('변경 완료');
		removeAlert(); // 팝업닫기
	}
	
	

	
</script>
</html>