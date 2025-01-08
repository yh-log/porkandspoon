<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공통 레이아웃 CSS</title>
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
						<li><a href="/ad/project/List">프로젝트 리스트</a></li>
						<li class="active"><a href="/ad/project/Write">프로젝트 등록</a></li>
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
                     <table>
                        <tr>
                           <th class="align-l">프로젝트 명</th>
                           	<td>
                           		
                           		<input class="form-control sor-1 "   type="text" placeholder="프로젝트 명을 입력해주세요." required="required"/>
                           	</td>
                        </tr>
                        <tr>
                           <th class="align-l">일정</th>
                           <td >
	                           <div id="searchLayout" class="col-7 col-lg-7">
		                           	<input class="form-control sor-1 short"  id="start_date" type="date"  required="required"/>
		                           	~
		                           	<input class="form-control sor-1 short"  type="date"  required="required"/>
	                           </div>
                           </td>
                        </tr>
                        <tr>
                           <th class="align-l">공개설정</th>
                           	<td>
                         		<div class="card-body">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked="checked"> <label class="form-check-label" for="flexRadioDefault1">
										공개 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
									<label class="form-check-label" for="flexRadioDefault2">
										비공개 </label>
								</div>
								</div>	
                           	</td>
                        </tr>
                       <tr>
						   <th class="align-l">인원 추가</th>
						   <td>
						   <button type="button" class="btn btn-primary" onclick="loadChartModal('chartInputModal')"><i class="bi bi-diagram-3"></i></button>
						   </td>
						</tr>
                     	</table>
                  		</div>
							<div id="btn-gap">							
								<button class="btn btn-primary">등록</button>
								<button class="btn btn-outline-primary">취소</button>
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
<script src='/resources/js/deptInfo.js'></script>
<script src='/resources/js/textEaditor.js'></script>

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
console.log('${userDTO.name}');

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
        	 
             // 새로운 row 데이터 생성
             const newRow = [userName, userDept, userPosition, '<button class="btn btn-primary">삭제</button>'];

             // 기존 rows에 추가
             initialData.rows.push(newRow);
             exampleData.rows.push(newRow);

             // 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
             updateTableData('customTable', exampleData);
         },
         error: function(e) {
             console.log(e);
         }
     });
 }

	    
 
 getSelectId(function (selectedId) {
     addSelectedIdToRows(selectedId);
 });
 
 
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
 	 
     }else{
     	layerPopup( "본인은 삭제하실 수 없습니다.","확인",false,removeAlert,removeAlert);
     }
 });
 
</script>

</html>