// author yh.kim (24.12.7) 

// schedule : 일정, 회의실 : cabinet, 물품 : article
var formattedDate = '';
var calender = null;
var data;
var section;
var url;
var params;
var method;
var submitUrl;


function dataSetting(sectionData, typeData, paramData){
	section = sectionData;
	type = typeData;
	data = paramData || {};
}

$(document).ready(function () {
	//loadCalender(section);
	// 캘린더 초기화
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
        buttonText: {
        	today : '오늘',
        	month : '월간',
        	week : '주간',
        	day : '일간',
        },
		timeFormat: {
            agenda: 'H(:mm)' //h:mm{ - h:mm}'
        },
        dateClick: function (info) {
            formattedDate = info.dateStr; 
            loadModal(section, type); // 일정 등록 모달
        },
        eventClick: function(info){
        	formattedDate = info.dateStr;
        	var idx = info.event.id; // FullCalendar의 id 필드에서 idx를 가져옴
    		console.log("클릭한 일정의 idx:", idx);
        	scheduleDetail(idx);
        },
        // 일정 수정 가능 여부 설정
        editable: false,
        // 한 날짜에 표시할 일정 수 제한 (초과 시 "더 보기" 표시)
        eventLimit: true,
        // 초기 일정 데이터 설정
        events: event,
        // 일정 시간 표시 여부
        displayEventTime: false,
    });
    calender.render();
}


document.addEventListener('click', function(event){
    if(event.target && event.target.id === 'addSchedule' || event.target && event.target.id === 'amendSchedule' || event.target && event.target.id === 'deleteSchedule'){
        httpAjax(method, submitUrl, params);
    }

});

function initializeModal(ids = []){
	// 모달 닫기 및 입력 필드 초기화
    document.getElementById('modalBox').style.display = 'none'; 
    ids.forEach(id => {
        var element = document.getElementById(id);
        if (element) {
            element.value = ''; // 값 초기화
        } else {
            console.log('id not found.');
        }
    });
}

// 일정 등록 완료 후 함수 
function httpSuccess(response){
    loadCalender(section);    
}


// 일정 불러오기 완료 후 함수
function getSuccess(response){
	var event = [];

    response.result.forEach(function(item){
        event.push({
        	id: item.idx,
            title : item.subject,
            start : item.start_date,
            end : item.end_date
        });
    });
    initializeCalendar(event);
}