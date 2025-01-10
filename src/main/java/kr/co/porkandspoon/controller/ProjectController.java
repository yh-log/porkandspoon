package kr.co.porkandspoon.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.ProjectDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ProjectService;
import kr.co.porkandspoon.util.CommonUtil;

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
	    List<ProjectDTO> list = projectService.getKanBanInfo(project_idx);
		ProjectDTO dto = projectService.getProjectInfo(project_idx);
		ModelAndView mav = new ModelAndView("/project/projectKanBan");
		
		 if (list == null) {
	        logger.warn("프로젝트 데이터가 존재하지 않습니다. 프로젝트 ID: " + project_idx);
	        mav.addObject("errorMessage", "프로젝트 데이터를 찾을 수 없습니다.");
	        mav.addObject("info", dto);
	        mav.addObject("idx", project_idx);
	    } else {
	        mav.addObject("list", list); // 명시적으로 이름 지정
	        mav.addObject("info", dto);
	        mav.addObject("idx", project_idx);
	    }
		return mav;
	}
	
	@PostMapping(value = "/project/saveTask")
	@ResponseBody
	public Map<String, Object> setTask(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestBody Map<String, String> params) {
	    
	    String loginId = userDetails.getUsername();
	    params.put("creater", loginId);
	    projectService.setTask(params);
	    String kanban_idx =CommonUtil.toString(params.get("kanban_idx"));
	   
	    // JSON 형식으로 응답 반환
	    Map<String, Object> response = new HashMap<>();
	    response.put("kanban_idx", kanban_idx);
	    response.put("message", "작업 저장 성공");

	    return response;
	}

	@PutMapping(value = "/project/updateStatus")
	@ResponseBody
	public Map<String, Object> editStatus(
			@AuthenticationPrincipal UserDetails userDetails,
			@RequestBody Map<String, String> params){
		 String loginId = userDetails.getUsername();
		 String project_idx = params.get("project_idx");
		 logger.info("프젝 idx"+project_idx);
		 String percent = projectService.getPercent(project_idx);
		 params.put("updater", loginId);
		 params.put("percent", percent);
		 int row =projectService.editStatus(params);
		 Map<String, Object> response = new HashMap<String, Object>();
		 response.put("row", row);
		 
		 
		 
		return response;
	}
	
}
