<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>교육 리스트</title>

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


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<style>
	#searchLayout{
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
   		justify-content: end; /* 가로 중앙 정렬 */
    	gap: 10px; /* 요소 간 간격 */
	}
	
	.selectStyle{
		width: 120px;
	}
	.form-control{
		width: 350px;
	}
	
	#filterLayout{
		display: flex;
	    align-items: end;
	    gap: 20px;
	    margin-bottom: 10px;
	}
	.btn-trip{
		display: flex;
    	justify-content: flex-end;
    	transform: translateY(-77px);
	}
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
	    width: 700px;
	    height: 800px;
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
	.modal-footer{
		display: flex;
		justify-content: center;
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
	.sun{
        border: 2px solid #E5D471;
        width: 100%;
        height: 620px;
        box-sizing: border-box;
        padding: 7px;
    }
    .sun1{
        background-image: url("data:image/svg+xml,%3csvg width='100%25' height='100%25' xmlns='http://www.w3.org/2000/svg'%3e%3crect width='100%25' height='100%25' fill='none' stroke='%23E5D471' stroke-width='4' stroke-dasharray='6%2c 12%2c 18%2c 24' stroke-dashoffset='0' stroke-linecap='square'/%3e%3c/svg%3e");
        width: 100%;
        height: 100%;
    }
    .print-div {
	  display: none;
	}

	@media print {
	  .print-div {
	    display: block;
	  }
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
					<h4 class="menu-title">교육 수강 리스트</h4>
					<ul>
						<li id="firstMenu" class="active"  ><a href="#">전체 보기</a></li>
						<li id="secondMenu" ><a href="#">수강 할 목록</a></li>
						<li id="thirdMenu"><a href="#">수강 한 목록</a></li>
					</ul>
				</section>
				<!-- 콘텐츠 영역 -->
				<section class="cont">
					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5 id="subMenuSubject"></h5>
						</div>
						<div class="cont-body"> 							
							<div class="col-12 col-lg-12">
								<table>
									<thead>
										<tr>
											<th>브랜드</th>
											<th>교육 분류</th>
											<th>제목</th>
											<th>이수 시간</th>
											<th>수강 상태</th>
											<th>이수증</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody id="list">
										
									</tbody>
								</table>
							</div>
							<nav aria-label="Page navigation" style="margin-top: 35px;">
								<ul class="pagination justify-content-center" id="pagination"></ul>
							</nav>
							
							<div id="modalBox" class="modal" style="display: none;">
					   			<div class="modal-content"></div>
							</div>			
						</div> <!-- cont-body -->
					</div>
				</section>	
			</div>
		</div>
	</div>
</body>






<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>


<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/menu.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	var show = 1;
	var paginationInitialized = false;
	var totalCount = 0;
    var pageSize = 15;  // 한 페이지당 게시글 수  //check!!! cnt를 얘로??
    var totalPage = 0;
    
	pageCall(show);
	
	function pageCall(page) {
		
		$.ajax({
			type:'GET',
			url:'/eEducationList',
			data:{
				'page':page,
				'cnt':15,
			},
			datatype:'JSON',
			success:function(data){
				console.log(data);
				drawList(data.list);

				if(data.list.length > 0){
					totalCount = data.list[0].total_count;  // 총 게시글 수
		            totalPage = Math.ceil(totalCount / pageSize);  // 총 페이지 수 계산
				}
				console.log("totalCount",totalCount,"totalPage",totalPage);
	            
	            
				 /* 페이지네이션 */       
				 if(!paginationInitialized){
						$('#pagination').twbsPagination('destroy');
						$('#pagination').twbsPagination({
							startPage:1, 
			           		totalPages: totalPage, 
			           		visiblePages:10,
			           		onPageClick:function(evt,page){
			           			console.log('evt',evt); 
			           			console.log('page',page); 
			           			pageCall(page);
			           		}
						});
						paginationInitialized = true;
		            }
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	var id;
	var no;
	function drawList(list) {
		
		var content ='';
		var createDate = '';
		if(totalCount == 0){
			content +='<tr><td colspan="8">조회된 데이터가 없습니다.</td></tr>';
			$('#list').html(content);
			return false;
		}
		
		for (var view of list) {
			// onclick="loadModal(\'edu\',\'Info\')"			
			id = view.id;
			no = view.no;
			console.log('부서,넘버 : ',id,no);
			content += '<tr>';
			content += '<td>'+view.text+'</td>';
			if(view.category == 'duty'){
				content += '<td>의무 교육</td>';
			}else if(view.category == 'job'){
				content += '<td>직무 교육</td>';
			}else if(view.category == 'hygiene'){
				content += '<td>위생 교육</td>';
			}else{
				content += '<td>운영 교육</td>';
			}
			
			content += '<td><a href="/us/educationDetail/'+view.no+'">'+view.subject+'</a></td>';
			content += '<td>'+view.total_time+'</td>';
			
			var dateOnly = view.create_date.split('T')[0];
			if (view.education_date) {
				content +='<td style="color: green;">수강완료</td>';
				content +='<td onclick="loadModal(\'history\',\'Info\','+no+')">발급</td>';
			}else{
				content +='<td style="color: red;">미수강</td>';
				content +='<td>미발급</td>';
			}
	                
	        content += '<td>' + dateOnly + '</td>';
	        content += '</tr>';
		}
		$('#list').html(content);
	}
	
	function setModalData(type,no) {
		console.log('실행',no)
		var data = {
			no: no
		}
		getAjax('/completion','JSON',data);
	}
	
	function getSuccess(response) {
		console.log("받아와?",response.list);
		$("#userName").append(response.list.name);
		$("#subject").append(response.list.subject);
		$("#totalTime").append(response.list.total_time);
		$("#eduDate").append(response.list.reCreate_date);
		
		// 이미지로 저장 기능			
		$("#downLoad").on("click", function() {
			html2canvas($('.down')[0]).then(function(canvas) {
		        var img = document.createElement("a");
		        img.download = response.list.subject+"-이수증.png";
		        img.href = canvas.toDataURL();
		        document.body.appendChild(img);
		        img.click();
		    });
		});
		
		// 인쇄 및 pdf 저장 기능
		$("#print").on("click", function() {
	    
			var html = document.querySelector('html');
		    var printContents = document.querySelector('.down').innerHTML;
		    var printDiv = document.createElement('DIV');
		    printDiv.className = 'print-div';
		    html.appendChild(printDiv);
		    printDiv.innerHTML = printContents;
		    document.body.style.display = 'none';
		    window.print();
		    document.body.style.display = 'block';
		    printDiv.style.display = 'none';
		});
	}
	
	
	
	
	
	



</script>

</html>