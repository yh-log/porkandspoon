
	
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
		if(response.status === 202){
			deptCodeOverlay = true;
			$('#overlayMessage').show();
        	$('#overlayMessage').text(response.message);
        	$('#overlayMessage').css('color', 'var(--bs-primary)');
		}else if(response.status === 400 || response.status === 500){
			deptCodeOverlay = false;
			$('#overlayMessage').show();
        	$('#overlayMessage').text(response.message);
        	$('#overlayMessage').css('color', 'var(--bs-danger)');
		}else if(response.status === 200){
			let newRow = [response.name, response.dept_name, response.position,  '<div onclick="chartTableDelete(this, \'' + response.username + '\', \'' + response.name + '\', \'' + response.parent + '\')"><i class="bi bi-trash3"></i></div>'];

			// 기존 rows에 추가
			exampleData.rows.push(newRow);

			// 테이블 업데이트 (id가 'customTable'인 테이블에 적용)
			updateTableData('customTable', exampleData);

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
	        }
            
		}else{
			removeAlert();
			layerPopup('필수값을 입력해주세요.', '확인', false, removeAlert, removeAlert);
		}
	}
	
	function deptUpdate(){
		var isFormValid = validateForm();

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
		removeAlert();
		console.log('결과', response);
		if(response.status === 200){
			location.href = '/ma/dept/detail/' + response.id;
		}else if(response.status === 202){
			location.href = 'ma/store/list';
		}
	}

	// 선택된 username 삭제
	function chartTableDelete(element, username, name, dept) {
		console.log('삭제 실행 ', username);

		// 1. 해당 버튼의 부모 tr 요소 찾기
		const row = element.closest('tr'); // 호출된 버튼을 기준으로 tr 찾기

		// 2. 행 삭제
		if (row) {
			row.remove(); // 테이블에서 해당 행 삭제
		}

		// 3. exampleData.rows에서 해당 username에 해당하는 데이터 제거
		exampleData.rows = exampleData.rows.filter(function (row) {
			return row[3].indexOf(username) === -1; // username과 일치하지 않는 데이터만 남김
		});

		// 4. 테이블 데이터 업데이트
		updateTableData('customTable', exampleData);

		console.log('삭제 완료!');
	}



