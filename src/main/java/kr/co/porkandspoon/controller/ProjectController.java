package kr.co.porkandspoon.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
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
		logger.info("params :{}",params);
		String loginId = userDetails.getUsername();
		params.put("updater", loginId);
		projectService.editProject(params);
		
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
	
	@GetMapping("/project/List/More")
	@ResponseBody
	public String loadMoreProjects(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam("page") int page,
	    @RequestParam(value = "includeCompleted", defaultValue = "true") boolean includeCompleted,
	    @RequestParam(value = "includeInProgress", defaultValue = "true") boolean includeInProgress,
	    @RequestParam(value = "is_open", defaultValue = "true") boolean isOpen,
	    @RequestParam(value = "search", required = false) String searchKeyword) {

	    String loginId = userDetails.getUsername();
	    int pageSize = 10; // 한 페이지당 프로젝트 수
	    int offset = (page - 1) * pageSize;

	    // 데이터 로드
	    List<ProjectDTO> list = projectService.getProjectScroll(loginId, includeCompleted, includeInProgress, isOpen, searchKeyword, offset, pageSize);

	    // JSP의 일부를 렌더링하여 반환
	    ModelAndView mav = new ModelAndView("/project/projectListFragment");
	    mav.addObject("list", list);
	    return mav.getViewName(); // JSP 이름 반환
	}
	
	
	@GetMapping(value="/project/KanBan/{project_idx}")
	public ModelAndView projectKanBanView(@AuthenticationPrincipal UserDetails userDetails,
			@PathVariable String project_idx) {
		logger.info("프젝idx"+project_idx);
	    List<ProjectDTO> list = projectService.getKanBanInfo(project_idx);
		ProjectDTO dto = projectService.getProjectInfo(project_idx);
		String loginId = userDetails.getUsername();
		UserDTO userDTO = projectService.getUserInfo(loginId);
		List<UserDTO> users = projectService.getUsersInfo(loginId,project_idx);
		logger.info("가지고 왔니? {}",userDTO);
	
		
		 ModelAndView mav = new ModelAndView("/project/projectKanBan");
		    mav.addObject("list", list != null ? list : Collections.emptyList());
		    mav.addObject("info", dto);
		    mav.addObject("idx", project_idx);
		    mav.addObject("userDTO", userDTO);
		    mav.addObject("projectUsers", users); // 프로젝트에 속한 모든 사용자 정보 추가
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
	
	
	@PostMapping("/project/registerApprovalLines")
	@ResponseBody
	public Map<String, Object> setPeople(@RequestBody ProjectDTO request) {
	    // 응답 데이터를 담을 Map
	    Map<String, Object> response = new HashMap<>();
	    logger.info("받은 요청 데이터: {}", request);

	    try {
	        // DTO에서 데이터 추출
	        String project_idx = request.getProject_idx(); // 프로젝트 ID 가져오기
	        List<String> approvalLines = request.getApprovalLines(); // 결재자 목록 가져오기

	        logger.info("projectIdx: {}", project_idx);
	        logger.info("approvalLines: {}", approvalLines);

	        projectService.deletePeople(project_idx);
	        
	        // 결재자 저장 로직
	        for (String username : approvalLines) {
	            // 서비스 메서드 호출하여 DB 저장
	            projectService.saveApprovalLine(project_idx, username);
	        }

	        // 성공 응답 데이터
	        response.put("status", "success");
	        response.put("message", "등록 성공");
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 실패 응답 데이터
	        response.put("status", "error");
	        response.put("message", "등록 실패: " + e.getMessage());
	    }

	    return response; // Map 형태로 응답 반환
	}

	@DeleteMapping(value = "/project/Delete")
	@ResponseBody
	public Map<String, Object> delProject(@RequestBody Map<String, Object> data) {
	    String project_idx = CommonUtil.toString(data.get("project_idx"));
	    projectService.delProject(project_idx);

		return null;
	}
}
