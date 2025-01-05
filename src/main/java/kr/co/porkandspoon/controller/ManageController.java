package kr.co.porkandspoon.controller;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.porkandspoon.dao.UserDAO;
import kr.co.porkandspoon.dto.*;
import kr.co.porkandspoon.util.CommonUtil;
import kr.co.porkandspoon.util.security.CustomUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.service.ManageService;

@RestController
public class ManageController {
	
	@Autowired ManageService manageService;

	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private UserDAO userDAO;

	// 매장관리홈
	@GetMapping(value="/ad/spotManage")
	public ModelAndView spotManageView() {
		return new ModelAndView("/manage/spotManage");
	}
	
	@GetMapping(value="/ad/directManage")
	public ModelAndView directManageView() {
		return new ModelAndView("/manage/directManage");
	}
	
	@GetMapping(value="/ad/brandManage")
	public ModelAndView brandManageView() {
		return new ModelAndView("/manage/brandManage");
	}
	
	
	
	//아르바이트
	@GetMapping(value="/ad/part")
	public ModelAndView partListView() {
		return new ModelAndView("/manage/partList");
	}
	
	@GetMapping(value="/ad/part/List")
	public Map<String, Object> getPartList(String pg,  String count, String opt, String keyword) {
		int page = Integer.parseInt(pg);
	    int cnt = Integer.parseInt(count);
	    int limit = cnt;
	    int offset = (page - 1) * cnt;
	    int totalPages = manageService.count(cnt, opt, keyword);
	    
	    List<ManageDTO> list = manageService.getPartList(opt, keyword, limit, offset);

	    // 로그 출력
	    logger.info("opt: {}", opt);
	    logger.info("keyword: {}", keyword);

	    Map<String, Object> result = new HashMap<>();
	    result.put("totalPages", totalPages);
	    result.put("currpage", page);
	    result.put("list", list);

	    return result;
	}
	
	@GetMapping(value="/ad/part/Quit")
	public ModelAndView partQuitListView() {
		return new ModelAndView("/manage/partQuitList");
	}
	
	@GetMapping(value="/ad/part/QuitList")
	public Map<String, Object> getPartQuitList(String pg,  String count, String opt, String keyword) {
		int page = Integer.parseInt(pg);
	    int cnt = Integer.parseInt(count);
	    int limit = cnt;
	    int offset = (page - 1) * cnt;
	    int totalPages = manageService.Quitcount(cnt, opt, keyword);
	    
	    List<ManageDTO> list = manageService.getPartQuitList(opt, keyword, limit, offset);

	    // 로그 출력
	    logger.info("opt: {}", opt);
	    logger.info("keyword: {}", keyword);

	    Map<String, Object> result = new HashMap<>();
	    result.put("totalPages", totalPages);
	    result.put("currpage", page);
	    result.put("list", list);

	    return result;
	}
	
	
	
	@GetMapping(value="/ad/part/Write")
	public ModelAndView partWriteView() {
		return new ModelAndView("/manage/partWrite");
	}
	
	@PostMapping(value = "/ad/part/Write")
	public ModelAndView setPartWrite(
		@AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam Map<String, String> params,
	    @RequestParam("work_date[]") List<String> workDates,
	    @RequestParam("start_time[]") List<String> startTimes,
	    @RequestParam("end_time[]") List<String> endTimes
	) {
	    // 기본 정보 저장
		String creater = userDetails.getUsername();
		params.put("creater", creater);
		
		logger.info("근무 요일 : {}",workDates);
		logger.info("시작 시간 : {}",startTimes);
		logger.info("종료 시간 : {}",endTimes);
		
		
	    manageService.setPartWrite(params, workDates, startTimes, endTimes);
	    return new ModelAndView("/manage/partWrite");
	}
	
	@GetMapping(value="/ad/part/Detail/{part_idx}")
	public ModelAndView partDetail(@PathVariable int part_idx) {
		ManageDTO dto =  manageService.partDetail(part_idx);
		List<ManageDTO>  list =  manageService.scheduleDetail(part_idx);
		
		ModelAndView mav = new ModelAndView("/manage/partDetail");
		mav.addObject("info",dto);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@GetMapping(value="/ad/part/Update/{part_idx}")
	public ModelAndView partUpdateView(@PathVariable int part_idx) {
		ManageDTO dto =  manageService.partDetail(part_idx);
		List<ManageDTO>  list =  manageService.scheduleDetail(part_idx);
		
		ModelAndView mav = new ModelAndView("/manage/partUpdate");
		mav.addObject("info",dto);
		mav.addObject("list",list);
		
		return mav;
	}
	
	@PostMapping(value = "/ad/part/Update")
	public ModelAndView editPart(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam Map<String, String> params,
	    @RequestParam("work_date[]") List<String> workDates,
	    @RequestParam("start_time[]") List<String> startTimes,
	    @RequestParam("end_time[]") List<String> endTimes
	) {
	   
	    logger.info("params : {}",params);
	    
	    String updater = userDetails.getUsername();
	    params.put("updater", updater);
	    String part_idx = params.get("part_idx");
	    logger.info(part_idx);

	    manageService.editPart(params, workDates, startTimes, endTimes);

	    return new ModelAndView("redirect:/ad/part/Detail/" + part_idx);
	}

	@GetMapping(value = "/ad/partSchedule")
	public ModelAndView partScheduleView() {
		return new ModelAndView("/manage/partSchedule");
	}
	
	
	@GetMapping(value = "/ad/getPartTime")
	public List<ManageDTO> getPartTime(@AuthenticationPrincipal UserDetails userDetails) {
	    String owner = userDetails.getUsername();
	    List<ManageDTO> list = manageService.getPartTime(owner);

	   
	    return list;
	}


	// 요일 매핑 함수
	@PostMapping(value = "ad/addPartHistory")
	public void addPartHistory(@RequestParam Map<String, String> params) {
		manageService.addPartHistory(params);
		
	}
	
	
	//휴점
	
	@GetMapping(value="/us/rest/listView")
	public ModelAndView restListView() {
		return new ModelAndView("/manage/restList");
	}


	@GetMapping(value="/ad/rest/Update")
	public ModelAndView restUpdateView() {
		return new ModelAndView("/manage/restUpdate");
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 페이지 이동
	 */
	@GetMapping(value="/us/rest/write")
	public ModelAndView restWriteView() {

		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		UserDTO userDTO = manageService.getUserStoreInfo(username);

		ModelAndView mav = new ModelAndView("/manage/restWrite");
		mav.addObject("name",userDetails.getName());
		mav.addObject("username", username);
		mav.addObject("userDTO",userDTO);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록
	 */
	@PostMapping(value = "/us/rest/write")
	public RestDTO restWrite(@ModelAttribute RestDTO restDTO, @RequestParam("imgsJson") String imgsJson){

		logger.info(CommonUtil.toString(restDTO));
		logger.info(CommonUtil.toString(imgsJson));

		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;

		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			restDTO.setImgs(imgs);

			restDTO = manageService.restWrite(restDTO);

		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정 페이지 이동
	 */
	@GetMapping(value="/us/rest/update/{rest_idx}")
	public ModelAndView restUpdateView(@PathVariable String rest_idx) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		ModelAndView mav = new ModelAndView("/manage/restUpdate");
		mav.addObject("getRest", manageService.getRestDetail(rest_idx));
		mav.addObject("username", username);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 상세 페이지 이동
	 */
	@GetMapping(value="/us/rest/detail/{rest_idx}")
	public ModelAndView restDetailView(@PathVariable String rest_idx) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		ModelAndView mav = new ModelAndView("/manage/restDetail");
		mav.addObject("getRest", manageService.getRestDetail(rest_idx));
		mav.addObject("username", username);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정
	 */
	@PostMapping(value="/ma/rest/update")
	public RestDTO restUpdate(@ModelAttribute RestDTO restDTO, @RequestParam("imgsJson") String imgsJson) {
		logger.info(CommonUtil.toString(restDTO));
		logger.info(CommonUtil.toString(imgsJson));

		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;

		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			restDTO.setImgs(imgs);

			restDTO = manageService.restUpdate(restDTO);

		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 비활성화
	 */
	@DeleteMapping(value="/us/rest/delete")
	public RestDTO restDelete(@ModelAttribute RestDTO restDTO){

		restDTO = manageService.restDelete(restDTO);

		return restDTO;
	}


	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 리스트 조회
	 */
	@GetMapping(value="/us/rest/list")
	public List<RestDTO> restList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "cnt", defaultValue = "10") int cnt,
			@RequestParam(defaultValue = "", value = "option") String option,
			@RequestParam(defaultValue = "", value="keyword") String keyword){


		List<RestDTO> restDTOS = manageService.restList(page, cnt, option, keyword);

		return restDTOS;
	}

}
