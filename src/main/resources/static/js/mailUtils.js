	console.log('mailUtils연결tnd');
	// 다중 읽음 처리
	function changeToRead() {
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		changeToReadAjax(checkedIdx,function(){
        	location.reload();
		});
	}
	// 다중 읽음 처리ajax
	function changeToReadAjax(checkedIdx,afterAction){
		$.ajax({
        	type : 'PUT',
	        url : '/mail/changeToRead',
	        data: JSON.stringify({ 
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json', 
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	afterAction();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	// 개별 안읽음 처리(detail페이지에서)
	function changeToUnread(idx) {

		$.ajax({
        	type : 'PUT',
	        url : '/mail/changeToUnread',
	        data: { 
	        	'idx': idx 
        	}, 
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
    			$('.util-area .btn.unread').css('display','none');
				$('.util-area .btn.read').css('display','inline-block');
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	
	// 다중 삭제 처리(휴지통)
	function moveToTrash() {
		removeAlert();
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		moveToTrashAjax(checkedIdx, function(){location.reload();});
	}
	
	function moveToTrashAjax(checkedIdx, afterAction){
		$.ajax({
        	type : 'PUT',
	        url : '/mail/moveToTrash',
	        data: JSON.stringify({
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json',
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	afterAction();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	
	//다중 영구삭제 처리
	function completeDelete() {
		removeAlert();
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		$.ajax({
        	type : 'PUT',
	        url : '/mail/completeDelete',
	        data: JSON.stringify({
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json',
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	location.reload();	
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	
	//다중 삭제취소 기능
	function restoreFromTrash() {
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		restoreFromTrashAjax(checkedIdx,function(){
			layerPopup('메일이 복구되었습니다.', '확인', false, function(){location.reload();}, removeAlert);
		});
	}
	
	// 다중 삭제취소 기능 요청ajax
	function restoreFromTrashAjax(checkedIdx,afterAction){
		$.ajax({
        	type : 'PUT',
	        url : '/mail/restoreFromTrash',
	        data: JSON.stringify({
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json',
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	afterAction();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	
	// 다중 북마크 토글
	function toggleBookmark(reloadYn){
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedList = [];
		for (var checkedEl of checkedEls) {
			console.log('book마크태그',$(checkedEl).siblings('#listBookmark'));
			console.log('book마크여부',$(checkedEl).siblings('#listBookmark').data('bookmark'));
			var mailInfo = {};
			mailInfo.idx = $(checkedEl).parents('.mail-item').data('idx');
			mailInfo.is_bookmark = $(checkedEl).siblings('#listBookmark').data('bookmark');
			checkedList.push(mailInfo);
		}
		
		toggleBookmarkAjax(checkedList, function(){
			if(reloadYn == 'Y'){
				location.reload();	
			}else{
				for (var checkedItem of checkedList) {
					var is_bookmark = checkedItem.is_bookmark == 'Y' ? 'N' : 'Y';
					var bookmarkEl = $('.mail-item[data-idx="'+checkedItem.idx+'"] #listBookmark');
					$(bookmarkEl).attr('data-bookmark', is_bookmark);
					$(bookmarkEl).toggleClass('bi-star-fill bi-star');
					$('.list-area .form-check-input').prop('checked', false);
				}
			}
		});
	}
	
	function toggleBookmarkAjax(checkedList, afterAction){
		console.log("AfterAction 전달됨: ", typeof afterAction);
		$.ajax({
        	type : 'PUT',
	        url : '/mail/toggleBookmark',
	        data: JSON.stringify({
	        	'checkedList': checkedList 
        	}), 
	        contentType: 'application/json',
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	console.log("Success 호출됨");
	            if (typeof afterAction === 'function') {
	                afterAction(); // 전달된 익명 함수가 실행됨
	            } else {
	                console.error("AfterAction이 함수가 아님!");
	            }
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}
	
	// 개별 북마크 토글
	$(document).on('click', '#listBookmark', function() {
		var thisEl = $(this);
		var checkedList = [
			{idx : $(thisEl).parents('.mail-item').data('idx'),
			is_bookmark : $(thisEl).data('bookmark')}
		];
		toggleBookmarkAjax(checkedList, function(){
			if(listType == 'bk'){
				location.reload();
			}else{
				var is_bookmark = $(thisEl).attr('data-bookmark') == 'Y' ? 'N' : 'Y';
				$(thisEl).attr('data-bookmark',is_bookmark);
				$(thisEl).toggleClass('bi-star-fill bi-star');
			}
		});
    });
	
	// 다시보내기 (재전송)
	function resend() {
		var checkedEls = $('.list-area .form-check-input:checked');
		var checkedIdx = [];
		for (var checkedEl of checkedEls) {
			checkedIdx.push($(checkedEl).parents('.mail-item').data('idx'));
		}
		console.log("checkedEls : ", checkedEls);
		console.log("checkedIdx : ", checkedIdx);
		
		$.ajax({
        	type : 'POST',
	        url : '/mail/resend',
	        data: JSON.stringify({ 
	        	'idxList': checkedIdx 
        	}), 
	        contentType: 'application/json', 
	        dataType : 'JSON',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader(csrfHeader, csrfToken);
	        },
	        success : function(response){
	        	location.reload();
	        },error: function(e){
	            console.log(e);
	        }
	    });
	}