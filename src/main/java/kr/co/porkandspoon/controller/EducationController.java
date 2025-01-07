package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.EducationDTO;
import kr.co.porkandspoon.service.EducationService;
import kr.co.porkandspoon.util.CommonUtil;
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
	@GetMapping(value="/ad/educationUpdate/{no}")
	public ModelAndView educationUpdateView(@AuthenticationPrincipal CustomUserDetails user,@PathVariable int no) {
		
		String userName = user.getName();
		logger.info("로그인한 유저 이름 : "+userName);
		
		List<DeptDTO> dept = eduService.dept();
		EducationDTO dto = eduService.detail(no);
		ModelAndView mav = new ModelAndView("/education/educationUpdate");
		mav.addObject("info", dto);
		mav.addObject("dept", dept);
		
		return mav;
	}
	
	// 교육 수정 ajax
	@PutMapping(value="/educationUpdate")
	public Map<String,Object> educationUpdate(@RequestParam Map<String,Object> params){
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", eduService.educationUpdate(params));
		
		return result;
	}
	
	// 교육 디테일 이동
	@GetMapping(value="/ad/educationDetail/{no}")
	public ModelAndView educationDetailView(@AuthenticationPrincipal CustomUserDetails user,@PathVariable int no) {
			
		String userName = user.getName();
		logger.info("로그인한 유저 이름 : "+userName);
			
		List<DeptDTO> dept = eduService.dept();
		EducationDTO dto = eduService.detail(no);
		ModelAndView mav = new ModelAndView("/education/educationDetail");
		mav.addObject("info", dto);
		mav.addObject("dept", dept);
		
		// YouTube 동영상 ID 추출
        String videoId  = urlId(dto.getUrl());
        mav.addObject("videoId",videoId );
			
		return mav;
	}
	
	// 영상 url id 추출
	private String urlId(String url) {
		if (url == null || url.isEmpty()) {
	        return null;
	    }
	    String regex = "(?:https?:\\/\\/)?(?:www\\.)?(?:youtube\\.com\\/(?:watch\\?v=|embed\\/)|youtu\\.be\\/)([A-Za-z0-9_-]{11})";
	    java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex);
	    java.util.regex.Matcher matcher = pattern.matcher(url);
	    if (matcher.find()) {
	        String videoId = matcher.group(1);
	        logger.info(videoId);
	        return videoId;
	    }
	    logger.info("No Video ID found in URL: " + url);
	    return null;
    }
	
	// 교육 이수이력 등록
	@PostMapping(value="/educationHistory")
	public Map<String,Object> educationHistory(@RequestParam Map<String, Object> params, @AuthenticationPrincipal CustomUserDetails user){
		
		Map<String, Object> result = new HashMap<>();
		
		 // 교육 번호 가져오기
		 int no = Integer.parseInt(params.get("no").toString());
		 logger.info("교육 번호"+no);
		 // 현재 사용자 이름 가져오기
		 String username = user.getUsername();
		 logger.info("수강자 이름"+username);
		 // 이수 기록 등록
		 boolean success = eduService.educationHistory(no, username);
		        	        
		result.put("success", success);
	    
		return result;
	}
	
	// 교육 삭제
	@DeleteMapping(value="/eduDelete")
	public Map<String,Object> eduDelete(@RequestParam int no){
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", eduService.eduDelete(no));
		
		return result;
	}
	
	//수강 이력 히스토리
	@GetMapping(value="/eduHistory")
	public Map<String,Object> eduHistory(@RequestParam int no,@RequestParam String id){	
		Map<String,Object> result = new HashMap<String, Object>();
		List<EducationDTO> list = eduService.historyList(no,id);
		logger.info("수강 이력 : "+CommonUtil.toString(list));
		result.put("list", list);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	

}
