document.addEventListener('DOMContentLoaded', function () {
    var firstMenu = document.getElementById('firstMenu');
    var secondMenu = document.getElementById('secondMenu');
    var thirdMenu = document.getElementById('thirdMenu');
    var subMenuSubject = document.getElementById('subMenuSubject');
	
    // firstMenu 리스트 클릭 이벤트 추가
    firstMenu.addEventListener('click', function () {
    	firstMenu.classList.add('active'); // active class 추가
    	secondMenu.classList.remove('active'); // active class 제거
    	thirdMenu.classList.remove('active');
        subMenuSubject.innerHTML = firstMenu.textContent.trim();
    });
	
    // seconMenu 리스트 클릭 이벤트 추가
    secondMenu.addEventListener('click', function () {
    	secondMenu.classList.add('active'); // active class 추가
        firstMenu.classList.remove('active'); // active class 제거
        thirdMenu.classList.remove('active');
        subMenuSubject.innerHTML = secondMenu.textContent.trim();
    });
    
    // thirdMenu 리스트 클릭 이벤트 추가
    thirdMenu.addEventListener('click', function(){
    	thirdMenu.classList.add('active');
    	firstMenu.classList.remove('active');
    	secondMenu.classList.remove('active');
    	subMenuSubject.innerHTML = thirdMenu.textContent.trim();
    });
	
    firstMenu.click();
});


