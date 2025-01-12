<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직원 등록</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet" href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">


<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">



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

	.userInfoText{
		font-weight: 600;
		margin-right: 15px;
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
						<li class="active" id="firstMenu"><a href="/ad/user/listView">직원 리스트</a></li>
						<li id="secondMenu"><a href="/ad/user/listView">퇴사자 리스트</a></li>
					</ul>
					<div class="btn btn-primary full-size" onclick="location.href='/ad/user/writeView'"><i class="bi bi-plus-lg"></i> 직원 등록</div>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">직원정보</h5>
						</div>
						<div class="cont-body"> 
							<input type="hidden" name="username" value="${username}">
							<button class="btn btn-sm btn-outline-secondary" style="float: right;" type="button" onclick="layerPopup('비밀번호를 초기화하시겠습니까?','확인','취소', passwordReset, removeAlert)">비밀번호 초기화</button>
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
												<span class="userInfoText">기간</span> <span id="education-start_date-value"></span>  <span id="education-end_date-value"></span>
									        </div>
									    </td>
									    <td colspan="2">
									        <div class="inline-layout">
												<span class="userInfoText">학교명</span> <span id="education-subject-value"></span>
									        </div>
									    </td>
									    <td>
									        <div class="inline-layout">
												<span class="userInfoText">상태</span> <span id="education-content-value"></span>
									        </div>
									    </td>
								</tr>
								<tr>
									<th>경력</th>
									<td colspan="2">
										<input type="hidden" name="type" value="career" />
										<div class="inline-layout">
											<span class="userInfoText">기간</span> <span id="career-start_date-value"></span>  <span id="career-end_date-value"></span>
										</div>
									</td>
									<td colspan="2">
										<div class="inline-layout">
											<span class="userInfoText">회사명</span> <span id="career-subject-value"></span>
										</div>
									</td>
									<td>
										<div class="inline-layout">
											<span class="userInfoText">직급</span> <span id="career-content-value"></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>자격</th>
									<td  colspan="2">
										<input type="hidden" name="type" value="qualification" />
										<div class="inline-layout">
											<span class="userInfoText">취득일</span> <span id="qualification-start_date-value"></span>
										</div>
									</td>
									<td colspan="2">
										<div class="inline-layout">
											<span class="userInfoText">자격증</span> <span id="qualification-subject-value"></span>
										</div>
									</td>
									<td>
										<div class="inline-layout">
											<span class="userInfoText">기관</span> <span id="qualification-content-value"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<div id="btn-gap">
											<button type="button" class="btn btn-primary" onclick="redirectToUpdate()">수정</button>
											<button type="button" class="btn btn-outline-secondary" onclick="location.href='/ad/user/listView'">목록</button>
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
<script src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	
<script src='/resources/js/common.js'></script>
<!-- <script src='/resources/js/userInfo.js'></script> -->
<script>

$(document).ready(function(){
    
	var username = $('input[name="username"]').val();
    httpAjax('POST', '/ad/user/detail/'+username, username);
    
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
                    if (startDateElement) startDateElement.textContent = item.start_date + ' ~ ';
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
                    if (contentElement) {
                        // content 값에 따라 표시될 텍스트 설정
                        switch (item.content) {
                            case 'GR':
                                contentElement.textContent = '졸업';
                                break;
                            case 'EN':
                                contentElement.textContent = '재학';
                                break;
                            case 'LV':
                                contentElement.textContent = '휴학';
                                break;
                            case 'DR':
                                contentElement.textContent = '중퇴';
                                break;
                            default:
                                contentElement.textContent = item.content; // 예외 처리
                        }
                    }
                }
            } else {
                console.warn(`타입 ${item.type}에 해당하는 행을 찾을 수 없습니다.`);
            }
        });
        
	}
} 

function redirectToUpdate(){
	var username = $('input[name="username"]').val();
	location.href = '/ad/user/update/' + username;
}

function passwordReset(){
	var username = {'username' : $('input[name="username"]').val()}
	getAjax('/ad/user/passwordReset', 'JSON', username);
}

function getSuccess(response){
	console.log(response === true);
	removeAlert();
	if(response){
		layerPopup("비밀번호 초기화가 안료되었습니다.", "확인", false, removeAlert, removeAlert);
	}else{
		layerPopup("비밀번호 초기화에 실패했습니다.", "확인", false, removeAlert, removeAlert);
	}
}
</script>

</html>