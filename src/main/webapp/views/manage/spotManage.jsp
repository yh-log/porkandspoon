<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매장관리</title>
<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- 파일 업로더 -->
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond/filepond.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.css">
<link rel="stylesheet"
	href="/resources/assets/extensions/toastify-js/src/toastify.css">



<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >

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
    height: 450px;
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
	.page-content {
  padding: 20px;
  background-color: #f9f9f9;
  max-width: 1800px; /* 중앙 정렬을 위한 최대 너비 설정 */
  
  margin: 0 auto; /* 페이지 가운데 정렬 */
  display: flex;
  flex-direction: column;
  gap: 20px;
}

/* 상단 영역 (전체 컨테이너) */
	.top-section {
	  display: flex;
	  gap: 20px;
	  align-items: stretch; /* 자식 요소의 높이를 동일하게 맞춤 */
	  min-height: 300px; /* 최소 높이 설정 */
	}
	
	/* 왼쪽 박스 */
	.top-left {
	  flex: 2; /* 비율로 크기 조정 */
	  background-color: #ffffff;
	  text-align: center;
	  padding: 20px;
	  border-radius: 10px;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	  display: flex;
	  flex-direction: column;
	  justify-content: center; /* 내용 가운데 정렬 */
	}
	
	/* 오른쪽 박스 (리스트 포함) */
	.top-right {
	  flex: 3; /* 비율로 크기 조정 */
	  background-color: #ffffff;
	  padding: 20px;
	  border-radius: 10px;
	  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	  overflow: auto; /* 내용이 많아지면 스크롤 활성화 */
	  max-height: 500px; /* 최대 높이 제한 (스크롤 활성화) */
	}

	#partlist {
  	text-align: center; /* 텍스트 중앙 정렬 */
  	margin-top: 10px; /* 위아래 간격 추가 */
	}
	
	#partlist a {
	  text-decoration: none; /* 링크 밑줄 제거 */
	  color: #007bff; /* 원하는 텍스트 색상 지정 */
	  font-weight: bold; /* 텍스트 굵게 */
	}
	
	#partlist a:hover {
	  color: #0056b3; /* 링크에 마우스를 올렸을 때 색상 변경 */
	  text-decoration: underline; /* 마우스를 올렸을 때 밑줄 표시 */
	}
	

/* 하단 영역 */
.bottom-section {
  display: flex;
  gap: 20px;
  height: auto; /* 고정 높이 제거 */
}

/* 하단 왼쪽 */
.bottom-left {
  flex: 1;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center; /* 그래프 가운데 정렬 */
  justify-content: center;
}

/* 하단 오른쪽 */
.bottom-right {
  flex: 3.5;
  background-color: #ffffff;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  overflow: hidden; /* 영역을 넘어가지 않도록 설정 */
  max-height: 500px; /* 최대 높이 제한 */
}

.chart-placeholder {
  width: 100%;
  height: 100%; /* 자동 크기 조정 */
  background-color: #f0f0f0;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 5px;
  color: #aaa;
}

#pieChart {
  height: 400px; /* 세로 길이를 늘림 */
}

#barChart {
  width: 100%; /* 부모 컨테이너에 맞게 너비를 설정 */
  height: auto; /* 높이를 자동 조정 */
}

/* 공통 스타일 */
h3, h4 {
  margin-bottom: 10px;
  font-weight: bold;
}

   /* 버튼 컨테이너 설정 */
    .button-container {
        display: flex;
        justify-content: center; /* 버튼을 중앙에 정렬 */
        gap: 10px; /* 버튼 사이의 간격 */
        margin-top: 20px; /* 위쪽과의 간격 */
    }

    /* 버튼 스타일 */
    #registerButton,
    #restButton {
        width: 200px; /* 버튼의 너비 */
        height: 100px; /* 버튼의 높이 */
        font-size: 18px; /* 버튼 텍스트 크기 */
        text-align: center; /* 텍스트 중앙 정렬 */
        padding: 5px; /* 내부 여백 */
    }

.modal-close {
    cursor: pointer;
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
			  <!-- 상단 영역 -->
			  <div class="top-section">
			    <div class="top-left">
			      <h3>${info.spotName} 정보</h3>
			      <p>직영점주: ${info.name}</p>
			      <p>주소: ${info.address} ${info.address_detail}</p>
			      <div class="button-container">
			        <button class="btn btn-primary" id="registerButton">매출 등록하기</button>
			        <button class="btn btn-outline-primary" id="restButton" onclick="location.href='/us/rest/listView'">휴점 신청</button>
			     </div>
			    </div>
			    
			    <div class="top-right">
			      <h4>아르바이트 리스트</h4>
			      <table class="info-table">
			        <thead>
			          <tr>
			            <th>이름</th>
			            <th>나이</th>
			            <th>직영점명</th>
			            <th>입사일</th>
			          </tr>
			        </thead>
			        <tbody>
			          <c:forEach var="part" items="${list}">
			            <tr>
			                <td>${part.name}</td>
			                <td>${part.birth}</td>
			                <td>${part.spotName}</td>
			                <td>${part.join_date}</td>
			            </tr>
			        </c:forEach>
			        </tbody>
			      </table>
			      <h6 id="partlist"><a href="/ad/part">아르바이트 리스트 더보러가기</a></h6>
			    </div>
			  </div>
			  
				<div id="salesModalBox" class="modal" style="display: none;">
					    <div class="modal-content">
					        <div class="modal-header">
					            <h5 class="title">스케줄 수정</h5>
					             <span class="modal-close" id="closeSalesModal" >&times;</span>
					        </div>
					        <div class="modal-body">
					        
					            
					                <table class="modal-table">
					                    <tr>
					                        <th>등록일</th>
					                        <td><input type="date" id="Create_Date" name="create_date"  class="form-control" /></td>
					                    </tr>
					                    <tr>
					                        <th>지점명</th>		
					                        <td>${info.spotName}</td>
					                    </tr>
					                    <tr>
					                        <th>일 매출</th>
					                        <td><input type="text" id="Sales" name="sales" class="form-control" /></td>
					                    </tr>
					                   
					                </table>
					           
					        </div>
					        <div class="modal-footer">
					            <button type="button" id="saveEditMenu" class="btn btn-primary">등록</button>
					            <button type="button" id="deleteEditMenu" class="btn btn-danger" hidden="">수정</button>
					            <button type="button" id="cancelEditModal" class="btn btn-secondary">삭제</button>
					        </div>
					    </div>
					</div>
					
					
			  <!-- 하단 영역 -->
			  <div class="bottom-section">
			    <div class="bottom-left">
			      <h4>요일별 매출</h4>
			      <canvas id="pieChart"></canvas>
			    </div>
			    <div class="bottom-right">
			      <h4>금천점 총 매출 그래프</h4>
			      <canvas id="barChart"></canvas>
			    </div>
			  </div>
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

<!-- 파일업로더 -->
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-size/filepond-plugin-file-validate-size.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-file-validate-type/filepond-plugin-file-validate-type.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-crop/filepond-plugin-image-crop.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-exif-orientation/filepond-plugin-image-exif-orientation.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-filter/filepond-plugin-image-filter.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-preview/filepond-plugin-image-preview.min.js"></script>
<script
	src="/resources/assets/extensions/filepond-plugin-image-resize/filepond-plugin-image-resize.min.js"></script>
<script src="/resources/assets/extensions/filepond/filepond.js"></script>
<script src="/resources/assets/static/js/pages/filepond.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>



<script>

$(document).ready(function () {
    // 매출 등록 모달 열기
    $('.btn-primary').on('click', function () {
        setTodayDate(); // 등록일 필드에 오늘 날짜 설정
        $('#salesModalBox').fadeIn(); // 모달 열기
    });

    // 매출 등록 모달 닫기
    $('#closeSalesModal, #cancelEditModal').on('click', function () {
        $('#salesModalBox').fadeOut(); // 모달 닫기
    });

    // 등록 버튼 클릭 시 Ajax 요청
    $('#saveEditMenu').on('click', function () {
        // 입력된 값 가져오기
        const salesData = {
            create_date: $('#Create_Date').val(), // 등록일
            spot_name: '${info.spotName}', // 지점명 (템플릿에서 가져옴)
            sales: $('#Sales').val(), // 일 매출
        };

        // 데이터 검증 (예: 필수 값 체크)
        if (!salesData.create_date || !salesData.sales) {
            alert('모든 필드를 입력해 주세요.');
            return;
        }

        console.log('전송 데이터:', salesData); // 디버깅용 로그

        // Ajax 요청
        $.ajax({
            url: '/ad/sales/Write', // 서버로 전송할 URL
            method: 'POST',
            contentType: 'application/json', // JSON 형식으로 전송
            data: JSON.stringify(salesData),
            beforeSend: function (xhr) {
                // CSRF 토큰 설정 (Spring Security 사용 시 필요)
                xhr.setRequestHeader($('meta[name="_csrf_header"]').attr('content'), $('meta[name="_csrf"]').attr('content'));
            },
            success: function (response) {
                console.log('등록 성공:', response); // 서버 응답 확인
                alert('매출 등록이 성공적으로 완료되었습니다.');
                $('#salesModalBox').fadeOut(); // 모달 닫기
                location.reload(); // 페이지 새로고침 (필요 시)
            },
            error: function (error) {
                console.error('등록 실패:', error); // 에러 확인
                alert('매출 등록에 실패했습니다. 다시 시도해 주세요.');
            }
        });
    });

    // 오늘 날짜를 등록일 필드에 설정하는 함수
    function setTodayDate() {
        const today = new Date(); // 오늘 날짜 객체 생성
        const year = today.getFullYear(); // 연도 추출
        const month = String(today.getMonth() + 1).padStart(2, '0'); // 월 추출 및 두 자리로 변환
        const day = String(today.getDate()).padStart(2, '0'); // 일 추출 및 두 자리로 변환
        const todayString = year + '-' + month + '-' + day; // 문자열 더하기로 날짜 형식 생성
        $('#Create_Date').val(todayString); // 등록일 필드에 설정
    }

});

//원형 차트
const pieCtx = document.getElementById('pieChart').getContext('2d');
const pieChart = new Chart(pieCtx, {
    type: 'pie',
    data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
            data: [15, 20, 25, 10, 15, 10, 5], // 임의 데이터
            backgroundColor: ['#ff6384', '#36a2eb', '#ffcd56', '#4bc0c0', '#9966ff', '#ff9f40', '#c9cbcf'],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom', // 범례를 아래로 배치
            },
        }
    }
});

// 막대 그래프
const barCtx = document.getElementById('barChart').getContext('2d');
const barChart = new Chart(barCtx, {
    type: 'bar',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '월별 매출',
            data: [1.5, 1.8, 1.3, 1.4, 2.0, 2.2, 2.1, 1.9, 1.7, 2.3, 2.5, 2.4], // 데이터를 억 단위로 조정
            backgroundColor: '#36a2eb',
            borderColor: '#36a2eb',
            borderWidth: 1,
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false, // 그래프 비율 유지 해제
        plugins: {
            legend: {
                display: true,
                position: 'top'
            },
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: function(value) {
                        return value.toFixed(1) + '억'; // y축 값을 억 단위로 표시
                    }
                }
            }
        }
    }
});


</script>

</html>