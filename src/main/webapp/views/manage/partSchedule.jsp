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


	
#scheduleWrite{
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
    height: 680px;
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
	
					<ul>
						<li><a href="/ad/spotManage">매장관리 홈</a></li>	
						<li><a href="/ad/partSchedule">스케줄 관리</a></li>	
						<li class="active"><a href="/ad/part">아르바이트 관리</a></li>
						<li><a href="/us/rest/listView">휴점신청</a></li>
					</ul>
					<div class="buttons">						
						<button class="btn btn-primary" id="scheduleWrite" >등록하기</button>
					</div>
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
                  <div id="weeklyPayModal" class="modal" style="display: none;">
				    <div class="modal-content">
				        <div class="modal-header">
				            <h5 class="title">이번주 주급 현황</h5>
				            <button type="button" id="closeWeeklyPayModal" class="modal-close">X</button>
				        </div>
				        <div class="modal-body">
				            <p>이번 주의 주급을 계산하고 있습니다...</p>
				            <div id="calculatedPay">계산 결과가 여기에 표시됩니다.</div>
				        </div>
				        <div class="modal-footer">
				            <button type="button" class="btn btn-secondary" id="closePayModalButton">닫기</button>
				        </div>
				    </div>
				</div>
                  
				  <!-- 수정 모달 -->
					<div id="editModalBox" class="modal" style="display: none;">
					    <div class="modal-content">
					        <div class="modal-header">
					            <h5 class="title">스케줄 수정</h5>
					            <button type="button" id="closeEditModal" class="modal-close">X</button>
					        </div>
					        <div class="modal-body">
					            <form id="editEventForm">
					                <table class="modal-table">
					                    <tr>
					                        <th>이름</th>
					                        <td>
					                            <select id="menuContent" name="part_name" class="form-control">
					                                <option value="" selected>이름을 선택하세요</option>
					                                <!-- 동적으로 옵션이 추가됩니다 -->
					                            </select>
					                            <input type="hidden" id="editHistoryIdx" name="history_idx" />
					                            <input type="hidden" id="editPartIdx" name="part_idx" />
					                        </td>
					                    </tr>
					                    <tr>
					                        <th>일자</th>
					                 
					                        <td><input type="date" id="menuDate" name="work_date"  class="form-control" /></td>
					                    </tr>
					                    <tr>
					                        <th>시작 시간</th>
					                        <td><input type="time" id="menuStartTime" name="start_time" class="form-control" /></td>
					                    </tr>
					                    <tr>
					                        <th>종료 시간</th>
					                        <td><input type="time" id="menuEndTime" name="end_time" class="form-control" /></td>
					                    </tr>
					                    <tr>
					                        <th>급여</th>
					                        <td><input type="number" id="pay" name="pay" class="form-control" placeholder="급여를 입력하세요" /></td>
					                    </tr>
					                    <tr>
					                        <th>상태</th>
					                        <td>
					                            <label><input type="radio" name="is_done" value="Y" id="isDoneYes" /> 완료</label>
					                            <label><input type="radio" name="is_done" value="N" id="isDoneNo" /> 미완료</label>
					                        </td>
					                    </tr>
					                </table>
					            </form>
					        </div>
					        <div class="modal-footer">
					            <button type="button" id="saveEditMenu" class="btn btn-primary">저장</button>
					            <button type="button" id="deleteEditMenu" class="btn btn-danger">삭제</button>
					            <button type="button" id="cancelEditModal" class="btn btn-secondary">취소</button>
					        </div>
					    </div>
					</div>
					
					<!-- 등록 모달 -->
					<div id="registerModalBox" class="modal" style="display: none;">
					    <div class="modal-content">
					        <div class="modal-header">
					            <h5 class="title">스케줄 등록</h5>
					            <button type="button" id="closeRegisterModal" class="modal-close">X</button>
					        </div>
					        <div class="modal-body">
					            <form id="registerEventForm">
					                <table class="modal-table">
					                    <tr>
					                        <th>이름</th>
					                        <td>
					                            <select id="registerMenuContent" name="part_name" class="form-control">
					                                <option value="" selected>이름을 선택하세요</option>
					                                <!-- 동적으로 옵션이 추가됩니다 -->
					                            </select>
					                            <input type="hidden" id="registerPartIdx" name="part_idx" />
					                            
					                        </td>
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
        left: 'prev,next', // 왼쪽에는 < > 버튼
        center: 'title',   // 가운데에는 캘린더 제목
        right: 'customWeeklyPay' // 오른쪽에는 주급 계산기 버튼
    },
    locale: 'ko',
    initialView: 'timeGridWeek',
    customButtons: {
        customWeeklyPay: {
            text: '주급 계산기',
            click: function() {
                // 버튼 클릭 시 동작
            	  $('#weeklyPayModal').fadeIn();
            }
        }
    },
    events: [], // 기존 이벤트 유지
    eventClick: function(info) {
        openEditModal(info); // 기존 수정 모달 열기
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
            const formattedData = data.map(item => {
                // 작업 날짜와 시간 결합
                const startDate = new Date(item.work_date + 'T' + item.start_time);
                const endDate = new Date(item.work_date + 'T' + item.end_time);

                return {
                    id: item.history_idx, // history_idx를 ID로 사용
                    title: item.part_name, // 달력에 표시할 이름
                    start: startDate.toISOString(), // ISO 형식으로 전달
                    end: endDate.toISOString(),
                    backgroundColor: getFixedColor(item.part_name),
                    borderColor: getFixedColor(item.part_name),
                    extendedProps: {
                        history_idx: item.history_idx, // history_idx 추가
                        part_idx: item.part_idx,
                        part_name: item.part_name,
                        pay: item.pay,
                        is_done: item.is_done,
                        work_date: item.work_date
                    }
                };
            });
            calendar.removeAllEvents();
            calendar.addEventSource(formattedData);
        },
        error: function (err) {
            console.error('이벤트 로드 실패:', err);
        }
    });
}

    loadEvents();

  // 이름 데이터 로드 및 select 태그에 추가
function loadPartNames(selectId, selectedValue = null) {
    $.ajax({
        url: '/ad/getPartNames',
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log('로드된 이름 데이터:', data); // 데이터를 콘솔에 출력

            const selectElement = document.querySelector(selectId);
            selectElement.innerHTML = ''; // 기존 옵션 제거

            data.forEach(function (item) {
                console.log('이름:', item.name, ' | part_idx:', item.part_idx); // 각 이름과 part_idx를 출력

                const option = document.createElement('option');
                option.value = item.name; // value는 이름으로 설정
                option.textContent = item.name; // 표시 이름
                option.dataset.partIdx = item.part_idx; // part_idx를 data 속성으로 추가

                // 선택된 값 설정
                if (selectedValue && selectedValue === item.name) {
                    option.selected = true;
                    // hidden 필드에 part_idx 값 설정
                    if (selectId === '#menuContent') {
                        $('#editPartIdx').val(item.part_idx);
                        console.log('editPartIdx 설정:', item.part_idx); // 설정값 확인
                    } else if (selectId === '#registerMenuContent') {
                        $('#registerPartIdx').val(item.part_idx);
                        console.log('registerPartIdx 설정:', item.part_idx); // 설정값 확인
                    }
                }

                selectElement.appendChild(option);
            });

            // 이름 선택 시 이벤트 추가
            $(selectId).on('change', function () {
                const selectedOption = this.options[this.selectedIndex];
                const partIdx = selectedOption.dataset.partIdx;

                console.log('선택된 이름:', selectedOption.value, ' | 선택된 part_idx:', partIdx); // 선택된 옵션 확인

                // hidden 필드에 선택된 part_idx 설정
                if (selectId === '#menuContent') {
                    $('#editPartIdx').val(partIdx);
                    console.log('editPartIdx 변경:', partIdx); // 변경값 확인
                } else if (selectId === '#registerMenuContent') {
                    $('#registerPartIdx').val(partIdx);
                    console.log('registerPartIdx 변경:', partIdx); // 변경값 확인
                }
            });

            // hidden 필드 기본값 설정 (최초 선택된 값에 대해)
            if (selectElement.options.length > 0) {
                const defaultOption = selectElement.options[selectElement.selectedIndex];
                if (selectId === '#registerMenuContent') {
                    $('#registerPartIdx').val(defaultOption.dataset.partIdx);
                    console.log('registerPartIdx 기본 설정:', defaultOption.dataset.partIdx);
                }
            }
        },
        error: function (err) {
            console.error('이름 데이터 로드 실패:', err); // 에러 로그 출력
        }
    });
}




function openRegisterModal() {
    if ($('#editModalBox').is(':visible')) {
        console.log('수정 모달 닫기');
        $('#editModalBox').fadeOut();
    }

    console.log('등록 모달 열기');
    $('#registerMenuDate').val('');
    $('#registerMenuStartTime').val('');
    $('#registerMenuEndTime').val('');
    $('#registerPay').val('');
    $('#registerIsDoneNo').prop('checked', true);

    // 이름 데이터 로드
    loadPartNames('#registerMenuContent');

    $('#registerModalBox').fadeIn();
}

function openEditModal(info) {
    const eventData = {
        history_idx: info.event.extendedProps.history_idx, // history_idx 가져오기
        part_idx: info.event.extendedProps.part_idx, // part_idx 가져오기
        part_name: info.event.extendedProps.part_name,
        work_date: new Date(info.event.start).toISOString().slice(0, 10), // 날짜만 추출
        start_time: new Date(info.event.start).toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit' }),
        end_time: new Date(info.event.end).toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit' }),
        pay: info.event.extendedProps.pay,
        is_done: info.event.extendedProps.is_done
    };

    console.log('수정할 이벤트 데이터:', eventData);

    $('#menuDate').val(eventData.work_date);
    $('#menuStartTime').val(eventData.start_time);
    $('#menuEndTime').val(eventData.end_time);
    $('#pay').val(eventData.pay);
    $('#editHistoryIdx').val(eventData.history_idx); // history_idx 설정
    $('#editPartIdx').val(eventData.part_idx); // part_idx 설정

    if (eventData.is_done === 'Y') {
        $('#isDoneYes').prop('checked', true);
    } else {
        $('#isDoneNo').prop('checked', true);
    }

    loadPartNames('#menuContent', eventData.part_name);

    $('#editModalBox').fadeIn();
}


$('#deleteEditMenu').on('click', function () {
    const historyIdx = $('#editHistoryIdx').val(); // 삭제하려는 이벤트의 history_idx 값
    const partIdx = $('#editPartIdx').val(); // part_idx도 추가적으로 사용할 경우

    if (confirm('정말로 삭제하시겠습니까?')) {
        $.ajax({
            url: '/ad/PartHistory/Delete', // 서버에서 처리할 DELETE 요청
            method: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify({ history_idx: historyIdx, part_idx: partIdx }), // 필요 시 part_idx도 포함
            beforeSend: function (xhr) {
                xhr.setRequestHeader($('meta[name="_csrf_header"]').attr('content'), $('meta[name="_csrf"]').attr('content'));
            },
            success: function () {
                console.log('삭제 성공');
                loadEvents(); // 캘린더 데이터 다시 로드
                $('#editModalBox').fadeOut(); // 수정 모달 닫기
            },
            error: function (err) {
                console.error('삭제 실패:', err);
            }
        });
    }
});



    // 모달창 닫기
    $('#closeWeeklyPayModal, #closePayModalButton').on('click', function() {
        $('#weeklyPayModal').fadeOut();
    });

    // 필요 시 주급 계산 로직 추가
    $('#weeklyPayModal').on('show', function() {
        // 주급 계산 로직 추가 가능
        $('#calculatedPay').text('계산 중...');
        setTimeout(() => {
            $('#calculatedPay').text('이번 주 주급: 500,000원');
        }, 1000); // 예시 데이터
    });


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

    $('#saveRegisterMenu').on('click', function () {
        const partIdx = $('#registerPartIdx').val(); // hidden 필드에서 가져온 값
        console.log('현재 registerPartIdx 값:', partIdx); // 값 확인 로그 추가

        const newEventData = {
            part_idx: partIdx,
            pay: $('#registerPay').val(),
            work_date: $('#registerMenuDate').val(),
            start_time: $('#registerMenuStartTime').val(),
            end_time: $('#registerMenuEndTime').val(),
            is_done: $('input[name="registerIsDone"]:checked').val(),
        };

        console.log('등록된 데이터:', newEventData);

        $.ajax({
            url: '/ad/PartHistory/Write',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(newEventData),
            beforeSend: function(xhr) {
                xhr.setRequestHeader($('meta[name="_csrf_header"]').attr('content'), $('meta[name="_csrf"]').attr('content'));
            },
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
            history_idx: $('#editHistoryIdx').val(), // 수정: history_idx 값 가져오기
            part_idx: $('#editPartIdx').val(), // 수정: part_idx 값 가져오기
            pay: $('#pay').val(),
            work_date: $('#menuDate').val(),
            start_time: $('#menuStartTime').val(),
            end_time: $('#menuEndTime').val(),
            is_done: $('input[name="is_done"]:checked').val() // is_done 값 가져오기
        };

        console.log('수정된 데이터:', updatedData);

        $.ajax({
            url: '/ad/PartHistory/Update', // 수정 API URL
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(updatedData), // JSON 형식으로 데이터 전송
            beforeSend: function (xhr) {
                xhr.setRequestHeader($('meta[name="_csrf_header"]').attr('content'), $('meta[name="_csrf"]').attr('content'));
            },
            success: function () {
                console.log('수정 성공');
                loadEvents(); // 캘린더 이벤트 다시 로드
                $('#editModalBox').fadeOut(); // 수정 모달 닫기
            },
            error: function (err) {
                console.error('수정 실패:', err);
            }
        });
    });

});


</script>

</html>