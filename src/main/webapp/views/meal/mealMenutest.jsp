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
               <li><a href="/ad/mealTicket">식권구매</a></li>
               <li class="active"><a href="/ad/mealMenu">식단표</a></li>
               <li><a href="/ad/mealMenu/Write">식단등록</a></li>
               <li><a href="/ad/mealTicket/Write">식권등록</a></li>
               <li><a href="/ad/meal/List">상품리스트</a></li>
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
               <!-- 
                <div id="modalBox" class="modal" style="display: none;">
			     <div class="modal-content">
                    <h3>식단 수정</h3>
                    
                 </div>
			  </div> -->
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

</script>
</html>
