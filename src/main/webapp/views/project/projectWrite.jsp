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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


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
	/* 조직도 모달 */
	#chartModalBox .chart-td.active {
		border-bottom: 2px solid #333;
	}
	#chartModalBox .left thead {
		margin-bottom: 10px;
	}
	#chartModalBox .bookmark {
	    transform: translateY(10px);
	}
	#chartModalBox .bookmark tr {
		border: none;
	}
	#chartModalBox .bookmark td {
		padding: 8px 16px;
	    text-align: left;
   		font-weight: 500;
   		cursor: pointer;
	}
	
	
	/* 모달 */
	/* 기본 모달 스타일 */
	.modal-dialog {
    	position: static;
    }
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
	#modalBox .modal-close {
    	font-size: 30px;
    }
	#modalBox h5 {
		padding-bottom: 16px;
	}
	#modalBox .form-control {
		display: inline-block;
	}
	#modalBox .input-row {
	    display: flex;
		margin: 6px 0;
	}
	#modalBox .item-tit {
		width: 88px;
	    flex-shrink: 0;
		margin-top: 4px;
	}
	#modalBox input {
		padding-left: 10px;
	}
 	#modalBox .btn{ 
	 	margin: 16px 5px 0;
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
	#selectedUserTable {
    border-collapse: collapse; /* 테이블 테두리를 한 줄로 만듦 */
    border: none; /* 테이블 전체 테두리 제거 */
	}
	
	#selectedUserTable th,
	#selectedUserTable td {
	    border: none; /* 각 셀의 테두리 제거 */
	}
	
	#selectedUserTable thead th {
	    border-bottom: 2px solid #ddd; /* 필요하면 헤더에만 밑줄 추가 */
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
		width: 300px;
	}
	
	
	.jstree-container {
    width: 100%;
    height: 280px; /* 조직도가 보일 충분한 높이 설정 */
    border: 1px solid #cdcdcd;
    overflow: auto;
}
.chart-scroll {
    width: 100%;
    height: 100%;
    overflow-y: auto;
}
.required-value{
		color: var(--bs-danger);
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
						<li><a href="/project/List">프로젝트 리스트</a></li>
						<li class="active"><a href="/project/Write">프로젝트 등록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>프로젝트 등록</h5>
						</div>
						<div class="cont-body">

						<div class="row">

			         <div class="col-12 col-lg-12">
			         <form action="/project/Write" method="post">
			         <input type="hidden" name="_csrf" value="${_csrf.token}" />
                     <table>
                        <tr>
                           <th class="align-l">프로젝트 명<span class="required-value">*</span></th>
                           	<td>
                           		
                           		<input class="form-control sor-1 " name="name"  type="text" placeholder="프로젝트 명을 입력해주세요." required="required"/>
                           		
                        </tr>
                        <tr>
                           <th class="align-l">일정<span class="required-value">*</span></th>
                           <td >
	                           <div id="searchLayout" class="col-7 col-lg-7">
		                           	<input class="form-control sor-1 short"  id="start_date" name="start_date" type="date"  required="required"/>
		                           	~
		                           	<input class="form-control sor-1 short"  type="date" name="end_date"  required="required"/>
	                           </div>
                           </td>
                        </tr>
                        <tr>
                           <th class="align-l">공개설정</th>
                           	<td>
                         		<div class="card-body">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="is_open" value="Y" id="flexRadioDefault1" checked="checked"> <label class="form-check-label" for="flexRadioDefault1">
										공개 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="is_open" value="N" id="flexRadioDefault2" >
									<label class="form-check-label" for="flexRadioDefault2">
										비공개 </label>
								</div>
								</div>	
                           	</td>
                        </tr>
                     	</table>
							<div id="btn-gap">							
								<button type="button" class="btn btn-primary btn-popup">등록</button>
								<button class="btn btn-outline-primary">취소</button>
							</div>
			         </form>
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
 
 
 
 
 
 
 $('.btn-popup').on(
			'click',
			function() {
				layerPopup('프로젝트를 등록하시겠습니까?', '확인', '취소', btn1Act,
						btn2Act);
			});
	
	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		
		// 필수 항목 검사
	    const requiredFields = document.querySelectorAll('.required-value');
	    let allFieldsFilled = true;

	    requiredFields.forEach(field => {
	        const input = field.closest('tr').querySelector('input, select');
	        if (input && !input.value.trim()) {
	            allFieldsFilled = false;
	        	removeAlert(); // 기존팝업닫기
	        }
	    });

	    if (!allFieldsFilled) {
	        // 필수 항목이 비어 있을 경우 팝업 표시
	        layerPopup("필수 항목을 입력해주세요!", "확인", false, removeAlert, removeAlert);


	        removeAlert(); // 기존팝업닫기
	    }

	    // 모든 필수 항목이 입력된 경우 진행
	    layerPopup("등록이 완료 되었습니다.", "확인", "취소", secondBtn1Act, secondBtn2Act);
	}
	
	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		
		removeAlert(); // 팝업닫기
	}
	
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		
		 document.querySelector('form').submit();
		
		removeAlert(); // 팝업닫기
		
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
		
	}
	
 
 
</script>

</html>