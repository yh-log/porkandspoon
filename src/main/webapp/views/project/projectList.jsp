<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로젝트</title>
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
<!-- 부트스트랩 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
#home,#schedule{
		width: 200px;
	}
	
	.card-content{
		display: felx;
	
	}

	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 230px;
	}

	.tit-area{
		display: flex; 
	}
	h5 .count{
		text-align: right;
		margin-right: 10px;
	}
	.card-body{
		display: flex;	
	}
	#flexRadioDefault2{
		margin-left: 20px;
	}
	td div.inline-layout{
		display: flex;
	    align-items: center;
	    flex-wrap: nowrap;
	    white-space: nowrap;
	    gap: 10px;
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
	}
	.align-l{
		width: 300px;
		text-align: center
	}
	#btn-gap{
		display: flex;
		gap: 30px;
		align-items: center;
		justify-content: center;
	}
	.short{
		width: 200px;
	}
	#start_date{
		margin-left: 800px;
	}
#project_name {
    display: block; /* 블록 요소로 설정 */
    width: 100%; /* 부모 요소의 너비에 맞춤 */
    max-width: 300px; /* 제목의 최대 너비 */
    white-space: nowrap; /* 텍스트를 한 줄로 유지 */
    overflow: hidden; /* 넘치는 텍스트를 숨김 */
    text-overflow: ellipsis; /* 말줄임표 추가 */
    cursor: pointer; /* 클릭 가능하게 설정 */
}
.list-form {
    border: 1px solid #E4E6E8;
    border-radius: 6px;
    padding: 10px;
    width: 49%;
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
    flex-direction: column;
    height: 250px;
    box-sizing: border-box;
    position: relative; /* 위치 조정 가능 */
}

#bar {
    margin-top: 10px;
    height: 20px; /* 진행 바의 높이 */
    width: 90%; /* 진행 바의 너비 */
    background-color: #fff;
    border: 1px solid var(--bs-primary);
    position: relative;
}

.update {
    display: flex;
    justify-content: flex-end; /* 오른쪽 정렬 */
    align-items: center; /* 세로 정렬 */
    gap: 10px; /* 수정 버튼과 쓰레기통 간격 */
    position: absolute; /* 절대 위치 지정 */
    bottom: 10px; /* 컨테이너 하단에서의 간격 */
    right: 10px; /* 컨테이너 오른쪽에서의 간격 */
}

.icon-trash {
    font-size: 20px; /* 아이콘 크기 */
    line-height: 1; /* 수직 정렬 */
    cursor: pointer;
    color: #555; /* 아이콘 색상 */
    transform: translate(55px, 10px);
}

.btn-outline-primary {
    font-size: 14px; /* 수정 버튼 글꼴 크기 */
    padding: 5px 10px; /* 버튼 여백 */
    border-radius: 4px; /* 둥근 모서리 */
}

#bar div {
    height: 100%; /* 진행 바 높이를 부모와 동일하게 설정 */
    background-color: var(--bs-primary);
    color: white;
    text-align: center;
    line-height: 20px; /* 텍스트 세로 정렬 */
    white-space: nowrap; /* 내부 텍스트 한 줄로 유지 */
    overflow: hidden; /* 넘치는 텍스트 숨김 */
    text-overflow: ellipsis; /* 텍스트 말줄임표 */
}


.list-row {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

.card-content {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.card-body {
    display: flex;
    align-items: flex-start;
}
	
	p{
		margin-bottom: 0px;
	}
	#first{
		margin-top: 88px;
	}
	


#searchLayout{
	display: flex;
}
#title{
	margin-left: -30px;
	
}
#flexRadioDefault2{
		margin-left: 5px;
	}	

.texts{
transform:translate(3px, -25px);
margin-bottom: 5px;
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
					<h4 class="menu-title">프로젝트</h4>
					<ul>
						<li class="active"><a href="/project/List">프로젝트 리스트</a></li>
						<li><a href="/project/Write">프로젝트 등록</a></li>
					</ul>
					<div class="filter-container">
		        	<div class="card-content">
					<div class="card-body">
						<ul class="list-unstyled mb-0">
					    <li class="d-inline-block me-2 mb-1">
					        <div class="form-check">
					            <div class="checkbox">
					                <input type="checkbox" id="checkbox1" class="form-check-input"
					                    <c:if test="${param.includeInProgress == null || param.includeInProgress == 'true'}">checked</c:if>>
					                <label for="checkbox1">진행중</label>
					            </div>
					        </div>
					    </li>
					    <li class="d-inline-block me-2 mb-1">
					        <div class="form-check">
					            <div class="checkbox">
					                <input type="checkbox" id="checkbox2" class="form-check-input"
					                    <c:if test="${param.includeCompleted == null || param.includeCompleted == 'true'}">checked</c:if>>
					                <label for="checkbox2">완료</label>
					            </div>
					        </div>
					    </li>
					</ul>
			        </div>
					</div>
					 <div class="card-body">
					    <!-- 공개 라디오 버튼 -->
					    <div class="form-check">
					        <input class="form-check-input" type="radio" name="is_open" value="Y" id="flexRadioDefault1"
					            <c:if test="${param.is_open == null || param.is_open == 'true'}">checked</c:if>>
					        <label class="form-check-label" for="flexRadioDefault1">공개</label>
					    </div>
					
					    <!-- 비공개 라디오 버튼 -->
					    <div class="form-check">
					        <input class="form-check-input" type="radio" name="is_open" value="N" id="flexRadioDefault2"
					            <c:if test="${param.is_open == 'false'}">checked</c:if>>
					        <label class="form-check-label" for="flexRadioDefault2">비공개</label>
					    </div>
					</div>
						<ul id="title">
							<li class="active">제목</li>
						</ul>
						<div id="searchLayout">
					    <input   type="text" id="searchKeyword" name="search" class="form-control search" placeholder="검색내용을 입력하세요" value="${param.searchKeyword}" />
					</div>
			    </div>
				</section>
				<section class="cont">
					<div class="col-12 col-lg-12"></div> <!-- 여기 아래로 삭제!! div 영역 잘 확인하세요 (페이지 복사 o, 해당 페이지 수정 x) -->
						<div class="tit-area">
							<h5>프로젝트 리스트</h5>
						</div>
						<div class="cont-body"> 
                  <!-- 여기에 내용 작성 -->
                  
					                  
                  <div class="row list-row">
				    <c:forEach var="project" items="${list}">
				        <div class="list-form">
				                <!-- 프로젝트 이름 -->
				            <div class="content-text">
				                <h4 id="project_name" title="${project.name}" onclick="location.href='/project/KanBan/${project.project_idx}'">
								    ${project.name}
								</h4>
								<div class="texts">
				                <p id="first"><strong>참여인원:</strong>  ${project.count} 명</p>
				                <p><strong>일정:</strong>  ${project.start_date} ~ ${project.end_date}</p>
				                <c:if test="${not empty project.update_start_date and not empty project.update_end_date}">
								    <p><strong>수정된 일정:</strong>  ${project.update_start_date} ~ ${project.update_end_date}</p>
								</c:if>
				                <p><strong>진행률</strong> </p>
								<div id="bar">
								    <c:choose>
								        <c:when test="${project.percent > 0}">
								            <div style="width: ${project.percent}%;">
								                ${project.percent}%
								            </div>
								        </c:when>
								        <c:otherwise>
								            <div style="width: 10%; background-color: var(--bs-secondary); color: gray;">
								                0%
								            </div>
								        </c:otherwise>
								    </c:choose>
								</div>
				            </div>
				            </div>
				            <div class="update">
				                <c:if test="${project.username == loginId}">
				                     <!-- 쓰레기통 아이콘 -->
				        			<i class="bi bi-trash icon-trash" title="삭제" onclick="deleteProject(${project.project_idx})"></i>
				                    <button onclick="location.href='/project/Update/${project.project_idx}'" class="btn btn-sm btn-outline-primary" style="transform: translate(10px, -180px);">
				                        수정
				                    </button>
				                </c:if>
				            </div>
				            
				        </div>
				    </c:forEach>
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

<!-- Need: Apexcharts(차트) -->
<script src="/resources/assets/extensions/apexcharts/apexcharts.min.js"></script>
<script src="/resources/assets/static/js/pages/dashboard.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<script>

$(document).ready(function () {
    let currentPage = 1;
    let isFetching = false; // 중복 요청 방지 플래그

    // 무한스크롤 이벤트
    $(window).on("scroll", function () {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
            if (!isFetching) {
                isFetching = true;
                loadMoreProjects(); // 다음 페이지 데이터 로드
            }
        }
    });

    // 추가 데이터 로드 함수
    function loadMoreProjects() {
        currentPage++;
        $("#loadingSpinner").show();

        $.ajax({
            url: "/project/List/More",
            type: "GET",
            data: {
                page: currentPage,
                includeCompleted: $("#checkbox2").is(":checked"),
                includeInProgress: $("#checkbox1").is(":checked"),
                is_open: $("input[name='is_open']:checked").val() === 'Y',
                search: $("#searchKeyword").val()
            },
            success: function (data) {
                $("#loadingSpinner").hide();
                if (data.trim() === "") {
                    // 더 이상 로드할 데이터가 없을 때
                    $(window).off("scroll");
                } else {
                    $("#projectList").append(data); // 새로운 프로젝트 추가
                    isFetching = false;
                }
            },
            error: function () {
                $("#loadingSpinner").hide();
                alert("데이터를 가져오는 중 문제가 발생했습니다.");
            },
        });
    }
});



function deleteProject(projectIdx) {
    console.log("가지고 왔니" + projectIdx);

    // CSRF 토큰 및 헤더 가져오기
    const csrfToken = $("meta[name='_csrf']").attr("content");
    const csrfHeader = $("meta[name='_csrf_header']").attr("content");

    // 레이어 팝업 호출
    layerPopup(
        "정말로 이 프로젝트를 삭제하시겠습니까?", // 팝업 내용
        "삭제", // 확인 버튼 텍스트
        "취소", // 취소 버튼 텍스트
        function () {
            // 확인 버튼 클릭 시 실행할 함수
            $.ajax({
                url: "/project/Delete", // 프로젝트 삭제를 처리하는 서버 URL
                type: "DELETE", // HTTP 메서드
                data: JSON.stringify({ project_idx: projectIdx }), // 전송할 데이터 (JSON 형식)
                contentType: "application/json; charset=UTF-8", // 전송 데이터의 타입
                beforeSend: function (xhr) {
                    // CSRF 헤더 추가
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: function (response) {
                    // 서버로부터 성공 응답을 받았을 때
                    
                    location.reload(); // 페이지 새로고침
                },
                error: function (xhr, status, error) {
                    // 서버로부터 에러 응답을 받았을 때
                    alert("프로젝트 삭제 중 문제가 발생했습니다. 다시 시도해주세요.");
                    console.error("Error:", error);
                },
            });
        },
       btn2Act
    );
}



$(document).ready(function () {
    $("#searchKeyword").on("keypress", function (event) {
        if (event.keyCode === 13) {
            applyFilter();
        }
    });

    // 체크박스 변경 이벤트
    $("input[type='checkbox']").on("change", function () {
        const includeCompleted = $("#checkbox2").is(":checked");
        const includeInProgress = $("#checkbox1").is(":checked");

        if (!includeCompleted && !includeInProgress) {
            alert("진행중 또는 완료를 하나 이상 선택해야 합니다.");
            $("#checkbox1").prop("checked", true);
            $("#checkbox2").prop("checked", true);
            return;
        }

        applyFilter();
    });

    // 라디오 버튼 변경 이벤트
    $("input[name='is_open']").on("change", function () {
        applyFilter();
    });

    // 필터 적용 함수
    function applyFilter() {
        const includeCompleted = $("#checkbox2").is(":checked");
        const includeInProgress = $("#checkbox1").is(":checked");

        // boolean으로 변환
        const isOpen = $("input[name='is_open']:checked").val() === 'Y';

        const searchKeyword = $("#searchKeyword").val();

        const queryParams = new URLSearchParams({
            includeCompleted: includeCompleted,
            includeInProgress: includeInProgress,
            is_open: isOpen, // boolean 값 전달
            search: searchKeyword
        });

        window.location.href = "/project/List?" + queryParams.toString();
    }
});


	$('.btnModal').on('click', function() {
		$('#modal').show();
	});

	$('#modal .close').on('click', function() {
		$('#modal').hide();
	});
	
	/* 알림 팝업 */
	function btn1Act() {
		// 1번버튼 클릭시 수행할 내용
		console.log('1번 버튼 동작');

		// 팝업 연달아 필요할 경우 (secondBtn1Act:1번 버튼 클릭시 수행할 내용/ secondBtn2Act: 2번 버튼 클릭시 수행할 내용)
		removeAlert(); // 기존팝업닫기
		// 멘트, 버튼1, 버튼2, 버튼1 함수, 버튼2 함수
		layerPopup("결제방법", "결제하기", "취소", secondBtn1Act, secondBtn2Act);
	}
	
	function btn2Act() {
		// 2번버튼 클릭시 수행할 내용
		console.log('2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function secondBtn1Act() {
		// 두번째팝업 1번버튼 클릭시 수행할 내용
		console.log('두번째팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
		layerPopup("QR", "결제하기", "취소", thirdBtn1Act, thirdBtn2Act);
	}

	function secondBtn2Act() {
		// 두번째팝업 2번버튼 클릭시 수행할 내용
		console.log('두번째팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
		
	}
	
	function thirdBtn1Act(){
		console.log('세번째 팝업 1번 버튼 동작');
		removeAlert(); // 팝업닫기
	}
	
	function thirdBtn2Act(){
		console.log('세번째 팝업 2번 버튼 동작');
		removeAlert(); // 팝업닫기
	}


</script>

</html>