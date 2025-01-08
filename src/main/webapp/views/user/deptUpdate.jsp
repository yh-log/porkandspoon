<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>브랜드 등록</title>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


<!-- select -->
<link rel="stylesheet" href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">
<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/chartModal.css">
<link rel="stylesheet" href="/resources/css/common.css">






<style>
	#selectBox{
		display: flex;
		gap: 10px;
		align-items: center;
		margin-top: 15px;
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
	
	.radioLayoutBox{
		display: flex;
	    gap: 20px;
    	font-weight: 500;
	}
	
	#overlayMessage{
	    display: none;
	    margin-bottom: -15px;
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
	
	.priview{
		width: 170px;
		height: 270px;
	}
	
	#deptLogo{
		width: 180px;
    	height: 200px;
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
					<h4 class="menu-title">부서 리스트</h4>
					<ul>
						<li class="active" id="firstMenu"><a href="/ma/dept/listView">브랜드 리스트</a></li>
						<li id="secondMenu"><a href="/ma/store/list">직영점 리스트</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject">브랜드 수정</h5>
						</div>
						<div class="cont-body"> 
							<form>
								<table>
									<tr>
										<td rowspan="3" class="filebox">
											<div id="imgPreview"></div>
											<img src="" id="deptLogo"/>
											<label for="file">+ 로고 수정</label>
											<input type="file" id="file" name="file" onchange="clearLogo(); preview(this);" id="fileInput"/>
										</td>
										<th>브랜드 명</th>
										<td colspan="2"><input type="text" name="text"  class="form-control" value="${deptInfo.text}	" data-required="true"/></td>
										<th>브랜드 코드</th>
										<td>
											<input type="text" name="id" id="deptCode" class="form-control input-readonly" data-required="true" value="${deptInfo.id}"/>
										</td>
									</tr>
									<tr>
										<th>활성</th>
										<td colspan="2">
											<div class="radioLayoutBox">
												<input type="radio" name="use_yn" value="Y" class="form-check-input"/> 활성
	 										    <input type="radio" name="use_yn" value="N" class="form-check-input"> 비활성
	 									    </div>
										</td>
										<th>시행일자</th>
										<td>
											<input type="date" name="use_date" class="form-control" value="${deptInfo.use_date}" data-required="true"/>
										</td>
									</tr>
									<tr class="custom-height-row">
										<th>소속 직원</th>
										<td colspan="4">
											<div class="inline-layout">
												<input type="text" name="deptUsername" class="form-control .disable" disabled="disabled" value="${deptInfo.user_name}"/>
												<button type="button" class="btn btn-primary" onclick="loadChartModal('chartInputModal')" ><i class="bi bi-diagram-3"></i></button>
												<input type="hidden" name="user_name">
											</div>
										</td>
									</tr>
									<tr><th colspan="6">설명</th></tr>
									<tr>
										<td colspan="6">
											<textarea name="postContent" id="summernote" maxlength="10000"></textarea>
										</td>
									</tr>
								</table>
								<div class="btn-Layout">
									<button type="button" class="btn btn-primary" onclick="layerPopup('브랜드를 수정하시겠습니까?','수정','취소', deptUpdate, removeAlert)">수정</button>
									<button type="button" class="btn btn-outline-primary" onclick="location.href='/ad/dept/detail/${deptInfo.id}'">취소</button>
								</div>
							</form>
						</div> <!-- cont-body -->
					</div>
				</section>	
			</div>
		</div>
	</div>
	<!-- 조직도 모달 사용 시 추가 -->
	<div id="chartModalBox" class="modal" style="display: none;">
		<div class="chartModal-content"></div>
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
<script src='/resources/js/charjstree.js'></script>
<script src='/resources/js/textEaditor.js'></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
	
	$(document).ready(function() {
	    // Summernote 초기화
	    $('#summernote').summernote({
	        height: 300
	    });
	    
	    // 서버에서 전달된 데이터 읽기
	    var content = '${deptInfo.content}';
	    
	    // Summernote에 데이터 삽입
	    $('#summernote').summernote('code', content);
	    
		var logofile = '${deptInfo.logo}';
	    
	    if(logofile){
	    	document.getElementById('deptLogo').src = '/photo/' + logofile;
	    }else{
	    	 document.getElementById('deptLogo').src = '/resource/img/google.png';
	    }
	    
		var deptCodeOverlay = true;
		
		var use_yn = '${deptInfo.use_yn}';
		
		if (use_yn === 'Y') {
	        document.querySelector('input[name="use_yn"][value="Y"]').checked = true;
	    } else {
	        document.querySelector('input[name="use_yn"][value="N"]').checked = true;
	    }
	});
	
	function clearLogo() {
        const deptLogo = document.getElementById('deptLogo');
        deptLogo.style.display = 'none';
    }

	const userInfo = JSON.parse('${userInfo}');


	userInfo.forEach(user => {
		console.log(user);
	})

	/* 조직도노드  */
	//초기 데이터
	const initialData = {
		headers: ['이름', '부서', '직급', '삭제'],
		rows: [

		],
		footer: '<div></div>'
	};

	userInfo.forEach(user => {
		initialData.rows.push([user.name, user.dept_name, user.position, '']);
	});

	const exampleData = JSON.parse(JSON.stringify(initialData));

	// 선택된 ID를 rows에 추가하는 함수
	function addSelectedIdToRows(selectedId) {
		console.log("가져온 ID:", selectedId);

		// 현재 데이터 모두 확인
		const isAlreadyAdded = [...initialData.rows, ...exampleData.rows].some(row => {
			const rowUsername = row[3]?.match(/'([^']+)'/); // row[3]에서 username 값 추출
			return rowUsername && rowUsername[1] === selectedId;
		});

		if (isAlreadyAdded) {
			alert("이미 추가된 사용자입니다!");
			return; // 중복된 경우 함수 종료
		}

		let username = {'username':selectedId};

		getAjax('/ad/dept/userAppend', 'JSON', username);

	}

	// 선택된 ID를 받아서 처리
	getSelectId(function (selectedId) {
		addSelectedIdToRows(selectedId);
	});

	$(document).on('click', '#addModal', function () {
		console.log("등록 버튼 클릭됨!");

		const newUsers = exampleData.rows.map(row => {
			const match = row[3]?.match(/chartTableDelete\(this, '([^']+)', '([^']+)', '([^']+)'\)/); // username과 name 추출
			return match ? { username: match[1], name: match[2], parent: match[3]} : null; // 객체로 반환
		}).filter(user => user !== null); // null 값 제거

		console.log("새롭게 추가된 사용자들의 username:", newUsers);

		if (newUsers.length === 0) {
			console.log("새롭게 추가된 사용자가 없습니다.");
			return;
		}

		// 필요에 따라 추가 작업 수행
		newUsers.forEach(user => {
			console.log("Username:", user.username, "Name:", user.name, "Parent", user.parent);
		});

		// 초기값을 설정하지 않으면 앞에 undefined 이 붙는다!
		let deptUsername = '';
		let usernames = '';
		for(const user of newUsers){
			if(user.parent !== 'NO1000'){
				layerPopup("미발령 직원만 선택 가능합니다.", '확인', false, removeAlert, removeAlert);
				break;
			}else{
				deptUsername += ' ' + user.name;
				usernames += user.username + ' ';
				const modal = document.querySelector("#chartModalBox");
				modal.style.display = "none";

			}
		}
		console.log(deptUsername);
		console.log(usernames);
		let defaultValue = $('input[name="deptUsername"]').val();
		$('input[name="deptUsername"]').val(defaultValue + deptUsername);
		$('input[name="user_name"]').val(usernames);

	});

	// 선택된 username 삭제 (조직도)
	function chartTableDelete(element, username) {
		console.log('삭제 실행 ', username);

		// 1. 해당 버튼의 부모 tr 요소 찾기
		const row = element.closest('tr'); // 호출된 버튼을 기준으로 tr 찾기

		// 2. 행 삭제
		if (row) {
			row.remove(); // 테이블에서 해당 행 삭제
		}

		// 3. exampleData.rows에서 해당 username에 해당하는 데이터 제거
		exampleData.rows = exampleData.rows.filter(function (row) {
			return row[3].indexOf(username) === -1; // username과 일치하지 않는 데이터만 남김
		});

		// 4. 테이블 데이터 업데이트
		updateTableData('customTable', exampleData);

		console.log('삭제 완료!');
	}




</script>

</html>