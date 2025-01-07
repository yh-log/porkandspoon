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
		  href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

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

	.input-readonly {
	    pointer-events: none; /* 입력 및 클릭 불가 */
	    background-color: #f0f0f0; /* 읽기 전용처럼 보이도록 회색 처리 */
	    color: #888; /* 텍스트 색상 변경 */
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
					<h4 class="menu-title">직원 등록</h4>
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
							<h5 id="subMenuSubject">직원등록</h5>
						</div>
						<div class="cont-body"> 
							<!-- 등록 폼 작성 -->
							<form>
								<table style="width: 100%; table-layout: fixed;">
									<tr>
										<td rowspan="4" class="filebox">
											<div id="imgPreview"></div>
											<label for="file">+ 프로필 등록</label>
											<input type="file" id="file" name="file" onchange="preview(this)" id="fileInput"/>
										</td>
										<th>이름<span class="required-value">*</span></th>
										<td colspan="2">
											<input type="text" name="name" class="form-control" data-required="true"/>
										</td>
										<th>부서<span class="required-value">*</span></th>
										<td>
											<select class="form-select selectStyle" name="parent" id="deptSelect">
											</select>
										</td>
									</tr>
									<tr>
										<th>사번</th>
										<td colspan="2">
											<input type="text" name="person_num" class="form-control" disabled="disabled"/>
										</td>
										<th>직위/직책</th>
										<td>
											<div class="inline-layout">
												<select class="form-select selectStyle" name="position">
													<option value="po6">사원</option>
													<option value="po5">주임</option>
													<option value="po4">대리</option>
													<option value="po3">과장</option>
													<option value="po2">차장</option>
													<option value="po1">부장</option>
													<option value="po7">직영점주</option>
												</select> / 
												<select class="form-select selectStyle" name="title">
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
												<input type="text" name="username" class="form-control" id="username" data-required="true"/>
												<button type="button" class="btn btn-sm btn-outline-primary" onclick="usernameOverlay()"><i class="bi bi-check-lg"></i></button>
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
												<input type="email" name="emailInfo" class="form-control" data-required="true"/> @ 
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
											<select class="form-select selectStyle" name="gender">
												<option value="F">여</option>
												<option value="M">남</option>
											</select>
											</div>
										</td>
										<th>입사일<span class="required-value">*</span></th>
										<td>
											<input type="date" name="join_date" class="form-control" data-required="true"/>
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
											<input type="date" name="leave_date" class="form-control" value="9999-12-31" disabled="disabled"/>
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
												<button type="button" class="btn btn-primary" onclick="layerPopup('직원을 등록하시겠습니까?','등록','취소', userWrite, removeAlert)">등록</button>
												<!-- todo - 리스트로 이동 -->
												<button type="button" class="btn btn-outline-secondary" onclick="location.href='/ad/user/listView'">취소</button>
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
	    getAjax('/ad/dept/list', 'JSON');
	});



    

    

    
    
     
</script>

</html>