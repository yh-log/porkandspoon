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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.service.ResevationService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class ResevationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ResevationService resService;
	
	// 물품 예약하기(캘린더) 이동
	@GetMapping(value="/articleResevation")
	public ModelAndView articleResevation() {
		
		ModelAndView mav = new ModelAndView("/resevation/articleResevation");
		mav.addObject("note", resService.note());
		mav.addObject("project", resService.project());
		mav.addObject("car", resService.car());
		
		return mav;
	}
	
	// 물품 예약 리스트 조회 ajax
	@GetMapping(value="/articleList")
	public List<CalenderDTO> articleList() {
		
		List<CalenderDTO> dto = resService.articleList();
		
		return dto;
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
	public ModelAndView roomResevationView() {
		return new ModelAndView("/resevation/roomResevation");
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
	
	
	
	
	
	


}
