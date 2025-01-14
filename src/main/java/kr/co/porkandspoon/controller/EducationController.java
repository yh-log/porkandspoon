package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
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
import kr.co.porkandspoon.dto.NoticeDTO;
import kr.co.porkandspoon.service.AlarmService;
import kr.co.porkandspoon.service.EducationService;
import kr.co.porkandspoon.util.CommonUtil;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@RestController
public class EducationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired EducationService eduService;
	@Autowired AlarmService alarmService;
	
	// 등록 리스트 뷰
	@GetMapping(value="/mo/education")
	public ModelAndView calenderView() {
		return new ModelAndView("/education/educationList");
	}
	
	// 교육 등록 뷰
	@GetMapping(value="/mo/educationWrite")
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
		
		// 교육 알림
//		NoticeDTO dto = new NoticeDTO();
//		dto.setContent((String) params.get("url"));
//		dto.setCode_name("ml005");
//		alarmService.saveAlarm(dto);
		
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
	@GetMapping(value="/mo/educationUpdate/{no}")
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
	
	// 매니저 교육 디테일 이동
	@GetMapping(value="/mo/educationDetail/{no}")
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
	
	// 유저 교육 디테일 이동
	@GetMapping(value="/us/educationDetail/{no}")
	public ModelAndView educationDetailViewUser(@AuthenticationPrincipal CustomUserDetails user,@PathVariable int no) {
			
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
	
	// 교육 이수이력 등록 ajax
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
	
	// 교육 삭제 ajax
	@DeleteMapping(value="/eduDelete")
	public Map<String,Object> eduDelete(@RequestParam int no){
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", eduService.eduDelete(no));
		
		return result;
	}
	
	//수강 이력 히스토리 ajax
	@GetMapping(value="/eduHistory")
	public Map<String,Object> eduHistory(@RequestParam Map<String,Object> params){
		logger.info("다 나오니!!! : "+params);
		Map<String,Object> result = new HashMap<String, Object>();
		List<EducationDTO> list = eduService.historyList(params);
		logger.info("수강 이력 : "+CommonUtil.toString(list));
		result.put("list", list);
		
		return result;
	}
	
	// 직영점주가 보는 뷰
	@GetMapping(value="/us/education")
	public ModelAndView mEducation() {
				
		ModelAndView mav = new ModelAndView("/education/education");
	
		return mav;
	}
	
	// 교육 리스트 ajax
	@GetMapping(value="/eEducationList")
	public Map<String,Object> eEducationList(@RequestParam Map<String,Object> params,@AuthenticationPrincipal CustomUserDetails user){
		
		String username = user.getUsername();
		logger.info("로그인한 아이디 : "+username);
		params.put("username", username);
		
		logger.info("params : "+params);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("list", eduService.eEducationList(params));
		
		return result;
	}
	
	// 이수증 발급
	@GetMapping(value="/completion")
	public Map<String,Object> completion(@RequestParam int no,@AuthenticationPrincipal CustomUserDetails user){
		
		String username = user.getUsername();
		logger.info("로그인한 아이디랑 교육번호 : "+username+no);
		EducationDTO dto = eduService.completion(no,username);
		LocalDateTime time = dto.getEducation_date();
		String education_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
		dto.setReCreate_date(education_date);
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("list", dto);
	
		return result;
	}
	
	
	
	
	
	
	

}
