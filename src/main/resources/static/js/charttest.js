

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

var selectedNodeData = null;


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
            }).on('changed.jstree', function (e, data) {
	            console.log("선택된 노드:", data.selected);
	            
	        });
}


function setupModalEvents(modal) {
    var closeModal = modal.querySelector("#closeModal");
    var cancelButton = modal.querySelector("#cancelModal");

    // 닫기 버튼 클릭 이벤트
    if (closeModal) {
        closeModal.addEventListener("click", function () {
            modal.style.display = "none";
        });
    }

    // 취소 버튼 클릭 이벤트
    if (cancelButton) {
        cancelButton.addEventListener("click", function () {
            modal.style.display = "none";
        });
    }

    // 모달 외부 클릭 시 닫기
    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
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
