<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    	flex-direction: column;
    	justify-content: space-between;
    	align-items: flex-end;
	}
	
	.write-form{
		display: flex;
	    align-items: flex-start;
	    justify-content: space-between;
	    margin: 20px;
	}
	
	.write-form1{
		display: flex;
    	align-items: center;
    	margin: 20px;
	}
	
	.write-form2{
		margin-left: 43px;
	}
	
	.art{
    	height: 270px;
    	resize: none;
	}
	
	.write-form-3{
		display: flex;
    	margin: 20px;
	}
	
	.btn-room{
		display: flex;
    	justify-content: center;
	}
	
	th{
		width: 20%;
	}
	
	.coutn-dis{
		display: flex;
		align-items: center;
	}
	.form-input1 {
	    width: 100%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	/* 반응형 iframe 스타일 */
    .responsive-iframe {
        position: relative;
        padding-bottom: 56.25%; /* 16:9 비율 */
        padding-top: 25px;
        height: 0;
    }
    .responsive-iframe iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    /* 에러 메시지 스타일 */
    #error-message {
        font-size: 12px;
        color: red;
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
			<h4 class="menu-title">교육 등록 리스트</h4>
			<ul>
				<li id="firstMenu"><a href="/mo/educationWrite">교육 등록</a></li>
				<li id="secondMenu"><a href="/mo/education">수강 기록</a></li>
			</ul>
		</section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>교육 수정</h5>
               </div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                  <div class="col-12 col-lg-12">
                  	<input type="hidden" name="no" value="${info.no}"/>
	                  <table class="align-l">
	                  	<tr>
	                  		<th>등록자</th>
	                  		<td class="align-l">${info.name}</td>
	                  	</tr>
	                  	<tr>
	                  		<th>카테고리</th>
	                  		<td>
	                  			<select class="form-input1" name="category">
	                  				<option value="duty" <c:if test="${info.category == 'duty'}">selected</c:if>>의무 교육</option>
           							<option value="job" <c:if test="${info.category == 'job'}">selected</c:if>>직무 교육</option>
            						<option value="hygiene" <c:if test="${info.category == 'hygiene'}">selected</c:if>>위생 교육</option>
            						<option value="operate" <c:if test="${info.category == 'operate'}">selected</c:if>>운영 교육</option>
	                  			</select>
	                  		</td>
	                  	</tr>
	                  	<tr>
	                  		<th>부서</th>
	                  		<td class="coutn-dis">
	                  			<select class="form-input1" name="dept">
	                  				<c:forEach items="${dept}" var="dept">
										<option value="${dept.id}" <c:if test="${dept.id == info.id}">selected</c:if>>${dept.text}</option>                 				
	                  				</c:forEach>
	                  			</select>
	                  		</td>
	                  	</tr>
	                  	<tr>
	                  		<th>제목</th>
	                  		<td><input class="form-control sor-1" type="text" name="subject" value="${info.subject}"/></td>
	                  	</tr>
	                  	<tr>
	                  		<th>영상 첨부</th>
							<td>
		                        <input value="${info.url}" id="youtube-url" class="form-control sor-1" type="text" name="url" placeholder="영상 주소를 입력 해주세요."/>
			                    <div id="error-message" style="color: red; margin-top: 5px;"></div>
			                    <div id="video-preview" style="margin-top: 15px;">
			                        <!-- 유튜브 동영상이 여기에 표시됩니다 -->
			                    </div>
                    		</td>
	                  	</tr>
	                  	<tr>
	                  		<th>영상 시간</th>
	                  		<td><input class="form-control sor-1" type="text" name="time" value="${info.total_time}"/></td>
	                  	</tr>
	                  	<tr>
	                  		<th>내용</th>
	                  		<td><textarea class="form-control art" name="content">${info.content}</textarea></td>
	                  	</tr>
	                  </table>
                  </div>
               	</div>
               	<div class="col-12 col-lg-12">
               		<div class="btn-room">
		           		<div class="btn btn-primary" onclick="eduUpdate()">수정하기</div>
		                <div class="btn btn-primary" onclick="back()">돌아가기</div>
	           		</div>
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

	$(document).ready(function(){
	    // YouTube 비디오 ID 추출 함수
	    function getYouTubeVideoID(url){
	        var regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:watch\?v=|embed\/)|youtu\.be\/)([A-Za-z0-9_-]{11})/;
	        var match = url.match(regex);
	        if(match){
	            console.log("정규식 매치 성공:", match[1]); // 디버깅용 로그
	            return match[1];
	        } else {
	            console.log("정규식 매치 실패"); // 디버깅용 로그
	            return null;
	        }
	    }
	
	    // YouTube 동영상 임베드 함수
	    function embedYouTubeVideo(url){
	        var videoId = getYouTubeVideoID(url);
	        if(videoId){
	            var embedUrl = 'https://www.youtube.com/embed/' + videoId;
	            var iframe = '<div class="responsive-iframe">' +
	                         '    <iframe src="' + embedUrl + '" ' +
	                         '            title="유튜브 동영상" ' +
	                         '            frameborder="0" ' +
	                         '            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" ' +
	                         '            referrerpolicy="strict-origin-when-cross-origin" ' +
	                         '            allowfullscreen>' +
	                         '    </iframe>' +
	                         '</div>';
	            $('#video-preview').html(iframe);
	            $('#error-message').text('');
	        } else if(url !== ''){
	            $('#video-preview').html('');
	            $('#error-message').text('유효한 유튜브 URL을 입력해주세요.');
	        } else {
	            $('#video-preview').html('');
	            $('#error-message').text('');
	        }
	    }
	
	    // 입력 필드 변경 시 동영상 임베드
	    $('#youtube-url').on('input', function() {
	        var url = $(this).val().trim();
	        console.log("입력된 URL:", url); // 디버깅용 로그
	        embedYouTubeVideo(url);
	    });
	
	    // 페이지 로드 시 기존 URL로 동영상 임베드
	    var initialUrl = $('#youtube-url').val().trim();
	    if(initialUrl){
	        embedYouTubeVideo(initialUrl);
	    }
	});
	
	function eduUpdate() {
		
		var category = $('select[name="category"]').val();
		var dept = $('select[name="dept"]').val();
		var subject = $('input[name="subject"]').val();
		var content = $('textarea[name="content"]').val();
		var time = $('input[name="time"]').val();		
		var url = $('input[name="url"]').val();
		var no = $('input[name="no"]').val();
		
				
	    if (!category || !dept || !subject || !content || !time || !url) {
	    	layerPopup("항목을 모두 입력해주세요.", "확인", false, secondBtn1Act, secondBtn1Act);
	        return;
	    }
		
		var data = {
				username: '${pageContext.request.userPrincipal.name}',
				category: category,
				id: dept,
				subject: subject,
				content: content,
				total_time: time,
				url: url,
				no: no
		}
		
		console.log('데이터',data);
		
		httpAjax('PUT','/educationUpdate',data);

	}
	
	function httpSuccess(response) {
		console.log('성공',response);
		location.href="/mo/educationDetail/${info.no}"
	}
	
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function back(){
		location.href="/mo/educationDetail/${info.no}"
    }
	
	
</script>
</html>