/**
* author yh.kim (24.12.31)
* 조직도 모달 기능 (조직도 노드 조회, 직원 추가, 동적 데이터 삽입)
*/

// CSS 및 JS 라이브러리 동적 로드 함수
function loadResources(callback) {
    // CSS 동적 로드
    var cssFiles = [
        "https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css",
        "https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
    ];
    cssFiles.forEach(function (href) {
        var link = document.createElement("link");
        link.rel = "stylesheet";
        link.href = href;
        document.head.appendChild(link);
    });

    // JS 동적 로드
    var jsFiles = [
        "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js",
        "https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"
    ];

    // 순서대로 로드 보장
    function loadScript(index) {
        if (index >= jsFiles.length) {
            if (typeof callback === "function") callback(); // 모든 파일 로드 후 콜백 실행
            return;
        }

        var script = document.createElement("script");
        script.src = jsFiles[index];
        script.onload = function () {
            loadScript(index + 1); // 다음 스크립트 로드
        };
        script.async = false; // 순서 보장
        document.head.appendChild(script);
    }

    loadScript(0); // 첫 번째 스크립트 로드 시작
}

const selectedNode = null;

function loadChartModal(modalId) {
    console.log("받은 modalId:", modalId); // 디버깅

    var modal = document.getElementById("chartModalBox");
    var modalContent = modal.querySelector(".chartModal-content");

    $.ajax({
        url: "/resources/html/chartModal.html", // 모달 HTML 파일 경로
        type: "GET",
        success: function (html) {
            var tempDiv = document.createElement("div");
            tempDiv.innerHTML = html;

            console.log("AJAX 로드된 tempDiv.innerHTML:", tempDiv.innerHTML); // 로드된 HTML 확인

            if (modalId && modalId.trim() !== "") {
                // 문자열 조합으로 선택자 생성
                var selector = "#" + modalId; // 템플릿 리터럴 대신 문자열 조합
                console.log("생성된 선택자:", selector); // 선택자 확인

                var selectedModal = tempDiv.querySelector(selector);
                console.log("찾은 모달:", selectedModal); // 선택된 요소 확인

                if (selectedModal) {
                    modalContent.innerHTML = selectedModal.innerHTML;
                    modal.style.display = "block";
                    setupModalEvents(modal);

                    // 데이터 업데이트 함수 호출
                    loadOrgChartData(); // 조직도 데이터 로드
                    updateTableData('customTable', exampleData); // 테이블 데이터 업데이트
                } else {
                    console.error(`모달 ID(${modalId})와 일치하는 요소를 찾을 수 없습니다.`);
                }
            } else {
                console.error("modalId가 유효하지 않거나 비어 있습니다.");
            }
        },
        error: function () {
            console.error("모달 HTML 파일을 로드하는 데 실패했습니다.");
        },
    });
}






// 조직도 데이터를 불러오는 함수
function loadOrgChartData() {
    $.ajax({
        url: "/getOrgChartData", // SQL 쿼리 결과를 반환하는 API URL
        type: "GET",
        success: function(response) {
            
            chartPrint(response);
        },
        error: function() {
            console.error("조직도 데이터를 로드하는 데 실패했습니다.");
        }
    });
}



function chartPrint(response){
 // 데이터 정렬 (menuDepth -> menuOrder 순서로 정렬)
            response.sort(function (a, b) {
                if (a.menuDepth === b.menuDepth) {
                    return a.menuOrder - b.menuOrder; // 같은 depth라면 menuOrder로 정렬
                }
                return a.menuDepth - b.menuDepth; // depth 기준 정렬
            });

            console.log("AJAX 응답 데이터 (정렬 후):", response);

            // jsTree 데이터 형식으로 변환
            var jsTreeData = response.map(function(item) {
                return {
                    id: item.id, // 고유 ID
                    parent: item.parent, // 부모 ID
                    text: item.text, // 노드에 표시할 텍스트
                    type: item.type, // 노드 유형
                    li_attr: { // HTML <li> 태그에 추가 속성
                        "data-menu-depth": item.menuDepth,
                        "data-menu-order": item.menuOrder
                    },
                    a_attr: { // HTML <a> 태그에 추가 속성
                        "data-menu-depth": item.menuDepth,
                        "data-menu-order": item.menuOrder
                    }
                };
            });

            console.log("jsTree 변환 데이터:", jsTreeData);

            // jsTree 초기화
            $('#jstree').jstree({
                'core': {
                    'themes': {
                        'dots': true,
                        'icons': true
                    },
                    'data': jsTreeData // 변환된 데이터
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
            });
            
            
            // 이벤트 등록
            $('#jstree').on('loaded.jstree', function () {
                console.log("jsTree가 성공적으로 초기화되었습니다.");
				$("#jstree").jstree("open_all");
				
				let searchTimeout = null;
			    $('.input-test').on('input', function () {
			        let search = $(this).val();
			
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
			        var selectedId = data.selected[0]; // 선택된 노드의 ID
			        console.log("선택된 노드 ID:", selectedId);
			
			        // 설정된 콜백 함수 호출
			        if (typeof selectIdCallback === "function") {
			            selectIdCallback(selectedId); // 콜백 함수에 선택된 ID 전달
			        }
			    } else {
			        console.log("선택된 노드가 없습니다.");
			    }
	        });
	        
}

function getSelectId(callback) {
    selectIdCallback = callback;
}


function setupModalEvents(modal) {
    var closeModal = modal.querySelector("#closeModal");
    var cancelButton = modal.querySelector("#cancelModal");
    var addButton = modal.querySelector("#addModal");

    // 확인 클릭 이벤트
    if (addButton) {
        addButton.addEventListener("click", function () {
            addBtnFn();
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


function updateTableData(tableId, data) {
    console.log("업데이트할 데이터:", data);

    // 1. thead 처리
    const header = document.querySelector("#" + tableId + " #orgHeader");
    if (data.headers) {
        header.innerHTML = '<tr>' + data.headers.map(function (header) {
            return '<th>' + header + '</th>';
        }).join('') + '</tr>';
    }

    // 2. tbody 처리
    const body = document.querySelector("#" + tableId + " #orgBody");
    if (data.rows && data.rows.length > 0) {
        body.innerHTML = data.rows
            .map(function (row) {
                return '<tr>' + row.map(function (cell) {
                    return '<td>' + cell + '</td>';
                }).join('') + '</tr>';
            })
            .join('');
    } else {
        body.innerHTML = '<tr><td colspan="4">데이터가 없습니다.</td></tr>';
    }

    // 3. tfoot 처리
    const footer = document.querySelector("#" + tableId + " #orgFooter");
    if (data.footer) {
        footer.innerHTML = '<tr><th colspan="4">' + data.footer + '</th></tr>';
    }
}

function resetTableData() {
    exampleData.rows = JSON.parse(JSON.stringify(initialData.rows)); // 초기 데이터로 복원
    updateTableData('customTable', exampleData); // 초기화된 데이터를 테이블에 반영
    console.log("테이블 데이터가 초기화되었습니다. 초기 데이터로 복원됨:", exampleData.rows);
}


// transferBox 내부 내용을 업데이트하는 함수
function updateTransferBox(boxId, data) {
    console.log("업데이트할 데이터:", data);

    // 1. 발령일자 업데이트
    if (data.transferDate) {
        const dateInput = document.querySelector(`#${boxId} input[name='transfer_date']`);
        if (dateInput) {
            dateInput.value = data.transferDate;
        }
    }

    // 2. 버튼 내용 업데이트
    if (data.buttons && data.buttons.length > 0) {
        const buttonContainer = document.querySelector(`#${boxId} #transferCheckBox`);
        if (buttonContainer) {
            buttonContainer.innerHTML = data.buttons
                .map(button => `<button class="btn btn-sm btn-outline-primary">${button}</button>`)
                .join('');
        }
    }
}
