<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구내식당</title>

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- FullCalendar -->
<script src='/resources/js/calender/main.js'></script>
<script src='/resources/js/calender/daygridmain.js'></script>
<script src='/resources/js/calender/interactionmain.js'></script>
<script src='/resources/js/calender/timemain.js'></script>

<link href='/resources/css/calender/main.css' rel='stylesheet' />
<link href='/resources/css/calender/daygridmain.css' rel='stylesheet' />
<link href='/resources/css/calender/timemain.css' rel='stylesheet' />

<!-- CSS -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<style>
  #calendarBox {
    width: 100%;
    max-width: 900px;
    margin: 0 auto;
    padding: 0 15px;
    box-sizing: border-box;
    position: relative;
  }

  #calender {
    width: 100%;
    height: auto;
  }

  /* 헤더 툴바 스타일 */
  .fc-header-toolbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
  }

  /* 페이지 이동 버튼 왼쪽 정렬 */
  .fc-toolbar-chunk:first-child {
      order: -1;
  }

  /* 캘린더 제목 중앙 정렬 */
  .fc-toolbar-title {
      text-align: center;
      flex-grow: 1;
      font-size: 18px;
      font-weight: bold;
  }

  /* 셀렉트 박스 위치 조정 */
  .select {
      position: absolute;
      right: 15px;
     
      z-index: 10;
  }

	.short{
		width: 100px;
	}

  /* 캘린더 날짜 중앙 정렬 */
  .fc-daygrid-day-top {
      display: flex;
      justify-content: center;
      align-items: center;
  }

  /* 이벤트 내용 중앙 정렬 */
  .fc-event-title {
      text-align: center !important;
  }

  /* "오늘" 버튼 제거 */
  .fc-today-button {
      display: none;
  }

  /* 이벤트 스타일 */
  .fc-event {
      background-color: transparent !important;
      border: none !important;
      color: black !important;
      font-size: 14px;
      white-space: pre-wrap;
      text-align: center !important;
      line-height: 1.5;
      display: flex;
      justify-content: center;
      align-items: center;
  }
  #modalBox {
	width: 100%;
	height: 100%;
	position: fixed;
    top: 0;
    left: 0;
	z-index: 996;
	background: rgba(0,0,0,0.6);
}
#modal .close {
    font-size: 40px;
    font-weight: 300;
    position: absolute;
    z-index: 996;
    top: 24px;
    right: 24px;
    display: inline-block;
    width: 30px;
    height: 30px;
    line-height: 27px;
    text-align: center;
    cursor: pointer;
}
 .modal-content{
	position: absolute;
	left: 50%;
	top: 40px;
	transform: translateX(-50%);
    width: 700px;
    height: 750px;
    padding: 30px;
    background: #fff;
    border: none;
   	border-radius: 8px;
   }
   #modal-body {
   	background: #fff;
   	border-radius: 10px;
   }
   
   .fc-time { 
    display: none; /* 시간을 숨김 */
}
 
 /* 흰 긴 줄 제거 */
.fc-toolbar-chunk:first-child {
    display: none;
}
.modal-header{
border-bottom: none;
}

/* 셀렉트 박스 나란히 배치 */
.select {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 10px; /* 간격 조정 */
}

/* 버튼 중앙 정렬 */
.modal-footer {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px; /* 버튼 간격 */
}

/* 모달 안 버튼 크기 및 위치 조정 */
.modal-footer .btn {
    padding: 10px 20px;
    font-size: 16px;
}

.select{
	display: flex;

}
.art{
		height: 280px;
		resize: none;
	}
#closeModal{
	cursor: pointer;
}	
	
</style>
</head>
<body>
<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
         <section id="menu">
            <h4 class="menu-title">구내식당</h4>
            <ul>
               <li><a href="/mealTicket">식권구매</a></li>
               <li class="active"><a href="/mealMenu">식단표</a></li>
               <!-- 관리자 메뉴: role 값이 'admin' 또는 'superadmin'일 때만 표시 -->
			    <c:if test="${role == 'admin' || role == 'superadmin'}">
			        <li><a href="/ad/mealMenu/Write">식단등록</a></li>
			        <li><a href="/ad/mealTicket/Write">식권등록</a></li>
			        <li><a href="/ad/meal/List">상품리스트</a></li>
			    </c:if>
            </ul>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>식단표</h5>
               </div>
               <div class="cont-body">
                  <div id="calendarBox">
                     <div class="select">
                        <select class="form-select short" id="mealTypeSelector" name="is_time">
                           <option value="B" selected="selected">아침</option>
                           <option value="L">점심</option>
                           <option value="D">저녁</option>
                        </select>
                     </div>
                     <div id='calender'></div>
                  </div>
               </div>
               
                <div id="modalBox" class="modal" style="display: none;">
			    <div class="modal-content">
			        <div class="modal-header">
			            <h3>식단 수정</h3>
			            <span class="modal-close" id="closeModal" >&times;</span>
			        </div>
			        <form action="/ad/mealMenu/Update" method="post">
			            <input type="hidden" name="_method" value="put">
			            <input type="hidden" name="_csrf" value="${_csrf.token}" />
			            <input type="hidden" id="idx" name="menu_idx" />
			            <div class="modal-body">
			                <table class="modal-table">
			                    <tr>
			                        <th>식단 종류</th>
			                        <td>
			                            <select class="form-select short" id="mealType" name="is_time">
			                                <option value="B">아침</option>
			                                <option value="L">점심</option>
			                                <option value="D">저녁</option>
			                            </select>
			                        </td>
			                    </tr>
			                    <tr>
			                        <th>시작 날짜</th>
			                        <td>
			                            <input type="datetime-local" class="form-control" id="start" name="start_date" required />
			                        </td>
			                    </tr>
			                    <tr>
			                        <th>종료 날짜</th>
			                        <td>
			                            <input type="datetime-local" class="form-control" id="end" name="end_date" />
			                        </td>
			                    </tr>
			                    <tr>
						            <th >내용</th>
						            <td>
						                <textarea id="content" class="form-control art" name="content" placeholder="메뉴 입력시 , 를구분좌로 사용하여야 됩니다." required="required"></textarea>
						            </td>
						        </tr>
			                </table>
			            </div>
			            <div class="modal-footer">
			                <button type="button" id="saveModal" class="btn btn-primary btn-popup">저장</button>
			                <button type="button" id="cancelModal" class="btn btn-outline-primary">취소</button>
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
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calender.js'></script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calender');
    var mealTypeSelector = document.getElementById('mealTypeSelector');
    var calendar;

    function loadEvents(is_time) {
        var url = '/mealMenu/' + is_time;
        $.ajax({
            url: url,
            method: 'GET',
            success: function (data) {
                updateCalendar(data);
            },
            error: function (err) {
                console.error('Failed to load events:', err);
            }
        });
    }

    function updateCalendar(events) {
        console.log("Received events data:", events);

        var formattedEvents = events.map(function (item) {
            return {
                title: formatEventContent(item),
                idx: item.menu_idx,
                start: item.start_date,
                end: item.end_date, // 종료 날짜가 없으면 null 설정
                is_time: item.is_time,
            };
        });

        console.log("Formatted events data:", formattedEvents);

        calendar.removeAllEvents();
        calendar.addEventSource(formattedEvents);
    }

    function formatEventContent(item) {
        const meals = item.content.split(',');
        return meals.join('\n');
    }

    calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['dayGrid', 'interaction'],
        header: {
            left: 'prev,next',
            center: 'title',
            right: ''
        },
        locale: 'ko',
        initialView: 'dayGridMonth',
        events: [],
        editable: false, // 이벤트 이동 불가능
        droppable: false, // 외부 요소 드롭 불가능
        eventResizableFromStart: false, // 시작 위치에서 크기 조정 불가능
        eventStartEditable: false, // 이벤트 시작 시간 변경 불가능
        eventDurationEditable: false, // 이벤트 기간 변경 불가능
        eventAllow: function (dropInfo, draggedEvent) {
            return false; // 이벤트 이동 자체를 허용하지 않음
        },
        dayHeaderContent: function (args) {
            return args.date.getDate() + '일';
        },
        eventClick: function (info) {
        	
        	const userRole = "${role}"; // JSP에서 사용자 역할(role)을 가져옵니다.

            // admin 또는 superadmin만 수정 가능하도록 제한
            if (userRole !== 'admin' && userRole !== 'superadmin') {
                return; // 함수 실행 중단 (아무 동작도 하지 않음)
            }
        	
            var eventData = {
            		
                title: info.event.title || '',
                start: info.event.start ? formatLocalDateTime(info.event.start) : '',
                end: info.event.end ? formatLocalDateTime(info.event.end) : '',
            	is_time: info.event.extendedProps.is_time || '',
              	idx: info.event.extendedProps.idx || '' // 저장한 idx 값을 가져옴
                	    };

            console.log("Event data:", eventData); // 디버깅용 로그

            // 모달 열기
            loadModal('menu', 'Update', eventData);
        }, // 일정 수정 가능 여부 설정
        editable: true,
    });

    calendar.render();

    var initialMealType = mealTypeSelector.value;
    loadEvents(initialMealType);

    mealTypeSelector.addEventListener('change', function () {
        var selectedMealType = mealTypeSelector.value;
        loadEvents(selectedMealType);
    });
});


// 모달 데이터 주입 함수
function setModalData(data) {
    console.log("Setting modal data:", data); // 디버깅 로그

    // 식단 종류 설정
    if (data.is_time) {
        document.getElementById('mealType').value = data.is_time;
    } else {
        document.getElementById('mealType').value = '';
    }

    // 시작 날짜 설정
    if (data.start) {
        document.getElementById('start').value = data.start;
    } else {
        document.getElementById('start').value = '';
    }

    // 종료 날짜 설정
    if (data.end) {
        document.getElementById('end').value = data.end;
    } else {
        document.getElementById('end').value = '';
    }

    // 내용 설정 (줄바꿈을 콤마로 변환)
    if (data.title) {
        document.getElementById('content').value = data.title.replace(/\n/g, ',');
    } else {
        document.getElementById('content').value = '';
    }

    // idx 설정 (hidden input에 값 주입)
    if (data.idx) {
        document.getElementById('idx').value = data.idx;
    } else {
        document.getElementById('idx').value = ''; // 없을 경우 빈 값 설정
    }
}

// 로컬 시간대를 유지하며 datetime-local 형식으로 변환
function formatLocalDateTime(date) {
    let localDate = new Date(date.getTime() - date.getTimezoneOffset() * 60000);
    return localDate.toISOString().slice(0, 16);
}

// 모달 열기 함수
function loadModal(section, type, data) {
    var modal = document.getElementById("modalBox");

    // 모달 표시
    modal.style.display = "block";

    // 데이터 주입
    setModalData(data);
}

// 모달 닫기
document.addEventListener('click', function (event) {
    if (event.target.id === 'cancelModal' || event.target.id === 'closeModal') {
        var modal = document.getElementById("modalBox");
        modal.style.display = "none";
    }
});

$('.btn-popup').on(
		'click',
		function() {
			layerPopup('식단을 수정하시겠습니까?', '확인', '취소', btn1Act,
					btn2Act);
		});

/* 알림 팝업 */
function btn1Act() {
	// 1번버튼 클릭시 수행할 내용
	console.log('1번 버튼 동작');

	// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
	removeAlert(); // 기존팝업닫기
	// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
	layerPopup("수정이 완료 되었습니다.", "확인", false, secondBtn1Act, secondBtn2Act);
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
document.getElementById('start').setAttribute('readonly', true);
document.getElementById('end').setAttribute('readonly', true);

</script>
</html>
