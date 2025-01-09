<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
<!-- 부트스트랩 -->
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


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
#home,#schedule{
		width: 200px;
	}

	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 230px;
	}

	.tit-area{
		display: flex; 
	}
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.card-body{
		display: flex;	
	}
	#flexRadioDefault2{
		margin-left: 20px;
	}
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
	}
	
	.content{
		display: flex; 
		align-content: cetner;
		border: 1px solid black;
	}
	buttons{
		align-content: cetner;
	}
	.art{
		height: 280px;
	}
	.align-l{
		width: 300px;
		text-align: center
	}
	#btn-gap{
		display: flex;
		gap: 30px;
		align-items: center;
		justify-content: center;
	}
	.short{
		width: 200px;
	}
	#start_date{
		margin-left: 800px;
	}
	.list-form{
		border: 1px solid #E4E6E8;
		border-radius: 6px;
		padding: 10px;
		width: 49%;
    	margin-top: 20px;
    	display: flex;
    	justify-content: space-between;
    	height: 250px;
	}
	.list-row{
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
	p{
		margin-bottom: 0px;
	}
	#first{
		margin-top: 88px;
	}
	#bar{
		margin-top: 10px;
	}
.kanban-board {
  display: flex;
  gap: 20px;
}

.kanban-column {
  flex: 1;
  background: #f7f7f7;
  border-radius: 10px;
  padding: 20px;
}

.kanban-item {
  background: white;
  padding: 10px;
  border-radius: 5px;
  margin-bottom: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  cursor: grab;
}

.tit-area {
  display: flex; /* Flexbox로 자식 요소 정렬 */
  align-items: center; /* 세로 정렬 */
  justify-content: space-between; /* 요소 간 간격 균등 */
  gap: 20px; /* 요소 간 간격 */
}

.kanban-title {
  flex: 1; /* 제목 영역 */
  font-size: 20px;
}

.project-info {
  flex: 3; /* 정보 영역 */
  display: flex;
  justify-content: space-around; /* 내부 요소 간 간격 조정 */
  align-items: center;
}

.progress-bar {
  width: 300px; /* 진행률 바의 가로 크기 */
  background-color: #f0f0f0;
  border: 1px solid var(--bs-primary);
  border-radius: 5px;
  overflow: hidden;
  height: 20px;
}

.progress {
  height: 100%;
  background-color: var(--bs-primary);
  color: #fff;
  text-align: center;
  line-height: 20px;
}
.task-card {
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 10px;
  margin-top: 10px;
  background-color: #f9f9f9;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 입력창 스타일 */
.task-card input {
  display: block;
  width: 100%;
  margin-bottom: 10px;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.task-card button {
  margin-right: 5px;
  padding: 5px 10px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.task-card button.save {
  background-color: #007bff;
  color: white;
}

.task-card button.cancel {
  background-color: #ddd;
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
					<h4 class="menu-title">프로젝트</h4>
					<ul>
						<li class="active"><a href="/ad/project/List">프로젝트 리스트</a></li>
						<li><a href="/ad/project/Write">프로젝트 등록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
						  <h5 class="kanban-title">칸반보드</h5>
						  <div class="project-info">
						    <h4>황금돼지를 잡아라!</h4>
						    <p>참여인원: 5명</p>
						    <p>일정: 2024.12.01 - 2024.12.31</p>
						    <p>진행률:</p>
						    <div class="progress-bar">
						      <div class="progress" style="width: 75%;">75%</div>
						    </div>
						  </div>
						</div>
						<div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                <div class="kanban-board">
				  <div class="kanban-column" id="todo">
				  <h4>처리 전</h4>
				  <div class="task-list" id="todo-list">
				    <!-- 작업 카드들이 추가되는 곳 -->
				  </div>
				  <button class="add-task-btn" onclick="createTaskCard()">+</button>
				</div>
								  
				  
				  <div class="kanban-column" id="in-progress">
				    <h4>진행 중</h4>
				  </div>
				  <div class="kanban-column" id="done">
				    <h4>완료</h4>
				  </div>
				</div>
                  
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

<!-- 조직도 노드 -->
<script src='/resources/js/common.js'></script>
<script src='/resources/js/charjstree.js'></script>

<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- Need: Apexcharts(차트) -->
<script src="/resources/assets/extensions/apexcharts/apexcharts.min.js"></script>
<script src="/resources/assets/static/js/pages/dashboard.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>



<script>

function createTaskCard() {
	  // 작업 리스트 가져오기
	  const taskList = document.getElementById('todo-list');

	  // 새로운 작업 카드 생성
	  const taskCard = document.createElement('div');
	  taskCard.classList.add('task-card');

	  // 작업 카드 내부 HTML
	  taskCard.innerHTML = `
	    <input type="text" placeholder="제목을 입력하세요" class="task-title">
	    
	    <textarea id="content" class="form-control art task-content" placeholder="내용을 입력하세요" name="content"></textarea>
	    <button class="save" onclick="saveTask(this)">저장</button>
	    <button class="cancel" onclick="cancelTask(this)">취소</button>
	  `;

	  // 작업 리스트에 추가
	  taskList.appendChild(taskCard);
	}

	// 저장 버튼 클릭 시
	function saveTask(button) {
	  const taskCard = button.parentElement;
	  const title = taskCard.querySelector('.task-title').value.trim();
	  const content = taskCard.querySelector('.task-content').value.trim();

	  if (title && content) {
	    // 저장된 내용을 표시
	    taskCard.innerHTML = `
	      <h4>${title}</h4>
	      <p>${content}</p>
	    `;
	  } else {
	    alert('제목과 내용을 입력하세요!');
	  }
	}

	// 취소 버튼 클릭 시
	function cancelTask(button) {
	  const taskCard = button.parentElement;
	  taskCard.remove(); // 작업 카드 삭제
	}

	
	
	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		layerPopup("결제방법", "결제하기", "취소", secondBtn1Act, secondBtn2Act);
	}
	
	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
		layerPopup("QR", "결제하기", "취소", thirdBtn1Act, thirdBtn2Act);
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
		
	}
	
	function thirdBtn1Act(){
		console.log('세번째 팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function thirdBtn2Act(){
		console.log('세번째 팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}


</script>

</html>