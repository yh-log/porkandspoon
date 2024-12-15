// author yh.kim (24.12.15) 

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

// jsTree 초기화 함수
function getSuccess(response) {
    // menuOrder를 기준으로 정렬
    response.sort(function (a, b) {
        return a.menuOrder - b.menuOrder;
    });

    // jsTree 초기화
    $('#jstree').jstree({
        'core': {
            'themes': {
                'dots': true,   // 점선 연결 활성화
                'icons': true   // 기본 아이콘 활성화
            },
            'data': response  // 트리 데이터
        },
        "plugins": ["types"], // types 플러그인 활성화
        "types": {
            "default": {
                "icon": "bi bi-house-fill" // 기본 폴더 아이콘 (Bootstrap Icons)
            },
            "file": {
                "icon": "bi bi-person-fill" // 파일 타입 아이콘 (Bootstrap Icons)
            }
        }
    });
}

// 리소스 로드 및 초기화
loadResources(function () {
    $(document).ready(function () {
        getAjax('/menu_tree'); // getAjax 호출
    });
});
