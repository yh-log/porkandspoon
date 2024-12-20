package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ApprovalService;

@RestController
public class ApprovalController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService approvalService;
	
	@GetMapping(value="/approval/write/{loginId}")
	public ModelAndView draftView(@PathVariable String loginId, HttpSession session) {
		
		// check!!! 나중에 바꾸기 (java에서 가져오기(시큐리티))
		//String loginId = (String) session.getAttribute("loginId");
		logger.info("userId : "+loginId);
		ModelAndView mav = new ModelAndView("/approval/draftWrite");  
		mav.addObject("userDTO", approvalService.getUserInfo(loginId));
		return mav;
	}

//	@GetMapping(value="/approvalUserInfo/{loginId}")
//	public Map<String, Object> getUserInfo(@PathVariable String loginId, HttpSession session) {
//		Map<String, Object> result = new HashMap<String, Object>();
//		// check!!! 나중에 바꾸기 (java에서 가져오기(시큐리티))
//		//String loginId = (String) session.getAttribute("loginId");
//		logger.info("userId : "+loginId);
//		result.put("userDTO", approvalService.getUserInfo(loginId));
//		return result;
//	}
	
	@PostMapping(value="/draftWrite")
	public ModelAndView draftWrite(@RequestParam Map<String, String> params) {
		ModelAndView mav = new ModelAndView("/approval/draftDetail");
		approvalService.draftWrite();
		return mav;
	}
	
	
}
