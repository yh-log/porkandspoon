package kr.co.porkandspoon.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.ProjectDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ProjectService;

@RestController
public class ProjectController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ProjectService projectService;
	
	@GetMapping(value="/project/Write")
	public ModelAndView projectWriteView(@AuthenticationPrincipal UserDetails userDetails) {
		String loginId = userDetails.getUsername();
		logger.info(loginId);

		
		ModelAndView mav = new ModelAndView("/project/projectWrite");
		
		UserDTO userDTO = projectService.getUserInfo(loginId);
		logger.info("가지고 왔니? {}",userDTO);
		mav.addObject("userDTO", userDTO);
		
		return mav;
	}
	
	@PostMapping(value = "/project/Write")
	public ModelAndView setProject(@AuthenticationPrincipal UserDetails userDetails,@RequestParam Map<String, String> params) {
		String loginId = userDetails.getUsername();
		logger.info(loginId);
		params.put("username", loginId);
	
		projectService.setProject(params);
		return new ModelAndView("redirect:/project/List");
	}
	
	@GetMapping(value = "/project/getUserInfo/{userId}")
	public UserDTO getUserInfo(@PathVariable String userId) {
		
		return projectService.getUserInfo(userId);
	}
	
	
	@GetMapping(value="/project/Update")
	public ModelAndView projectUpdateView() {
		return new ModelAndView("/project/projectUpdate");
	}
	
	@GetMapping(value="/project/List")
	public ModelAndView projectListView(@AuthenticationPrincipal UserDetails userDetails) {
		String loginId = userDetails.getUsername();
		List<ProjectDTO> list = projectService.getProject(loginId);
		ModelAndView mav = new ModelAndView("/project/projectList");
		
		mav.addObject("list",list);
		mav.addObject("loginId",loginId);
		return mav;
	}
	
	@GetMapping(value="/project/KanBan/{project_idx}")
	public ModelAndView projectKanBanView(@PathVariable int project_idx) {
		logger.info("프젝idx"+project_idx);
		ProjectDTO dto = projectService.getKanBanInfo(project_idx);
		ModelAndView mav = new ModelAndView("/project/projectKanBan");
		return mav;
	}
	
	
	
	
	
}
