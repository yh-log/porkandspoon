package kr.co.porkandspoon.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping(value="/ad/part/")
	public ModelAndView partListView() {
		return new ModelAndView("/manage/partList");
	}
	
	@GetMapping(value="/ad/part/List")
	public ModelAndView getPartList() {
		return new ModelAndView("/manage/partList");
	}
	
	@GetMapping(value="/ad/part/Write")
	public ModelAndView partWriteView() {
		return new ModelAndView("/manage/partWrite");
	}
	@PostMapping(value="/ad/part/Write")
	public ModelAndView setpartWrite(@RequestParam Map<String, String> params) {
		
		manageService.setpartWrite(params);
		
		return new ModelAndView("/manage/partWrite");
	}
	
	@GetMapping(value="/ad/part/Update")
	public ModelAndView partUpdateView() {
		return new ModelAndView("/manage/partUpdate");
	}
	
	@GetMapping(value="/ad/part/Detail")
	public ModelAndView partDetailView() {
		return new ModelAndView("/manage/partDetail");
	}
	
	@GetMapping(value="/ad/partSchdule")
	public ModelAndView partSchduleView() {
		return new ModelAndView("/manage/partSchdule");
	}
	
	
	
	//휴점
	
	@GetMapping(value="/ad/rest/List")
	public ModelAndView restListView() {
		return new ModelAndView("/manage/restList");
	}
	
	@GetMapping(value="/ad/rest/Write")
	public ModelAndView restWriteView() {
		return new ModelAndView("/manage/restWrite");
	}
	
	@GetMapping(value="/ad/rest/Update")
	public ModelAndView restUpdateView() {
		return new ModelAndView("/manage/restUpdate");
	}
	
	
	
}
