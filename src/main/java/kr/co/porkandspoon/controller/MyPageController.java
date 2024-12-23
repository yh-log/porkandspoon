package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/ad/myPage")
	public ModelAndView myPageView() {
		return new ModelAndView("/myPage/myPage");
	}
	
	@GetMapping(value="/ad/myPage/Update")
	public ModelAndView myPageUpdateView() {
		return new ModelAndView("/myPage/myPageUpdate");
	}
	
	@GetMapping(value="/ad/myPageSign")
	public ModelAndView myPageSignView() {
		return new ModelAndView("/myPage/myPageSign");
	}
	
	@GetMapping(value="/ad/myPageBuy/List")
	public ModelAndView myPageBuyListView() {
		return new ModelAndView("/myPage/myPageBuyList");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/list")
	public ModelAndView tripListView() {
		return new ModelAndView("/myPage/businessTripList");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/write")
	public ModelAndView tripWriteView() {
		return new ModelAndView("/myPage/businessTripWrite");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/update")
	public ModelAndView tripUpdateView() {
		return new ModelAndView("/myPage/businessTripUpdate");
	}
	
		
	
}
