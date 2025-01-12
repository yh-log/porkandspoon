package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
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
import org.thymeleaf.util.Validate;

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
		String project_idx =CommonUtil.toString(params.get("project_idx"));
		projectService.setProjectPeoloe(project_idx,loginId);
		return new ModelAndView("redirect:/project/List");
	}
	
	@GetMapping(value = "/project/getUserInfo/{userId}")
	public UserDTO getUserInfo(@PathVariable String userId) {
		
		return projectService.getUserInfo(userId);
	}
	
	
	@GetMapping(value="/project/Update/{project_idx}")
	public ModelAndView projectUpdateView(@PathVariable String project_idx) {
		ProjectDTO dto = projectService.getProjectInfo(project_idx);
		ModelAndView mav = new ModelAndView("/project/projectUpdate");
		mav.addObject("info",dto);
		return mav;
	}
	
	@PostMapping(value = "/project/Update")
	public ModelAndView eiditProject(@AuthenticationPrincipal UserDetails userDetails,
			@RequestParam Map<String, String> params) {
		String loginId = userDetails.getUsername();
		projectService.eiditProject(params);
		
		return new ModelAndView("redirect:/project/List");
	}
	
	@GetMapping(value = "/project/List")
	public ModelAndView projectListView(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam(value = "includeCompleted", defaultValue = "true") boolean includeCompleted,
	    @RequestParam(value = "includeInProgress", defaultValue = "true") boolean includeInProgress,
	    @RequestParam(value = "is_open", defaultValue = "true") boolean isOpen,
	    @RequestParam(value = "search", required = false) String searchKeyword) {

	    String loginId = userDetails.getUsername();
	    logger.info("isOpen "+isOpen);
	    // 필터 조건에 따른 프로젝트 목록 가져오기
	    List<ProjectDTO> list = projectService.getProject(loginId, includeCompleted, includeInProgress, isOpen, searchKeyword);

	    ModelAndView mav = new ModelAndView("/project/projectList");
	    mav.addObject("list", list);
	    mav.addObject("loginId", loginId);
	    mav.addObject("includeCompleted", includeCompleted);
	    mav.addObject("includeInProgress", includeInProgress);
	    mav.addObject("is_open", isOpen); // is_open 값 전달
	    mav.addObject("searchKeyword", searchKeyword); // 검색어 전달
	    return mav;
	}
	
	@GetMapping(value="/project/KanBan/{project_idx}")
	public ModelAndView projectKanBanView(@PathVariable String project_idx) {
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
	    String project_idx = params.get("project_idx");
	    String kanban_idx =CommonUtil.toString(params.get("kanban_idx"));
	    String percent = projectService.getPercent(project_idx);
		projectService.editPercent(percent,project_idx);
		
	    // JSON 형식으로 응답 반환
	    Map<String, Object> response = new HashMap<>();
	    response.put("kanban_idx", kanban_idx);
	    response.put("percent", percent);
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
		 params.put("updater", loginId);
		 int row =projectService.editStatus(params);
		 
		 String percent = projectService.getPercent(project_idx);
		 projectService.editPercent(percent,project_idx);
		 Map<String, Object> response = new HashMap<String, Object>();
		 response.put("row", row);
		 response.put("percent", percent);
		 
		 
		return response;
	}
	
	
	
}
