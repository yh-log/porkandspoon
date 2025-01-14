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
	                           <td ><input class="form-control sor-1 "  name="name" value="${info.name}" type="text" placeholder="상품명을 입력해주세요." required="required"/>
	                           <input class="form-control sor-1 " id="meal_idx" name="meal_idx" value="${info.meal_idx}" type="text" placeholder="상품명을 입력해주세요." required="required" hidden=""/>
	                           </td>
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
						        <!-- FilePond 입력 필드 -->
						        <input class="filepond" type="file" name="filepond" data-file-url="${fileUrl}" data-file-name="${fileName}" />
						        <input type="hidden" name="existingFile" value="${fileUrl}" />
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

$(document).ready(function () {
	  $('input[name="cost"], input[name="count"]').on('input', function () {
	        // 입력된 값에서 숫자 이외의 값 제거
	        this.value = this.value.replace(/[^0-9]/g, '');
	    });

	    // keydown 이벤트로 실시간으로 입력 제한
	    $('input[name="cost"], input[name="count"]').on('keydown', function (e) {
	        // 숫자키, 백스페이스, Delete, Tab, 화살표 키는 허용
	        if (
	            (e.keyCode >= 48 && e.keyCode <= 57) || // 숫자 (상단)
	            (e.keyCode >= 96 && e.keyCode <= 105) || // 숫자 (키패드)
	            e.keyCode === 8 || // 백스페이스
	            e.keyCode === 46 || // Delete
	            e.keyCode === 9 || // Tab
	            (e.keyCode >= 37 && e.keyCode <= 40) // 화살표 키
	        ) {
	            return true;
	        } else {
	            e.preventDefault();
	        }
	    });
	    const meal_idx = $('#meal_idx').val().trim();
	    let pond;

	    // FilePond 초기화
	    const $fileInput = $('input[type="file"]');
	    if ($fileInput.length) {
	        pond = FilePond.create($fileInput[0], {
	            server: {
	                process: {
	                    url: '/ad/mealTicket/Update/'+meal_idx, // 파일 업로드 처리 URL
	                    method: 'POST',
	                    headers: {
	                        'X-CSRF-TOKEN': '${_csrf.token}' // CSRF 토큰 추가
	                    },
	                    ondata: (formData) => {
	                        // 추가 데이터 설정
	                        formData.append('name', $('input[name="name"]').val());
	                        formData.append('cost', $('input[name="cost"]').val());
	                        formData.append('count', $('input[name="count"]').val());
	                        formData.append('use_yn', $('input[name="use_yn"]:checked').val());
	                        formData.append('existingFile', $('input[name="existingFile"]').val()); // Add existingFile to form data
	                        return formData;
	                    }
	                },
	                revert: null,
	                load: null,
	                fetch: null
	            },
	            instantUpload: false, // 자동 업로드 비활성화
	            files: [
	                {
	                    source: "${fileUrl}", // 서버에서 전달받은 기존 파일 URL
	                    options: {
	                        type: 'local',
	                        file: {
	                            name: "${fileName}", // 서버에서 전달받은 파일명
	                            size: 300000, // 임의로 설정한 파일 크기
	                            type: 'image/jpeg', // 파일 타입 예시
	                        },
	                    },
	                },
	            ],
	        });
	        console.log('FilePond 초기화 완료:', pond);
	    } else {
	        console.error('File input을 찾을 수 없습니다.');
	    }

	    // 수정 버튼 클릭 이벤트
	    $('.btn-popup').on('click', function () {
	        layerPopup('식권을 수정하시겠습니까?', '확인', '취소', btn1Act, btn2Act);
	    });

	    // 팝업 확인 버튼 (등록하시겠습니까?)
	    function btn1Act() {
	        console.log('1번 버튼 동작');
	        removeAlert(); // 팝업 닫기

	        const name = $('input[name="name"]').val().trim();
	        const cost = $('input[name="cost"]').val().trim();
	        const count = $('input[name="count"]').val().trim();
	        const fileCount = pond.getFiles().length;

	        console.log('상품명:', name);
	        console.log('상품가격:', cost);
	        console.log('상품수량:', count);
	        console.log('첨부된 파일 개수:', fileCount);

	        // 필수 데이터 검증
	        if (!name || !cost || !count || fileCount === 0) {
	            layerPopup('모든 필수 항목을 입력해 주세요.', '확인', false, btn2Act, btn2Act);
	            return;
	        }

	        // 파일 업로드 및 폼 전송
	        pond.processFiles().then(() => {
	            console.log('파일 업로드 완료');
	            // 두 번째 팝업 표시
	            layerPopup('수정이 완료되었습니다.', '확인', false, redirectToList, btn2Act);
	        }).catch((error) => {
	            console.error('파일 업로드 실패:', error);
	            layerPopup('파일 업로드 중 오류가 발생했습니다.', '확인', false, btn2Act, btn2Act);
	        });
	    }

	    // 팝업 취소 버튼
	    function btn2Act() {
	        console.log('2번 버튼 동작');
	        removeAlert(); // 팝업 닫기
	    }

	    // 두 번째 팝업 확인 후 경로 이동
	    function redirectToList() {
	        console.log('경로 이동');
	        window.location.href = '/ad/meal/List'; // 이동할 경로 설정
	    }
	});
</script>

</html>