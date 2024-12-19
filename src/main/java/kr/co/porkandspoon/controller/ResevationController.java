package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ResevationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 예약하기(캘린더) 이동
	@GetMapping(value="/resevation")
	public ModelAndView resevationView() {
		return new ModelAndView("/resevation/resevation");
	}
	
	// 자원리스트(ad권한만) 이동
	@GetMapping(value="/ad/resevation/list")
	public ModelAndView resevationListView() {
		return new ModelAndView("/resevation/resevationList");
	}
	
	// 회의실 등록 이동
	@GetMapping(value="/ad/room/Write")
	public ModelAndView roomWrtieView() {
		return new ModelAndView("/resevation/roomWrite");
	}

}
