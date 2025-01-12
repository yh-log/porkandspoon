package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dao.UserDAO;
import kr.co.porkandspoon.dto.MenuDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ApprovalService;
import kr.co.porkandspoon.service.MailService;
import kr.co.porkandspoon.service.MainService;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@RestController
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Autowired MainService mainService;
	@Autowired MailService mailService;
	@Autowired ApprovalService approvalService;
	@Autowired UserDAO userDao;
	@Value("${upload.path}") String paths;
	

	@GetMapping(value="/main")
	public ModelAndView mainView(HttpSession session) {
		ModelAndView mav = new ModelAndView("/main");
		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String loginId = userDetails.getUsername();
		// 미확인 메일
		int unreadMail = mailService.unreadMailCount(loginId);
		// 결재할 문서
		int haveToApprove = approvalService.haveToApproveCount(loginId);
		// 프로필이미지
		UserDTO userInfo = userDao.userDetail(loginId);
		mav.addObject("name", userDetails.getName()); 
		mav.addObject("userInfo", userInfo); 
		mav.addObject("unreadMail", unreadMail);
		mav.addObject("haveToApprove", haveToApprove);
		return mav;
	}
	
	@GetMapping(value="/sidebar")
	public Map<String, Object> getMenu() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<MenuDTO> menuList = mainService.getMenu();
		logger.info("menuList :::::"+menuList);
		result.put("menuList", menuList);
		CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		result.put("userRole",userDetails.getAuthorities()); // 권한
		return result;
	}

	@GetMapping(value="/header")
	public Map<String, Object> getUserInfo(@AuthenticationPrincipal UserDetails userDetails) {
		Map<String, Object> result = new HashMap<String, Object>();
		String loginId = userDetails.getUsername();
		// 유저정보
		result.put("userInfo",userDao.userDetail(loginId)); 
		return result;
	}
	
	
	
	// check!!권한 체크 서버로 부터 가져와서 if문으로 처리하기
//	@GetMapping(value="/checkAuthority")
//	public Map<String, Object> checkAuthority(){
//		Map<String, Object> result = new HashMap<String, Object>();
//		CustomUserDetails userDetails = (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		result.put("userName",userDetails.getName()); // 이름
//		result.put("userRole",userDetails.getAuthorities()); // 권한
//		return result;
//	}

}
