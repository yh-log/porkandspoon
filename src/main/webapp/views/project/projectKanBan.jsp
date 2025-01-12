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

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/chartModal.css">
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

.task-status{
 width: 100px;
 margin-left: 260px;
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
.card-content{
	margin-bottom: 15px;
}
.card-body{
	margin-bottom: 15px;
}
#searchLayout{
	display: flex;
}
#title{
	margin-left: -30px;
}
#home,#schedule{
		width: 200px;
		margin-left: -15px;
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
					<div class="buttons">							
						<button class="btn btn-primary" id="schedule" >인원 변경하기</button>
					</div>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
						  <h5 class="kanban-title">칸반보드</h5>
						  <div class="project-info">
						    <h4>${info.name}</h4>
						    <p>참여인원:${info.count}명</p>
						    <p>일정: ${info.start_date} ~ ${info.end_date}</p>
						    <div id="progress-text">진행률: ${info.percent}%</div>
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
<script src="/resources/assets/compiled/js/app.js"></script>
<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>
<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>



<script>

/* 조직도노드  */
	//초기 데이터
	const initialData = {
   headers: ['이름', '부서', '직급', '삭제'],
   rows: [
       ['${userDTO.name}', '${userDTO.dept.text}', '${userDTO.position_content}', '<button class="btn btn-primary">삭제</button>'],
   ]
	};

	var exampleData = JSON.parse(JSON.stringify(initialData));
	console.log("이거뭐야?"+exampleData);
	
	// 선택된 ID를 rows에 추가하는 함수
	var approvalLines = ['${userDTO.username}'];
	console.log("approvalLines 배열:", approvalLines);
	
// 선택된 ID를 rows에 추가하는 함수
function addSelectedIdToRows(selectedId) {
    console.log("가져온 ID:", selectedId);
    if(approvalLines.includes(selectedId)){
   	 layerPopup( "이미 등록된 결재자입니다.","확인",false,removeAlert,removeAlert);
    	 return false;
    }
    approvalLines.push(selectedId);
    console.log("approvalLines:", approvalLines);
    $.ajax({
        type: 'GET',
        url: '/ad/project/getUserInfo/'+selectedId,
        data: {},
        dataType: "JSON",
        success: function(response) {
       	 console.log("유저이름: ",response.name);
       	 console.log("유저정보: ",response.position_content);
       	 console.log("유저정보: ",response.dept.text);
       	 
       	 var userName = response.name;
       	 var userPosition = response.position_content;
       	 var userDept = response.dept.text;
       	 console.log(userPosition);
            // 새로운 row 데이터 생성
            const newRow = [userName, userDept, userPosition, '<button class="btn btn-primary">삭제</button>'];

            // 기존 rows에 추가
            initialData.rows.push(newRow);
            exampleData.rows.push(newRow);

            // 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
            updateTableData('customTable', exampleData);
           

            // 삭제 버튼 이벤트 연결
            bindRemoveUserEvent();
        	

        },
        error: function(e) {
            console.log(e);
        }
    });
}

function setupModalEvents(modal) {
	    var closeModal = modal.querySelector("#closeModal");
	    var cancelButton = modal.querySelector("#cancelModal");
	    var addButton = modal.querySelector("#addModal");

	    // 확인 클릭 이벤트
	    if (addButton) {
	        addButton.addEventListener("click", function () {
	            addBtnFn(approvalLines);
	        });
	    }
	    
	    // 닫기 버튼 클릭 이벤트
	    if (closeModal) {
	        closeModal.addEventListener("click", function () {
	            modal.style.display = "none";
	            resetTableData();
	        });
	    }

	    // 취소 버튼 클릭 이벤트
	    if (cancelButton) {
	        cancelButton.addEventListener("click", function () {
	            modal.style.display = "none";
	            resetTableData();
	        });
	    }

	   
	}


function chartPrint(response) {
	    console.log(response, '받아온 데이터');

	    // 데이터 정렬 (menuDepth -> menuOrder 순서로 정렬)
	    response.sort(function (a, b) {
	        if (a.menuDepth === b.menuDepth) {
	            return a.menuOrder - b.menuOrder; // 같은 depth라면 menuOrder로 정렬
	        }
	        return a.menuDepth - b.menuDepth; // depth 기준 정렬
	    });

	    console.log("AJAX 응답 데이터 (정렬 후):", response);

	    // jsTree 데이터 형식으로 변환
	    const processedData = processJsTreeData(response);

	    console.log("jsTree 변환 데이터:", processedData);

	    $('#jstree').jstree('destroy').empty();
	    // jsTree 초기화
	    $('#jstree').jstree({
	        'core': {
	            'data': function (node, callback) {
	                // 루트 노드 (#) 또는 특정 노드의 children 반환
	                if (node.id === "#") {
	                    callback(processedData.filter(item => item.parent === "#"));
	                } else {
	                    callback(processedData.filter(item => item.parent === node.id));
	                }
	            },
	            'themes': {
	                'dots': true,
	                'icons': true
	            }
	        },
	        "plugins": ["types", "search"],
	        "types": {
	            "default": { "icon": "bi bi-house-fill" }, // 기본 폴더 아이콘
	            "file": { "icon": "bi bi-person-fill" }    // 파일 아이콘
	        },
	        "search": {
	            "show_only_matches": true,
	            "show_only_matches_children": true
	        }
	    }).on('loaded.jstree', function () {
	        console.log("jsTree가 성공적으로 초기화되었습니다.");
	        $("#jstree").jstree("open_all");

	        // 검색 이벤트 처리
	        let searchTimeout = null;
	        $('.input-test').on('input', function () {
	            const search = $(this).val();

	            // 이전 타임아웃 제거
	            if (searchTimeout) {
	                clearTimeout(searchTimeout);
	            }

	            // 입력 후 300ms 후에 검색 실행
	            searchTimeout = setTimeout(function () {
	                $('#jstree').jstree('search', search);
	            }, 300);
	        });

	    }).on('changed.jstree', function (e, data) {
	        console.log("선택된 노드:", data.selected);
	        if (data.selected.length > 0) {
	        	
	            const selectedId = data.selected[0]; // 선택된 노드의 ID
	            console.log("선택된 노드 ID:", selectedId);

	            // 설정된 콜백 함수 호출
	            if (typeof selectIdCallback === "function") {
	                selectIdCallback(selectedId); // 콜백 함수에 선택된 ID 전달
	            }
	        } else {
	            console.log("선택된 노드가 없습니다.");
	        }
	    }).on("load_node.jstree", function (e, data) {
	        console.log("노드 로드 완료:", data.node);
	    });
	    
}


//조직도 노드 해당 사원 삭제
$(document).on('click', '#chartModalBox #orgBody .btn', function() {
    var idx = $(this).closest('tr').index();
    console.log(idx);
    if(idx != 0){
	    $(this).closest('tr').remove();
	    initialData.rows.splice(idx, 1);
	    exampleData.rows.splice(idx, 1);
	    approvalLines.splice(idx, 1);
	    console.log("approvalLines 수정 : ",approvalLines);
	   // 테이블에서 해당 행 삭제
	   
	   
    }else{
    	layerPopup( "본인은 삭제하실 수 없습니다.","확인",false,removeAlert,removeAlert);
    }
});






getSelectId(function (selectedId) {
 addSelectedIdToRows(selectedId);
});

function addBtnFn(approvalLines) {
	    console.log("addBtnFn 호출됨. Approval Lines 데이터:", approvalLines);

	    // selectedUserTable 테이블 업데이트
	    const tbody = document.querySelector("#selectedUserTable tbody");
	    tbody.innerHTML = ""; // 기존 내용을 초기화

	    approvalLines.forEach((id) => {
	        // approvalLines의 각 ID에 대해 initialData.rows에서 일치하는 데이터를 가져옴
	        const row = exampleData.rows.find(r => r.includes(id));
	        if (row) {
	            const tr = document.createElement("tr");
	            row.forEach((cellContent, index) => {
	                if (index !== row.length - 1) { // 삭제 버튼을 제외하고 추가
	                    const td = document.createElement("td");
	                    td.innerHTML = cellContent;
	                    tr.appendChild(td);
	                }
	            });
	            tbody.appendChild(tr); // 생성된 행을 테이블에 추가
	        } else {
	            console.error(`ID(${id})에 해당하는 데이터를 찾을 수 없습니다.`);
	        }
	    });

	    console.log("테이블 업데이트 완료. 업데이트된 테이블 데이터:", tbody.innerHTML);
	}













//Add event listener for the Add Task button
document.querySelector('.add-task-btn').addEventListener('click', function () {
    createTaskCard('todoList'); // ID 'todoList'를 가진 영역에 작업 카드를 추가
});

// 기존 Move Task 이벤트 리스너
document.querySelector('.kanban-board').addEventListener('change', function (event) {
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
	                is_class: "T"// 초기 상태는 "처리 전" (T)
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
					
	                const percent = response.percent;
	                updateProgressBar(percent); // 진행률 업데이트 함수 호출
	                
	                
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
		      success: function (response) {
	                console.log('상태가 업데이트되었습니다.', response);

	                // 서버 응답에서 퍼센트 값을 가져와 UI 업데이트
	                const percent = response.percent;
	                updateProgressBar(percent); // 진행률 업데이트 함수 호출
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

	function updateProgressBar(percent) {
	    // 진행률 반올림
	    const roundedPercent = Math.round(percent);

	    const progressText = document.getElementById('progress-text');
	    if (progressText) {
	        progressText.textContent = '진행률: ' + roundedPercent + '%'; // 진행률 텍스트 변경
	    }

	    // 진행률 바 업데이트
	    const progressBar = document.querySelector('.progress-bar .progress');
	    if (progressBar) {
	        progressBar.style.width = roundedPercent + '%'; // 문자열 연결로 너비 설정
	        progressBar.textContent = roundedPercent + '%'; // 진행률 표시
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