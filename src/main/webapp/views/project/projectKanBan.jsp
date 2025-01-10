<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
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

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


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



.tit-area {
  display: flex; /* Flexbox로 자식 요소 정렬 */
  align-items: center; /* 세로 정렬 */
  justify-content: space-between; /* 요소 간 간격 균등 */
  gap: 20px; /* 요소 간 간격 */
}

.kanban-board {
  display: flex;
  gap: 20px;
  margin-top: 20px;
}

.kanban-column {
  flex: 1;
  background: #f9f9f9; /* 더 밝은 색상으로 변경 */
  border-radius: 10px;
  padding: 20px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.kanban-column h3 {
  font-size: 18px;
  color: #333;
  margin-bottom: 20px;
  text-align: center;
  font-weight: bold;
}

.kanban-item {
  background: #ffffff; /* 작업 카드의 배경색 */
  padding: 15px;
  border-radius: 8px;
  margin-bottom: 15px;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s, box-shadow 0.2s;
  cursor: grab;
}

.kanban-item:hover {
  transform: scale(1.02);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
}

.kanban-item h4 {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 5px;
  color: #444;
}

.kanban-item p {
  font-size: 14px;
  color: #666;
  margin-bottom: 10px;
}

.task-card {
  position: relative;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-top: 10px;
  background-color: #fdfdfd;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  transition: all 0.2s ease;
}

.task-card input,
.task-card textarea {
  display: block;
  width: calc(100% - 20px);
  margin: 10px auto;
  padding: 10px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background: #f9f9f9;
}

.task-card button {
  margin-right: 5px;
  padding: 7px 15px;
  border: none;
  border-radius: 5px;
  font-size: 14px;
  font-weight: bold;
  cursor: pointer;
  background-color: #007bff;
  color: white;
  transition: background-color 0.3s ease;
}

.task-card button.cancel {
  background-color: #ddd;
  color: #555;
}

.task-card button:hover {
  background-color: #0056b3;
}

.add-task-btn {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  font-weight: bold;
  color: white;
  background-color: #28a745;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
  margin-top: 20px;
  width: 100%;
}

.add-task-btn:hover {
  background-color: #218838;
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
						<li class="active"><a href="/project/List">프로젝트 리스트</a></li>
						<li><a href="/project/Write">프로젝트 등록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
						  <h5 class="kanban-title">칸반보드</h5>
						  <div class="project-info">
						    <h4>${info.name}</h4>
						    <p>참여인원:${info.count}명</p>
						    <p>일정: ${info.start_date} ~ ${info.end_date}</p>
						    <p>진행률: ${info.percent}%</p>
						    <div class="progress-bar">
						      <div class="progress" style="width: ${info.percent}%;">${info.percent}%</div>
						    </div>
						  </div>
						</div>
						<div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                <div class="kanban-board">
				  <div class="kanban-column" id="todo">
				    <h4>처리 전</h4>
				    <div class="task-list" id="todoList">
				     <c:forEach var="task" items="${list}">
		                <c:if test="${task.is_class == 'T'}">
		                    <div class="kanban-item" data-kanban-idx="${task.kanban_idx}" data-project-idx="${task.project_idx}">

		                    	 <select class="form-select task-status" name="is_class">
					                <option value="T" <c:if test="${task.is_class == 'T'}">selected</c:if>>처리전</option>
					                <option value="P" <c:if test="${task.is_class == 'P'}">selected</c:if>>진행중</option>
					                <option value="D" <c:if test="${task.is_class == 'D'}">selected</c:if>>완료</option>
					            </select>
		                        <h4>${task.subject}</h4>
		                        <p>${task.content}</p>
		                      
		                       
		                    </div>
		                </c:if>
		            </c:forEach>
				    </div>
				    <button class="add-task-btn" >+</button>
				  </div>
				
				  <div class="kanban-column" id="in-progress">
				    <h4>진행 중</h4>
				    <div class="task-list" id="inProgressList">
				    	 <c:forEach var="task" items="${list}">
			                <c:if test="${task.is_class == 'P'}">
			                    <div class="kanban-item" data-kanban-idx="${task.kanban_idx}" data-project-idx="${task.project_idx}">

			                    	 <select class="form-select task-status" name="is_class">
						                <option value="T" <c:if test="${task.is_class == 'T'}">selected</c:if>>처리전</option>
						                <option value="P" <c:if test="${task.is_class == 'P'}">selected</c:if>>진행중</option>
						                <option value="D" <c:if test="${task.is_class == 'D'}">selected</c:if>>완료</option>
						            </select>
			                        <h4>${task.subject}</h4>
			                        <p>${task.content}</p>
			                     	 
			                    </div>
			                </c:if>
			            </c:forEach>
				    </div>
				  </div>
				
				  <div class="kanban-column" id="done">
				    <h4>완료</h4>
				    <div class="task-list" id="doneList" >
				    	<c:forEach var="task" items="${list}">
			                <c:if test="${task.is_class == 'D'}">
			                    <div class="kanban-item" data-kanban-idx="${task.kanban_idx}" data-project-idx="${task.project_idx}" >
			                     <select class="form-select task-status" name="is_class">
					                <option value="T" <c:if test="${task.is_class == 'T'}">selected</c:if>>처리전</option>
					                <option value="P" <c:if test="${task.is_class == 'P'}">selected</c:if>>진행중</option>
					                <option value="D" <c:if test="${task.is_class == 'D'}">selected</c:if>>완료</option>
					            </select>
			                        <h4>${task.subject}</h4>
			                        <p>${task.content}</p>
			                         
			                    </div>
			                </c:if>
			            </c:forEach>
				    
				    </div>
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

document.querySelector('.kanban-board').addEventListener('change', function(event) {
	  if (event.target.classList.contains('task-status')) {
	    moveTask(event.target);
	  }
	});

	function createTaskCard(listId) {
	  // 작업 리스트 가져오기
	  const taskList = document.getElementById(listId);
	  console.log("createTaskCard called"); // 실행 확인용 로그

	  // 새로운 작업 카드 생성
	  const taskCard = document.createElement('div');
	  taskCard.classList.add('task-card');

	  // 작업 카드 내부 HTML
	  taskCard.innerHTML = `
	    <input type="text"  placeholder="제목을 입력하세요"  id="subject" name= "subject" class="task-title">
	    <input type="text"  name= "project_idx" id="project_idx" hidden=""  value="${idx}" class="task-title" >
	    <textarea class="form-control art task-content" id="content" name="content"  placeholder="내용을 입력하세요" ></textarea>
	    <button class="save">저장</button>
	    <button class="cancel">취소</button>
	  `;

	  // 이벤트 바인딩
	  taskCard.querySelector('.save').addEventListener('click', function () {
	    saveTask(this);
	  });
	  taskCard.querySelector('.cancel').addEventListener('click', function () {
	    taskCard.remove();
	  });

	  // 작업 리스트에 추가
	  taskList.appendChild(taskCard);
	}
	
	
	
	function saveTask(button) {
	    const taskCard = $(button).closest('.task-card');

	    // jQuery로 input, textarea 값 가져오기
	    const title = taskCard.find('input[name="subject"]').val(); // 제목 값 가져오기
	    const content = taskCard.find('textarea[name="content"]').val(); // 내용 값 가져오기
	    const projectIdx = taskCard.find('input[name="project_idx"]').val(); // 프로젝트 idx 값 가져오기

	    console.log("title: " + title);
	    console.log("content: " + content);
	    console.log("projectIdx: " + projectIdx);

	    // CSRF 토큰 가져오기
	    const csrfToken = $('meta[name="_csrf"]').attr('content');
	    const csrfHeader = $('meta[name="_csrf_header"]').attr('content');

	    if (title && content) {
	        // AJAX 요청으로 데이터 서버에 전송
	        $.ajax({
	            url: "/project/saveTask", // 서버에 데이터를 저장할 엔드포인트
	            method: "POST",
	            contentType: "application/json",
	            headers: {
	                [csrfHeader]: csrfToken // CSRF 헤더 추가
	            },
	            data: JSON.stringify({
	                project_idx: projectIdx,
	                subject: title,
	                content: content,
	                is_class: "T", // 초기 상태는 "처리 전" (T)
	            }),
	            success: function (response) {
	                console.log(response);
	                const kanbanIdx = response.kanban_idx;
	                console.log("kanbanIdx: " + kanbanIdx);

	                // 기존 taskCard 내용 제거
	                taskCard.empty();

	                // 상태 선택박스 추가
	                const select = $('<select>')
	                    .addClass('form-select task-status')
	                    .append('<option value="T" selected>처리 전</option>')
	                    .append('<option value="P">진행 중</option>')
	                    .append('<option value="D">완료</option>')
	                    .on('change', function () {
	                        moveTask(this);
	                    });

	                // 제목, 내용, kanbanIdx 추가
	                const titleElem = $('<h4>').text(title);
	                const contentElem = $('<p>').text(content);
	                const kanbanIdxElem = $('<p>').text(kanbanIdx).hide();

	                // taskCard에 새롭게 추가
	                taskCard.append(select)
	                    .append(titleElem)
	                    .append(contentElem)
	                    .append(kanbanIdxElem);

	                alert("작업이 저장되었습니다!");
	            },
	            error: function (xhr, status, error) {
	                console.error("작업 저장 중 오류가 발생했습니다:", error);
	                alert("작업 저장 중 오류가 발생했습니다.");
	            }
	        });
	    } else {
	        alert('제목과 내용을 입력하세요!');
	    }
	}


	function moveTask(select) {
		  // 이동할 taskCard 및 상태 가져오기
		  const taskCard = select.closest('.kanban-item');
		  const status = select.value;

		  // 상태에 따른 targetColumn 설정
		  const targetColumn = document.getElementById(
		    status === 'T' ? 'todoList' : status === 'P' ? 'inProgressList' : 'doneList'
		  );

		  if (targetColumn) {
		    // UI에서 카드 이동
		    targetColumn.appendChild(taskCard);

		    const kanbanIdx = taskCard.dataset.kanbanIdx; // Kanban 카드 ID
		    const projectIdx = taskCard.dataset.projectIdx;
		 
		    const csrfToken = $('meta[name="_csrf"]').attr('content'); // CSRF 토큰
		    const csrfHeader = $('meta[name="_csrf_header"]').attr('content');

		    console.log("kanbanIdx: " + kanbanIdx);
		    console.log("projectIdx: " + projectIdx);
			
			
		    if (!kanbanIdx || !projectIdx) {
		        console.error("kanbanIdx 또는 projectIdx가 정의되지 않았습니다!");
		        return;
		      }

		    // AJAX 요청으로 상태값만 업데이트
		    $.ajax({
		      url: '/project/updateStatus', // 상태값 업데이트용 엔드포인트
		      method: 'PUT',
		      contentType: 'application/json',
		      headers: {
		        [csrfHeader]: csrfToken // CSRF 헤더 추가
		      },
		      data: JSON.stringify({
		        kanban_idx: kanbanIdx,
		        project_idx: projectIdx, // Kanban 카드 ID
		        is_class: status // 변경된 상태값
		      }),
		      success: function () {
		        console.log('상태가 업데이트되었습니다.');
		      },
		      error: function (xhr, status, error) {
		        console.error('상태 업데이트 중 오류가 발생했습니다.', error);
		        alert('상태 업데이트 중 오류가 발생했습니다.');
		      }
		    });
		  } else {
		    console.error('Target column not found for status:', status);
		  }
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