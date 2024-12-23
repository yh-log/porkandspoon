<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- fullcalender -->
	<script src='/resources/js/calender/main.js'></script>
	<script src='/resources/js/calender/daygridmain.js'></script>
	<script src='/resources/js/calender/interactionmain.js'></script>
	<script src='/resources/js/calender/timemain.js'></script>

	<link href='/resources/css/calender/main.css' rel='stylesheet' />
	<link href='/resources/css/calender/daygridmain.css' rel='stylesheet' />
	<link href='/resources/css/calender/timemain.css' rel='stylesheet' />
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		href="resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon"
		href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
		type="image/png">
		
	<link rel="stylesheet" href="resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="resources/css/common.css">	
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">
	
<style>
    #calendarBox{
        width: 80%;
        padding-left: 15%;
    }

    /* 기본 모달 스타일 */
	.modal {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 1100;
	}
	
	/* 모달 내부 콘텐츠 */
	.modal-content {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: #fff;
	    padding: 20px;
	    border-radius: 8px;
	    width: 800px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	}

	/* 모달 헤더 */
	.modal-header {
	    display: flex;
	    justify-content: end;
	    align-items: center;
	    border-bottom: 1px none #ddd;
	    margin-bottom: 15px;
	}

	/* 닫기(x) 버튼 */
	.modal-close {
	    font-size: 20px;
	    cursor: pointer;
	}
	
	/* 모달 바디 */
	.modal-body .form-group {
	    margin-bottom: 15px;
	}
	
	.form-label {
	    display: block;
	    font-size: 14px;
	    
	}
	
	.form-input {
	    width: 30%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	.form-input1 {
	    width: 100%;
	    padding: 8px;
	    font-size: 14px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	}
	
	/* 모달 푸터 */
	.modal-footer {
	    display: flex;
	    justify-content: center;
	    gap: 10px;
	}
	
	/* 버튼 스타일 */
	.btn {
	    padding: 8px 12px;
	    font-size: 14px;
	    border: none;
	    cursor: pointer;
	    border-radius: 4px;
	}
</style>
</head>
<body>
	<!-- 부트스트랩 -->
	<script src="assets/static/js/initTheme.js"></script>
	
	<div id="app">
   <jsp:include page="../sidebar.jsp" />
   <div id="main">
      <jsp:include page="../header.jsp" />
      <div class="page-content">
         <section id="menu">
            <h4 class="menu-title">캘린더</h4>
            <div class="btn btn-primary full-size">일정추가</div>
            <ul>
               <li class="active">전체 캘린더</li>
               <li>공지 캘린더</li>
               <li>팀별 캘린더</li>
               <li>개인 캘린더</li>
            </ul>
         </section>
         <section class="cont">
            <div class="col-12 col-lg-12">
               <div class="tit-area">
                  <h5>캘린더(많이수정)</h5>
               </div>
               <div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
					<div id="calendarBox">
						<div id='calendar'></div>
					</div>
					<div id="modalBox" class="modal" style="display: none;">
					    <div class="modal-content"></div>
					</div> 
               </div>
            </div>
         </section>   
      </div>
    </div>
	</div>
</body>

<!-- 부트스트랩 -->
<script src="resources/assets/static/js/components/dark.js"></script>
<script src="resources/assets/extensions/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>
<script src='/resources/js/calenderJH.js'></script>

<script>

// 캘린더 js
//author yh.kim (24.12.7) 

//schedule : 일정, 회의실 : cabinet, 물품 : article
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

//FullCalendar 초기화 함수 
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

//일정 등록 완료 후 함수 
function httpSuccess(response){
 loadCalender(section);    
}


//일정 불러오기 완료 후 함수
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

// common.js
// author yh.kim (24.12.5) 
/* 공통 ajax */

/* GET 방식 */

function getAjax(url){
    $.ajax({
        type : 'GET',
        url : url,
        data: {},
        dataType: 'JSON',
        success: function(response){
            getSuccess(response);
        },error: function(e){
            console.log(e);
        }
    });
}


/* POST, PUT, DELETE 방식 */
/**
 * type : POST, PUT, DELETE
 * url : 이동 url
 * param : json 형태
 *
 * html head에 해당 코드 추가
 * <meta name="_csrf" content="${_csrf.token}">
 * <meta name="_csrf_header" content="${_csrf.headerName}"> 
 *
 */

function httpAjax(type, url, params){

	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

    $.ajax({
        type : type,
        url : url,
        data : params,
        dataType : 'JSON',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        },
        success : function(response){
	            httpSuccess(response);
        },error: function(e){
            console.log(e);
        }
    });
}


/* 파일 전송 ajax */
/**
 * type : POST, PUT, DELETE
 * url : 이동 url
 * formData : 파일이 포함된 데이터(josn 형태)
 *
 * html head에 해당 코드 추가
 * <meta name="_csrf" content="${_csrf.token}">
 * <meta name="_csrf_header" content="${_csrf.headerName}"> 
 */

function fileAjax(type, url, formData){

	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

    $.ajax({
        type : type,
        url : url,
        data : formData,
        contentType : false,
        processData : false,
        enctype : 'multipart/form-data',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        },
        success : function(response){
            fileSuccess(response);
        },error : function(e){
            console.log(e);
        }
    });
}


/* 파일 미리보기 */
/**
 * 이미지 미리보기 div 요소 id : id="imgPreview"
 * 이미지 미리보기 div 요소 css : class="priview" *클래스 스타일은 별도 지정 필요
 *  onchange="preview(this)" : input type="file"
 */
function preview(img){
    var reader;
    $('#imgPreview').empty();

    for(var file of img.files){
        reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            $('#imgPreview').append('<img class="priview" src="' + e.target.result + '"/>');
        }
    }
}

/* 파일 다운로드 */
/* onclick="download(file1, file2)"
 * ori_filename : 파일의 원래 이름
 * new_filename : UUID
 */
function download(ori_filename, new_filename) {
    $.ajax({
        type: 'GET',
        url: '/download',
        data: {
            'ori_filename': ori_filename,
            'new_filename': new_filename
        }, xhrFields: {
            responseType: 'blob' // 서버 응답을 Blob 형태로 처리
        }, success: function(blob) {
            // 파일 다운로드 처리
            var url = window.URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.style.display = 'none';
            a.href = url;
            a.download = ori_filename; // 다운로드 파일 이름 설정
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        }, error: function(e) {
            console.error("다운로드 실패:", e);
        }
    });
}

/**
 * author yh.kim (24.12.16) 
 * 모달 오픈 함수 (오픈 후 데이터 처리 함수 : setModalData())
 * 
 * @param {*} section   모달 구분명 (ex. calender, cabinet 등..)
 * @param {*} type      모달 동작 명 (ex. Input, Write 등..)
 * @param {*} data      모달 실행 시 필요 데이터(없을 경우 없이 사용 가능)
 * 
 * 아래 형태로 div 요소 삽입 필요
 * <div id="modalBox" class="modal" style="display: none;">
 *	    <div class="modal-content"></div>
 *	</div>
 * 
 */
// 모달 오픈
function loadModal(section, type, data) {
    var modal = document.getElementById("modalBox");
    var modalContent = modal.querySelector(".modal-content");

    $.ajax({
        url: "/resources/html/modal.html", // 모달 HTML 파일 경로
        type: "GET",
        success: function (html) {
            var tempDiv = document.createElement("div");
            tempDiv.innerHTML = html;

            var modalId = `${section}${type}Modal`; // 동적으로 ID 생성
            var selectedModal = tempDiv.querySelector(`#${modalId}`);

            if (selectedModal) {
                // 모달 HTML 삽입
                modalContent.innerHTML = selectedModal.innerHTML;

                // 모달 표시
                modal.style.display = "block";

                // 데이터 주입 (data가 없을 경우 빈 객체로 처리)
                setModalData(data || {});

                // 모달 닫기 및 기타 이벤트 설정
                setupModalEvents(modal);
            } else {
                console.error(`해당하는 모달을 찾을 수 없습니다: ${modalId}`);
            }
        },
        error: function () {
            console.error("모달 HTML 파일을 로드하는 데 실패했습니다.");
        },
    });
}

/**
 * author yh.kim (24.12.16) 
 * 모달 닫기 함수 (x 버튼, 취소 버튼, 모달 외부 클릭 시)
 * 
 * 닫기 : id="closeModal"
 * 취소 : id="cancelModal"
 */
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



// 팝업을 제거하는 함수
var removeAlert = function(confirmBox) {
    document.body.removeChild($('.confirm-box')[0]);
    document.body.removeChild($('.overlay')[0]);
    window.removeEventListener('keydown', handleKeyDown);
};

// 키 눌림 이벤트 방지
var handleKeyDown = function(event) {
    event.preventDefault();
};

// 기본 텍스트 팝업
function layerPopup(message, btn1, btn2, btn1Callback = btn1Act, btn2Callback = btn2Act) {
    // 대화 상자를 HTML 요소로 생성
    var confirmBox = document.createElement('div');
    confirmBox.setAttribute('class', 'confirm-box');
    confirmBox.innerHTML = '<p>' + message + '</p><a class="btn-close"></a><div class="buttons"><button class="confirm btn btn-primary">'+btn1+'</button></div>';
    
    popUpCommon(btn2, confirmBox, btn1Callback, btn2Callback);
}

// 팝업 공통 기능
function popUpCommon(btn2, confirmBox, btn1Callback, btn2Callback, iconIdx){
	if(btn2){
        confirmBox.getElementsByClassName('buttons')[0].insertAdjacentHTML('beforeend', '<button class="cancel btn btn-outline-primary">'+btn2+'</button>');
    }

    // body 요소의 하위 요소로 추가
    document.body.appendChild(confirmBox);

    // 회색 배경 추가
    var overlay = document.createElement('div');
    overlay.setAttribute('class', 'overlay');
    document.body.appendChild(overlay);

    // 확인 버튼 클릭 시
    var confirmButton = document.querySelector('.confirm-box .confirm');
    confirmButton.addEventListener('click', function() {
        btn1Callback(iconIdx);  
    });

    // 취소 버튼이 있을 때 클릭 이벤트 처리
    if(btn2){
        var cancelButton = document.querySelector('.confirm-box .cancel');
        cancelButton.addEventListener('click', function() {
            btn2Callback();  
        });
    }

    // 회색 배경 클릭 시 팝업 닫기
    overlay.addEventListener('click', removeAlert);
    
    // 닫기 버튼 클릭 시 팝업 닫기
    var closeBtn = confirmBox.getElementsByClassName('btn-close')[0];
    closeBtn.addEventListener('click', removeAlert);

    // 키보드 동작 막기
    window.addEventListener('keydown', handleKeyDown);
    
}


/**
 * author yh.kim (24.12.18) 
 * 페이지 네이션 기능
 */

// 받아야 하는 변수
/**
 * page : 보여줄 페이지 (ex. 1, 2 .. )
 * cnt : 페이지에 보여줄 게시물 수 (ex. 5, 10, 15 ..)
 * option : 검색/필터 옵션
 * search : 검색어 (DB에서 like 사용)
 * filtering : 필터링 값
 */
if($('#pagination')){
	
    function pageCall(page, cnt, url, { option = '', search = '', filtering = '' } = {}){
        
        var requestData = {
	        page: page,
	        cnt: cnt,
	        option: option,
	        search: search,
	        filtering: filtering
	    };
	    console.log(requestData);
        
        $.ajax({
        	type: 'GET',
        	url: url,
        	data: requestData,
        	dataType: 'JSON',
        	success: function(response){
        		console.log('성공함');
        		// 성공 시 실행 함수
        		pringList(response);
        		
				$('#pagination').twbsPagination({ 
					startPage: 1, 
            		totalPages: response.totalPages, 
            		visiblePages: 10,
            		onPageClick:function(evt, page){
            			pageCall(page);
            		}
				});

        		
        	}, error: function(e){
        		console.log('페이지 네이션 에러 => ', e);
        	}
        
        });
    }

}

	
	
</script>
</html>