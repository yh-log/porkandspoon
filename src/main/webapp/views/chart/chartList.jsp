<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공통 레이아웃 CSS</title>
	<!-- 부트스트랩 -->
	<link rel="shortcut icon"
		href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
	<link rel="shortcut icon"
		href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
		type="image/png">
	<script src="/resources/assets/compiled/js/app.js"></script>
		
	
	<!-- select -->
	<link rel="stylesheet"
		href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">
	
	<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css">
	<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
	<link rel="stylesheet" href="/resources/css/common.css">
	
	
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	
	<!-- google chart -->
	<script src="https://www.gstatic.com/charts/loader.js"></script>
	
	<meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}"> 
</head>
<style>

	/* 차트 테이블 tr 선 제거 */
	#orgchart table tr {
		border: none;
	}
	
	/* 차트 테이블 선 제거 */
	#orgchart table {
		border: none;
	}
	
	#orgchart .google-visualization-orgchart-node {
	    background: var(--bs-primary) !important;
	    border: none !important;
	    box-shadow: none !important;
	}
	
	#orgchart .google-visualization-orgchart-node-selected {
	    background: none !important;
	    border: none !important;
	}
	
	.userNode {
		background: var(--bs-secondary);
		border: none !important;
	}
	
	#modal .modal-style {
		top: 150px;
	    border: none;
	    height: 640px;
	    width: 350px;
	}
	
	.one1 {
		width: 100px;
		height: 100px;
		border-radius: 50%;
		display: flex;
	    justify-content: center;
 	    align-items: center;
	    position: relative;
	    background-color: gray;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	}
	
	.one2 {
		width: 90px;
		height: 90px;
		border-radius: 50%;
		overflow: hidden; /* 이미지를 원 모양에 맞게 자르기 */
    	position: absolute;
	}
	
	.one2 img {
		width: 100%; /* 이미지가 내부 원 크기에 맞게 조정 */
	    height: 100%; /* 이미지가 내부 원 크기에 맞게 조정 */
	    object-fit: cover; /* 이미지 비율 유지하며 원 채우기 */
	}
	
	.tr-style th {
		width: 100px;
	}
	
	.table-sun {
		border: none;
	}
	
	.table-sun tr {
		border: none;
	}
	
	.td-style-style {
		height: 100px;
	}
</style>
<body>
	<!-- 부트스트랩 -->
	<script src="/resources/assets/static/js/initTheme.js"></script>
	<div id="app">
	   <jsp:include page="../sidebar.jsp" />
	   <div id="main">
	      <jsp:include page="../header.jsp" />
	      <div class="page-content">
	         <section id="menu">
	            <h4 class="menu-title">조직도</h4>
	         </section>
	         <section class="cont">
	            <div class="col-12 col-lg-12">
	               <div class="tit-area">
	                  <h5>조직도 리스트</h5>
	               </div>												
	               <div class="cont-body" id="clickToMove">
		               <div id="modal" class="modal">
							<div class="modal-cont modal-cont-chart modal-style">
								<span class="close">&times;</span>
								<div id="modal-body">
									<div class="col-12 col-lg-12">
										<div class="row">
											<div class="col-sm-3"></div>
											<div class="col-sm-6">
												<div class="card">
													<table class="table-sun">
														<tbody>
															<tr>
																<td>브랜드팀</td>
															</tr>
															<tr>
																<td class="td-style-style" style="text-align: -webkit-center;">
																	<div class="one1">
																		<div class="one2">
																			<img alt="강아지사진" src="">
																		</div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="col-sm-3"></div>
										</div>
									</div>
									<div class="card">
										<table>
											<tbody class="tr-style">
												<tr>
													<th>이름</th>
													<td></td>
												</tr>
												<tr>
													<th>직급</th>
													<td></td>
												</tr>
												<tr>
													<th>사번</th>
													<td></td>
												</tr>
												<tr>
													<th>생년월일</th>
													<td></td>
												</tr>
												<tr>
													<th>번호</th>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div id="modal" class="modal modal-dept">
							<div class="modal-cont modal-cont-chart modal-style">
								<span class="close">&times;</span>
								<div id="modal-body2">
									<div class="col-12 col-lg-12">
										<div class="row">
											<div class="col-sm-3"></div>
											<div class="col-sm-6">
												<div class="card">
													<table class="table-sun">
														<tbody>
															<tr>
																<td class="department-name"></td>
															</tr>
															<tr>
																<td class="td-style-style" style="text-align: -webkit-center;">
																	<div class="one1">
																		<div class="one2">
																			
																		</div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
											<div class="col-sm-3"></div>
										</div>
									</div>
									<div class="card">
										<table>
											<tbody class="tr-style2">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
	             		<div id="orgchart" style="width: 100%; height: 600px;"></div>
	               </div>
	            </div>
	         </section>   
	      </div>
	   </div>
	</div>
</body>

<script>


	google.charts.load('current', { packages: ['orgchart'] });
	google.charts.setOnLoadCallback(initChart);
	
	function initChart() {
	    $(document).ready(function () {

	        const url = '/getOrgchart';
	        getAjax(url, 'json'); // 데이터를 AJAX로 가져오기
	    });
	}
	
	function getSuccess(response) {
	    console.log("서버 응답 데이터:", response);
	    drawChart(response); // 데이터를 받아 Google Chart에 전달
	}
	
	function drawChart(data) {
	    const chartData = new google.visualization.DataTable();
	    console.log(data);
	    chartData.addColumn('string', 'Name');     // 노드 이름
	    chartData.addColumn('string', 'Manager');  // 부모 노드

	    const departmentEmployees = {}; // 부서별 사원 데이터 저장

	    // 데이터 추가
	    data.forEach(item => {
	        const id = item.id;
	        const parent = item.parent;
	        const text = item.text || "기본 텍스트";
	        const menuOrder = item.menuOrder || ""; // 직급을 나타내는 menuOrder
	        let position = "";

	        if (item.type === 'file') {
	            // 부서에 해당하는 사원 데이터를 저장
	            if (!departmentEmployees[parent]) {
	                departmentEmployees[parent] = [];
	            }

	            // menuOrder 값에 따라 직급 부여
	            switch (menuOrder.toString()) {
	                case "po0":
	                    position = "대표";
	                    break;
	                case "po1":
	                    position = "부장";
	                    break;
	                case "po2":
	                    position = "차장";
	                    break;
	                case "po3":
	                    position = "과장";
	                    break;
	                case "po4":
	                    position = "대리";
	                    break;
	                case "po5":
	                    position = "주임";
	                    break;
	                case "po6":
	                    position = "사원";
	                    break;
	                case "po7":
	                    position = "직영점주";
	                    break;
	                default:
	                    position = "기타";
	            }

	         // 부서별로 사원 데이터를 저장
	            if (!departmentEmployees[parent]) {
	                departmentEmployees[parent] = [];
	            }
	            departmentEmployees[parent].push({
	                id: id,
	                text: text,
	                position: position,
	                menuOrder: parseInt(menuOrder.replace('po', ''), 10), // 숫자로 변환
	                parent: parent
	            });
	        } else {
	            // 부서 데이터 추가
	            chartData.addRow([
	                { v: id, f: '<div onclick="deptIdData(\'' + id + '\', \'' + parent + '\')" style="padding: 5px; text-align: center;">' + text + '</div>' },
	                parent
	            ]);
	        }
	    });

	    // 각 부서에 사원 노드 추가
	    for (const deptId in departmentEmployees) {
	        const employees = departmentEmployees[deptId];

	        // 직급 순서로 정렬
	        employees.sort((a, b) => a.menuOrder - b.menuOrder);

	        let previousEmployeeId = deptId; // 부서가 첫 번째 사원의 부모

	        // 사원을 계층적으로 추가
	        employees.forEach(employee => {
	            chartData.addRow([
	                { v: employee.id, f: '<div class="userNode" style="padding: 5px; text-align: center;" onclick="userIdData(\'' + employee.id + '\')">' + employee.position + ' ' + employee.text + '</div>' },
	                previousEmployeeId // 바로 이전 사원이 부모
	            ]);
	            previousEmployeeId = employee.id; // 현재 사원을 다음 사원의 부모로 설정
	        });
	    }

	    // 조직도 렌더링
	    const chart = new google.visualization.OrgChart(document.getElementById('orgchart'));
	    chart.draw(chartData, { allowHtml: true });
	}
	
	// 일단 브랜드팀 부서코드 임의로 지저
	const brandDeptId = "5";
	
	// 부서 데이터 가져오기
	function deptIdData(departmentId, parent) {
	    console.log('클릭한 부서 코드: ' + departmentId);
		console.log('비교할 부서 코드: ', parent);
	    // 브랜드팀의 하위 부서만 데이터 가져오기
	    if (parent === brandDeptId) {
		    getDeptdata(departmentId);
	    }
	}
	
	function getDeptdata(departmentId) {
	    const params = { departmentId: departmentId };
		console.log('파람 확인', params);
	    // AJAX로 부서 정보 요청
		$.ajax({
	        type: 'GET',
	        url: '/getDeptdata',
	        data: params,
	        dataType: 'JSON',
	        success: function(response) {
	            depthttpSuccess(response); // 부서 데이터를 처리하는 콜백
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	}
	
	function depthttpSuccess(response) {
	    console.log("서버 응답 데이터:", response);
	    const modalBody = document.getElementById('modal-body2');
	    const firstItem = response[0];
	    const departmentName = firstItem.name || '없음';
	    const imageFileName = firstItem.new_filename || 'resources/img/person.png';

	    // 부서명 삽입
	    const nameTd = modalBody.querySelector('.table-sun td');
	    if (!nameTd.innerText) {
	        nameTd.innerText = departmentName;
	    }

	    // 이미지 삽입
	    const profileImageDiv = modalBody.querySelector('.one2');
	    if (!profileImageDiv.querySelector('img')) {
	        profileImageDiv.innerHTML = 
	            '<img src="/photo/' + imageFileName + '">';
	    }

	    // 3. 직영점 데이터 출력
	    const tbody = modalBody.querySelector('.tr-style2');
	    tbody.innerHTML = ''; // 기존의 내용 지우기

	    // 직영점 데이터가 있다면 테이블 행 추가
	    if (response.length > 0) {
	        response.forEach(store => {
	            const tr = document.createElement('tr');

	            const td1 = document.createElement('td');
	            td1.innerText = store.name || '직영점 이름 없음'; // 직영점 이름
	            tr.appendChild(td1);

	            const td2 = document.createElement('td');
	            td2.innerText = store.code_name || '구분 코드 없음'; // 구분 코드
	            tr.appendChild(td2);

	            tbody.appendChild(tr);
	        });
	    } else {
	        const tr = document.createElement('tr');
	        const td = document.createElement('td');
	        td.colSpan = 2; // 여러 칸을 합친 셀로 처리
	        td.innerText = '직영점 정보가 없습니다.';
	        tr.appendChild(td);
	        tbody.appendChild(tr);
	    }

	    // 모달 표시
	    const modal = document.querySelector('.modal-dept');
	    modal.style.display = 'block';
	}
	
	// 사원 데이터 가져오기
	function userIdData(data) {
		console.log('클릭한 유저 ID', data);
        var params = {username: data};
		console.log(params);
        
        httpAjax('GET', '/getUserdata', params);
	}

	function httpSuccess(response) {
	    console.log("서버 응답 데이터:", response);
	    const modalBody = document.getElementById('modal-body');
	    
	    // 응답 데이터 확인
	    document.querySelector('#modal .table-sun td').innerText = response.text || "없음"; // 브랜드명 = 부서명
	    const tableRows = document.querySelectorAll('#modal .tr-style tr');

	    // 각 데이터가 null, undefined 또는 빈 문자열이면 "없음"으로 표시
	    tableRows[0].querySelector('td').innerText = response.name || "없음";       // 이름
	    tableRows[1].querySelector('td').innerText = response.position || "없음";   // 직급
	    tableRows[2].querySelector('td').innerText = response.person_num || "없음"; // 사번
	    tableRows[3].querySelector('td').innerText = response.birth || "없음";        // 나이
	    tableRows[4].querySelector('td').innerText = response.phone || "없음";      // 번호
	    const profileImageDiv = document.querySelector('.one2');
	    profileImageDiv.innerHTML = 
	        '<img src="' + (response.new_filename ? '/photo/' + response.new_filename : '/resources/img/person.png') + 
	        '">';
	    
	    // 모달 표시
	    const modal = document.getElementById('modal');
	    modal.style.display = 'block';
	}
	
	
	

	$('#modal .close').on('click', function() {
	    $('#modal').hide();
	});

	$('.modal-dept .close').on('click', function() {
	    $('.modal-dept').hide();
	});
</script>

</html>