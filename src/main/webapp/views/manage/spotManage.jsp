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
<link rel="shortcut icon" href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon" href="https://example.com/favicon.png" type="image/png">

<link rel="stylesheet" href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">

	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

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
        height: 50px; /* 버튼의 높이 */
        font-size: 18px; /* 버튼 텍스트 크기 */
        text-align: center; /* 텍스트 중앙 정렬 */
        padding: 5px; /* 내부 여백 */
    }

	.modal-close {
		cursor: pointer;
	  }

	#chartDiv{
		justify-content: center;
		display: flex;
		width: 100%;
		align-items: center;
		margin-top: 5px;
		gap: 10px;
		position: relative; /*select 만 왼쪽으로 배치하기 위해 추가*/
	}

	#chartDiv select{
		width: auto;
		position: absolute;
		right: 0px;
		top: 15px;
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
			      <h6 id="partlist"><a href="/us/part">아르바이트 리스트 더보러가기</a></h6>
			    </div>
			  </div>
			  
				<div id="salesModalBox" class="modal" style="display: none;">
					    <div class="modal-content">
					        <div class="modal-header">
					             <span class="modal-close" id="closeSalesModal" >&times;</span>
					        </div>
					        <div class="modal-body">
					                <table class="modal-table">
					                    <tr>
					                        <th>지점명</th>
					                        <td style="float: left;">${info.spotName}</td>
					                    </tr>
					                    <tr>
					                        <th>등록일</th>
					                        <td><input type="date" id="Create_Date" name="create_date"  class="form-control" onchange="findSealesDate()"/></td>
					                    </tr>
					                    <tr>
					                        <th>일 매출</th>
					                        <td><input type="text" id="Sales" name="sales" class="form-control" data-required="true"/></td>
					                    </tr>
					                   
					                </table>

					           
					        </div>
					        <div class="modal-footer">
					            <button type="button" id="saveEditMenu" class="btn btn-primary">등록</button>
					            <button type="button" id="cancelEditModal" class="btn btn-outline-secondary">취소</button>
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
						<div id="chartDiv">
							<h4>${info.spotName} 총 매출</h4>
							<select class="form-control" id="monthChartDate" onchange="chartDataImport()">

							</select>
						</div>
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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src='/resources/js/common.js'></script>

<script>

	$(document).ready(function () {


		// 년도 추가 (2020년부터 현재년도까지)
		const currentYear = new Date().getFullYear();
		const yearSelect = document.getElementById("monthChartDate");
		for (let year = 2020; year <= currentYear; year++) {
			let option = document.createElement("option");
			option.value = year;
			option.textContent = year;
			// 현재 연도를 기본 선택
			if (year === currentYear) {
				option.selected = true; // 현재 연도에 selected 속성 추가
			}
			yearSelect.appendChild(option);
		}

		chartDataImport();
	});


	// 매출 등록 모달 열기
	$('.btn-primary').on('click', function () {
		//setTodayDate(); // 등록일 필드에 오늘 날짜 설정
		$('#salesModalBox').fadeIn(); // 모달 열기
	});

	// 매출 등록 모달 닫기
	$('#closeSalesModal, #cancelEditModal').on('click', function () {
		$('#salesModalBox').fadeOut(); // 모달 닫기
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

	// function setTodayDateIfEmpty() {
	// 	const currentVal = $('#Create_Date').val();
	// 	if (!currentVal) {
	// 		// 날짜 필드가 비어있을 때만 오늘 날짜로 설정
	// 		const today = new Date();
	// 		// 년, 월, 일 구해서 yyyy-MM-dd 포맷
	// 		const year = today.getFullYear();
	// 		const month = String(today.getMonth() + 1).padStart(2, '0');
	// 		const day = String(today.getDate()).padStart(2, '0');
	// 		$('#Create_Date').val(year + '-' + month + '-' + day);
	// 	}
	// }


	let message = '매출을 등록하시겠습니까?';
	let type = 'N';

	function findSealesDate(){
		let storieId = '${info.id}';
		let create_date = $('input[name="create_date"]').val();

		let storeData = {'id' : storieId, 'create_date' : create_date};
		getAjax('/us/pastSeales', 'JSON', storeData)
	}

	function getSuccess(response){
		console.log(response);
		if(response.status === 200){
			let findSeales = response.sale;
			console.log(findSeales);
			$('input[name="sales"]').val(response.sale);


			message = '매출을 수정하시겠습니까?';
			type = 'U';
		}else{
			setTodayDate();
			message = '매출을 등록하시겠습니까?';
			type = 'N';
		}
	}



	$('#saveEditMenu').on('click', function(){

		let isFormValid = validateForm();

		console.log(isFormValid);
		console.log($('input[name="sales"]').val());

		if(!isFormValid){
			console.log('잘못된 값');
			layerPopup('필수값을 입력해주세요', '확인', false, removeAlert, removeAlert);
		}else{
			layerPopup(message, '확인', '취소', salseWrite, removeAlert);
			//$('#salesModalBox').hide();
		}
	});

	function salseWrite(){
		const id = '${info.id}';
		const create_date = $('input[name="create_date"]').val();
		const sale = $('input[name="sales"]').val();
		const username = '${info.username}';

		const storeDTO = {'id' : id, 'create_date' : create_date, 'sale' : sale, 'username' : username, 'text' : type};

		httpAjax('POST', '/us/salesWrite', storeDTO);
	}

	function httpSuccess(response){
		removeAlert();
		console.log(response);
		if (response.status){
			layerPopup(response.message, '확인', false, removeAlert, removeAlert);
			$('#salesModalBox').hide();
		}
	}

	// 직영점 차트 데이터 가져오기
	function chartDataImport(){
		const id = '${info.id}';
		const yearSelect = document.getElementById("monthChartDate");
		const year = yearSelect.value;
		console.log('직영점 차트 데이터 가져오기 실행', id);

		$.ajax({
			type: 'GET',
			url: '/chart/store/statistics',
			data: {'id':id, 'year': year},
			dataType: 'JSON',
			success: function (response){
				console.log(response);
				printChartMonth(response);
			}, error: function(e){
				console.log('차트 에러 => ', e);
			}
		})
	}
	// 값 저장을 위해 전역변수로 선언
	let pieChart, barChart;

	function printChartMonth(response) {


		// 요일과 매핑할 labels
		const labels = ['일', '월', '화', '수', '목', '금', '토'];
		const data = [0, 0, 0, 0, 0, 0, 0]; // 초기값을 0으로 설정

		// response 데이터를 순회하며 weekSum이 있는 경우만 데이터 추가
		response.forEach(item => {
			if (item.weekSum && item.week >= 1 && item.week <= 7) {
				// 요일에 따라 데이터를 추가 (dayOfWeek가 1~7로 설정됨)
				data[item.week - 1] = item.weekSum; // dayOfWeek가 1~7이므로 -1로 배열 인덱스 보정
			}
		});


		// 기존 데이터 있으면 파괴
		if (pieChart) {
			pieChart.destroy();
		}

		//원형 차트
		const pieCtx = document.getElementById('pieChart').getContext('2d');
		pieChart = new Chart(pieCtx, {
			type: 'pie',
			data: {
				labels: labels,
				datasets: [{
					data: data, // (여기에 받아온 데이터 가공해서 넣기)
					backgroundColor: ['#ff6384', '#36a2eb', '#ffcd56', '#4bc0c0', '#9966ff', '#ff9f40', '#5CD1E5'],
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


		const labelsMon = [];
		const dataMon = new Array(12).fill(0); // [0,0,0,0,0,0,0,0,0,0,0,0]

		// 1~12월 설정
		for (let i = 0; i < 12; i++) {
			labelsMon[i] = (i + 1) + '월';
		}

		// response 데이터를 순회하며 monthSum과 month가 유효한 경우에만 데이터 추가
		response.forEach(item => {
			// month가 1~12 사이인지 체크
			if (item.monthSum && item.month >= 1 && item.month <= 12) {
				// 예: month가 1이면 dataMon[0]에 값 세팅
				dataMon[item.month - 1] = item.monthSum;
			}
		});

		if (barChart) {
			barChart.destroy();
		}

		// 막대 그래프
		const barCtx = document.getElementById('barChart').getContext('2d');
		barChart = new Chart(barCtx, {
			type: 'bar',
			data: {
				labels: labelsMon,
				datasets: [{
					label: '월별 매출',
					data: dataMon, // 데이터를 억 단위로 조정
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
							callback: function (value) {
								const unit = value / 1000;
								return unit.toFixed(1) + '천'; // y축 값을 억 단위로 표시
							}
						}
					}
				}
			}
		});
	}


</script>

</html>