<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직영점 수정</title>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">


<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">




<!-- 다음 주소 검색 api 사용 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/daumApi.js"></script>


<style>
	#selectBox{
		display: flex;
		gap: 10px;
		align-items: center;
		margin-top: 15px;
	}
	
	table td {
	    padding: 10px 16px;
	    text-align: center;
	}
		
	.form-select{
	 	width: 20%;
	}
	.cont-body .row .col-6.col-lg-6:last-of-type{
	    display: flex;
	    justify-content: flex-end;
	    gap: 10px;
	}
	
	
	.btnInputBox{
		display: flex;
		align-items: center;
		gap: 10px;
	}

	.custom-height-row th, 
	.custom-height-row td {
	    line-height: 60px;    
	    padding-top: 0;
	    padding-bottom: 0;
	}
	
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
	}
	
	.btn-Layout{
		display: flex;
		gap: 10px;
	    justify-content: center;
	}
	
.radioLayoutBox {
    display: flex;
    align-items: center; /* 수직 정렬 */
    gap: 10px; /* 요소 간 간격 */
    font-weight: 500; /* 필요 시 글자 굵기 설정 */
}

.radioLayoutBox input {
    margin: 0;
}
		
	#overlayMessage{
	    display: none;
	    margin-bottom: -15px;
	    margin-top: -32px;
	    font-size: 14px;
	    color : var(--bs-primary);
	    float: left;
	}
	
	
	.filebox label {
	    display: inline-block;
	    padding: 10px 20px;
	    color: var(--bs-secondary);
	    vertical-align: middle;
	    background-color: #fff;
	    cursor: pointer;
	    height: 40px;
	    margin-left: 10px;
	}
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
	
	#dept-logo{
		width: 150px;
    	height: 150px;
	}
	
	input.form-control.input-readonly {
	    pointer-events: none !important; /* 입력 및 클릭 불가 */
	    background-color: #f0f0f0 !important; /* 읽기 전용 스타일 */
	    color: #888 !important; /* 텍스트 색상 */
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
					<h4 class="menu-title">직영점 리스트</h4>
					<ul>
						<li class="active" id="firstMenu"><a href="#">브랜드 리스트</a></li>
						<li id="secondMenu"><a href="#">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직영점 수정</h5>
						</div>
						<div class="cont-body"> 
							<form>
								<table>
									<tr>
										<td rowspan="2" class="filebox">
											<img src="" id="dept-logo"/>
										</td>
										<th>직영점 명</th>
										<td>
											<div class="inline-layout">
												${storeInfo.text}<input type="text" name="name"  class="form-control" value="${storeInfo.name}" id="deptCode" data-required="true"/>
											</div>
										</td>
										<th>직영점 코드</th>
										<td>
											<div class="inline-layout">
												<input type="hidden" name="parent" value="${storeInfo.parent}"/>
												<input type="text" name="id" class="form-control input-readonly" value="${storeInfo.id}" />
											</div>
											<div id="overlayMessage"></div>
										</td>
									</tr>
									<tr>
										<th>직영점주</th>
										<td>
											<div class="inline-layout">
											<!-- todo - 나중에 조직도 모달 붙이기 -->
												<input type="hidden" name="owner" value="${storeInfo.owner}"/>
												<input type="text" name="user_name" class="form-control input-readonly" value="${storeInfo.owner}" /> 
												<button class="btn btn-primary" ><i class="bi bi-diagram-3"></i></button>
											</div>
										</td>
										<th>시행일자</th>
										<td>
											<input type="date" name="use_date" class="form-control" value="${storeInfo.use_date}" data-required="true"/>
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="2">
											<div class="inline-layout">
												도로명 <input type="text" name="address" class="form-control input-readonly" id="roadAddress" value="${storeInfo.address}"/>
											</div>
										</td>
										<td colspan="2">
											<div class="inline-layout">
												상세주소 <input type="text" name="address_detail" class="form-control" id="address_detail" value="${storeInfo.address_detail}" data-required="true"/>
												<button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch(); addressUpload();"><i class="bi bi-geo-alt-fill"></i></button>
											</div>
										</td>
									</tr>
									<tr>
										<th>활성</th>
										<td>
											<div class="radioLayoutBox">
												<input type="radio" name="use_yn" value="Y" class="form-check-input" /> 활성 
	 										    <input type="radio" name="use_yn" value="N" class="form-check-input"> 비활성
	 									    </div>
										</td>
									</tr>
									<tr>
										<th>휴점</th>
										<td>
											<div class="radioLayoutBox">
												<input type="radio" name="is_close" value="Y" class="form-check-input" /> 휴점
	 										    <input type="radio" name="is_close" value="N" class="form-check-input"> 운영
	 										</div>
	 									</td>
	 									<th style="display: none;" id="restTh">휴점 일정 </th>
	 									<td colspan="2">
	 										<div class="radioLayoutBox" style="display: none;"> 
	 											<input type="date" name="start_date" value="" class="form-control" /> ~ 
	 											<input type="date" name="end_date" value="" class="form-control" />
	 										</div>
	 									</td>
									</tr>
									<tr><th colspan="5">설명</th></tr>
									<tr>
										<td colspan="5">
											<textarea name="postContent" id="summernote" maxlength="10000"></textarea>
										</td>
									</tr>
									<c:set var="username" value="${pageContext.request.userPrincipal.name}" />
									<input type="hidden" name="creater" value="${username}" />
								</table>
								<div class="btn-Layout">
									<button type="button" class="btn btn-primary" onclick="layerPopup('직영점을 수정하시겠습니까?','수정','취소', storeUpdate, removeAlert)">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="location.href='/ad/store/detail/${storeInfo.id}'">취소</button>
								</div>
							</form>
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

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/deptInfo.js'></script>
<script src='/resources/js/textEaditor.js'></script>
<script>

$(document).ready(function() {
    // Summernote 초기화
    $('#summernote').summernote({
        height: 300
    });
    
    // 서버에서 전달된 데이터 읽기
    var content = '${storeInfo.content}';
    
    // Summernote에 데이터 삽입
    $('#summernote').summernote('code', content);
    

	var logo_file = '${storeInfo.logo}';
	if(logo_file){
		document.getElementById('dept-logo').src = '/photo/' + logo_file;
	}else {
        document.getElementById('dept-logo').src = '/resource/img/logo.jpg';
    }
	
	var use_yn = '${storeInfo.use_yn}';
	
	if (use_yn === 'Y') {
        document.querySelector('input[name="use_yn"][value="Y"]').checked = true;
    } else {
        document.querySelector('input[name="use_yn"][value="N"]').checked = true;
    }
	
	 var is_close = '${storeInfo.is_close}'.trim();
	    const restTh = document.getElementById('restTh'); // 휴점 일정 <th>
	    const restDiv = document.querySelector('td[colspan="2"] .radioLayoutBox'); // 휴점 일정 <div>

	    if (is_close === 'Y') {
	        // '휴점' 라디오 버튼 선택
	        document.querySelector('input[name="is_close"][value="Y"]').checked = true;

	        // 휴점 일정 관련 요소 표시
	        restTh.style.display = 'table-cell'; // <th> 요소 표시
	        restDiv.style.display = 'flex'; // <div> 표시 (flex로 강제 설정)

	        // 시작일과 종료일 설정
	        var start_date = '${storeInfo.start_date}';
	        var end_date = '${storeInfo.end_date}';
	        document.querySelector('input[name="start_date"]').value = start_date.split(" ")[0];
	        document.querySelector('input[name="end_date"]').value = end_date.split(" ")[0];
	    } else {
	        // '운영' 라디오 버튼 선택
	        document.querySelector('input[name="is_close"][value="N"]').checked = true;

	        // 휴점 일정 관련 요소 숨기기
	        restTh.style.display = 'none'; // <th> 숨김
	        restDiv.style.display = 'none'; // <div> 숨김
	    }

	    // 라디오 버튼 클릭 이벤트 추가
	    const isCloseRadios = document.querySelectorAll('input[name="is_close"]');

	    isCloseRadios.forEach(function (radio) {
	        radio.addEventListener('change', function () {
	            if (radio.value === 'Y') {
	                // 휴점 선택 시
	                restTh.style.display = 'table-cell'; // 휴점 일정 표시
	                restDiv.style.display = 'flex'; // 날짜 필드 표시 (flex로 강제 설정)
	            } else {
	                // 운영 선택 시
	                restTh.style.display = 'none'; // 휴점 일정 숨기기
	                restDiv.style.display = 'none'; // 날짜 필드 숨기기

	                // 날짜 입력 필드 초기화
	                document.querySelector('input[name="start_date"]').value = '';
	                document.querySelector('input[name="end_date"]').value = '';
	            }
	        });
	    });
	    
	    
	    const parentDate = '${storeInfo.parent_date}'.trim(); // 서버에서 전달받은 parent_date 값
	    const useDateInput = document.querySelector('input[name="use_date"]'); // 날짜 입력 필드
	    console.log('parentDate:', parentDate);

	    // parent_date 값을 `min` 속성으로 설정
	    if (parentDate) {
	        useDateInput.setAttribute('min', parentDate);
	    }

	    // 선택한 날짜가 parent_date보다 빠르면 경고 메시지
	    useDateInput.addEventListener('change', function () {
	        const selectedDate = this.value; // 사용자가 선택한 날짜
	        if (selectedDate < parentDate) {
	            this.value = ''; // 선택된 날짜 초기화
	        }
	    });
});

function addressUpload() {
	
	$('#address_detail').val('');

    console.log('도로명 주소 변경 감지:', roadAddress.value);

}
</script>

</html>