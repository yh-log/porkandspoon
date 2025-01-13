<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구내식당</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


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
	.required-value {
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
					<h4 class="menu-title">상품리스트</h4>
					<ul>
						<li><a href="/mealTicket">식권구매</a></li>
						<li><a href="/mealMenu">식단표</a></li>
						<li ><a href="/ad/mealMenu/Write">식단등록</a></li>
						<li ><a href="/ad/mealTicket/Write">식권등록</a></li>
						<li class="active"><a href="/ad/meal/List">상품리스트</a></li>
					</ul>
				</section>
				<section class="cont">
					 <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>식권 수정</h5>
						</div>
						<div class="cont-body">
						<div class="row">

			         <div class="col-12 col-lg-12">
			         <form action="/ad/mealTicket/Update/${info.meal_idx}" method="post" enctype="multipart/form-data">
	                     <input type="hidden" name="_csrf" value="${_csrf.token}" />
	                     <table>
	                        <tr>
	                           <th class="align-l">상품명<span class="required-value">*</span></th>
	                           <td ><input class="form-control sor-1 "  name="name" value="${info.name}" type="text" placeholder="상품명을 입력해주세요." required="required"/></td>
	                           <td ><input class="form-control sor-1 "  name="meal_idx" value="${info.meal_idx}" type="text" placeholder="상품명을 입력해주세요." required="required" hidden=""/></td>
	                        </tr>
	                        <tr>
	                           <th class="align-l">상품가격<span class="required-value">*</span></th>
	                           <td ><input class="form-control sor-1 "  name="cost" value="${info.cost}" type="text" placeholder="상품가격을 입력해주세요." required="required"/></td>
	                        </tr>
	                        <tr>
	                           <th class="align-l">상품수량<span class="required-value">*</span></th>
	                          <td ><input class="form-control sor-1 "  name="count" value="${info.count}" type="text" placeholder="상품수량을 입력해주세요." required="required"/></td>
	                        </tr> 
	                       <tr>
					            <th class="align-l">파일첨부</th>
					            <td>
					                <input class="filepond" type="file" name="filepond" />
					            </td>
					        </tr>
		                     <tr>
							   <th class="align-l">활성여부</th>
							   <td>
							      <div class="card-body">
							         <div class="form-check">
							            <input class="form-check-input"  type="radio"  name="use_yn" value="Y"  id="flexRadioDefault1"
							               <c:if test="${info.use_yn == 'Y'}">checked</c:if>>
							            <label class="form-check-label" for="flexRadioDefault1">활성</label>
							         </div>
							         <div class="form-check">
							            <input  class="form-check-input"  type="radio"  name="use_yn"  value="N"  id="flexRadioDefault2"
							               <c:if test="${info.use_yn == 'N'}">checked</c:if>  >
							            <label class="form-check-label" for="flexRadioDefault2">비활성</label>
							         </div>
							      </div>
							   </td>
							</tr>
		                     </table>
								<div id="btn-gap">							
									<button type="button" class="btn btn-primary btn-popup">수정</button>
									<button  type="button" class="btn btn-outline-primary" onclick="location.href='/ad/meal/List'">취소</button>
								</div>
				         </form>
	                  </div>
					</div>
				</div> 
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

<!-- 파일업로더 -->
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="/resources/assets/extensions/filepond/filepond.js"></script>
<script src="/resources/assets/static/js/pages/filepond.js"></script>


<script>

//FilePond 초기화
const pond = FilePond.create(document.querySelector('input[type="file"]'), {
    allowMultiple: false, // 단일 파일만 허용
    allowImagePreview: true, // 이미지 미리보기 활성화
    imagePreviewMaxHeight: 150, // 미리보기 높이
    acceptedFileTypes: ['image/*'], // 이미지 파일만 허용
    instantUpload: false, // 즉시 업로드 비활성화
    server: {
        process: null, // 실시간 처리하지 않음
        revert: null, // 삭제 처리 비활성화
    },
});

// 서버에서 제공된 기존 파일 설정
const fileUrl = '${fileUrl}'; // 서버에서 전달한 파일 URL
const fileName = '${fileName}'; // 서버에서 전달한 파일 이름

if (fileUrl && fileName) {
    pond.setOptions({
        files: [
            {
                source: fileUrl, // 기존 이미지의 URL
                options: {
                    type: 'local', // 로컬 파일로 간주
                    file: {
                        name: fileName, // 기존 파일 이름
                        size: 300000, // 파일 크기 (옵션)
                        type: 'image/jpeg', // MIME 타입 (예시)
                    },
                },
            },
        ],
    });
}

// 선택된 파일을 폼 데이터에 추가
document.querySelector('form').addEventListener('submit', (e) => {
    e.preventDefault(); // 기본 동작 방지

    const form = e.target; // 현재 폼
    const formData = new FormData(form);

    // FilePond에서 파일 데이터 가져오기
    pond.getFiles().forEach((fileItem) => {
        formData.append('filepond', fileItem.file); // 'filepond'는 서버에서 받을 이름
    });

    // AJAX 요청
    const xhr = new XMLHttpRequest();
    xhr.open('POST', form.action, true);
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            console.log('폼 전송 성공:', xhr.responseText);
            alert('업로드 성공!');
            window.location.reload(); // 성공 시 페이지 새로고침 또는 다른 처리
        } else {
            console.error('폼 전송 실패:', xhr.responseText);
            alert('업로드 실패. 다시 시도해주세요.');
        }
    };
    xhr.send(formData); // 폼 데이터 전송
});

$('.btn-popup').on(
		'click',
		function() {
			layerPopup('식권을 수정하시겠습니까?', '확인', '취소', btn1Act,
					btn2Act);
		});

/* 알림 팝업 */
function btn1Act() {
	// 1번버튼 클릭시 수행할 내용
	console.log('1번 버튼 동작');

	// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
	removeAlert(); // 기존팝업닫기
	// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
	layerPopup("수정이 완료 되었습니다.", "확인", "취소", secondBtn1Act, secondBtn2Act);
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