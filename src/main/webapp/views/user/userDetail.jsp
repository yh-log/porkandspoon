<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직원 등록</title>

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

<style>
	.selectStyle{
		width: 160px;
	}

	input.form-control:disabled {
		background: var(--bs-light-secondary);
	}
	
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
	}
	#btn-gap{
		display: flex;
		gap: 30px;
		align-items: center;
		justify-content: center;
	}
	.custom-height-row th, 
	.custom-height-row td {
	    line-height: 60px;    
	    padding-top: 0;
	    padding-bottom: 0;
	}
	

	#userProfile{
		width: 170px;
		height: 230px;
	}
</style>
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

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
					<h4 class="menu-title">직원 정보</h4>
					<ul>
						<li id="firstMenu"><a href="#">직원 리스트</a></li>
						<li id="secondMenu"><a href="#">퇴사자 리스트</a></li>
					</ul>
					<div class="btn btn-primary full-size"><i class="bi bi-plus-lg"></i> 직원 등록</div>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직원정보</h5>
						</div>
						<div class="cont-body"> 
							<table>
								<tr>
									<td rowspan="4"><img src="" id="userProfile"/></td>
									<th>이름</th>
									<td colspan="2">
										<span id="name-value"></span>
									</td>
									<th>부서</th>
									<td>
										<span id="dept-value"></span>
									</td>
								</tr>
								<tr>
									<th>사번</th>
									<td colspan="2">
										<span id="person_num-value"></span>
									</td>
									<th>직위/직책</th>
									<td>
										<span id="position_idx-value"></span> / <span id="title_idx-value"></span>
									</td>
								</tr>
								<tr class="custom-height-row">
									<th>아이디</th>
									<td colspan="2">
										<span id="username"></span>
									</td>
									<th>핸드폰</th>
									<td>
										<span id="inputFieldPhone"></span>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td colspan="2">
										<span id="email-value"></span>
									</td>
									<th>사내번호</th>
									<td>
										<span id="inputFieldComNum"></span>
									</td>
								</tr>
								<tr><th colspan="6">기타정보</th></tr>
								<tr>
									<th>생년월일</th>
									<td>
										<span id="birth-value"></span>
									</td>
									<th>성별</th>
									<td>
										<span id="gender-value"></span>
									</td>
									<th>입사일</th>
									<td>
										<span id="join_date-value"></span>
									</td>
								</tr>
								<tr class="custom-height-row">
									<th>주소</th>
									<td colspan="3">
										<span id="roadAddress"></span>
									</td>
									<th>퇴사일</th>
									<td>
										<span id="end_date-value"></span>
									</td>
								</tr>
								<tr><th colspan="6">이력사항</th></tr>
								<tr>
									<th>학력</th>
									    <td colspan="2">
									    	<input type="hidden" name="type" value="education" />
									        <div class="inline-layout">
									            기간 <span id="education-start_date-value"></span> ~ <span id="education-end_date-value"></span>
									        </div>
									    </td>
									    <td colspan="2">
									        <div class="inline-layout">
									            학교명 <span id="education-subject-value"></span>
									        </div>
									    </td>
									    <td>
									        <div class="inline-layout">
									            상태 <span id="education-content-value"></span>
									        </div>
									    </td>
								</tr>
								<tr>
									<th>경력</th>
									<td colspan="2">
										<input type="hidden" name="type" value="career" />
										<div class="inline-layout">
											기간 <span id="career-start_date-value"></span> ~ <span id="career-end_date-value"></span>
										</div>
									</td>
									<td colspan="2">
										<div class="inline-layout">
											회사명 <span id="career-subject-value"></span>
										</div>
									</td>
									<td>
										<div class="inline-layout">
											직급 <span id="career-content-value"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>자격</th>
									<td  colspan="2">
										<input type="hidden" name="type" value="qualification" />
										<div class="inline-layout">
											취득일 <span id="qualification-start_date-value"></span>
										</div>
									</td>
									<td colspan="2">
										<div class="inline-layout">
											자격증 <span id="qualification-subject-value"></span>
										</div>
									</td>
									<td>
										<div class="inline-layout">
											기관 <span id="qualification-content-value"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<div id="btn-gap">
											<button type="button" class="btn btn-primary">수정</button>
											<button type="button" class="btn btn-outline-secondary">취소</button>
										</div>
									</td>
								</tr>
							</table>
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
	
<script src='/resources/js/common.js'></script>
<!-- <script src='/resources/js/userInfo.js'></script> -->
<script>

$(document).ready(function(){
    
    // todo - 나중에 동적으로 username 받아서 넘기기 (list, write 에서)
    var username = 'qtgks9';
    getAjax('/ad/user/detail/qtgks9', username);
    
});

function httpSuccess(response){
	console.log(response);
	if(response.status == 202){
    	
		// 프로필 이미지 URL 설정
        if (response.profile) { // response에서 profileImage URL이 있을 경우
            document.getElementById('userProfile').src = '/photo/' + response.profile;
        } else {
            // 기본 이미지 설정 (이미지가 없을 경우)
            document.getElementById('userProfile').src = '/resource/img/logo.jpg';
        }
		
        $('#name-value').text(response.name);
        $('#person_num-value').text(response.person_num);
        $('#username').text(response.username);
        $('#email-value').text(response.email);
        $('#dept-value').text(response.dept_name);
        $('#position_idx-value').text(response.position_content);
        
        if(response.title === 'T'){
	        $('#title_idx-value').text('팀장');
        }else{
        	$('#title_idx-value').text('팀원');
        }
        
        $('#inputFieldPhone').text(response.phone);
        $('#inputFieldComNum').text(response.company_num);
        
        $('#birth-value').text(response.birth);
        
        if(response.gender === 'F'){
        	$('#gender-value').text('여자');
        }else{
        	$('#gender-value').text('남자');
        }
        
        $('#join_date-value').text(response.join_date);
        
        if(response.leave_date === '9999-12-31'){
        	$('#end_date-value').text('재직중');
        }else{
        	$('#end_date-value').text(response.leave_date);
        }
        
        $('#roadAddress').text(response.address);
        
        var careerData = response.career;

        careerData.forEach((item) => {
            // 타입에 따라 행을 찾음
            var row;
            if (item.type === 'education') {
                row = document.querySelector('input[name="type"][value="education"]').closest('tr');
            } else if (item.type === 'career') {
                row = document.querySelector('input[name="type"][value="career"]').closest('tr');
            } else if (item.type === 'qualification') {
                row = document.querySelector('input[name="type"][value="qualification"]').closest('tr');
            }

            if (row) {
                // 데이터 매핑
                if (item.start_date) {
                    const startDateElement = row.querySelector('span[id$="start_date-value"]');
                    if (startDateElement) startDateElement.textContent = item.start_date;
                }
                if (item.end_date) {
                    const endDateElement = row.querySelector('span[id$="end_date-value"]');
                    if (endDateElement) endDateElement.textContent = item.end_date;
                }
                if (item.subject) {
                    const subjectElement = row.querySelector('span[id$="subject-value"]');
                    if (subjectElement) subjectElement.textContent = item.subject;
                }
                if (item.content) {
                    const contentElement = row.querySelector('span[id$="content-value"]');
                    if (contentElement) contentElement.textContent = item.content;
                }
            } else {
                console.warn(`타입 ${item.type}에 해당하는 행을 찾을 수 없습니다.`);
            }
        });
        
	}
} 


</script>

</html>