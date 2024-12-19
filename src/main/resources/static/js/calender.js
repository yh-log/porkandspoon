// author yh.kim (24.12.7) 

// schedule : 일정, 회의실 : cabinet, 물품 : article
var section= 'schedule';
var formattedDate = '';
var calender = null;

$(document).ready(function () {
	initializeCalendar();
});

function loadCalender(section) {
	url= "/" + section + "List";
    getAjax(url)
}; 

// FullCalendar 초기화 함수 
function initializeCalendar(event) {
    var calendarEl = document.getElementById('calendar');

    if (calender) {
        calender.destroy();
    }

    // FullCalendar 인스턴스 생성 및 설정
    calender = new FullCalendar.Calendar(calendarEl, {
        // 플러그인 활성화 (interaction: 사용자 상호작용, dayGrid: 달력 형태 보기)
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        // 캘린더 헤더에 표시할 버튼들 설정
        header: {
            left: 'prevYear,prev,next,nextYear today', // 왼쪽에 연도 이동과 오늘 버튼
            center: 'title',                          // 중앙에 현재 달력 제목
            right: 'dayGridMonth,timeGridWeek,timeGridDay', // 오른쪽에 보기 모드 전환 버튼
        },
		timeFormat: {
            agenda: 'H(:mm)' //h:mm{ - h:mm}'
        },
        dateClick: function (info) {
            formattedDate = info.dateStr; 
            loadModal('Input', info); // 일정 등록 모달
        },
        eventClick: function(info){
        	formattedDate = info.dateStr;
        	loadModal('Info', info); // 일정 확인, 수정 모달
        },
        // 일정 수정 가능 여부 설정
        editable: true,
        // 한 날짜에 표시할 일정 수 제한 (초과 시 "더 보기" 표시)
        eventLimit: true,
        // 초기 일정 데이터 설정
        events: event,
        // 일정 시간 표시 여부
        displayEventTime: false,
    });
    calender.render();
}

function loadModal(type, info) {
    var modal = document.getElementById("calendarModal");
    var modalContent = modal.querySelector(".modal-content");

    $.ajax({
        url: "/resources/html/calenderModal.html", // 모달 HTML 파일 경로
        type: "GET",
        success: function (data) {
            var tempDiv = document.createElement("div");
            tempDiv.innerHTML = data;

            var selectedModal = tempDiv.querySelector(`#${section}${type}Modal`);
            if (selectedModal) {
                modalContent.innerHTML = selectedModal.innerHTML;

                if (type === "Input") { // 일정 등록 시 
                    document.getElementById("calendar_start_date").value = formattedDate;
                    document.getElementById("calendar_end_date").value = formattedDate;
                }else{ // 일정 확인 시
                	document.getElementById("calendar_content").value = info.event._def.title;
                	document.getElementById("calendar_start_date").value = info.event._instance.range.start.toISOString().slice(0, 10); // YYYY-MM-DD 형식
					document.getElementById("calendar_end_date").value = info.event._instance.range.end.toISOString().slice(0, 10); // YYYY-MM-DD 형식
					document.getElementById("calendar_event_id").value = event.id;
					console.log(document.getElementById("calendar_event_id").value);
					console.log(document.getElementById("calendar_content").value);
				}
                modal.style.display = "block";

                // 모달 닫기 및 기타 이벤트 설정
                setupModalEvents(modal);
            } else {
                console.error("해당하는 모달을 찾을 수 없습니다: " + section);
            }
        },
        error: function () {
            console.error("모달 HTML 파일을 로드하는 데 실패했습니다.");
        },
    });
}

// 모달 닫기 및 이벤트 등록 함수
function setupModalEvents(modal) {
    var closeModal = modal.querySelector("#closeModal");
    var cancelButton = modal.querySelector("#cancelModal");

    // 닫기 버튼 클릭 이벤트
    if (closeModal) {
        closeModal.addEventListener("click", function () {
            modal.style.display = "none";
        });
    }

    // 취소 버튼 클릭 이벤트
    if (cancelButton) {
        cancelButton.addEventListener("click", function () {
            modal.style.display = "none";
        });
    }

    // 모달 외부 클릭 시 닫기
    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });
}

document.addEventListener('click', function(event){
    if(event.target && event.target.id === 'addSchedule' || event.target && event.target.id === 'amendSchedule'){
        var content = document.getElementById('calendar_content').value; // 일정 내용
        var start_date = document.getElementById('calendar_start_date').value; // 시작일
        var end_date = document.getElementById('calendar_end_date').value;     // 종료일

        // 입력값 유효성 검사 (모달 내용에 따라 다르게 작성)
        if (content == null || content == "") {
            alert("내용을 입력하세요."); 
        } else if (start_date == "" || end_date == "") {
            alert("날짜를 입력하세요.");
        } else if (new Date(end_date) - new Date(start_date) < 0) {
            alert("종료일이 시작일보다 먼저입니다."); 
        } else {

			// DB 구조에 따라 파라미터 정의
            var params = {
                subject : content,
                start : start_date,
                end : end_date
            };
			if(event.target && event.target.id === 'addSchedule'){
	            httpAjax('POST', '/scheduleWrite', params);
			}else{
				httpAjax('PUT', '/scheduleWrite', params);
			}
        }

        // 모달 닫기 및 입력 필드 초기화
        document.getElementById('calendarModal').style.display = 'none'; 
        document.getElementById('calendar_content').value = '';          
        document.getElementById('calendar_start_date').value = '';       
        document.getElementById('calendar_end_date').value = '';         
    }

    if(event.target && event.target.id === 'addCabinet'){
        console.log('회의실 등록')
        // 실행할 함수 등록
    }

    if(event.target && event.target.id === 'addArticle'){
        console.log('물품 등록');
        // 실행함 함수 등록
    }
});

// 일정 등록 완료 후 함수
function httpSuccess(response){
    loadCalender(section);             	
}

// 일정 불러오기 완료 후 함수
function getSuccess(response){
	var event = [];

    response.result.forEach(function(item){
        event.push({
            title : item.subject,
            start : item.start,
            end : item.end,
            id : item.id
        });
    });
    initializeCalendar(event);
}