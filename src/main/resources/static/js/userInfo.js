    // 년도 추가 (1900년부터 현재년도까지)
    var currentYear = new Date().getFullYear();
    var yearSelect = document.getElementById("birthYear");
    for (let year = 1900; year <= currentYear; year++) {
        let option = document.createElement("option");
        option.value = year;
        option.textContent = year;
        yearSelect.appendChild(option);
    }

    // 월 추가 (1월부터 12월까지)
    var monthSelect = document.getElementById("birthMonth");
    for (let month = 1; month <= 12; month++) {
        let option = document.createElement("option");
        option.value = month;
        option.textContent = month;
        monthSelect.appendChild(option);
    }

    // 일 추가 (1일부터 31일까지)
    var daySelect = document.getElementById("birthDay");
    for (let day = 1; day <= 31; day++) {
        let option = document.createElement("option");
        option.value = day;
        option.textContent = day;
        daySelect.appendChild(option);
    }
    
    // 핸드폰 번호
    document.getElementById('inputFieldPhone').addEventListener('input', function (e) {
        var regExp = /^[0-9]*$/; // 숫자만 허용
        var input = e.target.value;

        // 숫자가 아닌 문자가 입력되었으면 제거
        if (!regExp.test(input)) {
            e.target.value = input.replace(/[^0-9]/g, '');
        }

        // 길이가 11자리를 초과하면 잘라냄
        if (e.target.value.length > 11) {
            e.target.value = e.target.value.substring(0, 11);
        }
    });
    
    // 사내번호
    document.getElementById('inputFieldComNum').addEventListener('input', function (e) {
        var regExp = /^[0-9]*$/; // 숫자만 허용
        var input = e.target.value;

        // 숫자가 아닌 문자가 입력되었으면 제거
        if (!regExp.test(input)) {
            e.target.value = input.replace(/[^0-9]/g, '');
        }
    });
    
    // 아이디 중복 체크 여부
    var usernameCheck = false;
    
    function usernameOverlay(){
    	var username = $('input[name="username"]').val();
        var regExp = /^[a-zA-Z0-9]*$/; // 숫자와 영어만 허용하는 정규식

        // 정규식 만족 여부 확인
        if (regExp.test(username)) {
            var dto = { 'username': username };
            console.log('실행', dto);
            getAjax('/ad/user/overlay', 'JSON', dto);
        } else {
        	$('#overlayMessage').show();
        	$('#overlayMessage').text('숫자와 영어만 입력 가능합니다.');
        	$('#overlayMessage').css('color', 'var(--bs-danger)');
        }
    }
    
     function getSuccess(response){
    	 console.log(response);
    	
    	// 아이디 중복체크
	   if(response.status == 200){
		   	usernameCheck = true;
		   	$('#overlayMessage').show();
		   	$('#overlayMessage').text(response.message);
		   	$('#overlayMessage').css('color', 'var(--bs-primary)');
	   }else if(response.status == 400){
		   	usernameCheck = false;
		   	$('#overlayMessage').show();
		   	$('#overlayMessage').css('color', 'var(--bs-warning)');
		   	$('#overlayMessage').text(response.message);
	   }
    	
    	// 부서 등록
    	var deptSelect = document.getElementById('deptSelect');
    	
    	response.forEach(dept => {
    	    var option = document.createElement('option');
    	    option.value = dept.id; 
    	    option.textContent = dept.text;

    	    deptSelect.appendChild(option);
    	});
    	
    } 
    
    function httpSuccess(response){
    	console.log(response);
    	
    	if(response.status == 202){
    	
    		// 프로필 이미지 URL 설정
	        if (response.profile) { // response에서 profileImage URL이 있을 경우
	            document.getElementById('userProfile').src = '/photo/' + response.profile;
	        } else {
	            // 기본 이미지 설정 (이미지가 없을 경우)
	            document.getElementById('userProfile').src = '/resource/img/logo.jpg';
	        }
    	
	    	 $('#name-value').val(response.name);
	    	 $('#person_num-value').val(response.person_num);
	    	 $('#username').val(response.username);
	    	 $('#inputFieldPhone').val(response.phone);
	    	 $('#inputFieldComNum').val(response.company_num);
	    	 $('#roadAddress').val(response.address);
	    	 $('#join_date-value').val(response.join_date);
	    	 
	    	 var deptElement = document.getElementById('deptSelect');
	    	 deptElement.value = response.parent;
	    	 
	    	 
	    	 var positionElement = document.getElementById('position-select');
	  		 positionElement.value = response.position;
	  		 
	  		 var titleElement = document.getElementById('title-select');
	  		 titleElement.value = response.title;
	  		 
	  		 var genderElement = document.getElementById('gender-select');
	  		 genderElement.value = response.gender;
	  		 
	  		 var emailStr = response.email.split('@');
	  		 var emailFirst = emailStr[0];
	  		 var emailAddr = '@' + emailStr[1];
	  		 console.log(emailAddr);
	  		 
	  		 $('#emailFirst').val(emailFirst);
	  		 var emailAddrElement = document.getElementById('emailAddr');
	  		 emailAddrElement.value = emailAddr;
	  		 
	  		 var birth = response.birth.split('/');
	  		 birthYear.value = birth[0];
	  		 birthMonth.value = birth[1];
	  		 birthDay.value = birth[2];
	  		
	  		 var careerData = response.career;

		     careerData.forEach((item) => {
	             // 타입에 따라 행을 찾음
	             var row;
	             if (item.type === 'education') {
	                 row = document.querySelector('input[name="type"][value="education"]').closest('tr');
	             } else if (item.type === 'career') {
	                 row = document.querySelector('input[name="type"][value="career"]').closest('tr');
	             } else if (item.type === 'qualification') {
	                 row = document.querySelector('input[name="type"][value="qualification"]').closest('tr');
	             }
	          
	             if (row) {
	                 // 데이터 매핑
	                 if (item.start_date) row.querySelector('input[name="start_date"]').value = item.start_date;
	                 if (item.end_date) row.querySelector('input[name="end_date"]').value = item.end_date;
	                 if (item.subject) row.querySelector('input[name="subject"]').value = item.subject;
	                 if (item.content) {
	                     let contentElement = row.querySelector('select[name="content"], input[name="content"]');
	                     if (contentElement) contentElement.value = item.content;
	                 }
	             } else {
	                 console.warn(`타입 ${item.type}에 해당하는 행을 찾을 수 없습니다.`);
	             }
	         });
        
    	}
    }
     
    
    
    function validateForm() {
        // data-required="true"가 있는 필드만 선택
        var requiredFields = document.querySelectorAll('[data-required="true"]');
        var isValid = true;

        requiredFields.forEach(function(field) {
            if (!field.value.trim()) { // 값이 없으면
                field.classList.add('is-invalid'); // 클래스 추가
                isValid = false;
            } else {
                field.classList.remove('is-invalid'); // 유효하면 클래스 제거
            }
        });

        return isValid; // 전체 유효성 결과 반환
    }
    
    
    function processFormData() {
        // 모든 hidden 필드 선택
        var hiddenFields = document.querySelectorAll('input[type="hidden"][name="type"]');
        var groupedData = []; // 그룹 데이터를 저장할 배열 (career 안에 모두 포함)

        hiddenFields.forEach(hiddenField => {
            var type = hiddenField.value; // hidden 필드의 value (education, career, qualification)

            // 해당 그룹의 다른 필드 가져오기
            var groupFields = hiddenField.closest('tr').querySelectorAll('input:not([type="hidden"]), select');

            // 그룹별 데이터를 담기 위한 객체
            const groupData = { type: type }; // type 필드를 먼저 추가

            groupFields.forEach(field => {
                if (field.value.trim() !== '') { // 값이 비어있지 않을 경우만 추가
                    var fieldName = field.name; // 필드 이름
                    var fieldValue = field.value; // 필드 값
                    groupData[fieldName] = fieldValue; // 이름: 값으로 추가
                }
            });

            // 값이 있는 경우만 배열에 추가
            if (Object.keys(groupData).length > 1) { // type 외에 다른 데이터가 있을 경우만 추가
                groupedData.push(groupData); // career 배열에 데이터 추가
            }
        });

        var result = { career: groupedData }; // career 키로 묶어서 반환
        console.log(result); // 결과 출력
        return result;
    }



    // 제출 버튼 클릭 시 호출
    function userWrite() {
        var isFormValid = validateForm();
        
        
        if (isFormValid) {
            console.log('폼이 유효합니다.');
            
	        var form = document.querySelector('form');
	        var formData = new FormData(form);
	        
	        formData.append('address', $('input[name="address"]').val());
	        
	        var email = $('input[name="emailInfo"]').val() + document.getElementById('emailAddr').value;
	        formData.append('email', email);
	        
	        var birthYear = document.getElementById("birthYear").value;
	        var birthMonth = document.getElementById("birthMonth").value;
	        var birthDay = document.getElementById("birthDay").value;
	
	        
	        var birth = birthYear + '/' + birthMonth + '/' + birthDay;
	        formData.append('birth', birth);
	            
	        var jsonData = processFormData();
	        formData.append('careerStr', JSON.stringify(jsonData));
			
	        	
	        for (var pair of formData.entries()) {
	            console.log(pair[0] + ': ' + pair[1]);
	        }
	        
	        if(!usernameCheck){
	        	$('#overlayMessage').show();
	    		$('#overlayMessage').css('color', 'var(--bs-danger)');
	    		$('#overlayMessage').text('아이디 중복체크를 진행해주세요');
	    		
	    		var username = document.getElementById("username");
	    		username.classList.add('is-invalid');
	    		
	        }else{
		        fileAjax('POST', '/ad/user/write', formData);
		        username.classList.remove('is-invalid');
	        }
            
        } else {
            console.log('폼에 잘못된 값이 있습니다.');
        }
    }
    
    function userUpdate(){
    	var isFormValid = validateForm();
        
        
        if (isFormValid) {
            console.log('폼이 유효합니다.');
            
	        var form = document.querySelector('form');
	        var formData = new FormData(form);
	        
	        formData.append('address', $('input[name="address"]').val());
	        formData.append('username', $('input[name="username"]').val());
	        
	        var email = $('input[name="emailInfo"]').val() + document.getElementById('emailAddr').value;
	        formData.append('email', email);
	        
	        var birthYear = document.getElementById("birthYear").value;
	        var birthMonth = document.getElementById("birthMonth").value;
	        var birthDay = document.getElementById("birthDay").value;
	
	        
	        var birth = birthYear + '/' + birthMonth + '/' + birthDay;
	        formData.append('birth', birth);
	            
	        var jsonData = processFormData();
	        formData.append('careerStr', JSON.stringify(jsonData));
			
	        	
	        for (var pair of formData.entries()) {
	            console.log(pair[0] + ': ' + pair[1]);
	        }
	        
		    fileAjax('PUT', '/ad/user/update', formData);
            
            
        } else {
            console.log('폼에 잘못된 값이 있습니다.');
        }
    }
    
function fileSuccess(response){

	if(response.status == 200){
		alert(response.message);
	}
	
}
    