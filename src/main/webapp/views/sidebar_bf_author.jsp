<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar">
	<div class="sidebar-wrapper active">
		<div class="sidebar-header position-relative">
			<div class="d-flex justify-content-between align-items-center">
				<div class="logo">
					<a href="index.html"><img src="/resources/img/logo.jpg"
						alt="Logo" srcset=""></a>
				</div>
			</div>
		</div>
		<div class="sidebar-menu">
			<ul class="menu">
				<!-- <li class="sidebar-item active "><a href="index.html"
					class='sidebar-link'> <i class="bi bi-envelope-fill"></i> <span>사내메일</span>
				</a></li>

				<li class="sidebar-item"><a href="#" class='sidebar-link'>
						<i class="bi bi-chat-left-dots-fill"></i> <span>메신저</span>
				</a></li>

				<li class="sidebar-item"><a href="#" class='sidebar-link'>
						<i class="bi bi-calendar-check-fill"></i> <span>캘린더</span>
				</a></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-clock-fill"></i> <span>예약</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item"><a href="layout-default.html"
							class="submenu-link">회의실 예약</a></li>
						<li class="submenu-item"><a
							href="layout-vertical-1-column.html" class="submenu-link">물품
								예약</a></li>
						<li class="submenu-item"><a
							href="layout-vertical-navbar.html" class="submenu-link">자원 관리</a>
						</li>
					</ul></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-chat-left-text-fill"></i>
						<span>게시판</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item"><a href="form-element-input.html"
							class="submenu-link">게시판</a></li>

						<li class="submenu-item  "><a
							href="form-element-input-group.html" class="submenu-link">라이브러리</a>
						</li>

						<li class="submenu-item  "><a href="form-element-select.html"
							class="submenu-link">맛집 지도</a></li>

						<li class="submenu-item  "><a href="form-element-radio.html"
							class="submenu-link">투표</a></li>
					</ul></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-chat-left-text-fill"></i>
						<span>프로젝트</span>
				</a>
					<ul class="submenu ">
						<li class="submenu-item  "><a
							href="form-validation-parsley.html" class="submenu-link">프로젝트
								리스트</a></li>
						<li class="submenu-item  "><a
							href="form-validation-parsley.html" class="submenu-link">프로젝트
								등록/수정</a></li>
					</ul></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-clipboard-check-fill"></i>
						<span>문서함</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item  "><a href="form-editor-quill.html"
							class="submenu-link">결재 작성</a></li>
						<li class="submenu-item  "><a href="form-editor-tinymce.html"
							class="submenu-link">나의 문서함</a></li>
						<li class="submenu-item  "><a
							href="form-editor-ckeditor.html" class="submenu-link">부서문서함</a></li>
					</ul></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-people-fill"></i> <span>인사관리</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item  "><a href="table-datatable.html"
							class="submenu-link">직원리스트</a></li>
						<li class="submenu-item  "><a
							href="table-datatable-jquery.html" class="submenu-link">직원 등록</a>
						</li>
						<li class="submenu-item  "><a
							href="table-datatable-jquery.html" class="submenu-link">인사 이동</a>
						</li>
						<li class="submenu-item  "><a
							href="table-datatable-jquery.html" class="submenu-link">부서 관리</a>
						</li>
					</ul></li>
				-->

					
				<!--

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-bar-chart-fill"></i> <span>매장
							관리</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item  "><a
							href="ui-icons-bootstrap-icons.html" class="submenu-link">매장직원
								리스트</a></li>
						<li class="submenu-item  "><a
							href="ui-icons-fontawesome.html" class="submenu-link">매출 등록</a></li>
						<li class="submenu-item  "><a href="ui-icons-dripicons.html"
							class="submenu-link">휴점 신청</a></li>
						<li class="submenu-item  "><a href="ui-icons-dripicons.html"
							class="submenu-link">매출 통계</a></li>
					</ul></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-mortarboard-fill"></i> <span>교육</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item  "><a href="ui-chart-chartjs.html"
							class="submenu-link">교육 등록</a></li>
						<li class="submenu-item  "><a href="ui-chart-apexcharts.html"
							class="submenu-link">수강 기록</a></li>
						<li class="submenu-item  "><a href="ui-chart-apexcharts.html"
							class="submenu-link">교육수강 리스트</a></li>
					</ul></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-person-fill"></i> <span>나의
							정보</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item  "><a href="ui-map-google-map.html"
							class="submenu-link">나의 정보</a></li>
						<li class="submenu-item  "><a href="ui-map-jsvectormap.html"
							class="submenu-link">출장</a></li>
						<li class="submenu-item  "><a href="ui-map-jsvectormap.html"
							class="submenu-link">서명 관리</a></li>
						<li class="submenu-item  "><a href="ui-map-jsvectormap.html"
							class="submenu-link">구매/사용 기록</a></li>
					</ul></li>

				<li class="sidebar-item"><a href="#" class='sidebar-link'>
						<i class="bi bi-diagram-3-fill"></i> <span>조직도</span>
				</a></li>

				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-credit-card-fill"></i> <span>구내식당</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item"><a href="#" class="submenu-link">식권
								구매</a></li>
						<li class="submenu-item"><a href="#" class="submenu-link">식단표</a>
						</li>
						<li class="submenu-item"><a href="#" class="submenu-link">상품
								등록/수정</a></li>
					</ul></li> -->

			</ul>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	console.log('dddddaaa');
	$.ajax({
		type:'GET',
		url:'/sidebar',
		data:{},
		datatype:'JSON',
		success:function(data){
			console.log(data.menuList);
			drawMenu(data.menuList);
            
		},
		error:function(e){
			console.log(e);
		}
	});
	
	
	
	function drawMenu(menuList){
		var content ='';
		for (var menu of menuList) {
			
				content +='<li class="sidebar-item'; 
				if(menu.childMenus.length > 0){
					content +=' has-sub">';
					content +='<a class=\"sidebar-link\"> ';
				}else{
					content +='">';
					content +='<a href="'+menu.depth1_url+'" class=\"sidebar-link\"> ';
				}
				content +='<i class="bi bi-person-fill"></i> ';
				content +='<span>'+menu.depth1_name+'</span></a>';
				console.log('menu.childMenus.length : ',menu.childMenus.length);
				if(menu.childMenus.length > 0){
					for (var menu2 of menu.childMenus) {
						content +='<ul class="submenu ">';
						content +='<li class="submenu-item ">';
						content +='<a href="'+menu2.depth2_url+'" class="submenu-link">'+menu2.depth2_name+'</a>';
						content +='</li>';
						content +='</ul>';
					}
				}
			
			content +='</li>';
			
			
		  }
	     $('.sidebar-menu .menu').append(content);
	}
	
	$(document).on('click','li.has-sub > a',function(){
		console.log('click!!');
		$(this).siblings('.submenu').toggleClass('submenu-open submenu-close');
	});
</script>