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

var currentEventData = null;


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
        // 학원에서 추가한 부분
        titleFormat: function (date) {
	      year = date.date.year;
	      month = date.date.month + 1;
	
	      return year + "년 " + month + "월";
    	},
        dateClick: function (info) {
            formattedDate = info.dateStr;
            loadModal(section, 'Input'); // 일정 등록 모달
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
    if(event.target){
        // 일정 등록 버튼 클릭
        if(event.target.id === 'addSchedule'){
            handleAddSchedule();
        }
        // 일정 수정 버튼 클릭
        else if(event.target.id === 'amendSchedule'){
            handleAmendSchedule();
        }
        // 일정 삭제 버튼 클릭
        else if(event.target.id === 'deleteSchedule'){
            handleDeleteSchedule();
        }
        // 일정 수정 저장 버튼 클릭
        else if(event.target.id === 'saveEditSchedule'){
            handleSaveEditSchedule();
        }
        // 조직도 모달 버튼 클릭
        else if(event.target.id === 'loadChartModal'){
            loadChartModal('chartInputModal')
        }
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



var typeColorMap = {
    'C': { background: '#D7F5FC', text: '#000000' }, // 
    'P': { background: '#FFF2D6', text: '#000000' }, // 
    'T': { background: '#EDC0FF', text: '#000000' }, // 
};


// 일정 불러오기 완료 후 함수
function getSuccess(response){
	var event = [];
	console.log('getSuccess response:', response);
    response.result.forEach(function(item){
        event.push({
        	id: item.idx,
            title : item.subject,
            start : item.start_date,
            end : item.end_date,
            color: typeColorMap[item.type]?.background || '#3788d8', // 배경색
        	textColor: typeColorMap[item.type]?.text || '#000000',   // 글자색
        });
    });
    initializeCalendar(event);
}