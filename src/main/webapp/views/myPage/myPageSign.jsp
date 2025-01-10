<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공통 레이아웃 CSS</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">

<!-- rating.js(별점) -->
<link rel="stylesheet"
	href="/resources/assets/extensions/rater-js/lib/style.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
	.tit-area{
		display: flex; 
	}
	
	#home,#schedule{
		width: 200px;
	}
	
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.content{
		display: flex; 
		align-content: cetner;
		border: 1px solid black;
	}
	
	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 20%;
	}
	.form-control{
		width: 350px;
	}
	.pagination {
    justify-content: center; /* 페이지네이션 중앙 정렬 */
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
					<h4 class="menu-title">나의 정보</h4>
					<ul>
						<li id="firstMenu"><a href="/myPageView">나의 정보</a></li>
						<li id="secondMenu"><a href="/trip/list">출장</a></li>
						<li id="secondMenu" class="active"><a href="/ad/myPageSign">서명관리</a></li>
						<li id="secondMenu"><a href="/ad/myPageBuy">구매/사용 기록</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>서명관리</h5>
						</div>
						<div class="cont-body">
							<div class="col-12 col-lg-12">
								<div id="signaturePadContainer">
								    <!-- 서명 이미지 -->
								    <img id="signatureImage" src="" alt="서명 이미지" style="width: 100%; height: 300px; border: 1px solid black; display: none;">
								    <!-- 서명 캔버스 -->
								    <canvas id="signaturePad" style="border: 1px solid black; width: 100%; height: 300px; display: none;"></canvas>
								    
								    <!-- 버튼 영역 -->
								    <div style="margin-top: 10px;">
									    <button id="editSignature" class="btn btn-secondary">수정</button>
									    <button id="deleteSignature" class="btn btn-danger">삭제</button>
									    <button id="clearSignature" class="btn btn-warning" style="display: none;">지우기</button>
									    <button id="saveSignature" class="btn btn-primary" style="display: none;">저장</button>
									    <button id="writeSignature" class="btn btn-primary">직인 등록</button>
									    <button id="registerSignature" class="btn btn-primary" style="display: none;">사인 등록</button>
									</div>
								</div>
							</div>
						</div> 
					</div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
				</section>
			</div>
		</div>
	</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/static/js/components/dark.js"></script>
<script
	src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>


<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>



<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>

<!-- 사인패드 -->	
<script src="https://cdn.jsdelivr.net/npm/signature_pad"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById("signaturePad");
    const signaturePad = new SignaturePad(canvas);
    const signatureImage = document.getElementById("signatureImage");
    const csrfToken = document.querySelector("meta[name='_csrf']").content;
    const csrfHeader = document.querySelector("meta[name='_csrf_header']").content;

    const editButton = document.getElementById("editSignature");
    const clearButton = document.getElementById("clearSignature");
    const saveButton = document.getElementById("saveSignature");
    const deleteButton = document.getElementById("deleteSignature");
    const writeButton = document.getElementById("writeSignature");
    const registerButton = document.getElementById("registerSignature");

    let originalImageURL = ""; // 현재 이미지 URL 저장
    let currentCodeName = ""; // 현재 이미지의 codeName (SG001 or SG002)

    // 캔버스 크기 초기화 함수
    function resizeCanvas() {
        const containerWidth = canvas.parentElement.offsetWidth;
        const containerHeight = 300; // 고정 높이 설정
        canvas.width = containerWidth;
        canvas.height = containerHeight;

        const ratio = Math.max(window.devicePixelRatio || 1, 1);
        canvas.getContext("2d").scale(ratio, ratio);
    }

    // 초기 캔버스 크기 설정
    resizeCanvas();

    // 브라우저 창 크기 변경 시 캔버스 크기 재설정
    window.addEventListener("resize", resizeCanvas);

    // 초기 서명 이미지 불러오기
    fetch("/ad/myPageSign/getImage")
        .then(response => response.json())
        .then(data => {
            if (data.imageUrl) {
                originalImageURL = data.imageUrl;
                currentCodeName = data.codeName; // SG001(사인) 또는 SG002(직인)
                signatureImage.src = data.imageUrl;
                signatureImage.style.display = "block";
                canvas.style.display = "none";

                // 버튼 상태 설정
                if (currentCodeName === "SG002") {
                    // 직인 이미지인 경우
                    editButton.style.display = "inline-block";
                    deleteButton.style.display = "inline-block";
                    writeButton.style.display = "none"; // 직인 등록 버튼 숨김
                    registerButton.style.display = "inline-block"; // 사인 등록 버튼 표시
                    clearButton.style.display = "none";
                    saveButton.style.display = "none";
                } else if (currentCodeName === "SG001") {
                    // 사인 이미지인 경우
                    editButton.style.display = "inline-block";
                    deleteButton.style.display = "inline-block";
                    writeButton.style.display = "inline-block"; // 직인 등록 버튼 표시
                    registerButton.style.display = "none"; // 사인 등록 버튼 숨김
                    clearButton.style.display = "none";
                    saveButton.style.display = "none";
                }
            } else {
                // 저장된 이미지가 없는 경우
                signatureImage.style.display = "none";
                canvas.style.display = "block";
                signaturePad.clear();

                // 버튼 상태 설정
                editButton.style.display = "none";
                deleteButton.style.display = "none";
                writeButton.style.display = "inline-block";
                registerButton.style.display = "none";
                clearButton.style.display = "inline-block";
                saveButton.style.display = "inline-block";
            }
        })
        .catch(error => console.error("서명 이미지 불러오기 오류:", error));

    // 직인 등록 버튼 클릭 시
   writeButton.addEventListener("click", async function () {
    if (currentCodeName === "SG001") {
        // 새로운 직인 등록 -> 기존 사인 이미지 삭제
        await uploadImage("SG002");
        deleteExistingImage("SG001");
    } else {
        // 새로운 직인 등록
        uploadImage("SG002");
    }
});


    // 사인 등록 버튼 클릭 시
    registerButton.addEventListener("click", async function () {
    if (currentCodeName === "SG002") {
        // 캔버스 활성화
        signatureImage.style.display = "none";
        canvas.style.display = "block";
        signaturePad.clear();

        // 버튼 상태 업데이트
        editButton.style.display = "none";
        deleteButton.style.display = "none";
        writeButton.style.display = "none";
        registerButton.style.display = "none";
        clearButton.style.display = "inline-block";
        saveButton.style.display = "inline-block";

        // 저장 후 기존 직인 삭제
        saveButton.addEventListener("click", async function () {
            if (!signaturePad.isEmpty()) {
                await saveSignature("SG001");
                deleteExistingImage("SG002");
            }
        });
    }
});



    // 수정 버튼 클릭 시
   editButton.addEventListener("click", function () {
    if (currentCodeName === "SG002") {
        // 직인 수정 로직
        try {
            console.log("직인 수정 시작...");

            // 새로운 직인 업로드
            const fileInput = document.createElement("input");
            fileInput.type = "file";
            fileInput.accept = "image/*";

            fileInput.onchange = async function (event) {
                const file = event.target.files[0];
                if (!file) return;

                // 새로운 파일을 저장하기 전에 기존 파일 삭제
                try {
                    console.log("기존 직인 이미지 삭제 중...");
                    const deleteResponse = await fetch(`/ad/myPageSign/delete?code_name=SG002`, {
                        method: "DELETE",
                        headers: { [csrfHeader]: csrfToken },
                    });

                    if (!deleteResponse.ok) {
                        throw new Error("기존 직인 이미지 삭제 실패");
                    }
                    console.log("기존 직인 이미지 삭제 완료");
                } catch (error) {
                    console.error("기존 직인 이미지 삭제 오류:", error);
                    alert("기존 직인 이미지를 삭제하지 못했습니다.");
                    return; // 삭제 실패 시 종료
                }

                // 새로운 파일 저장
                try {
                    console.log("새로운 직인 이미지 저장 중...");
                    const formData = new FormData();
                    formData.append("file", file);
                    formData.append("code_name", "SG002"); // 직인 코드

                    const saveResponse = await fetch("/ad/myPageSign/save", {
                        method: "POST",
                        body: formData,
                        headers: { [csrfHeader]: csrfToken },
                    });

                    if (!saveResponse.ok) {
                        throw new Error("새로운 직인 이미지 저장 실패");
                    }

                    const result = await saveResponse.text();
                    alert(result);

                    // 새로고침
                    location.reload();
                } catch (error) {
                    console.error("새로운 직인 이미지 저장 오류:", error);
                }
            };

            fileInput.click();
        } catch (error) {
            console.error("직인 수정 오류:", error);
        }
    } else if (currentCodeName === "SG001") {
        // 사인 수정 로직 (캔버스 활성화)
        try {
            console.log("사인 수정 시작...");
            fetch("/ad/myPageSign/getBase64")
                .then(response => response.json())
                .then(data => {
                    const ctx = canvas.getContext("2d");
                    const image = new Image();
                    image.src = 'data:image/png;base64,' + data.base64Image;

                    image.onload = function () {
                        resizeCanvas();
                        signatureImage.style.display = "none";
                        canvas.style.display = "block";
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);

                        // 버튼 상태 업데이트
                        clearButton.style.display = "inline-block";
                        saveButton.style.display = "inline-block";
                        editButton.style.display = "none";
                        deleteButton.style.display = "none";
                        writeButton.style.display = "none";
                        registerButton.style.display = "none";
                    };
                })
                .catch(error => {
                    throw new Error("사인 데이터 가져오기 실패");
                });
        } catch (error) {
            console.error("사인 수정 오류:", error);
        }
    }
});


    
    
    
    //초기화 버튼
    clearButton.addEventListener("click", function () {
        signaturePad.clear(); // 캔버스 초기화
        signatureImage.style.display = "none"; // 기존 이미지 숨김
        canvas.style.display = "block"; // 캔버스 활성화

        // 버튼 상태 조정
        saveButton.style.display = "inline-block";
        clearButton.style.display = "inline-block";
        editButton.style.display = "none";
        deleteButton.style.display = "none";
        writeButton.style.display = "none";
        registerButton.style.display = "none";

        console.log("캔버스가 초기화되었습니다.");
    });

    

 // 저장 버튼 클릭 시
   saveButton.addEventListener("click", async function () {
    if (signaturePad.isEmpty()) {
        alert("사인이 비어 있습니다.");
        return;
    }

    // 사인 데이터를 캔버스에서 가져오기
    const dataURL = signaturePad.toDataURL("image/png");
    const blob = dataURLtoBlob(dataURL);

    const formData = new FormData();
    formData.append("file", blob, "signature.png");
    formData.append("code_name", "SG001"); // 사인으로 저장

    try {
        // 1. 기존 직인 이미지 삭제 (만약 현재 이미지가 직인일 경우)
        if (currentCodeName === "SG002") {
            console.log("기존 직인 이미지 삭제 중...");
            const deleteResponse = await fetch(`/ad/myPageSign/delete?code_name=SG002`, {
                method: "DELETE",
                headers: { [csrfHeader]: csrfToken },
            });

            if (!deleteResponse.ok) {
                throw new Error("기존 직인 이미지 삭제 실패");
            }
            console.log("기존 직인 이미지 삭제 완료");
        }

        // 2. 기존 사인 이미지 삭제 (만약 현재 이미지가 사인일 경우)
        if (currentCodeName === "SG001") {
            console.log("기존 사인 이미지 삭제 중...");
            const deleteResponse = await fetch(`/ad/myPageSign/delete?code_name=SG001`, {
                method: "DELETE",
                headers: { [csrfHeader]: csrfToken },
            });

            if (!deleteResponse.ok) {
                throw new Error("기존 사인 이미지 삭제 실패");
            }
            console.log("기존 사인 이미지 삭제 완료");
        }

        // 3. 새로운 사인 이미지 저장
        console.log("새로운 사인 이미지 저장 중...");
        const saveResponse = await fetch("/ad/myPageSign/save", {
            method: "POST",
            body: formData,
            headers: { [csrfHeader]: csrfToken },
        });

        if (!saveResponse.ok) {
            throw new Error("사인 이미지 저장 실패");
        }

        const result = await saveResponse.text();
        alert(result);

        // 페이지 새로고침
        location.reload();
    } catch (error) {
        console.error("사인 저장 오류:", error);
    }
});
 
    async function deleteExistingImage(codeName) {
        if (!confirm("이미지를 삭제하시겠습니까?")) return;

        try {
            const response = await fetch(`/ad/myPageSign/delete?code_name=${codeName}`, {
                method: "DELETE",
                headers: { [csrfHeader]: csrfToken },
            });

            if (!response.ok) {
                throw new Error("이미지 삭제 실패");
            }
            console.log("기존 이미지 삭제 완료");
        } catch (error) {
            console.error("이미지 삭제 오류:", error);
        }
    }

 
    
    // 삭제 버튼 클릭 시
    deleteButton.addEventListener("click", deleteExistingImage);

    // 이미지 삭제
  function deleteExistingImage() {
    var codeNameToDelete = currentCodeName; // 현재 이미지의 code_name (SG001 또는 SG002)
	console.log(codeNameToDelete);
    if (!confirm("이미지를 삭제하시겠습니까?")) return;

    fetch(`/ad/myPageSign/delete?code_name=`+codeNameToDelete, { // codeName 동적 처리
        method: "DELETE",
        headers: { [csrfHeader]: csrfToken },
    })
        .then(response => {
            if (!response.ok) {
                throw new Error("삭제 실패");
            }
            return response.text();
        })
        .then(result => {
            alert(result);
            location.reload(); // 삭제 후 새로고침
        })
        .catch(error => console.error("이미지 삭제 오류:", error));
}

    // 이미지 업로드
    function uploadImage(codeName) {
        const fileInput = document.createElement("input");
        fileInput.type = "file";
        fileInput.accept = "image/*";

        fileInput.onchange = async function (event) {
            const file = event.target.files[0];
            if (!file) return;

            const formData = new FormData();
            formData.append("file", file);
            formData.append("code_name", codeName);

            fetch("/ad/myPageSign/save", {
                method: "POST",
                body: formData,
                headers: { [csrfHeader]: csrfToken },
            })
                .then(response => response.ok ? response.text() : Promise.reject("저장 실패"))
                .then(() => location.reload())
                .catch(error => console.error("이미지 저장 오류:", error));
        };

        fileInput.click();
    }
    
    function dataURLtoBlob(dataURL) {
        const [header, base64Data] = dataURL.split(",");
        const byteString = atob(base64Data);
        const mimeString = header.split(":")[1].split(";")[0];
        const arrayBuffer = new ArrayBuffer(byteString.length);
        const uintArray = new Uint8Array(arrayBuffer);

        for (let i = 0; i < byteString.length; i++) {
            uintArray[i] = byteString.charCodeAt(i);
        }

        return new Blob([arrayBuffer], { type: mimeString });
    }
    
    
});



</script>

</html>