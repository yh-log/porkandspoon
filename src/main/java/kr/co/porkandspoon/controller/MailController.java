package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.service.ApprovalService;

@RestController
public class MailController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService approvalService;

	// 받은 메일함 view
	@GetMapping(value="/mail/list/receive")
	public ModelAndView receiveMailListView() {
		ModelAndView mav = new ModelAndView("/mail/mailList");  
		return mav;
	}

	// 메일작성 view
	@GetMapping(value="/mail/write")
	public ModelAndView MailWriteView() {
		ModelAndView mav = new ModelAndView("/mail/mailWrite");  
		return mav;
	}
	
	// 메일 상세페이지 view
	@GetMapping(value="/mail/detail")
	public ModelAndView MailDetailView() {
		ModelAndView mav = new ModelAndView("/mail/mailDetail");  
		return mav;
	}
	
	// 메일작성시 수신자 자동완성
	//@GetMapping(value = "/json", produces="text/plain;charset=UTF-8")
	//public String json(Locale locale, Model model) {    
		/*ObjectMapper objectMapper = new ObjectMapper();
		String[] array = {"엽기떡볶이", "신전떡볶이", "걸작떡볶이", "신당동떡볶이"}; // 배열 생성
	    
	    String userList = "";
		try {
			userList = objectMapper.writeValueAsString(array);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

	    return userList; 
	    */
		
		
		
	//}
	
}
