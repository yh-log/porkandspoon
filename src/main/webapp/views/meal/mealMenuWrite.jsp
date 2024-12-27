<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

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
						<li><a href="/ad/mealTicket">식권구매</a></li>
						<li><a href="/ad/mealMenu">식단표</a></li>
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
						            <th class="align-l">상태</th>
						            <td>
						                <select class="form-select short" id="basicSelect" name="is_time">
						                    <option value="B" selected="selected">아침</option>
						                    <option value="L">점심</option>
						                    <option value="D">저녁</option>
						                </select>
						            </td>
						        </tr>
						        
						        <tr>
							    <th class="align-l datetime">일정</th>
							    <td>
							        <div class="datetime-group">
							            <input id="start" class="form-control sor-1 short" type="datetime-local" name="start_date" />
							            	~
							            <input id="end" class="form-control sor-1 short" type="datetime-local" name="end_date" />
							        </div>
							    </td>
							</tr>
						        
						        <tr>
						            <th class="align-l">내용</th>
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


<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<script>
// 초기값 설정 같은 날자 넣었을때 처리하는 방법 어캐할 건지 
$(document).ready(function () {
    // 초기값 설정
    function setInitialValues() {
        const selectedValue = $('#basicSelect').val(); // 초기 상태 값 가져오기
        const now = new Date(); // 현재 날짜 가져오기
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
        const date = String(now.getDate()).padStart(2, '0');

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

        // 설정된 값 확인
        console.log('Initial Start Time:', $('#start').val());
        console.log('Initial End Time:', $('#end').val());
    }

    // 초기 실행
    setInitialValues();

    // 셀렉트 박스 변경 이벤트
    $('#basicSelect').change(function () {
        setInitialValues();
    });
});



/* 알림 팝업 */
function btn1Act() {
	// 1번버튼 클릭시 수행할 내용
	console.log('1번 버튼 동작');

	// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
	removeAlert(); // 기존팝업닫기
	// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
	layerPopup("두번째", "체크", false, secondBtn1Act, secondBtn2Act);
}

function btn2Act() {
	// 2번버튼 클릭시 수행할 내용
	console.log('2번 버튼 동작');
	removeAlert(); // 팝업닫기
}



function secondBtn1Act() {
    console.log("두번째팝업 1번 버튼 동작");
    var url = "/ad/mealMenu/Overlay";
    var start_date = $("#start").val();
    var end_date = $("#end").val();
    console.log("start_date:", start_date);
    console.log("end_date:", end_date);

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


$('.btn-popup').on(
		'click',
		function() {
			layerPopup('메뉴를 등록하시겠습니까?', '확인', '취소', secondBtn1Act,
					secondBtn2Act);
		});

</script>

</html>