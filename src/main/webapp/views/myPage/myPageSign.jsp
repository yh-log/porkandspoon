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
						<li id="firstMenu"><a href="/ad/myPage">나의 정보</a></li>
						<li id="secondMenu"><a href="#">출장</a></li>
						<li id="secondMenu"><a href="/ad/myPageSign">서명관리</a></li>
						<li id="secondMenu"><a href="/ad/myPageBuy">구매기록</a></li>
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
								        <button id="saveSignature" class="btn btn-primary">저장</button>
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

    let originalImageURL = ""; // 원래 있던 이미지 URL을 저장

    // 초기 서명 이미지 불러오기
    fetch("/ad/myPageSign/getImage")
        .then(response => response.json())
        .then(data => {
            if (data.imageUrl) {
                originalImageURL = data.imageUrl; // 원래 이미지 URL 저장
                signatureImage.src = data.imageUrl;
                signatureImage.style.display = "block"; // 이미지를 보여줌
                canvas.style.display = "none"; // 캔버스 숨김
                clearButton.style.display = "none"; // 초기에는 지우기 버튼 숨김
            } else {
                console.log("저장된 서명이 없습니다.");
            }
        })
        .catch(error => console.error("서명 이미지 불러오기 오류:", error));

    // 수정 버튼 클릭 시 Base64 데이터 불러오기
    editButton.addEventListener("click", function () {
        fetch("/ad/myPageSign/getBase64")
            .then(response => response.json())
            .then(data => {
                console.log(data); // Base64 데이터를 확인
                if (data.base64Image) {
                    const ctx = canvas.getContext("2d");
                    const image = new Image();
                    image.src = 'data:image/png;base64,' + data.base64Image;

                    image.onload = function () {
                        // 캔버스 크기를 이미지 크기에 맞게 동적으로 설정
                        canvas.width = signatureImage.offsetWidth;
                        canvas.height = signatureImage.offsetHeight;

                        const ratio = Math.max(window.devicePixelRatio || 1, 1);
                        canvas.getContext("2d").scale(ratio, ratio);

                        // 기존 이미지 숨기기 및 캔버스 표시
                        signatureImage.style.display = "none";
                        canvas.style.display = "block";

                        // 캔버스 초기화 및 Base64 이미지를 캔버스에 그리기
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        ctx.drawImage(image, 0, 0, canvas.width, canvas.height);

                        // 버튼 상태 변경
                        editButton.style.display = "none"; // 수정 버튼 숨기기
                        deleteButton.style.display = "none"; // 삭제 버튼 숨기기
                        clearButton.style.display = "inline-block"; // 지우기 버튼 표시
                    };
                } else {
                    console.log("Base64 데이터가 없습니다.");
                }
            })
            .catch(error => console.error("Base64 데이터 불러오기 오류:", error));
    });

    // 초기화(지우기) 버튼 클릭 시 캔버스 초기화
    clearButton.addEventListener("click", function () {
        signaturePad.clear(); // 캔버스 초기화
        canvas.style.display = "block"; // 캔버스 표시
        signatureImage.style.display = "none"; // 기존 이미지 숨김
        console.log("캔버스 초기화 완료");
    });

    // 서명 저장
    saveButton.addEventListener("click", function () {
        if (signaturePad.isEmpty()) {
            alert("서명이 비어 있습니다.");
            return;
        }

        const dataURL = signaturePad.toDataURL("image/png");
        const blob = dataURLtoBlob(dataURL);

        const formData = new FormData();
        formData.append("file", blob, "signature.png");

        fetch("/ad/myPageSign/save", {
            method: "POST",
            body: formData,
            headers: {
                [csrfHeader]: csrfToken,
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("서명 저장 실패");
                }
                return response.text();
            })
            .then(result => {
                alert(result);
                if (originalImageURL) {
                    // 원래 이미지 삭제 요청
                    deleteOriginalImage(originalImageURL);
                }
                location.reload(); // 저장 후 새로고침
            })
            .catch(error => console.error("서명 저장 오류:", error));
    });

    // 삭제 버튼 클릭 시 원래 이미지 삭제
    deleteButton.addEventListener("click", function () {
        if (!confirm("서명을 삭제하시겠습니까?")) {
            return; // 사용자가 취소를 누르면 실행 중단
        }

        fetch("/ad/myPageSign/delete", {
            method: "DELETE",
            headers: {
                [csrfHeader]: csrfToken, // CSRF 토큰 추가
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("서명 삭제 실패");
                }
                return response.text();
            })
            .then(result => {
                alert(result);
                signaturePad.clear(); // 캔버스 초기화
                signatureImage.src = ""; // 이미지 초기화
                signatureImage.style.display = "none"; // 이미지 숨김
                canvas.style.display = "none"; // 캔버스 숨김

                // 버튼 상태 초기화
                editButton.style.display = "inline-block"; // 수정 버튼 표시
                deleteButton.style.display = "inline-block"; // 삭제 버튼 표시
                clearButton.style.display = "none"; // 지우기 버튼 숨김
            })
            .catch(error => console.error("서명 삭제 오류:", error));
    });

    // 원래 이미지를 삭제하는 함수
    function deleteOriginalImage(imageURL) {
        fetch("/ad/myPageSign/delete", {
            method: "DELETE",
            headers: {
                [csrfHeader]: csrfToken,
                "Content-Type": "application/json",
            },
            body: JSON.stringify({ imageUrl: imageURL }),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error("원래 이미지 삭제 실패");
                }
                console.log("원래 이미지가 성공적으로 삭제되었습니다.");
            })
            .catch(error => console.error("원래 이미지 삭제 오류:", error));
    }

    // Base64 데이터를 Blob으로 변환
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