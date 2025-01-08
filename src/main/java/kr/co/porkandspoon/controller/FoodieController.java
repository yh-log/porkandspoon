package kr.co.porkandspoon.controller;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.FoodieDTO;
import kr.co.porkandspoon.service.FoodieService;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@RestController
public class FoodieController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired FoodieService foodieService;
	
	// 페이지 이동
	@GetMapping(value="/foodielist/View")
	public ModelAndView foodielistView() {
		ModelAndView mav = new ModelAndView();
		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mav.addObject("userName",userDetails.getName());
		mav.setViewName("/foodie/foodieList");
		return mav;
	}
	
	// 매장 등록
	@PostMapping(value="/foodie/write")
	public FoodieDTO setFoodieWrite(@ModelAttribute FoodieDTO dto) {
		if (foodieService.getOverlapStore(dto) > 0) {
			dto.setStatus(400);
			dto.setMessage("매장중복");
		}else {
			foodieService.setFoodieWrite(dto);
			dto.setStatus(200);
			dto.setMessage("매장등록");			
		}
		return dto;
	}
	
	@GetMapping(value="/foodie/list")
	public List<FoodieDTO> getFoodieList() {
		List<FoodieDTO> dto = foodieService.getFoodieList();
		return dto;
	}
	
	@GetMapping(value="/getReviewList")
	public List<FoodieDTO> getReviewList(@ModelAttribute FoodieDTO fdto) {
		List<FoodieDTO> dto = foodieService.getReviewList(fdto);
		return dto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
