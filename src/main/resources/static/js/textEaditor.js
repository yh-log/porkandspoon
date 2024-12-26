// author yh.kim (24.12.5) 
// 썸머노트 사용 및 업로드 기능

$(document).ready(function(){
    function summernote(){
        $('#summernote').summernote({
            // 에디터 크기 설정
            height: 400,
            width: 1200,
            // 에디터 한글 설정
            lang: 'ko-KR',
            // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
            toolbar: [
                // 폰트 설정
                ['fontname', ['fontname']],
                
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 글자 [굵게, 기울임, 밑줄, 취소 선, 지우기]
                ['style', ['bold', 'italic', 'underline','strikethrough']], // , 'clear'
                // 글자색 설정
                ['color', ['color']],
                // 표 만들기
                /* ['table', ['table']], */
                // 서식 [글머리 기호, 번호매기기, 문단정렬]
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격 설정
                ['height', ['height']],
                // 이미지 첨부
                ['insert',['picture']]
            ],
            // 추가한 글꼴
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체', 'Pretendard'],
            // 추가한 폰트사이즈
            fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72','96'],
            // focus는 작성 페이지 접속시 에디터에 커서를 위치 시킬 경우 설정 (true / false)
            focus : false,
            // callbacks은 이미지 업로드 처리입니다.
            callbacks : {                                                    
                onImageUpload : function(files, editor, welEditable) {   
                    // 다중 이미지 처리를 위해 for문 사용
                    for (var i = 0; i < files.length; i++) {
                        imageUploader(files[i], this);
                    }
                }
            }
        });
    }

    // summernote 함수 호출
    summernote();
});


// 이미지 담을 배열 선언
var tempImg = [];

// 이미지 추가 (임시 폴더에 추가)
function imageUploader(files, el){
	console.log('들어감');
    var formData = new FormData(); // 함수 호출 시마다 FormData 생성
    formData.append('files', files);
    
    var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;
    
    $.ajax({
        type: 'POST',
        url: '/textImage',
        data: formData,
        contentType: false,
        processData: false,
        enctype: 'multipart/form-data',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        },
        success: function(data){
        $(el).summernote('insertImage', data.new_filename, function($image) {
            $image.css('width', "100%");
        });
            
        var newFilename = data.new_filename.split('/').pop(); 
        var oriFilename = data.ori_filename;
        
        tempImg.push({'new_filename' : newFilename, 'ori_filename' : oriFilename}); // dto와 이름 동일해야 함
        
        },error: function(e){
            console.log('에러 => ', e);
        }
    });
}


// 최종 글 작성
// 글 전송할 url 파라미터 포함
// 전송 버튼에 textEaditorWrite(url) 함수 사용
function textEaditorWrite(url){

	var csrfToken = document.querySelector('meta[name="_csrf"]').content;
    var csrfHeader = document.querySelector('meta[name="_csrf_header"]').content;

	var formData = new FormData($('form')[0]); // formData
	var content = $('#summernote').summernote('code'); // summernote로 작성된 코드
	formData.append('content', content);
	
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
}
