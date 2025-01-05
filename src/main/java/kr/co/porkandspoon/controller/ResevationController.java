package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
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
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ResevationService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class ResevationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ResevationService resService;
	
	// 물품 예약하기(캘린더) 이동
	@GetMapping(value="/articleResevation")
	public ModelAndView articleResevation(@AuthenticationPrincipal UserDetails userDetails) {
		
		String loginId = userDetails.getUsername();
		
		ModelAndView mav = new ModelAndView("/resevation/articleResevation");
		mav.addObject("note", resService.note());
		mav.addObject("project", resService.project());
		mav.addObject("car", resService.car());
		mav.addObject("info",resService.info(loginId));
		
		return mav;
	}
	
	// 물품 예약 리스트 조회 ajax
	@GetMapping(value="/itemList")
	public Map<String, Object> articleList() {
		
		List<CalenderDTO> list = resService.articleList();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("result", list);
		
		return result;
	}
	
	// 예약하기 페이지에 물품 상세정보 ajax
	@GetMapping(value="/itemDetail")
	public Map<String,Object> itemDetail(@RequestParam String no){
		
		Map<String,Object> result = new HashMap<String, Object>();
		CalenderDTO dto = resService.itemDetail(no);
		LocalDateTime time = dto.getCreate_date();
		String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
		dto.setReCreate_date(create_date);
		result.put("list",dto);
		
		return result;
	}
	
	// 회의실 예약하기(캘린더) 이동
	@GetMapping(value="/roomResevation")
	public ModelAndView roomResevationView(@AuthenticationPrincipal UserDetails userDetails) {
		String loginId = userDetails.getUsername();
		ModelAndView mav = new ModelAndView("/resevation/roomResevation");
		UserDTO dto = resService.info(loginId);
		mav.addObject("info",dto);
		mav.addObject("room", resService.room());
		return mav;
	}
	
	// 조직도 인원 설정 (선택한 사람 데이터 가져오기)
	@GetMapping(value="/getUserInfo/{userId}")
	public UserDTO getUserInfo (@PathVariable String userId){
		UserDTO userInfo = resService.info(userId);		
		return userInfo;
	}
	
	// 자원리스트(ad권한만) 이동
	@GetMapping(value="/ad/resevation/list")
	public ModelAndView resevationListView() {
		return new ModelAndView("/resevation/resevationList");
	}
	
	// 자원리스트 호출 ajax
	@GetMapping(value="/resevationList")
	public Map<String,Object> resevationList(
			@RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "size", defaultValue = "6") int size,
	        @RequestParam(value = "category", defaultValue = "all") String category){
		
		List<CalenderDTO> list = resService.list(page,size,category);
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("list", list);
		
		return result;
	}
	
	// 회의실 등록 이동
	@GetMapping(value="/ad/room/write")
	public ModelAndView roomWrtieView(@AuthenticationPrincipal UserDetails userDetails) {
		
		String loginId = userDetails.getUsername();
		
		ModelAndView mav = new ModelAndView("/resevation/roomWrite");
		mav.addObject("info",resService.info(loginId));
		
		return mav;
	}
	
	// 회의실 등록
	@PostMapping(value="/roomWrite")
	public Map<String,Object> roomWrite(@RequestParam Map<String,Object> params){
			
		logger.info("받아온 데이터 : "+params);
			
		Map<String,Object> result = new HashMap<String, Object>();
			
		result.put("success",resService.roomWrite(params));
			
		return result;
	}
	
	// 회의실 상세보기 이동
	@GetMapping(value="/ad/room/detail/{no}")
	public ModelAndView roomDetailView(@PathVariable String no) {
			
		ModelAndView mav = new ModelAndView("/resevation/roomDetail");
		CalenderDTO dto = resService.roomDetail(no);
		LocalDateTime time = dto.getCreate_date();
		String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
		dto.setReCreate_date(create_date);
			
		mav.addObject("info",dto);
			
		return mav;
	}
	
	// 회의실 수정 이동
	@GetMapping(value="/ad/room/update/{no}")
	public ModelAndView roomUpdateView(@PathVariable String no) {
		
		ModelAndView mav = new ModelAndView("/resevation/roomUpdate");
		CalenderDTO dto = resService.roomDetail(no);
		mav.addObject("info",dto);
		
		return mav;
	}
	
	// 회의실 수정 ajax
	@PutMapping(value="/roomUpdate")
	public Map<String,Object> roomUpdate(@RequestParam Map<String,Object> params){
			
		Map<String,Object> result = new HashMap<String, Object>();
		int dto = resService.roomUpdate(params);
			
		result.put("response",dto);
			
		return result;
	}
	
	// 물품 등록 이동
	@GetMapping(value="/ad/article/write")
	public ModelAndView articleWrtieView(@AuthenticationPrincipal UserDetails userDetails) {
		
		String loginId = userDetails.getUsername();
		
		ModelAndView mav = new ModelAndView("/resevation/articleWrite");
		mav.addObject("info",resService.info(loginId));
		
		return mav;
	}
	
	// 물품 등록
	@PostMapping(value="/articleWrite")
	public Map<String,Object> articleWrite(@RequestParam Map<String,Object> params){
		
		logger.info("받아온 데이터 : "+params);
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		result.put("success",resService.articleWrite(params));
		
		return result;
	}
		
	// 물품 상세보기 이동
	@GetMapping(value="/ad/article/detail/{no}")
	public ModelAndView articleDetailView(@PathVariable String no) {
		
		ModelAndView mav = new ModelAndView("/resevation/articleDetail");
		CalenderDTO dto = resService.articleDetail(no);
		LocalDateTime time = dto.getCreate_date();
		String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
		dto.setReCreate_date(create_date);
		
		mav.addObject("info",dto);
		
		return mav;
	}
		
	// 물품 수정 이동
	@GetMapping(value="/ad/article/update/{no}")
	public ModelAndView articleUpdateView(@PathVariable String no) {
		
		ModelAndView mav = new ModelAndView("/resevation/articleUpdate");
		CalenderDTO dto = resService.articleDetail(no);
		mav.addObject("info",dto);
		
		return mav;
	}
	
	// 물품 수정 ajax
	@PutMapping(value="/articleUpdate")
	public Map<String,Object> articleUpdate(@RequestParam Map<String,Object> params){
		
		Map<String,Object> result = new HashMap<String, Object>();
		int dto = resService.articleUpdate(params);
		
		result.put("response",dto);
		
		return result;
	}
	
	// 예약 활성 비활성
	@PutMapping(value="/updateYN")
	public Map<String,Object> updateYN(@RequestParam String no,@RequestParam String filter){
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("update",resService.updateYN(no,filter));
		
		return result;
	}
	
	// 소프트 삭제(자원 활성 비활성)
	@DeleteMapping(value="/allDelete")
	public Map<String,Object> allDelete(@RequestParam String no,@RequestParam String filter){
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("allDelete",resService.allDelete(no,filter));
		
		return result;
	}
	
	// 선택된 리스트
	@GetMapping(value="/selectList")
	public Map<String,Object> selectList(@RequestParam String selection){
		
		Map<String,Object> result = new HashMap<String, Object>();
		List<CalenderDTO> dto = resService.selectList(selection);
		result.put("list", dto);
		
		return result;
	}
	
	// 물품 예약 등록 ajax
	@PostMapping(value="/itemWrite")
	public Map<String, Object> itemWrite(@RequestBody CalenderDTO calederDto,@AuthenticationPrincipal UserDetails userDetails){
						
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", resService.itemWrite(calederDto));
			
		return resultMap;
	}
	
	// 물품 예약 일정 조회 ajax
    @GetMapping(value="/resDetail/{idx}")
    public Map<String, Object> resDetail(@PathVariable int idx){
        logger.info("일정 상세 조회 실행, IDX: " + idx);
        CalenderDTO schedule = resService.resDetail(idx);
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
    
    // 물품 예약 수정 ajax
    @PutMapping(value="/itemUpdate/{idx}")
    public Map<String,Object> calenderUpdate(@PathVariable String idx, @RequestBody CalenderDTO calenderDto){
    	logger.info("일정 수정 실행, IDX: " + idx + ", 데이터: " + CommonUtil.toString(calenderDto));
    	boolean success = resService.itemUpdate(idx, calenderDto);
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
    
    // 물품 예약 삭제 ajax
    @DeleteMapping(value="/itemDelete/{idx}")
    public Map<String,Object> itemDelete(@PathVariable String idx){
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", resService.itemDelete(idx));
		
    	return resultMap;
    }
    
    @GetMapping(value="/roomDetail")
    public Map<String,Object> resRoomDetail(@RequestParam String no){
    	
    	Map<String,Object> result = new HashMap<String, Object>();
		CalenderDTO dto = resService.resRoomDetail(no);
		LocalDateTime time = dto.getCreate_date();
		String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
		dto.setReCreate_date(create_date);
		result.put("list",dto);
		
		return result;
    }
    
    // 선택된 리스트
 	@GetMapping(value="/selectRoomList")
 	public Map<String,Object> selectRoomList(){
 		
 		Map<String,Object> result = new HashMap<String, Object>();
 		List<CalenderDTO> dto = resService.room();
 		result.put("list", dto);
 		
 		return result;
 	}
 	
 	// 회의실 예약 리스트
 	@GetMapping(value="/roomList")
	public Map<String,Object> roomList(){
 		
 		List<CalenderDTO> list = resService.roomList();
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("result", list);
 		
 		return result;
 	}
	
 	// 회의실 예약 등록 엔드포인트
    @PostMapping(value="/roomReservation")
    public Map<String, Object> roomReservation(@RequestBody CalenderDTO calenderDto, @AuthenticationPrincipal UserDetails userDetails) {

        boolean success = resService.roomReservationWrite(calenderDto);
        Map<String, Object> response = new HashMap<>();
        if(success) {
            response.put("success", true);
            response.put("message", "회의실 예약이 성공적으로 등록되었습니다.");
        } else {
            response.put("success", false);
            response.put("message", "회의실 예약에 실패했습니다.");
        }
        return response;
    }
    
    // 회의실 예약 상세보기
    @GetMapping(value="/roomReservationDetail/{idx}")
	public Map<String,Object> roomReservationDetail(@PathVariable int idx){
    	
    	Map<String,Object> result = resService.roomReservationDetail(idx);
    	  	
    	return result;
    }
    
    // 회의실 예약 수정
    @PutMapping(value="/roomUpdate/{idx}")
    public Map<String,Object> roomUpdate(@RequestBody CalenderDTO calenderDto,@PathVariable String idx){
    	
    	logger.info("수정 파람 : "+CommonUtil.toString(calenderDto));
    	
    	 boolean success = resService.roomReservationUpdate(calenderDto,idx);
         Map<String, Object> response = new HashMap<>();
         if(success) {
             response.put("success", true);
             response.put("message", "회의실 예약이 성공적으로 수정되었습니다.");
         } else {
             response.put("success", false);
             response.put("message", "회의실 예약 수정에 실패했습니다.");
         }
         return response;
    	
    }
    
    // 물품 예약 삭제 ajax
    @DeleteMapping(value="/roomDelete/{idx}")
    public Map<String,Object> roomDelete(@PathVariable String idx){
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", resService.roomDelete(idx));
		
    	return resultMap;
    }


}
