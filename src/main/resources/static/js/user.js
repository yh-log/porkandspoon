
var time; // 2분
	
function formatTime(seconds){
	var minutes = Math.floor(seconds/60); // 분 계산 
	var secs = seconds % 60; // 초 계산 (초를 60으로 나눈 나머지)
	
	return minutes + ' : ' + secs;
	
};

function certificationSubmit(){
	time = 120;
	var params = {'name' : $('input[name="name"]').val(), 'email' : $('input[name="email"]').val()};
	
	httpAjax('POST', '/sendMail', params);
	
	$('#certificationChackBox').show();
	document.getElementById('findIdBtn').classList.remove('disabled');
	document.getElementById('certificationBtn').classList.add('disabled');
	
	var showTime = document.getElementById('timeChack');
	
	var count = setInterval(() => {
		
		time--;
		showTime.innerHTML = formatTime(time);
		
		if(time == 0){
			clearInterval(count);
			document.getElementById('findIdBtn').classList.add('disabled');
			document.getElementById('certificationBtn').classList.remove('disabled');
		}
	}, 1000)
}
	
function findUserId(){
	
	var params = {
			'authentication' : $('input[name="certification"]').val(),
			'username' : $('input[name="username"]').val(),
			'name' : $('input[name="name"]').val(), 
			'email' : $('input[name="email"]').val()	
		};
	
	httpAjax('POST', '/chackAuthCode', params);
}
	
		
function httpSuccess(response){

	console.log(response);
	
	if(response.status !== null){
		alert(response.message);
	}
	
	// 아이디 제공 페이지 이동
	if(response.status === 201){
		location.href = '/displayUserId';
	}
	
	// 비밀번호 변경 페이지 이동
	if(response.status === 202){
		location.href = '/changePassword';
	}
	
	if(response.status === 205){
		location.href = '/';
	}
	
	
}