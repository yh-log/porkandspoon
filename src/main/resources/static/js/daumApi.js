/*duam map api*/
var roadAddr = '';


// button onclick="addressSearch()"
// 도로명 주소 표시할 요소 id="roadAddress"

function addressSearch(){
    var themeObj = {
        postcodeTextColor: "#FB7E3A", //우편번호 글자색 수정
    };
        
    new daum.Postcode({
        theme: themeObj,
        oncomplete: function(data) {
                
            // 도로명 주소
            roadAddr = data.roadAddress;
            $('#roadAddress').val(roadAddr); // 사용자에게 보여지는 값

        }
    }).open();
};