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



<!-- 다음 주소 검색 api 사용 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/daumApi.js"></script>

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

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
	
	.filebox .upload-name {
	    display: inline-block;
	    height: 40px;
	    padding: 0 10px;
	    vertical-align: middle;
	    border: 1px solid var(--bs-light-dark);
	    width: 78%;
	    color: #999999;
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
	
	.priview{
		width: 170px;
		height: 270px;
	}
	
	
.gender-th {
    width: 80px; 
    text-align: center; 
}

#overlayMessage{
    display: none;
    margin-bottom: -15px;
    margin-top: -32px;
    font-size: 14px;
    color : var(--bs-primary);
    float: left;
}

.required-value{
	color: var(--bs-danger);
}

#userProfile{
	width: 170px;
	height: 270px;
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
					<h4 class="menu-title">직원 수정</h4>
					<ul>
						<li class="active" id="firstMenu"><a href="#">직원 리스트</a></li>
						<li id="secondMenu"><a href="#">퇴사자 리스트</a></li>
					</ul>
					<div class="btn btn-primary full-size" onclick="location.href='/ad/user/writeView'"><i class="bi bi-plus-lg"></i> 직원 등록</div>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직원수정</h5>
						</div>
						<div class="cont-body"> 
							<!-- 등록 폼 작성 -->
							<input type="hidden" name="username" value="${username}">
							<form>
								<table style="width: 100%; table-layout: fixed;">
									<tr>
										<td rowspan="4" class="filebox">
											<div id="imgPreview"></div>
											<img src="" id="userProfile"/>
											<label for="file">+ 프로필 수정</label>
											<input type="file" id="file" name="file" onchange="clearLogo(); preview(this);" id="fileInput"/>
										</td>
										<th>이름<span class="required-value">*</span></th>
										<td colspan="2">
											<input type="text" name="name" class="form-control" id="name-value" data-required="true"/>
										</td>
										<th>부서<span class="required-value">*</span></th>
										<td>
											<select class="form-select selectStyle" name="parent" id="deptSelect" disabled="disabled" >
											</select>
										</td>
									</tr>
									<tr>
										<th>사번</th>
										<td colspan="2">
											<input type="text" name="person_num" class="form-control" id="person_num-value" disabled="disabled"/>
										</td>
										<th>직위/직책</th>
										<td>
											<div class="inline-layout">
												<select class="form-select selectStyle" name="position" id="position-select">
													<option value="po6">사원</option>
													<option value="po5">주임</option>
													<option value="po4">대리</option>
													<option value="po3">과장</option>
													<option value="po2">차장</option>
													<option value="po1">부장</option>
													<option value="po7">직영점주</option>
												</select> / 
												<select class="form-select selectStyle" name="title" id="title-select">
													<option value="T">팀장</option>
													<option value="U">팀원</option>
												</select>
											</div>
										</td>
									</tr>
									<tr class="custom-height-row">
										<th>아이디<span class="required-value">*</span></th>
										<td colspan="2">
											<div class="inline-layout">
												<input type="text" name="username" class="form-control" id="username" data-required="true" disabled="disabled"/>
											</div>
											<div id="overlayMessage"></div>
										</td>
										<th>핸드폰<span class="required-value">*</span></th>
										<td>
											<input type="text" name="phone" class="form-control" id="inputFieldPhone" data-required="true"/>
										</td>
									</tr>
									<tr>
										<th>이메일<span class="required-value">*</span></th>
										<td colspan="2">
											<div class="inline-layout">
												<input type="email" name="emailInfo" id="emailFirst" class="form-control" data-required="true"/> @ 
												<select class="form-select selectStyle" name="emailAddr" id="emailAddr">
													<option value="@naver.com">naver.com</option>
													<option value="@gmail.com">gmail.com</option>
													<option value="@daum.net">daum.net</option>
													<option value="@nate.com">nate.com</option>
													<option value="@hanmail.net">hanmail.net</option>
													<!-- 기타일 경우 input 창으로 전환 -->
													<option value="ect">기타</option>
												</select>
												
											</div>
										</td>
										<th>사내번호</th>
										<td>
											<input type="text" name="company_num" class="form-control" id="inputFieldComNum"/>
										</td>
									</tr>
									<tr><th colspan="6">기타정보</th></tr>
									<tr>
										<th>생년월일 / 성별<span class="required-value">*</span></th>
										<td colspan="2">
											<div class="inline-layout">
 												<!-- 년도 선택 -->
									            <select class="form-select selectStyle" id="birthYear" name="birthYear"></select>년
									            <!-- 월 선택 -->
									            <select class="form-select selectStyle" id="birthMonth" name="birthMonth"></select>월
									            <!-- 일 선택 -->
									            <select class="form-select selectStyle" id="birthDay" name="birthDay"></select>일
											</div> 
										</td>
										<td> 
											<div class="inline-layout">/ <span style="font-weight: 500;">성별</span>
											<select class="form-select selectStyle" name="gender" id="gender-select">
												<option value="F">여</option>
												<option value="M">남</option>
											</select>
											</div>
										</td>
										<th>입사일<span class="required-value">*</span></th>
										<td>
											<input type="date" name="join_date" class="form-control" id="join_date-value" data-required="true"/>
										</td>
									</tr>
									<tr class="custom-height-row">
										<th>주소<span class="required-value">*</span></th>
										<td colspan="3">
											<div class="inline-layout">
												<input type="text" name="address" class="form-control" id="roadAddress" disabled="disabled" data-required="true"/>
												<button type="button" class="btn btn-sm btn-outline-primary" onclick="addressSearch()"><i class="bi bi-geo-alt-fill"></i></button>
											</div>
										</td>
										<th>퇴사일</th>
										<td>
											<input type="date" name="leave_date" class="form-control"/>
										</td>
									</tr>
									<tr><th colspan="6">이력사항</th></tr>
									<tr>
										<th>학력<span class="required-value">*</span></th>
										    <td colspan="2">
												<input type="hidden" name="type" value="education" />
										        <div class="inline-layout">
										            기간 <input type="date" name="start_date" class="form-control" data-required="true"/> ~ <input type="date" name="end_date" class="form-control" data-required="true"/>
										        </div>
										    </td>
										    <td colspan="2">
										        <div class="inline-layout">
										            학교명 <input type="text" name="subject" class="form-control" data-required="true"/>
										        </div>
										    </td>
										    <td>
										        <div class="inline-layout">
										            상태
										            <select class="form-select selectStyle" name="content">
										                <option value="GR">졸업</option>
										                <option value="EN">재학</option>
										                <option value="LV">휴학</option>
										                <option value="DR">중퇴</option>
										            </select>
										        </div>
										    </td>
									</tr>
									<tr>
										<th>경력</th>
										<td colspan="2">
											<input type="hidden" name="type" value="career" />
											<div class="inline-layout">
												기간 <input type="date" name="start_date" class="form-control" /> ~ <input type="date" name="end_date" class="form-control" /> 
											</div>
										</td>
										<td colspan="2">
											<div class="inline-layout">
												회사명 <input type="text" name="subject" class="form-control" />
											</div>
										</td>
										<td>
											<div class="inline-layout">
												직급 <input type="text" name="content" class="form-control" />
											</div>
										</td>
									</tr>
									<tr>
										<th>자격</th>
										<td  colspan="2">
											<input type="hidden" name="type" value="qualification" />
											<div class="inline-layout">
												취득일 <input type="date" name="start_date" class="form-control" />
											</div>
										</td>
										<td colspan="2">
											<div class="inline-layout">
												자격증 <input type="text" name="subject" class="form-control" />
											</div>
										</td>
										<td>
											<div class="inline-layout">
												기관 <input type="text" name="content" class="form-control" />
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<div id="btn-gap">
												<button type="button" class="btn btn-primary" onclick="layerPopup('직원을 수정하시겠습니까?','수정','취소', userUpdate, removeAlert)">수정</button>
												<!-- todo - 리스트로 이동 -->
												<button type="button" class="btn btn-outline-secondary" onclick="redirectToUpdate()">취소</button>
											</div>
										</td>
									</tr>
								</table>
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

<script src='/resources/js/common.js'></script>
<script src='/resources/js/userInfo.js'></script>

<script>

$(document).ready(function(){
    // 부서 조회
    getAjax('/dept/list');
    
    // todo - 나중에 동적으로 username 받아서 넘기기 (list, write 에서)
    
    var username = $('input[type="hidden"][name="username"]').val();
    httpAjax('POST', '/ad/user/detail/'+username, username);
    
});

function clearLogo() {
    const userProfile = document.getElementById('userProfile');
    userProfile.style.display = 'none';
}
     
function redirectToUpdate(){
	var username = $('input[name="username"]').val();
	location.href = '/ad/user/detailView/' + username;
}
     
</script>

</html>