
	
	function deptOverlay(){
		var deptCode = $('input[name="id"]').val();
		var regex = /^[A-Z]{2}[0-9]{4}$/;
		
		if(regex.test(deptCode)){
			var dto = {'id' : deptCode};
			getAjax('/ad/user/deptCodeOverlay', 'JSON', dto);
			$('#overlayMessage').hide();
		}else {
			$('#overlayMessage').show();
        	$('#overlayMessage').text('대문자 2, 숫자 4 형태로 입력하세요');
        	$('#overlayMessage').css('color', 'var(--bs-danger)');
		}
	}


	function getSuccess(response){
		if(response.status == 200){
			deptCodeOverlay = true;
			$('#overlayMessage').show();
        	$('#overlayMessage').text(response.message);
        	$('#overlayMessage').css('color', 'var(--bs-primary)');
		}else{
			deptCodeOverlay = false;
			$('#overlayMessage').show();
        	$('#overlayMessage').text(response.message);
        	$('#overlayMessage').css('color', 'var(--bs-danger)');
		}
	}
	
	function validateForm() {
	    var requiredFields = document.querySelectorAll('[data-required="true"]');
	    var isValid = true;

	    requiredFields.forEach(function(field) {
	        if (!field.value.trim()) { // 값이 없으면
	            field.classList.add('is-invalid'); // 클래스 추가
	            isValid = false; // 한 번이라도 유효하지 않으면 false
	        } else {
	            field.classList.remove('is-invalid'); // 유효하면 클래스 제거
	        }
	    });

	    return isValid; // 최종 결과 반환
	}
	
	function deptWrire(){
		var isFormValid = validateForm();

		if (isFormValid) {
            console.log('폼이 유효합니다.');

	        var deptCode = document.getElementById("deptCode");
	        
	        if(!deptCodeOverlay){
	        	$('#overlayMessage').show();
	    		$('#overlayMessage').css('color', 'var(--bs-danger)');
	    		$('#overlayMessage').text('부서 코드 중복을 확인해주세요');
	    		
	    		deptCode.classList.add('is-invalid');
	    		removeAlert();
	    		
	        }else{
		        deptCode.classList.remove('is-invalid');
		        
		        textEaditorWrite('/ad/dept/write');
		        removeAlert();
	        }
            
		}
	}
	
	function deptUpdate(){
		var isFormValid = validateForm();
		removeAlert();
		
		if (isFormValid) {
            console.log('폼이 유효합니다.');
			textEaditorWrite('/ad/dept/update');
	        var deptCode = document.getElementById("deptCode");
	        
	        if(!deptCodeOverlay){
	        	$('#overlayMessage').show();
	    		$('#overlayMessage').css('color', 'var(--bs-danger)');
	    		$('#overlayMessage').text('부서 코드 중복을 확인해주세요');
	    		
	    		deptCode.classList.add('is-invalid');
	    		removeAlert();
	    		
	        }else{
		        deptCode.classList.remove('is-invalid');
		       
		        removeAlert();
	        }
            
		}
	}
	
	function storeWrire(){
		var isFormValid = validateForm();
		removeAlert();
		
		if (isFormValid) {
            console.log('폼이 유효합니다.');
			textEaditorWrite('/ad/store/write');
	        var deptCode = document.getElementById("deptCode");
	        
	        if(!deptCodeOverlay){
	        	$('#overlayMessage').show();
	    		$('#overlayMessage').css('color', 'var(--bs-danger)');
	    		$('#overlayMessage').text('부서 코드 중복을 확인해주세요');
	    		
	    		deptCode.classList.add('is-invalid');
	    		removeAlert();
	    		
	        }else{
		        deptCode.classList.remove('is-invalid');
		       
		        removeAlert();
	        }
            
		}
	}
	
	function storeUpdate(){
		var isFormValid = validateForm();
		removeAlert();
		
		if (isFormValid) {
            console.log('폼이 유효합니다.');
			textEaditorWrite('/ad/store/update');
    		removeAlert();
	    		
	        }else{
		       console.log('폼이 유효하지 않습니다.');
		        removeAlert();
	        }
		
	}
	
	// 값을 변경하면 중복 확인 상태를 초기화
	function handleInputChange() {
		var deptCode = document.getElementById("deptCode");
	    deptCodeOverlay = false; 
	    deptCode.classList.add('is-invalid');
	    $('#overlayMessage').hide(); 
	}
	
	function fileSuccess(response){
		console.log('결과');
	}