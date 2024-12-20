package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class UserController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * author yh.kim (24.12.18) 
	 * 직원 리스트 이동
	 */
	@GetMapping(value="/ad/user/list")
	public ModelAndView userListView() {
		return new ModelAndView("/user/userList");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 부서 리스트 이동
	 */
	@GetMapping(value="/ad/dept/list")
	public ModelAndView deptListView() {
		return new ModelAndView("/user/deptList");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 인사이동 리스트 이동
	 */
	@GetMapping(value="/ad/employeeTransfer")
	public ModelAndView employeeTransferView() {
		return new ModelAndView("/user/employeeTransfer");
	}

	/**
	 * author yh.kim (24.12.18) 
	 * 직원 등록 페이지 이동
	 */
	@GetMapping(value="/ad/user/write")
	public ModelAndView userWriteView() {
		return new ModelAndView("/user/userWrite");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 직원 상세 페이지 이동
	 */
	@GetMapping(value="/ad/user/detail")
	public ModelAndView userDetailView() {
		return new ModelAndView("/user/userDetail");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직원 수정 페이지 이동
	 */
	@GetMapping(value="/ad/user/update")
	public ModelAndView userUpdateView() {
		return new ModelAndView("/user/userUpdate");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 아이디 찾기 페이지 이동
	 */
	@GetMapping(value="/findUserId")
	public ModelAndView findUserIdView() {
		return new ModelAndView("/login/findUserId");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 비밀번호 찾기 페이지 이동
	 */
	@GetMapping(value="/findPassword")
	public ModelAndView findPasswordView() {
		return new ModelAndView("/login/findPassword");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 비밀번호 변경 페이지 이동
	 */
	@GetMapping(value="/changePassword")
	public ModelAndView changePasswordView() {
		return new ModelAndView("/login/changePassword");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 아이디 제공 페이지 이동
	 */
	@GetMapping(value="/displayUserId")
	public ModelAndView displayUserIdView() {
		return new ModelAndView("/login/displayUserId");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 부서 상세 페이지 이동
	 */
	@GetMapping(value="/ad/dept/detail")
	public ModelAndView deptDetailView() {
		return new ModelAndView("/user/deptDetail");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 부서 등록 페이지 이동
	 */
	@GetMapping(value="/ad/dept/write")
	public ModelAndView deptWriteView() {
		return new ModelAndView("/user/deptWrite");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 부서 수정 페이지 이동
	 */
	@GetMapping(value="/ad/dept/update")
	public ModelAndView deptUpdateView() {
		return new ModelAndView("/user/deptUpdate");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직영점 작성 페이지 이동
	 */
	@GetMapping(value="/ad/store/write")
	public ModelAndView storeWriteView() {
		return new ModelAndView("/user/storeWrite");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직영점 수정 페이지 이동
	 */
	@GetMapping(value="/ad/store/update")
	public ModelAndView storeUpdateView() {
		return new ModelAndView("/user/storeUpdate");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직영점 상세 페이지 이동
	 */
	@GetMapping(value="/ad/store/detail")
	public ModelAndView storeDetailView() {
		return new ModelAndView("/user/storeDetail");
	}
	
	
}
