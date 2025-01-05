<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단표</title>

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

  .select {
    width: auto;
    position: absolute;
    right: 15px;
    margin-bottom: 10px;
     z-index: 10; /* z-index로 다른 요소 위로 올리기 */
  }


	
#home,#schedule{
		width: 200px;
	}
	/* 이벤트 폭 고정 */
	.fc-event {
    position: absolute !important;
    z-index: 1 !important;
    width: 90% !important; /* 이벤트 간 폭 좁히기 */
    margin-left: 10px; /* 좌측 간격 */
    border-radius: 5px;
    padding: 5px;
    font-weight: bold;
    color: #fff !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
}


	
	/* 겹칠 때 폭 좁아지는 현상 제거 */
	.fc-timegrid-event {
    width: 100% !important;
    margin: 0 !important;
    border-radius: 5px;
}

/* 텍스트 정렬 및 색상 */
.fc-event-title {
    color: #fff !important;
    text-align: center;
    font-weight: bold;
}

  .fc-toolbar-chunk:nth-child(3) {
    display: none !important; /* 'week' 버튼을 포함한 오른쪽 상단 버튼 숨김 */
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
    height: 700px;
    padding: 30px;
    background: #fff;
    border: none;
   	border-radius: 8px;
   }
   #modal-body {
   	background: #fff;
   	border-radius: 10px;
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

	
</style>
</head>
<body>
<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
				<section id="menu">
					<h4 class="menu-title">매장관리</h4>
					<div class="buttons">							
						<button class="btn btn-outline-primary" id="home"  onclick="location.href='/ad/spotManage'">매장관리 홈</button>
						<button class="btn btn-primary" id="schedule" onclick="location.href='/ad/partSchedule'">스케줄 관리</button> 
						<button class="btn btn-primary" id="scheduleWrite" >등록하기</button>
					</div>
	
					<ul>
						<li class="active"><a href="/ad/part">아르바이트 관리</a></li>
						<li><a href="/ad/rest/List">휴점신청</a></li>
					</ul>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>아르바이트 관리</h5>
               </div>
               <div class="cont-body">
                  <div id="calendarBox">
      
                     <div id='calender'></div>
                  </div>
				  <!-- 수정 모달 -->
<div id="editModalBox" class="modal" style="display: none;">
    <div class="modal-content">
        <div class="modal-header">
            <h5>이벤트 수정</h5>
            <button type="button" id="closeEditModal" class="modal-close">X</button>
        </div>
        <div class="modal-body">
            <form id="editEventForm">
                <table class="modal-table">
                    <tr>
                        <th>이벤트 제목</th>
                        <td><input type="text" id="menuContent" class="form-control" placeholder="제목을 입력하세요" /></td>
                    </tr>
                    <tr>
                        <th>일자</th>
                        <td><input type="date" id="menuDate" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>시작 시간</th>
                        <td><input type="time" id="menuStartTime" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>종료 시간</th>
                        <td><input type="time" id="menuEndTime" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>급여</th>
                        <td><input type="number" id="pay" class="form-control" placeholder="급여를 입력하세요" /></td>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td>
                            <label><input type="radio" name="isDone" value="Y" id="isDoneYes" /> 완료</label>
                            <label><input type="radio" name="isDone" value="N" id="isDoneNo" /> 미완료</label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" id="saveEditMenu" class="btn btn-primary">저장</button>
            <button type="button" id="cancelEditModal" class="btn btn-secondary">취소</button>
        </div>
    </div>
</div>

<!-- 등록 모달 -->
<div id="registerModalBox" class="modal" style="display: none;">
    <div class="modal-content">
        <div class="modal-header">
            <h5>이벤트 등록</h5>
            <button type="button" id="closeRegisterModal" class="modal-close">X</button>
        </div>
        <div class="modal-body">
            <form id="registerEventForm">
                <table class="modal-table">
                    <tr>
                        <th>이벤트 제목</th>
                        <td><input type="text" id="registerMenuContent" class="form-control" placeholder="제목을 입력하세요" /></td>
                    </tr>
                    <tr>
                        <th>일자</th>
                        <td><input type="date" id="registerMenuDate" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>시작 시간</th>
                        <td><input type="time" id="registerMenuStartTime" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>종료 시간</th>
                        <td><input type="time" id="registerMenuEndTime" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>급여</th>
                        <td><input type="number" id="registerPay" class="form-control" placeholder="급여를 입력하세요" /></td>
                    </tr>
                    <tr>
                        <th>상태</th>
                        <td>
                            <label><input type="radio" name="registerIsDone" value="Y" id="registerIsDoneYes" /> 완료</label>
                            <label><input type="radio" name="registerIsDone" value="N" id="registerIsDoneNo" checked /> 미완료</label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" id="saveRegisterMenu" class="btn btn-primary">저장</button>
            <button type="button" id="cancelRegisterModal" class="btn btn-secondary">취소</button>
        </div>
    </div>
</div>

                  
               </div>
            </div>
         </section>
      </div>
   </div>
</div>
</body>
<script src="/resources/assets/static/js/components/dark.js"></script>
<script src="/resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="/resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calender.js'></script>


<script>
$(document).ready(function () {
    // 캘린더 초기화
    var calendarEl = document.getElementById('calender');
    var colorMap = {}; // 이름별 색상 저장

    function getFixedColor(name) {
        if (!colorMap[name]) {
            const hue = Math.floor(Math.random() * 360);
            const saturation = 75;
            const lightness = 55;
            colorMap[name] = 'hsl(' + hue + ', ' + saturation + '%, ' + lightness + '%)';
        }
        return colorMap[name];
    }

    // 캘린더 설정
    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['timeGrid', 'interaction'],
        header: {
            left: 'prev,next',
            center: 'title',
            right: ''
        },
        locale: 'ko',
        initialView: 'timeGridWeek',
        events: [],
        eventClick: function (info) {
            openEditModal(info); // 수정 모달 열기
        }
    });

    calendar.render();

    // 이벤트 데이터 로드
    function loadEvents() {
        $.ajax({
            url: '/ad/getPartTime',
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                const formattedData = data.map(item => ({
                    id: item.id,
                    part_idx: item.part_idx,
                    title: item.part_name,
                    start: new Date(item.work_date + ' ' + item.start_time).toISOString(),
                    end: new Date(item.work_date + ' ' + item.end_time).toISOString(),
                    pay: item.pay,
                    is_done: item.is_done,
                    backgroundColor: getFixedColor(item.part_name),
                    borderColor: getFixedColor(item.part_name),
                }));
                calendar.removeAllEvents();
                calendar.addEventSource(formattedData);
            },
            error: function (err) {
                console.error('이벤트 로드 실패:', err);
            }
        });
    }

    loadEvents();

    // 등록 모달 열기 함수
    function openRegisterModal() {
        if ($('#editModalBox').is(':visible')) {
            console.log('수정 모달 닫기');
            $('#editModalBox').fadeOut();
        }

        console.log('등록 모달 열기');
        $('#registerMenuContent').val('');
        $('#registerMenuDate').val('');
        $('#registerMenuStartTime').val('');
        $('#registerMenuEndTime').val('');
        $('#registerPay').val('');
        $('#registerIsDoneNo').prop('checked', true);

        $('#registerModalBox').fadeIn();
    }

    // 수정 모달 열기 함수
    function openEditModal(info) {
        if ($('#registerModalBox').is(':visible')) {
            console.log('등록 모달 닫기');
            $('#registerModalBox').fadeOut();
        }

        const eventData = {
            id: info.event.id,
            part_idx: info.event.extendedProps.part_idx,
            title: info.event.title,
            date: info.event.start.toISOString().slice(0, 10),
            startTime: info.event.start.toISOString().slice(11, 16),
            endTime: info.event.end.toISOString().slice(11, 16),
            pay: info.event.extendedProps.pay,
            is_done: info.event.extendedProps.is_done,
        };

        console.log('수정할 이벤트 데이터:', eventData);

        $('#menuContent').val(eventData.title);
        $('#menuDate').val(eventData.date);
        $('#menuStartTime').val(eventData.startTime);
        $('#menuEndTime').val(eventData.endTime);
        $('#pay').val(eventData.pay);
        $('#partIdx').val(eventData.id);

        if (eventData.is_done === 'Y') {
            $('#isDoneYes').prop('checked', true);
        } else {
            $('#isDoneNo').prop('checked', true);
        }

        $('#editModalBox').fadeIn();
    }

    // 등록 모달 닫기
    $('#closeRegisterModal, #cancelRegisterModal').on('click', function () {
        console.log('등록 모달 닫기');
        $('#registerModalBox').fadeOut();
    });

    // 수정 모달 닫기
    $('#closeEditModal, #cancelEditModal').on('click', function () {
        console.log('수정 모달 닫기');
        $('#editModalBox').fadeOut();
    });

    // 등록 버튼 클릭
    $('#scheduleWrite').on('click', function () {
        openRegisterModal();
    });

    // 등록 저장 버튼 클릭
    $('#saveRegisterMenu').on('click', function () {
        const newEventData = {
            title: $('#registerMenuContent').val(),
            date: $('#registerMenuDate').val(),
            startTime: $('#registerMenuStartTime').val(),
            endTime: $('#registerMenuEndTime').val(),
            pay: $('#registerPay').val(),
            is_done: $('input[name="registerIsDone"]:checked').val(),
        };

        console.log('등록된 데이터:', newEventData);

        $.ajax({
            url: '/ad/addPartHistory',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(newEventData),
            success: function () {
                console.log('등록 성공');
                loadEvents();
                $('#registerModalBox').fadeOut();
            },
            error: function (err) {
                console.error('등록 실패:', err);
            }
        });
    });

    // 수정 저장 버튼 클릭
    $('#saveEditMenu').on('click', function () {
        const updatedData = {
            id: $('#partIdx').val(),
            title: $('#menuContent').val(),
            date: $('#menuDate').val(),
            startTime: $('#menuStartTime').val(),
            endTime: $('#menuEndTime').val(),
            pay: $('#pay').val(),
            is_done: $('input[name="isDone"]:checked').val(),
        };

        console.log('수정된 데이터:', updatedData);

        $.ajax({
            url: '/ad/updatePartTime',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(updatedData),
            success: function () {
                console.log('수정 성공');
                loadEvents();
                $('#editModalBox').fadeOut();
            },
            error: function (err) {
                console.error('수정 실패:', err);
            }
        });
    });
});

</script>

</html>