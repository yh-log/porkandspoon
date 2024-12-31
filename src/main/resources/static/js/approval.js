console.log("approval.js 실행");

//최종 글 작성
//글 전송할 url 파라미터 포함
//전송 버튼에 textEaditorWrite(url) 함수 사용
function textEaditorWrite(url, after){
console.log('approval.js textEaditorWrite실행');
	// check!!! 이거두줄
	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
	
	var formData = new FormData($('form')[0]); // formData
	var content = $('#summernote').summernote('code'); // summernote로 작성된 코드
	formData.append('content', content);
	
	
	  // 로고 파일 추가
    const logoFile = logoFilePond.getFiles();
    if (logoFile.length > 0) {
    	formData.append('logoFile', logoFile[0].file);  // 첫 번째 파일을 formData에 추가
    
    	console.log("logoFile!!! : ", logoFile);
    }
    
    //첨부 파일 추가
    const attachedFiles = attachedFilesPond.getFiles();
    if (attachedFiles.length > 0) {
    	attachedFiles.forEach(function(file, index) {
    	    formData.append('files', file.file); 
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
 
 fileAjax('POST', url, formData, after);
}


// 에디터 이미지 저장
function fileAjax(type, url, formData, after){

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
            fileSuccess(response, after);
        },error : function(e){
            console.log(e);
        }
    });
}

// 결재 요청
function sendApproval(){
	document.querySelector('input[name="draft_idx"]').value = null;
	document.querySelector('input[name="status"]').value = "sd";
	
	// file required 속성 해제
	//document.getElementsByClassName('filepond--browser')[0].removeAttribute('required');
	
	const form = document.getElementById("formDraft");
    const inputs = form.querySelectorAll("input[required]");
    const selects = form.querySelectorAll("select[required]");

    let isValid = true;

    // input 필드 유효성 검사
    inputs.forEach(input => {
        if (!input.value.trim()) {
            isValid = false;
            var txtEl = input.parentNode;
            console.log("t0:::"+txtEl);
            var titleEl = txtEl.previousSibling;
            console.log("t1:::"+titleEl.innerText);
            return; 
        }
    });

    // select 필드 유효성 검사
    selects.forEach(select => {
        if (!select.value) {
            isValid = false;
            //alert(select.name + " is required.");
            return;
        }
    });
    
    if (isValid) {
		textEaditorWrite('/draftWrite/sd',true);	
    }else {
    	 layerPopup("필수 값을 모두 입력하세요.",'확인',false);
    }

}

// 알림 팝업(유효성 검사)
function btn1Act() {
	removeAlert(); // 기존팝업닫기
}
function btn2Act() {
	removeAlert(); // 기존팝업닫기
}

// 임시 저장
function saveTemp(){
	document.querySelector('input[name="status"]').value = "sv";
	textEaditorWrite('/draftWrite/sv',false);	
	
}

//1분마다 자동 임시저장 check!!! 나중에 풀기
//setInterval(saveTemp, 60000);



// 저장 성공 후 상세페이지 이동
function fileSuccess(response, after){
	console.log("success : "+response.success);
	console.log("success : "+response.draftIdx);
	if(after){
		location.href = "/approval/detail/"+response.draftIdx;
	}else{
		$('input[name="draft_idx"]').val(response.draftIdx);
	}
	
} 