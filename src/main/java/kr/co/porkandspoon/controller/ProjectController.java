package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ProjectService;

@RestController
public class ProjectController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ProjectService projectService;
	
	@GetMapping(value="/ad/project/Write")
	public ModelAndView projectWriteView(@AuthenticationPrincipal UserDetails userDetails) {
		String loginId = userDetails.getUsername();
		logger.info(loginId);
		ModelAndView mav = new ModelAndView("/project/projectWrite");
		UserDTO userDTO = projectService.getUserInfo(loginId);
		logger.info("가지고 왔니? {}",userDTO);
		mav.addObject("userDTO", userDTO);
		
		return mav;
	}
	
	@GetMapping(value = "/ad/project/getUserInfo/{userId}")
	public UserDTO getUserInfo(@PathVariable String userId) {
		
		return projectService.getUserInfo(userId);
	}
	
	
	@GetMapping(value="/ad/project/Update")
	public ModelAndView projectUpdateView() {
		return new ModelAndView("/project/projectUpdate");
	}
	
	@GetMapping(value="/ad/project/List")
	public ModelAndView projectListView() {
		return new ModelAndView("/project/projectList");
	}
	
	@GetMapping(value="/ad/project/KanBan")
	public ModelAndView projectKanBanView() {
		return new ModelAndView("/project/projectKanBan");
	}
	
	
	
	
	
}
