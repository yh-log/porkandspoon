package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class EducationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/education")
	public ModelAndView calenderView() {
		return new ModelAndView("/education/education");
	}

}
