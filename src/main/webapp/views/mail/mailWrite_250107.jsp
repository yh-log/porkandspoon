<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문서함</title>

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

<!-- summernote bootstrap-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/resources/assets/compiled/css/app.css">
<!-- <link rel="stylesheet" href="/resources/assets/compiled/css/app-dark.css"> -->
<!-- <link rel="stylesheet" href="/resources/assets/compiled/css/iconly.css"> -->
<link rel="stylesheet" href="/resources/css/chartModal.css">
<link rel="stylesheet" href="/resources/css/common.css">

<!-- FilePond CSS -->
<link href="https://unpkg.com/filepond@^4/dist/filepond.css" rel="stylesheet" />

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<!-- jstree -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<!-- Autocomplete -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
.mailList .tit-area {
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.mailList .tit-area .left {
	display: flex;
    align-items: center;
    justify-content: space-between;
}

.mailList .tit-area .left button{
	background: none;
	border: none;
}

.mailList .tab {
	margin-left: 14px;
}

.mailList .tab .bar {
	display: inline-block;
	width: 1px;
	height: 14px;
	background: #ddd;
}

.mailList .tab button {
	color: #888;
}

.mailList .tab button.selected {
	color: #333;
}

.mailList table tr:hover {
	background: #f7f7f7;
}

.mailList .util-area {
	display: flex;
	justify-content: space-between;
    padding: 20px 40px;
    border-bottom: 1px solid #ddd;
}

.mailList .util-area .left > * {
	margin-right: 10px;
}

.mailList .cont-body {
    padding: 20px 40px;
}

.mailList .list-area .mail-item {
	display: flex;
	justify-content: space-between;
    padding: 16px 40px;
    border-bottom: 1px solid #ddd;
}
.mailList .list-area .mail-item .left > *{
	margin-right: 10px;
}
.mailList .list-area .mail-item .name {
	margin-right: 30px;
}
.mailList .line {
	margin-bottom: 30px;
}
.mailList .line label {
	width: 72px;	
}
.mailList .line .filepond--drop-label label {
	width: auto;	
}
.mailList .btn {
	margin: 0;
}
.mailList .note-editor {
    width: 100% !important;
}
 .mailList .receivers-area {
     flex-grow: 1;
     margin-right: 10px;
}
 .mailList .receivers-area label {
     flex-shrink: 0;
 	 margin-right: 5px;
 }
 .mailList #receivers {
 	display: flex;
    flex-wrap: wrap;
    gap: 4px;
 	width: 100%;
 	min-height: 40px;
    padding: 4px;
    line-height: 1.5;
    border: 1px solid #dce7f1;
    border-radius: .25rem;
    cursor: text;
 }
 .mailList #receivers .search-area {
 	position: relative;
    display: inline-block;
    width: 160px;
 }
 .mailList #receivers .search-area span{
 	position: absolute;
 	top: 50%;
 	transform: translateY(-50%);
 	display: inline-block;
	width: 18px;
	height: 18px;
	box-sizing: border-box;
 	opacity:0.8;
 	cursor: pointer;
 	display:none;
 }
 .mailList #receivers .search-area span:hover{
 	opacity: 1;
 }
 .mailList #receivers .search-area span.btn-edit{
 	right: 22px;
	background: url('/resources/img/ico/ico_edit_s.png') no-repeat center/cover;
 }
 .mailList #receivers .search-area .btn-delete{
	right: 4px;
	background: url('/resources/img/ico/ico_close_s.png') no-repeat center/cover;
 }
 
 .mailList #receivers input {
 	width: 100%;
 	height: 30px;
 	padding: 6px 50px 6px 10px;
 	display: inline-block;
 	font-size: 14px;
 }
 .mailList #receivers input:focus {
 	box-shadow: 0 0 0 .145rem rgba(67,94,190,.2);
 }
/* .mailList #receivers input {
    display: block;
    height: 34px;
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #607080;
    -webkit-appearance: none;
    appearance: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #dce7f1;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
} */
/* .mailList #receivers input:focus{
    color: #607080;
    background-color: #fff;
    border-color: #a1afdf;
    outline: 0;
    box-shadow: 0 0 0 .25rem rgba(67, 94, 190, .25);
} */
.mailList #receivers input[readonly],
.mailList #receivers input.invalid {
	cursor: default;
	outline: none;
	box-shadow: none;
	background-color: var(--bs-bg);
	border: 1px solid #dae0eb;
}
.mailList #receivers input.invalid {
	background-color: var(--bs-light-danger);
}
.mailList #receivers input[readonly] + span, 
.mailList #receivers input[readonly] + span + span,
.mailList #receivers input.invalid + span, 
.mailList #receivers input.invalid + span + span {
	display: block;
}
.mailList .form-control{
	display: inline-block;
    width: calc(100% - 77px);
	padding: 19px 10px;
}
.mailList #filepond {
	width: 100%;
}

    .ui-autocomplete { position: absolute; max-height: 200px; margin: 0; padding: 0; background-color: #fff; border: 1px solid #ccc; border-radius: 8px; z-index: 1; list-style: none; overflow-y: auto; } 
    .ui-autocomplete li { padding: 10px; cursor: pointer; font-size: 16px; color: #000; } 
    .ui-autocomplete li strong { color: #0077cc; } 
    .ui-helper-hidden-accessible { display: none; } 
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

			<div class="page-content mailList">
				<section id="menu">
					<h4 class="menu-title">사내메일</h4>
					<ul>
						<li class="active"><a href="#">받은메일함</a></li>
						<li><a href="#">보낸메일함</a></li>
						<li><a href="#">임시보관함</a></li>
						<li><a href="#">중요메일함</a></li>
						<li><a href="#">휴지통</a></li>
					</ul>
					<div class="btn btn-primary full-size">메일쓰기</div>
				</section>
				<section class="cont">

					<div class="col-12 col-lg-12">
						<div class="tit-area">
							<div class="left">
								<h5>메일쓰기 <button>임시보관 메일</button><span class="mail-count">21</span></h5>
							</div>
						</div>
						<div class="util-area">
							<div class="left">
								<button class="btn btn-primary" onclick="sendMail()">보내기</button>
								<button class="btn btn-outline-primary" onclick="saveMail()">임시저장</button>
							</div>
						</div>

						<div class="cont-body">
							<form id="mailWriteForm">
								<input type="hidden" name="idx"/>
								<div class="line">
									<div class="flex between">
										<div class="flex receivers-area">
											<label class="fw-600">받는 사람</label> 
											<!-- <input name="myself" type="checkbox" class="form-check-input" id="checkbox2">
											<label for="myself">나에게</label> -->
											
											<!-- 검색어를 입력할 input box 구현부 -->
		    								<div id="receivers">
		    									<div class="search-area">
		    										<input class="searchBox form-control" name="username" required/>
		    										<span class="btn-edit"></span>
		    										<span class="btn-delete"></span>
		    									</div>
	    									</div>
											<!-- <input type="text" id="autocomplete" class="autocomplete-input"> -->
										</div>
										<button class="btn btn-outline-primary btn-sm">조직도</button>
									</div>
								</div>
								<div class="line">
									<label class="fw-600">제목</label>
									<input class="form-control" type="text" name="title" required/>
								</div>
								<div class="line clearfix">
									<label class="fw-600">파일첨부</label> 
									<!-- <button class="btn btn-outline-primary btn-sm">파일첨부</button> -->
								<!-- 	<p class="float-r">
										<span>0KB</span>
										/
										<span>10MB</span>
									</p> -->
									<input type="file" class="filepond-multiple" multiple data-max-file-size="10MB" data-max-files="5" id="filepond" multiple="" name="attachedFiles" type="file"/>
								</div>			
								<!-- <input type="file" class="with-validation-filepond" required multiple data-max-file-size="10MB"> -->
								<div class="editor-area">
									<textarea id="summernote" maxlength="10000"></textarea>
								</div>		
							</form>
						</div>
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

<!-- FilePond JavaScript -->
<script src="https://unpkg.com/filepond@^4/dist/filepond.js"></script>

<!-- jQuery -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	
<script src='/resources/js/common.js'></script>
<script src='/resources/js/charjstree.js'></script>

<!-- select  -->
<script
	src="/resources/assets/extensions/choices.js/public/assets/scripts/choices.js"></script>
<script src="/resources/assets/static/js/pages/form-element-select.js"></script>

<script src='/resources/js/textEaditor.js'></script>

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	//두 번째 FilePond에 다른 설정 적용
	const attachedFilesPond = FilePond.create(document.querySelector('input.filepond-multiple'), {
	    allowMultiple: true,
	    maxFiles: 5,
	    allowImagePreview: false,
	    labelIdle: '파일을 드래그하거나 클릭하여 업로드하세요 (최대 3개)',
	    instantUpload: false
	});
	
	
	
	
// auto-complete
	setAutoComplete();
	function setAutoComplete(){
	
	    $('.searchBox').autocomplete({
	        source : function(request, response) {
	            $.ajax({
	                type : 'get',
	                url: '/json',
	                dataType : 'json',
	                success : function(cont) {
	                	const inputText = request.term.toLowerCase();
	                    // 서버에서 json 데이터 response 후 목록 추가
	                    response(
	                        $.map(cont.filter(item => item.text.toLowerCase().includes(inputText)), function(item) {
	                            return {
	                                label : item.text,
	                                value : item.username,
	                                //test : item + 'test'
	                            }
	                        })
	                    );
	                    
	                    
	                    /* const filteredItems = data.filter(item => item.toLowerCase().includes(inputText));
		                response(filteredItems); */
	                }
	            });
	        },
	        select : function(event, ui) {
	        	// 현재 input 입력못하게
	        	event.target.setAttribute("readonly", true);
	        	event.target.blur();
	        	//event.target.parentElement.classList.add("readonly");
	        	event.target.classList.remove("invalid");
	        	
	        	addNewInput();
	        	
	            //var clonedElement = e.target.cloneNode();
	            //clonedElement.setAttribute("readonly", false);
	            //document.getElementById("receivers").appendChild(clonedElement);
	            //var inputElement = document.createElement("input");
	            //inputElement.setAttribute("name", "username");
	            //inputElement.setAttribute("autofocus", true);
				//inputElement.classList.add("searchBox");
	            //document.getElementById("receivers").appendChild(inputElement);
	           
				//inputElement.focus();
	        	
	            console.log("ui: ", ui);
	            console.log(ui.item.label);
	            console.log(ui.item.value);
	            console.log(ui.item.test);
	        },
	        focus : function(event, ui) {
	            return false;
	        },
	        minLength : 1,
	        autoFocus : true,
	        classes : {
	            'ui-autocomplete': 'highlight'
	        },
	        delay : 500,
	        position : { my : 'right top', at : 'right bottom' },
	        close : function(e) {
	            console.log("close: ",e);
	            
	        }
    	});
	}

// 새로운 input 생성
function addNewInput(){
   	var inputCont = '<div class="search-area">';
   	inputCont += '<input class="searchBox form-control" name="username" required/>';
   	inputCont += '<span class="btn-edit"></span>';
   	inputCont += '<span class="btn-delete"></span>';
   	inputCont += '</div>';
 	$('#receivers').append(inputCont);
 	$('#receivers input:not([readonly])').focus();
    setAutoComplete();									
}

// 받는 사람 input 편집버튼 클릭시
$(document).on('click','#receivers .btn-edit',function(e){
	$(this).siblings('input').attr('readonly', false);
});

// 받는 사람 input 삭제버튼 클릭시
$(document).on('click','#receivers .btn-delete',function(e){
	$(this).parents('.search-area').remove();
});
	
	/* $(document).ready(function () {
    const data = [
        "HTML",
        "CSS",
        "JavaScript",
        "jQuery",
        "Ajax",
        "React",
        "Angular",
        "Vue.js",
        "Node.js",
        "Express"
    ];

    // 자동 완성 셋업
    $("#autocomplete").autocomplete({
        // 입력 문자열에 대해 필터링된 제안을 반환하는 함수
        source: function (request, response) {
            const inputText = request.term.toLowerCase();
            const filteredItems = data.filter(item => item.toLowerCase().includes(inputText));
            response(filteredItems);
        },
        
        // 자동 완성 위치 조정
        position: { my: "left top+5" },

        // 자동 완성 메뉴가 열렸을 때, 하이라이팅 로직
        open: function () {
            const inputText = $("#autocomplete").val().toLowerCase();
            // 각 제안 아이템에 대한 하이라이팅
            $(".ui-autocomplete li").each(function () {
                let suggestion = $(this).text();
                const index = suggestion.toLowerCase().indexOf(inputText);

                if (index !== -1) {
                    // 단어의 일부를 강조하는 HTML을 사용하여 새로운 제안 생성
                    const highlightedPart = `<strong>${suggestion.substr(index, inputText.length)}</strong>`;
                    suggestion = suggestion.substring(0, index) + highlightedPart + suggestion.substring(index + inputText.length);
                    // 새로운 제안으로 항목 내용을 업데이트
                    $(this).html(suggestion);
                }
            });
        },
        delay : 100, // 입력창에 글자가 써지고 나서 autocomplete 이벤트 발생될 떄 까지 지연 시간(ms)
    });
}); */
	
// 메일전송
function sendMail(){
	const form = document.getElementById("mailWriteForm");
    const inputs = form.querySelectorAll("input[required]");
	let isValid = true;
	let missingFields = [];
	
    // input 필드 유효성 검사
    inputs.forEach(input => {
    	console.log("input.value.trim() :" ,input.value.trim());
    	console.log("input.value :" ,input.value);
        if (!input.value.trim()) {
            isValid = false;
            let text = $(input).parents('.line').find('label').text();
            console.log("text!!!!",$(input).parents('.line'));
            missingFields.push(text);
            return; 
        }
    });
    // 받는사람 input
    var existReceiver = $('#receivers input[readonly]').length >= 1;
    var invalidReceiver = $('#receivers input.invalid').length >= 1;
    //console.log("$('#receivers input[readonly]')",$('#receivers input[readonly]'));
    //console.log("existReceiver",existReceiver);
    if (isValid && existReceiver && !invalidReceiver) {
    	textEaditorWrite('/mail/write/sd');
    }else {
    	if(!existReceiver){
    		missingFields.push('받는 사람');
    	}
    	if(invalidReceiver){
    		layerPopup("받는 사람이 유효하지 않습니다.",'확인',false,removeAlert,removeAlert);
			return;
    	}else{
	    	let missingText = missingFields.join(', ');
	    	layerPopup("필수 값을 모두 입력하세요: "+missingText,'확인',false,removeAlert,removeAlert);
    	}
    }
}	

// 임시저장
function saveMail(){
	textEaditorWrite('/mail/write/sv');
}

//1분마다 자동 임시저장 check!!! 나중에 풀기
//setInterval(saveMail, 60000);


function textEaditorWrite(url, after){
	console.log('approval.js textEaditorWrite실행');
	// check!!! 이거두줄
	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

	var formData = new FormData($('form')[0]); // formData
	var content = $('#summernote').summernote('code'); // summernote로 작성된 코드
	console.log("content!!@@##",content);
	formData.append('content', content);
    
    //첨부 파일 추가
    const attachedFiles = attachedFilesPond.getFiles();
    if (attachedFiles.length > 0) {
    	attachedFiles.forEach(function(file, index) {
    	    formData.append('attachedFiles', file.file); 
    	});
    }
	
	var tempDom = $('<div>').html(content);
    var imgsInEditor = []; // 최종 파일을 담을 배열
 
 	 tempDom.find('img').each(function () {
            var src = $(this).attr('src');
            if (src && src.includes('/photoTem/')) {  // 경로 검증
                var filename = src.split('/').pop();  // 파일명 추출
                imgsInEditor.push(filename);  // 추출된 파일명 배열에 추가
            }
    });
 
	 // new_filename과 일치하는 항목만 필터링
    var finalImgs = tempImg.filter(function (temp) {
        return imgsInEditor.includes(temp.new_filename);  // 에디터에 있는 파일과 tempImg의 new_filename 비교
    });
 
 	formData.append('imgsJson', JSON.stringify(finalImgs));
 
 	 fileAjax('POST', url, formData);
     console.log("textEaditorWrite 실행완료");
     console.log("textEaditorWrite after : "+after);
}


function fileSuccess(response){
	if(response.status == 'sd'){
		location.href='/mail/detail/'+response.mailIdx;
	}else{
		$('input[name="idx"]').val(response.mailIdx);
		layerPopup("임시저장 되었습니다.",'확인',false,removeAlert,removeAlert);
	}
}

// 받는 사람 영역 클릭시 새로운 input생성
$(document).on('click','#receivers',function(e){
	// 마지막 input 요소
	var lastInput = $(this).find('.search-area:last-child input');
	console.log("lastInput : : :",lastInput);
	console.log("lastInput : readonly: :",$(lastInput).attr("readonly"));
	if($(lastInput).attr('readonly') == 'readonly' || lastInput.length < 1){
		addNewInput();
	}else{
		$(lastInput).focus();
	}
});
$(document).on('focusout','.searchBox',function(e){
	if($(this).val() == ''){
		$(this).parent().remove();
	}
	if(!$(this).attr('readonly')){
		$(this).addClass('invalid');
	}
});
	
	
</script>

</html>