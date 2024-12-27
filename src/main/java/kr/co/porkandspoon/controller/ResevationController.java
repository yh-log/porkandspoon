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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.service.ResevationService;

@RestController
public class ResevationController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ResevationService resService;
	
	// 예약하기(캘린더) 이동
	@GetMapping(value="/resevation")
	public ModelAndView resevationView() {
		return new ModelAndView("/resevation/resevation");
	}
	
	// 자원리스트(ad권한만) 이동
	@GetMapping(value="/ad/resevation/list")
	public ModelAndView resevationListView() {
		return new ModelAndView("/resevation/resevationList");
	}
	
	// 자원리스트 호출
	@GetMapping(value="/resevationList")
	public Map<String,Object> resevationList(
			@RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "size", defaultValue = "6") int size){
		
		List<CalenderDTO> list = resService.list(page,size);
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("list", list);
		
		return result;
	}
	
	// 회의실 등록 이동
	@GetMapping(value="/ad/room/write")
	public ModelAndView roomWrtieView() {
		return new ModelAndView("/resevation/roomWrite");
	}
	
	// 회의실 상세보기 이동
	@GetMapping(value="/ad/room/detail")
	public ModelAndView roomDetailView() {
		return new ModelAndView("/resevation/roomDetail");
	}
	
	// 회의실 수정 이동
	@GetMapping(value="/ad/room/update")
	public ModelAndView roomUpdateView() {
		return new ModelAndView("/resevation/roomUpdate");
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
		CalenderDTO dto = resService.articleUpdate(params);
		
		result.put("response",dto);
		
		return result;
	}
	
	// 활성 비화설
	@PutMapping(value="/updateYN")
	public Map<String,Object> updateYN(@RequestParam String no,@RequestParam String filter){
		
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("update",resService.updateYN(no,filter));
		
		return result;
	}
	
	
	
	
	
	
	
	


}
