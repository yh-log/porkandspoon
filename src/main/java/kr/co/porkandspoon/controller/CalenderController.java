package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.service.CalenderService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class CalenderController {
	
	@Autowired CalenderService calenderService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 일정 페이지 이동
	@GetMapping(value="/calender")
	public ModelAndView calenderView() {
		return new ModelAndView("/calender/calender");
	}
	
	// 일정 리스트 호출 ajax
	@GetMapping(value="/calenderList")
	public Map<String, Object> calenderList(){
		
		logger.info("일정 불러오기 실행");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", calenderService.calenderList());
		System.out.println(CommonUtil.toString(calenderService.calenderList()));
		
		return resultMap;
	}
	
	@PostMapping(value="/calenderWrite")
	public Map<String, Object> calenderWrite(@RequestParam Map<String, Object> params){
		
		logger.info("받아온 값 => " + params);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", calenderService.calenderWrite(params));
		
		return resultMap;
	}

}
