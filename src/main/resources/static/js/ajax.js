// author yh.kim (24.12.5) 
/* 공통 ajax */

/* GET 방식 */

function getAjax(url){
    $.ajax({
        type : 'GET',
        url : url,
        data: {},
        dataType: 'JSON',
        success: function(response){
            getSuccess(response);
        },error: function(e){
            console.log(e);
        }
    });
}


/* POST, PUT, DELETE 방식 */
/**
 * type : POST, PUT, DELETE
 * url : 이동 url
 * param : json 형태
 *
 * html head에 해당 코드 추가
 * <meta name="_csrf" content="${_csrf.token}">
 * <meta name="_csrf_header" content="${_csrf.headerName}"> 
 *
 */

function httpAjax(type, url, params){

	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

    $.ajax({
        type : type,
        url : url,
        data : params,
        dataType : 'JSON',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        },
        success : function(response){
	            httpSuccess(response);
        },error: function(e){
            console.log(e);
        }
    });
}


/* 파일 전송 ajax */
/**
 * type : POST, PUT, DELETE
 * url : 이동 url
 * formData : 파일이 포함된 데이터(josn 형태)
 *
 * html head에 해당 코드 추가
 * <meta name="_csrf" content="${_csrf.token}">
 * <meta name="_csrf_header" content="${_csrf.headerName}"> 
 */

function fileAjax(type, url, formData){

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
            fileSuccess(response);
        },error : function(e){
            console.log(e);
        }
    });
}


/* 파일 미리보기 */
/**
 * 이미지 미리보기 div 요소 id : id="imgPreview"
 * 이미지 미리보기 div 요소 css : class="priview" *클래스 스타일은 별도 지정 필요
 *  onchange="preview(this)" : input type="file"
 */
function preview(img){
    var reader;
    $('#imgPreview').empty();

    for(var file of img.files){
        reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            $('#imgPreview').append('<img class="priview" src="' + e.target.result + '"/>');
        }
    }
}

/* 파일 다운로드 */
/* onclick="download(file1, file2)"
 * ori_filename : 파일의 원래 이름
 * new_filename : UUID
 */
function download(ori_filename, new_filename) {
    $.ajax({
        type: 'GET',
        url: '/download',
        data: {
            'ori_filename': ori_filename,
            'new_filename': new_filename
        }, xhrFields: {
            responseType: 'blob' // 서버 응답을 Blob 형태로 처리
        }, success: function(blob) {
            // 파일 다운로드 처리
            var url = window.URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.style.display = 'none';
            a.href = url;
            a.download = ori_filename; // 다운로드 파일 이름 설정
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        }, error: function(e) {
            console.error("다운로드 실패:", e);
        }
    });
}

// 모달 오픈
function loadModal(section, type) {
    var modal = document.getElementById("calendarModal");
    var modalContent = modal.querySelector(".modal-content");

    $.ajax({
        url: "/resources/html/calenderModal.html", // 모달 HTML 파일 경로
        type: "GET",
        success: function (data) {
            var tempDiv = document.createElement("div");
            tempDiv.innerHTML = data;

            var selectedModal = tempDiv.querySelector(`#${section}${type}Modal`);
            if (selectedModal) {
                modalContent.innerHTML = selectedModal.innerHTML;

                modalOpen();
                
                modal.style.display = "block";

                // 모달 닫기 및 기타 이벤트 설정
                setupModalEvents(modal);
            } else {
                console.error("해당하는 모달을 찾을 수 없습니다: " + section);
            }
        },
        error: function () {
            console.error("모달 HTML 파일을 로드하는 데 실패했습니다.");
        },
    });
}
