package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.MyPageService;

@RestController
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageService myPageService;
	
	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동
	 */
	@GetMapping(value="/myPageView/{username}")
	public ModelAndView myPageView(@PathVariable String username) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myPage/myPage");
		mav.addObject("username", username);
		
		return mav;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 정보 조회
	 */
	@GetMapping(value="/myPageDetail")
	public UserDTO myPageDetail(@RequestParam String username) {
		
		logger.info("조회 하는 username => " + username);
		UserDTO dto = new UserDTO();
		
		if(username == null || username.equals("")) {
			dto.setStatus(404);
			dto.setMessage("직원 아이디가 존재하지 않습니다.");
			return dto;
		}
		
		dto = myPageService.myPageDetail(username);
		
		if(dto == null) {
			dto.setStatus(501);
			dto.setMessage("직원 정보를 불러오지 못했습니다.");
			return dto;
		}
		
		dto.setStatus(202);
		dto.setMessage("직원 정보를 불러오는데 성공했습니다.");
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 수정 페이지 이동
	 */
	@GetMapping(value="/myPage/update")
	public ModelAndView myPageUpdateView() {
		return new ModelAndView("/myPage/myPageUpdate");
	}
	
	@GetMapping(value="/ad/myPageSign")
	public ModelAndView myPageSignView() {
		return new ModelAndView("/myPage/myPageSign");
	}
	
	@GetMapping(value="/ad/myPageBuy/List")
	public ModelAndView myPageBuyListView() {
		return new ModelAndView("/myPage/myPageBuyList");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/list")
	public ModelAndView tripListView() {
		return new ModelAndView("/myPage/businessTripList");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/write")
	public ModelAndView tripWriteView() {
		return new ModelAndView("/myPage/businessTripWrite");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/update")
	public ModelAndView tripUpdateView() {
		return new ModelAndView("/myPage/businessTripUpdate");
	}
	
		
	
}
