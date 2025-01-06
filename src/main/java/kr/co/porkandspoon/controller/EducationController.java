package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.EducationDTO;
import kr.co.porkandspoon.service.EducationService;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@RestController
public class EducationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired EducationService eduService;
	
	// 등록 리스트
	@GetMapping(value="/ad/education")
	public ModelAndView calenderView() {
		return new ModelAndView("/education/educationList");
	}
	
	// 교육 등록 뷰
	@GetMapping(value="/ad/educationWrite")
	public ModelAndView calenderWriteView(@AuthenticationPrincipal CustomUserDetails user) {
		
		String userName = user.getName();
		logger.info("로그인한 유저 이름 : "+userName);
		
		List<DeptDTO> dept = eduService.dept();
		
		ModelAndView mav = new ModelAndView("/education/educationWrite");
		mav.addObject("info", userName);
		mav.addObject("dept", dept);
		
		return mav;
	}
	
	// 교육 등록 ajax
	@PostMapping(value="/educationWrite")
	public Map<String,Object> educationWrite(@RequestParam Map<String,Object> params){
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", eduService.educationWrite(params));
		
		return result;
	}
	
	// 교육 리스트 ajax
	@GetMapping(value="/educationList")
	public Map<String,Object> educationList(@RequestParam Map<String,Object> params){
		
		logger.info("params : "+params);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("list", eduService.educationList(params));
		
		return result;
	}
	
	// 교육 수정 이동
	@GetMapping(value="/ad/educationUpdate")
	public ModelAndView educationUpdateView(@AuthenticationPrincipal CustomUserDetails user) {
		
		String userName = user.getName();
		logger.info("로그인한 유저 이름 : "+userName);
		
		List<DeptDTO> dept = eduService.dept();
		
		ModelAndView mav = new ModelAndView("/education/educationUpdate");
		
		mav.addObject("info", userName);
		mav.addObject("dept", dept);
		
		return mav;
	} 
	
	
	
	

}
