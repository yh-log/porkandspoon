<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>구내식당</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
.required-value {
    color: var(--bs-danger);
}
	.tit-area{
		display: flex; 
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
	buttons{
		align-content: cetner;
	}
	.art{
		height: 280px;
		resize: none;
	}
	.align-l{
		
		width: 300px;
		text-align: center
	}
	
	/* 날짜 입력 필드 가로 정렬 */
	.datetime-group {
	    display: flex;
	    gap: 10px; /* 필드 간 간격 */
	    align-items: center;
	}
	
	#btn-gap{
		display: flex;
		gap: 30px;
		align-items: center;
		justify-content: center;
	}
	.short{
		width: 280px;
	
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
					<h4 class="menu-title">구내식당</h4>
					<ul>
						<li><a href="/mealTicket">식권구매</a></li>
						<li><a href="/mealMenu">식단표</a></li>
						<li class="active"><a href="/ad/mealMenu/Write">식단등록</a></li>
						<li><a href="/ad/mealTicket/Write">식권등록</a></li>
						<li><a href="/ad/meal/List">상품리스트</a></li>
					</ul>
				</section>
				<section class="cont">
					 <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>식단등록</h5>
						</div>
						<div class="cont-body">
						<div class="row">

			         <div class="col-12 col-lg-12">
		               <form id="mealForm" action="/ad/mealMenu/Write" method="post">
						    <input type="hidden" name="_csrf" value="${_csrf.token}" />
						    
						    <table>
						        <tr>
						            <th class="align-l">상태 <span class="required-value">*</span></th>
						            <td>
						                <select class="form-select short" id="basicSelect" name="is_time">
						                    <option value="B" selected="selected">아침</option>
						                    <option value="L">점심</option>
						                    <option value="D">저녁</option>
						                </select>
						            </td>
						        </tr>
						        
						        <tr>
							    <th class="align-l datetime">일정 <span class="required-value">*</span></th>
							    <td>
							        <div class="datetime-group">
							            <input id="start" class="form-control sor-1 short" type="datetime-local" name="start_date" />
							            	~
							            <input id="end" class="form-control sor-1 short" type="datetime-local" name="end_date" />
							        </div>
							    </td>
							</tr>
						        
						        <tr>
						            <th class="align-l">내용 <span class="required-value">*</span></th>
						            <td>
						                <textarea id="content" class="form-control art" name="content" placeholder="메뉴 입력시 , 를구분좌로 사용하여야 됩니다." required="required"></textarea>
						            </td>
						        </tr>
						    </table>
						
						    <div id="btn-gap">
						        <button type="button" class="btn btn-primary btn-popup" >등록</button> 
						        <button type="button" class="btn btn-outline-primary" onclick="location.href='/ad/mealMenu/Write'">초기화</button>
						    </div>
						</form>
						
						<!--  onclick="layerPopup('해당상품을 구매하시겠습니까?','구매','취소')" -->
											
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
<script src="/resources/js/common.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<script>


$(document).ready(function () {
    // 초기값 설정
    function setInitialValues() {
        const selectedValue = $('#basicSelect').val(); // 초기 상태 값 가져오기
        const now = new Date(); // 현재 날짜 가져오기
        const year = now.getFullYear();
        const month = (now.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1
        const date = now.getDate().toString().padStart(2, '0');

        let startTime = '';
        let endTime = '';

        // 상태에 따라 시간 설정
        if (selectedValue === 'B') { // 아침
            startTime = year + '-' + month + '-' + date + 'T07:00';
            endTime = year + '-' + month + '-' + date + 'T08:00';
        } else if (selectedValue === 'L') { // 점심
            startTime = year + '-' + month + '-' + date + 'T12:00';
            endTime = year + '-' + month + '-' + date + 'T13:00';
        } else if (selectedValue === 'D') { // 저녁
            startTime = year + '-' + month + '-' + date + 'T18:00';
            endTime = year + '-' + month + '-' + date + 'T19:00';
        }

        // input 값 설정
        $('#start').val(startTime);
        $('#end').val(endTime);

        // 종료 날짜를 readonly로 설정
        $('#end').prop('readonly', true);

        // 설정된 값 확인
        console.log('Initial Start Time:', $('#start').val());
        console.log('Initial End Time:', $('#end').val());
    }

    // 초기 실행
    setInitialValues();

    // 셀렉트 박스 변경 이벤트
    $('#basicSelect').change(function () {
        const selectedStart = $('#start').val(); // 현재 시작 날짜 가져오기
        if (selectedStart) {
            updateTimeBasedOnDateAndMeal(selectedStart, $(this).val());
        } else {
            setInitialValues(); // 시작 날짜가 없으면 초기값 설정
        }
    });

    // 시작 날짜 변경 이벤트
    $('#start').on('change', function () {
        const selectedStart = $(this).val(); // 시작 날짜 가져오기
        const selectedMeal = $('#basicSelect').val(); // 현재 선택된 상태 값 가져오기
        updateTimeBasedOnDateAndMeal(selectedStart, selectedMeal);
    });

    // 날짜와 식단 상태에 따라 시간 업데이트 함수
    function updateTimeBasedOnDateAndMeal(startDateValue, mealType) {
        const startDate = new Date(startDateValue);
        let endDate = new Date(startDateValue); // 종료 시간 초기값

        // 상태에 따라 종료 시간 계산
        if (mealType === 'B') { // 아침
            startDate.setHours(7, 0);
            endDate.setHours(8, 0);
        } else if (mealType === 'L') { // 점심
            startDate.setHours(12, 0);
            endDate.setHours(13, 0);
        } else if (mealType === 'D') { // 저녁
            startDate.setHours(18, 0);
            endDate.setHours(19, 0);
        }

        // 종료 날짜 설정
        const formattedStartDate = startDate.getFullYear() + '-' +
            (startDate.getMonth() + 1).toString().padStart(2, '0') + '-' +
            startDate.getDate().toString().padStart(2, '0') + 'T' +
            startDate.getHours().toString().padStart(2, '0') + ':' +
            startDate.getMinutes().toString().padStart(2, '0');

        const formattedEndDate = endDate.getFullYear() + '-' +
            (endDate.getMonth() + 1).toString().padStart(2, '0') + '-' +
            endDate.getDate().toString().padStart(2, '0') + 'T' +
            endDate.getHours().toString().padStart(2, '0') + ':' +
            endDate.getMinutes().toString().padStart(2, '0');

        $('#start').val(formattedStartDate);
        $('#end').val(formattedEndDate);

        console.log('Updated Start Time:', $('#start').val());
        console.log('Updated End Time:', $('#end').val());
    }
});


$('.btn-popup').on(
		'click',
		function() {
			layerPopup('메뉴를 등록하시겠습니까?', '확인', '취소', secondBtn1Act,
					secondBtn2Act);
		});


/* 알림 팝업 */
function btn1Act() {
	// 1번버튼 클릭시 수행할 내용
	console.log('1번 버튼 동작');

	layerPopup("두번째", "체크", false, secondBtn1Act, secondBtn2Act);
	// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
	removeAlert(); // 기존팝업닫기
	// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
}

function btn2Act() {
	// 2번버튼 클릭시 수행할 내용
	console.log('2번 버튼 동작');
	removeAlert(); // 팝업닫기
}



function secondBtn1Act() {
	removeAlert(); // 팝업닫기
    console.log("두번째팝업 1번 버튼 동작");
    var url = "/ad/mealMenu/Overlay";
    var start_date = $("#start").val();
    var end_date = $("#end").val();
    var content = $("#content").val();
    
    
    console.log("start_date:", start_date);
    console.log("end_date:", end_date);
    console.log("content:", content);

    if (!start_date || !end_date || !content) {
        layerPopup('모든 필수 항목을 입력해 주세요.', '확인', false, thirdBtn2Act, thirdBtn2Act);
        return;
    }
    
    
    
    var data = { start: start_date, end: end_date };

    $.ajax({
        url: url,
        type: "GET",
        data: data,
        success: function (response) {
            console.log("서버 응답:", response);

            if (response.menu_idx > 0) {
                var mealIdx = response.menu_idx; // 메뉴 ID
                console.log("중복된 메뉴 ID:", mealIdx);
                removeAlert(); // 팝업닫기
                layerPopup("같은 날짜에 이미 등록한 메뉴가 있습니다. 이 메뉴로 덮어씌우시겠습니까?",  "확인","취소",  
                		function () {
                	console.log(mealIdx);
                    console.log("확인 버튼 클릭!"); // 디버깅 로그
                    thirdBtn1Act(mealIdx); // 덮어쓰기 처리
                },thirdBtn2Act);
            } else {
                console.log("중복 없음, 폼 제출 시작");
                $("#mealForm").submit();
            }
        },
        error: function (xhr, status, error) {
            console.error("AJAX 요청 실패:", error);
        },
    });
}



function secondBtn2Act() {
	// 두번째팝업 2번버튼 클릭시 수행할 내용
	console.log('두번째팝업 2번 버튼 동작');
	removeAlert(); // 팝업닫기
}



function thirdBtn1Act(mealIdx) {
    console.log("덮어쓰기 확인 버튼 클릭");
    console.log("mealIdx in thirdBtn1Act:", mealIdx);

    // 폼 데이터 수집
    const formData = {
        menu_idx: mealIdx,
        start_date: $('#start').val(),
        end_date: $('#end').val(),
        content: $('#content').val(),
        is_time: $('#basicSelect').val()
    };

    // Ajax를 통한 PUT 요청
    httpAjax('PUT', '/ad/mealMenu/Update', formData);
	
    removeAlert(); // 팝업 닫기
}

function thirdBtn2Act() {
	// 두번째팝업 2번버튼 클릭시 수행할 내용
	console.log('두번째팝업 2번 버튼 동작');
	removeAlert(); // 팝업닫기
}



</script>

</html>