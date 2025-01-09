package kr.co.porkandspoon.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	
	@Value("${upload.path}") String paths;
	

	@GetMapping(value="/main")
	public ModelAndView mainView(@AuthenticationPrincipal UserDetails userDetails, HttpSession session) {
		return new ModelAndView("/main");
	}

}
