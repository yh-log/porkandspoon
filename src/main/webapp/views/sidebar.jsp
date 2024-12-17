<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="sidebar">
	<div class="sidebar-wrapper active">
		<div class="sidebar-header position-relative">
			<div class="d-flex justify-content-between align-items-center">
				<div class="logo">
					<a href="index.html"><img src="resources/img/logo.jpg"
						alt="Logo" srcset=""></a>
				</div>
				
<%-- 				<div class="theme-toggle d-flex gap-2  align-items-center mt-2">
					<svg xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
						role="img" class="iconify iconify--system-uicons" width="20"
						height="20" preserveAspectRatio="xMidYMid meet"
						viewBox="0 0 21 21">
                    <g fill="none" fill-rule="evenodd"
							stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round">
                        <path
							d="M10.5 14.5c2.219 0 4-1.763 4-3.982a4.003 4.003 0 0 0-4-4.018c-2.219 0-4 1.781-4 4c0 2.219 1.781 4 4 4zM4.136 4.136L5.55 5.55m9.9 9.9l1.414 1.414M1.5 10.5h2m14 0h2M4.135 16.863L5.55 15.45m9.899-9.9l1.414-1.415M10.5 19.5v-2m0-14v-2"
							opacity=".3"></path>
                        <g transform="translate(-210 -1)">
                            <path d="M220.5 2.5v2m6.5.5l-1.5 1.5"></path>
                            <circle cx="220.5" cy="11.5" r="4"></circle>
                            <path
							d="m214 5l1.5 1.5m5 14v-2m6.5-.5l-1.5-1.5M214 18l1.5-1.5m-4-5h2m14 0h2"></path>
                        </g>
                    </g>
                </svg>
					<div class="form-check form-switch fs-6">
						<input class="form-check-input  me-0" type="checkbox"
							id="toggle-dark" style="cursor: pointer"> <label
							class="form-check-label"></label>
					</div>
					<svg xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true"
						role="img" class="iconify iconify--mdi" width="20" height="20"
						preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24">
                    <path fill="currentColor"
							d="m17.75 4.09l-2.53 1.94l.91 3.06l-2.63-1.81l-2.63 1.81l.91-3.06l-2.53-1.94L12.44 4l1.06-3l1.06 3l3.19.09m3.5 6.91l-1.64 1.25l.59 1.98l-1.7-1.17l-1.7 1.17l.59-1.98L15.75 11l2.06-.05L18.5 9l.69 1.95l2.06.05m-2.28 4.95c.83-.08 1.72 1.1 1.19 1.85c-.32.45-.66.87-1.08 1.27C15.17 23 8.84 23 4.94 19.07c-3.91-3.9-3.91-10.24 0-14.14c.4-.4.82-.76 1.27-1.08c.75-.53 1.93.36 1.85 1.19c-.27 2.86.69 5.83 2.89 8.02a9.96 9.96 0 0 0 8.02 2.89m-1.64 2.02a12.08 12.08 0 0 1-7.8-3.47c-2.17-2.19-3.33-5-3.49-7.82c-2.81 3.14-2.7 7.96.31 10.98c3.02 3.01 7.84 3.12 10.98.31Z">
                    </path>
                </svg>
				</div>
				<div class="sidebar-toggler  x">
					<a href="#" class="sidebar-hide d-xl-none d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div> --%>
				
				
			</div>
		</div>
		<div class="sidebar-menu">
			<ul class="menu">
				<li class="sidebar-item active "><a href="index.html"
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
						<li class="submenu-item  "><a
							href="form-editor-ckeditor.html" class="submenu-link">전사문서함</a></li>
						<li class="submenu-item  "><a
							href="form-editor-summernote.html" class="submenu-link">결재할
								문서</a></li>
						<li class="submenu-item  "><a href="form-editor-tinymce.html"
							class="submenu-link">나의 문서함</a></li>
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


				<li class="sidebar-item  has-sub"><a href="#"
					class='sidebar-link'> <i class="bi bi-bar-chart-fill"></i> <span>브랜드
							관리</span>
				</a>

					<ul class="submenu ">
						<li class="submenu-item  "><a href="ui-widgets-chatbox.html"
							class="submenu-link">직영점 리스트</a></li>

						<li class="submenu-item  "><a href="ui-widgets-pricing.html"
							class="submenu-link">매출 통계</a></li>

						<li class="submenu-item  "><a href="ui-widgets-todolist.html"
							class="submenu-link">브랜드 리스트</a></li>
					</ul></li>

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
					</ul></li>

			</ul>
		</div>
	</div>
</div>