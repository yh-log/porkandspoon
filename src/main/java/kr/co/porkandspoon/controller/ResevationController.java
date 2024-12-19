package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ResevationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/resevation")
	public ModelAndView resevationView() {
		return new ModelAndView("/resevation/resevation");
	}

}
