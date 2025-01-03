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

import kr.co.porkandspoon.dto.RestDTO;
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

import kr.co.porkandspoon.dto.ManageDTO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.service.ManageService;

@RestController
public class ManageController {
	
	@Autowired ManageService manageService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
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
	public List<Map<String, Object>> getPartTime(@AuthenticationPrincipal UserDetails userDetails) {
	    String owner = userDetails.getUsername();
	    List<ManageDTO> list = manageService.getPartTime(owner);

	    List<Map<String, Object>> response = new ArrayList<>();

	    for (ManageDTO schedule : list) {
	        try {
	            java.sql.Date joinDate = schedule.getJoin_date(); // 입사일
	            if (joinDate == null) {
	                System.err.println("Join Date is null for: " + schedule.getPart_name());
	                continue;
	            }

	            LocalDate joinLocalDate = joinDate.toLocalDate(); // LocalDate로 변환
	            DayOfWeek workDay = mapDayOfWeek(schedule.getWork_date()); // 요일 변환
	            LocalDate workDate = joinLocalDate.with(TemporalAdjusters.nextOrSame(workDay)); // 입사일 기준으로 계산

	            // 디버깅 로그
	            System.out.println("Processing schedule for: " + schedule.getPart_name());
	            System.out.println("Join Date: " + joinLocalDate);
	            System.out.println("Calculated Work Date: " + workDate);

	            if (!workDate.isBefore(joinLocalDate)) { // 조건 수정
	                Map<String, Object> event = new HashMap<>();
	                event.put("title", schedule.getPart_name());
	                event.put("daysOfWeek", List.of(workDay.getValue() % 7));
	                event.put("startTime", schedule.getStart_time().toString());
	                event.put("endTime", schedule.getEnd_time().toString());
	                response.add(event);
	            }
	        } catch (Exception e) {
	            System.err.println("Error processing schedule for " + schedule.getPart_name() + ": " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
	    return response;
	}


	// 요일 매핑 함수
	private DayOfWeek mapDayOfWeek(String workDate) {
	    switch (workDate) {
	        case "월": return DayOfWeek.MONDAY;
	        case "화": return DayOfWeek.TUESDAY;
	        case "수": return DayOfWeek.WEDNESDAY;
	        case "목": return DayOfWeek.THURSDAY;
	        case "금": return DayOfWeek.FRIDAY;
	        case "토": return DayOfWeek.SATURDAY;
	        case "일": return DayOfWeek.SUNDAY;
	        default: throw new IllegalArgumentException("Invalid work date: " + workDate);
	    }
	}

	
	
	//휴점
	
	@GetMapping(value="/ad/rest/List")
	public ModelAndView restListView() {
		return new ModelAndView("/manage/restList");
	}
	
	@GetMapping(value="/ad/rest/Write")
	public ModelAndView restWriteView() {

		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		ModelAndView mav = new ModelAndView("/manage/restWrite");
		mav.addObject("userName",userDetails.getName());
		mav.addObject("userRole",userDetails.getAuthorities());

		return mav;
	}
	
	@GetMapping(value="/ad/rest/Update")
	public ModelAndView restUpdateView() {
		return new ModelAndView("/manage/restUpdate");
	}


	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록
	 */
	@PostMapping(value = "/ma/rest/write")
	public RestDTO restWrite(@ModelAttribute RestDTO restDTO){

		logger.info(CommonUtil.toString(restDTO));

		return null;
	}

}
