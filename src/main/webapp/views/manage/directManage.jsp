<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>직영점 관리</title>
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

<!-- rating.js(별점) -->
<link rel="stylesheet"
	href="/resources/assets/extensions/rater-js/lib/style.css">

<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style >
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
	

	/* 공통 스타일 */
	h3, h4 {
	  margin-bottom: 10px;
	  font-weight: bold;
	}

.logo-container {
    display: flex;
    flex-direction: column;
    align-items: center; /* 가로 중앙 정렬 */
    justify-content: center; /* 세로 중앙 정렬 */
    gap: 10px; /* 이미지와 텍스트 간격 */
  }

  .logo-container img {
    max-width: 120px;
    height: auto;
  }

  .logo-container p {
    margin: 0;
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
			    <div class="logo-container">
				    <c:choose>
		                <c:when test="${not empty info.filedto and not empty info.filedto.new_filename}">
		                    <img src=" /photo/${info.filedto.new_filename}" alt="상품 이미지">  
		                </c:when>
		                <c:otherwise>
		                    <img src="/resources/img/default.jpg" alt="기본 이미지">
		                </c:otherwise>
		            </c:choose>
			      <h3>${info.text} 정보</h3>
			      <p>${info.text}팀 팀장:${info.name} </p>
			      <p>주소: 서울 강남구 강남대로 27 1층</p>
			    </div>
			    
			    </div>
			    
			    <div class="top-right">
			      <h4>직영점 리스트</h4>
			      <table class="info-table">
			      <colgroup>
						<col>
						<col >
						<col width="40%">
						<col>
					</colgroup>
			        <thead>
			          <tr>
			            <th>직영점이름</th>
			            <th>담당자</th>
			            <th>주소</th>
			            <th>오픈일</th>
			          </tr>
			        </thead>
			        <tbody>
			          <c:forEach var="direct" items="${list}">
			            <tr>
			                <td>${direct.spotName}</td>
			                <td>${direct.name}</td>
			                <td>${direct.address}</td>
			                <td>${direct.create_date}</td>
			            </tr>
			        	</c:forEach>
			        </tbody>
			      </table>
			      <h6 id="partlist"><a href="/ma/dept/listView">직영점 리스트 더보러가기</a></h6>
			    </div>
			  </div>
			
			  <!-- 하단 영역 -->
			  <!-- 하단 영역 -->
			  <div class="bottom-section">
				  <div class="bottom-left">
					  <h4>직영점별 매출</h4>
					  <canvas id="pieChart"></canvas>
				  </div>
				  <div class="bottom-right">
					  <div id="chartDiv">
						  <h4>직영점 총 매출</h4>
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

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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

	// 차트 데이터 가져오기
	function chartDataImport(){
		const id = '${info.id}';
		const yearSelect = document.getElementById("monthChartDate");
		const year = yearSelect.value;
		console.log('직영점 차트 데이터 가져오기 실행', id);

		$.ajax({
			type: 'GET',
			url: '/chart/direct/statistics',
			data: {'id':id, 'year': year, 'type' : 'S'},
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

		console.log(response);


		const labels = [];
		const data = []; // 초기값을 0으로 설정
		const color = [];

		let i = 0;
		response.forEach(item => {
			if (item.brand !== null && item.brand !== '') {
				labels[i] = item.brand;
				data[i] = item.brandSum;
				color[i] = getRandomColor();
				i++;
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
					backgroundColor: color,
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

	// 색상 랜덤 생성
	function getRandomColor() {
		let letters = "0123456789ABCDEF";
		let color = "#";
		for (let i = 0; i < 6; i++) {
			color += letters[Math.floor(Math.random() * 16)];
		}
		return color;
	}


</script>

</html>