
var time; // 2분

// 시간 분 : 초 단위로 계산하는 함수	
function formatTime(seconds){
	var minutes = Math.floor(seconds/60); // 분 계산 
	var secs = seconds % 60; // 초 계산 (초를 60으로 나눈 나머지)
	
	return minutes + ' : ' + secs;
};

// 인증 버튼 클릭 시 입력값 체크
// email 유효성 검사 진행
function certificationSubmit() {
    var name = document.getElementById('findIdName');
    var email = document.getElementById('findIdEmail');
    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    var username; // username 초기화
    if ($('input[name="type"]').val() === 'pw') { // 비밀번호 찾기일 때만 username 체크
        username = document.getElementById('findIdUserName');
        if (username.value === null || username.value === '') {
            username.classList.add('is-invalid');
            name.classList.remove('is-invalid');
            email.classList.remove('is-invalid');
            return;
        } else {
            username.classList.remove('is-invalid');
        }
    }

    // 이름 필드 확인
    if (name.value === null || name.value === '') {
        name.classList.add('is-invalid');
        if (username) username.classList.remove('is-invalid'); // username이 있을 때만 제거
        email.classList.remove('is-invalid');
        return;
    } else {
        name.classList.remove('is-invalid');
    }

    // 이메일 필드 확인
    if (email.value === null || email.value === '') {
        email.classList.add('is-invalid');
        name.classList.remove('is-invalid');
        if (username) username.classList.remove('is-invalid'); // username이 있을 때만 제거
        return;
    } else if (!emailRegex.test(email.value)) { // 이메일 유효성 검사
        email.classList.add('is-invalid');
        name.classList.remove('is-invalid');
        if (username) username.classList.remove('is-invalid'); // username이 있을 때만 제거
        $('#emailMessage').show();
        return;
    } else {
        email.classList.remove('is-invalid');
        $('#emailMessage').hide();
    }

    // 모든 검증 통과 시 codeSubmit 호출
    codeSubmit();

    // 필드 초기화
    name.classList.remove('is-invalid');
    email.classList.remove('is-invalid');
    if (username) username.classList.remove('is-invalid'); // username이 있을 때만 제거
}
var count;

// 인증 버튼 클릭 후 유효성 체크 완료 후 실행 함수 (인증코드 발송 요청)
function codeSubmit() {

    time = 120;
    var params = {
    			'name': $('input[name="name"]').val(), 
    			'email': $('input[name="email"]').val(),
    			'type' : $('input[name="type"]').val()
    };
    
    if ($('input[name="type"]').val() === 'pw') {
        params['username'] = $('input[name="username"]').val(); // 비밀번호 찾기라면 username 추가
    }
    
    httpAjax('POST', '/sendMail', params);

    // 인증번호 입력 input 초기화
    $('input[name="certification"]').val('');
    
    $('#certificationChackBox').show();
    document.getElementById('findIdBtn').classList.remove('disabled');
    document.getElementById('certificationBtn').classList.add('disabled');
    
    var showTime = document.getElementById('timeChack');
    
    count = setInterval(() => {
        time--;
        showTime.innerHTML = formatTime(time);
        
        if (time === 0) {
            clearInterval(count);
            document.getElementById('findIdBtn').classList.add('disabled');
            document.getElementById('certificationBtn').classList.remove('disabled');
            
            // 타임아웃 후 메서드 호출
            onTimeoutFunction();
        }
    }, 1000);
    
    // 2분(120초) 후 실행할 메서드 예약
    setTimeout(() => {
        onTimeoutFunction();
    }, 120000);
}


// 인증코드 입력 후 아이디 찾기 버튼 클릭 시 입력값 검사
function findUserInfo(){
	
	var code = document.getElementById('certificationCode');
	if(code.value === null || code.value === ''){
		name.classList.add('is-invalid');
		return;
	}
	findUserSubmit();
}

	
// 인증코드 확인 시 실행 함수
function findUserSubmit(){

    const params = {
			'authentication' : $('input[name="certification"]').val(),
			'idx' : $('input[name="idx"]').val(),
			'name' : $('input[name="name"]').val(), 
			'email' : $('input[name="email"]').val(),
			'type' : $('input[name="type"]').val()
		};

    const type = $('input[name="type"]').val();
		
	if (type === 'pw') {
        params['username'] = $('input[name="username"]').val(); // 비밀번호 찾기라면 username 추가
    }
    console.log('찾기 버튼 시 데이터 =>', params);
	
	httpAjax('POST', '/chackAuthCode', params);
}

// 비밀번호 변경 버튼 클릭 시 실행 함수 (유효성 검사)
function changePassword(){

	var passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+[\]{};':"\\|,.<>?]).{8,20}$/;

	var pw = $('input[name="password"]').val();
	
	if(!passwordRegex.test(pw)){
		$('#passMessage').show();
		return;
	}
	
	var params = {
		'password' : pw, 
		'username' : $('input[name="username"]').val()};
		
	console.log('비밀번호 변경 요청 데이터:', params);
	
	
	httpAjax('PUT', '/changePassword', params);
	
}



// 비밀번호 재입력 필드에서 이벤트 감지
document.getElementById("passReInput").addEventListener("input", () => {
    validatePasswords();
});

// 입력 비밀번호화 재입력 비밀번호가 같은지 체크하는 함수
function validatePasswords() {
    var password = $('input[name="password"]').val();
    var checkPassword = $('input[name="checkPassword"]').val();

    if (password === checkPassword) {
        $('#passChangeMessage').hide(); // 비밀번호 확인 메시지 숨기기
        return true; // 비밀번호가 같음
    } else {
        $('#passChangeMessage').show(); // 비밀번호 확인 메시지 보이기
        return false; // 비밀번호가 다름
    }
}

// 요청과 관련된 결과 가공 함수
function httpSuccess(response){

	console.log('받아온 값 !! => ',response); // 리턴값 있는지 확인!
	
	$('input[name="idx"]').val(response.idx);
	console.log(response.idx);
	
	// 존재하지 않은 사용자 or 잘못된 인증번호
	if(response.status === 404 || response.status === 400){
		alert(response.message);
		$('#certificationChackBox').hide();
		document.getElementById('findIdBtn').classList.add('disabled');
        document.getElementById('certificationBtn').classList.remove('disabled');
		clearInterval(count);
		
	}
	
	// 아이디 제공 페이지 이동
	if(response.status === 200){
		location.href = '/displayUserId/'+response.username;
	}
	
    // 비밀번호 변경 페이지 이동
	if(response.status === 202){
		location.href = '/changePassword/'+response.username;
	}
	
	if(response.status === 205){
		location.href = '/';
	}

}

// 2분 초과 시 요청 함수
function onTimeoutFunction() {
   // alert("시간 초과되었습니다. 다시 시도해주세요.");
    
    // 만료 시 서버로 요청 보내기
    var params = {
        'idx': $('input[name="idx"]').val()
    };
    
    httpAjax('PUT', '/timeoutAction', params);
}