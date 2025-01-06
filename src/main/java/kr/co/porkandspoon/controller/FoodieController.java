package kr.co.porkandspoon.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.service.FoodieService;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@RestController
public class FoodieController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired FoodieService foodieService;

	@GetMapping(value="/foodielist/View")
	public ModelAndView foodielistView() {
		ModelAndView mav = new ModelAndView();
		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mav.addObject("userName",userDetails.getName());
		mav.setViewName("/foodie/foodieList");
		return mav;
	}
}
