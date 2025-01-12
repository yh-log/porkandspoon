<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결재라인 즐겨찾기 리스트</title>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- 부트스트랩 -->
<link rel="shortcut icon"
	href="/resources/assets/compiled/svg/favicon.svg" type="image/x-icon">
<link rel="shortcut icon"
	href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAiCAYAAADRcLDBAAAEs2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS41LjAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iCiAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgIHhtbG5zOnBob3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIKICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgZXhpZjpQaXhlbFhEaW1lbnNpb249IjMzIgogICBleGlmOlBpeGVsWURpbWVuc2lvbj0iMzQiCiAgIGV4aWY6Q29sb3JTcGFjZT0iMSIKICAgdGlmZjpJbWFnZVdpZHRoPSIzMyIKICAgdGlmZjpJbWFnZUxlbmd0aD0iMzQiCiAgIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiCiAgIHRpZmY6WFJlc29sdXRpb249Ijk2LjAiCiAgIHRpZmY6WVJlc29sdXRpb249Ijk2LjAiCiAgIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiCiAgIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIKICAgeG1wOk1vZGlmeURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiCiAgIHhtcDpNZXRhZGF0YURhdGU9IjIwMjItMDMtMzFUMTA6NTA6MjMrMDI6MDAiPgogICA8eG1wTU06SGlzdG9yeT4KICAgIDxyZGY6U2VxPgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJwcm9kdWNlZCIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWZmaW5pdHkgRGVzaWduZXIgMS4xMC4xIgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTAzLTMxVDEwOjUwOjIzKzAyOjAwIi8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3JkZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+Cjw/eHBhY2tldCBlbmQ9InIiPz5V57uAAAABgmlDQ1BzUkdCIElFQzYxOTY2LTIuMQAAKJF1kc8rRFEUxz9maORHo1hYKC9hISNGTWwsRn4VFmOUX5uZZ36oeTOv954kW2WrKLHxa8FfwFZZK0WkZClrYoOe87ypmWTO7dzzud97z+nec8ETzaiaWd4NWtYyIiNhZWZ2TvE946WZSjqoj6mmPjE1HKWkfdxR5sSbgFOr9Ll/rXoxYapQVik8oOqGJTwqPL5i6Q5vCzeo6dii8KlwpyEXFL519LjLLw6nXP5y2IhGBsFTJ6ykijhexGra0ITl5bRqmWU1fx/nJTWJ7PSUxBbxJkwijBBGYYwhBgnRQ7/MIQIE6ZIVJfK7f/MnyUmuKrPOKgZLpEhj0SnqslRPSEyKnpCRYdXp/9++msneoFu9JgwVT7b91ga+LfjetO3PQ9v+PgLvI1xkC/m5A+h7F32zoLXug38dzi4LWnwHzjeg8UGPGbFfySvuSSbh9QRqZ6H+Gqrm3Z7l9zm+h+iafNUV7O5Bu5z3L/wAdthn7QIme0YAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAJTSURBVFiF7Zi9axRBGIefEw2IdxFBRQsLWUTBaywSK4ubdSGVIY1Y6HZql8ZKCGIqwX/AYLmCgVQKfiDn7jZeEQMWfsSAHAiKqPiB5mIgELWYOW5vzc3O7niHhT/YZvY37/swM/vOzJbIqVq9uQ04CYwCI8AhYAlYAB4Dc7HnrOSJWcoJcBS4ARzQ2F4BZ2LPmTeNuykHwEWgkQGAet9QfiMZjUSt3hwD7psGTWgs9pwH1hC1enMYeA7sKwDxBqjGnvNdZzKZjqmCAKh+U1kmEwi3IEBbIsugnY5avTkEtIAtFhBrQCX2nLVehqyRqFoCAAwBh3WGLAhbgCRIYYinwLolwLqKUwwi9pxV4KUlxKKKUwxC6ZElRCPLYAJxGfhSEOCz6m8HEXvOB2CyIMSk6m8HoXQTmMkJcA2YNTHm3congOvATo3tE3A29pxbpnFzQSiQPcB55IFmFNgFfEQeahaAGZMpsIJIAZWAHcDX2HN+2cT6r39GxmvC9aPNwH5gO1BOPFuBVWAZue0vA9+A12EgjPadnhCuH1WAE8ivYAQ4ohKaagV4gvxi5oG7YSA2vApsCOH60WngKrA3R9IsvQUuhIGY00K4flQG7gHH/mLytB4C42EgfrQb0mV7us8AAMeBS8mGNMR4nwHamtBB7B4QRNdaS0M8GxDEog7iyoAguvJ0QYSBuAOcAt71Kfl7wA8DcTvZ2KtOlJEr+ByyQtqqhTyHTIeB+ONeqi3brh+VgIN0fohUgWGggizZFTplu12yW8iy/YLOGWMpDMTPXnl+Az9vj2HERYqPAAAAAElFTkSuQmCC"
	type="image/png">

<!-- select -->
<link rel="stylesheet"
	href="/resources/assets/extensions/choices.js/public/assets/styles/choices.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css">
<link rel="stylesheet" href="/resources/css/common.css">



<style>
.apprLineList table tr:hover {
	background: #fbfbfb;
}

.apprLineList input {
	width: 100%;
	height: 100%;
	border: none;
}

.apprLineList .search-area {
	display: flex;
	gap: 4px;
}

.apprLineList input[name="search-data"] {
	width: 300px;
	height: 38px;
	margin: 14px 0;
	border: 1px solid #DFE3E7;
}

.apprLineList .search-area select {
	margin: 14px 0;
}


.apprLineList .buttons {
	display: flex;
	justify-content: space-between;
	padding: 4px 40px;
}

.apprLineList .buttons .btn {
	margin: 14px 0;
}

.apprLineList h4.doc-subject {
	margin: 20px 0 50px;
	text-align: center;
}

.apprLineList .btm-area {
	display: flex;
	flex-wrap: wrap;
	border-left: 1px solid #ddd;
	border-top: 1px solid #ddd;
	margin-top: 40px;
}
.apprLineList table {
    table-layout: auto;
}
.apprLineList table td.delete:hover{
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

			<div class="page-content apprLineList">
				<section id="menu">
					<h4 class="menu-title">나의문서함</h4>
					<ul>
						<li><a href="/approval/listView/my">기안문서함</a></li>
						<li><a href="/approval/listView/tobe">결재할 문서</a></li>
						<li><a href="/approval/listView/did">결재한 문서</a></li>
						<li><a href="/approval/listView/sv">임시저장 문서</a></li>
						<li class="active"><a href="/approval/listView/line">나의 결재라인</a></li>
					</ul>
					<div class="btn btn-primary full-size" onclick="location.href='/approval/write'">결재작성</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<h5>나의 결재라인</h5>
						</div>
						<div class="buttons">
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-primary">조직도</button>
							</div>
						</div>
						<div class="cont-body">

							<table class="list">
								<colgroup>
									<col width="60px;">
									<col width="20%;">
									<col>
									<col>
									<col>
									<col>
									<col>
								</colgroup>
								<thead>
									<tr>
										<th>NO</th>
										<th class="align-l">결재라인명</th>
										<th>결재자1</th>
										<th>결재자2</th>
										<th>결재자3</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>

							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center" id="pagination"></ul>
							</nav>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	
	
	<!-- 조직도 모달 사용 시 추가 -->
	<div id="chartModalBox" class="modal" style="display: none;">
    	<div class="chartModal-content"></div>
	</div>
	<input type="hidden" id="selectedNodeInput" value=""/>
</body>

<!-- 부트스트랩 -->
<script src="/resources/assets/compiled/js/app.js"></script>
<script src='/resources/js/common.js'></script>

<!-- 페이지네이션 -->
<script src="/resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
	
<!-- jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<!-- 조직도 js -->
<script src='/resources/js/charjstree.js'></script>
<script>
var show = 1;

var totalCount = 0;
var pageSize = 15;  // 한 페이지당 게시글 수  //check!!! cnt를 얘로??
var totalPage = 0;

pageCall(show);

function pageCall(page) {
	//console.log("page : ", page);
	$.ajax({
		type:'GET',
		url:'/approval/list/line',
		data:{
			'page':page,
			'cnt':15
		},
		datatype:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.bookmarkList);

			if(data.bookmarkList.length > 0){
				totalCount = data.bookmarkList[0].total_count;  // 총 게시글 수
	            totalPage = Math.ceil(totalCount / pageSize);  // 총 페이지 수 계산
			}
			console.log("totalCount",totalCount,"totalPage",totalPage);
            
			
            
			 /* 페이지네이션 */       

			$('#pagination').twbsPagination({
				startPage: 1, 
           		totalPages: totalPage, 
           		visiblePages:10,
           		onPageClick:function(evt,page){
           			console.log('evt',evt); 
           			console.log('page',page); 
           			pageCall(page);
           		}
			});

		},
		error:function(e){
			console.log("에러러러ㅓ");
			console.log(e);
		}
	});
}

function drawList(list) {
	var thead ='';
	var content ='';
	if(totalCount == 0){
		content +='<tr><td colspan="8">조회된 데이터가 없습니다.</td></tr>';
		$('.list tbody').html(content);
		return false;
	}
	
	var approverNames = '';
 	for (var view of list) {
 		approverNames = view.approver_names.split(', ');
 		var approverPositions = view.approver_positions.split(', ');
 		console.log("approverNames : ", approverNames);
 		
 	 	// tbody
		content += '<tr>';
		content += '<td>'+view.line_idx+'</td>';
		content += '<td class="align-l">'+view.line_name+'</td>';
		// 결재자 수 만큼
 	 	for (var i=0; i<approverNames.length; i++) {
 	 		content += '<td>'+ approverNames[i] +' '+ approverPositions[i] +'</td>';
 	 	}

		// 결재자 수에 따라 달라지는 td갯수 맞추기
	    var numColumns = approverNames.length;  
	    var maxColumns = 3;  // 최대
	    var missingColumns = maxColumns - numColumns; 
        // <td> 추가
	    if (missingColumns > 0) {
	        for (var j = 0; j < missingColumns; j++) {
	        	content += '<td></td>';
	        }
	    }
		content += '<td class="delete" data-lineidx="'+view.line_idx+'" ><i class="bi bi-trash3"></i></td>';
		content += '</tr>';
   } 
 	
    $('.list tbody').html(content);
	
	console.log("bookmarkList:  ", '${bookmarkList}');
}
$(document).on('click','.list td.delete',function(){
	var lineIdx = $(this).data('lineidx');
	layerPopup('해당 결재라인을 삭제하시겠습니까?', '삭제', '취소', deleteAct, btn1Act);

	function deleteAct(){
		$.ajax({
	        type : 'DELETE',
	        url : '/approval/DeleteBookmark/'+lineIdx,
	        data : {},
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	 if(response.success){
	     		 	removeAlert(); 
	      			layerPopup('삭제 완료되었습니다.', '확인', false, reloadAct, btn1Act);
	     		 }else{
	     		 	removeAlert(); 
	      			layerPopup('삭제 실패하였습니다.', '재시도', '취소', deleteAct, btn1Act);
	     		 }
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
});

/* $(document).on('click', '.td.delete', function() {
	alert('dd');
}); */

// 삭제 팝업 (삭제버튼)
var csrfToken = document.querySelector('meta[name="_csrf"]').content;
var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
		


// 삭제 팝업 (취소버튼)
function btn1Act(){
	removeAlert();
}
//삭제확인 후 팝업 (확인버튼)
function reloadAct() {
	location.reload();
	removeAlert();
}



</script>

</html>