
// 팝업을 제거하는 함수
var removeAlert = function(confirmBox) {
    document.body.removeChild($('.confirm-box')[0]);
    document.body.removeChild($('.overlay')[0]);
    window.removeEventListener('keydown', handleKeyDown);
};

// 키 눌림 이벤트 방지
var handleKeyDown = function(event) {
    event.preventDefault();
};

// 기본 텍스트 팝업
function layerPopup(message, btn1, btn2, btn1Callback = btn1Act, btn2Callback = btn2Act) {
    // 대화 상자를 HTML 요소로 생성
    var confirmBox = document.createElement('div');
    confirmBox.setAttribute('class', 'confirm-box');
    confirmBox.innerHTML = '<p>' + message + '</p><a class="btn-close"></a><div class="buttons"><button class="confirm btn btn-primary">'+btn1+'</button></div>';
    
    popUpCommon(btn2, confirmBox, btn1Callback, btn2Callback);
}

// 팝업 공통 기능
function popUpCommon(btn2, confirmBox, btn1Callback, btn2Callback, iconIdx){
	if(btn2){
        confirmBox.getElementsByClassName('buttons')[0].insertAdjacentHTML('beforeend', '<button class="cancel btn btn-outline-primary">'+btn2+'</button>');
    }

    // body 요소의 하위 요소로 추가
    document.body.appendChild(confirmBox);

    // 회색 배경 추가
    var overlay = document.createElement('div');
    overlay.setAttribute('class', 'overlay');
    document.body.appendChild(overlay);

    // 확인 버튼 클릭 시
    var confirmButton = document.querySelector('.confirm-box .confirm');
    confirmButton.addEventListener('click', function() {
        btn1Callback(iconIdx);  
    });

    // 취소 버튼이 있을 때 클릭 이벤트 처리
    if(btn2){
        var cancelButton = document.querySelector('.confirm-box .cancel');
        cancelButton.addEventListener('click', function() {
            btn2Callback();  
        });
    }

    // 회색 배경 클릭 시 팝업 닫기
    overlay.addEventListener('click', removeAlert);
    
    // 닫기 버튼 클릭 시 팝업 닫기
    var closeBtn = confirmBox.getElementsByClassName('btn-close')[0];
    closeBtn.addEventListener('click', removeAlert);

    // 키보드 동작 막기
    window.addEventListener('keydown', handleKeyDown);
    
}

