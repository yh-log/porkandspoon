package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.service.CalenderService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class CalenderController {
	
	@Autowired CalenderService calenderService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 일정 페이지 이동
	@GetMapping(value="/calender")
	public ModelAndView calenderView() {
		return new ModelAndView("/calender/calender");
	}
	
	// 일정 리스트 호출 ajax
	@GetMapping(value="/calenderList")
	public Map<String, Object> calenderList(@AuthenticationPrincipal UserDetails userDetails){
		
		String loginId = userDetails.getUsername(); // 로그인 한 유저의 아이디
		String dept = calenderService.dept(loginId); // 로그인 한 유저의 부서
		logger.info("부서 정보"+CommonUtil.toString(dept));
		logger.info("일정 불러오기 실행");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", calenderService.calenderList(loginId,dept));
		System.out.println(CommonUtil.toString(calenderService.calenderList(loginId,dept)));
		
		return resultMap;
	}
	
	// 일정 등록 ajax
	@PostMapping(value="/calenderWrite")
	public Map<String, Object> calenderWrite(@RequestBody CalenderDTO calederDto,@AuthenticationPrincipal UserDetails userDetails){
		String loginId = userDetails.getUsername();
		String id = calenderService.dept(loginId);
		
		calederDto.setId(id);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", calenderService.calenderWrite(calederDto));
		
		return resultMap;
	}
	
	// 일정 조회 ajax
    @GetMapping(value="/calenderDetail/{idx}")
    public Map<String, Object> calenderDetail(@PathVariable int idx){
        logger.info("일정 상세 조회 실행, IDX: " + idx);
        CalenderDTO schedule = calenderService.calenderDetail(idx);
        System.out.println(CommonUtil.toString(schedule));
        //schedule.setStart_date(CommonUtil.formatDateTime(schedule.getStart_date(), "yyyy-mm-dd HH:mm:ss"));
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if(schedule != null) {
            resultMap.put("success", true);
            resultMap.put("schedule", schedule);
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "일정을 찾을 수 없습니다.");
        }
        return resultMap;
    }
    
    // 일정 수정 ajax
    @PutMapping(value="/calenderUpdate/{idx}")
    public Map<String,Object> calenderUpdate(@PathVariable String idx, @RequestBody CalenderDTO calenderDto){
    	logger.info("일정 수정 실행, IDX: " + idx + ", 데이터: " + CommonUtil.toString(calenderDto));
    	boolean success = calenderService.calenderUpdate(idx, calenderDto);
    	Map<String, Object> resultMap = new HashMap<>();
    	if(success) {
    		resultMap.put("success", true);
    		resultMap.put("message", "일정이 수정되었습니다.");
    	} else {
    		resultMap.put("success", false);
    		resultMap.put("message", "일정 수정에 실패했습니다. 존재하지 않는 일정 ID일 수 있습니다.");
    	}
    	return resultMap;
    }
    
    // 일정 삭제 ajax
    @DeleteMapping(value="/calenderDelete/{idx}")
    public Map<String,Object> calenderDelete(@PathVariable String idx){
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", calenderService.calenderDelete(idx));
		
    	return resultMap;
    }
    
    
    
    
    
    
    
    
    
    

}
