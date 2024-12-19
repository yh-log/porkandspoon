package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ManageController {

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
	
	@GetMapping(value="/ad/part/List")
	public ModelAndView partListView() {
		return new ModelAndView("/manage/partList");
	}
	
	@GetMapping(value="/ad/part/Write")
	public ModelAndView partWriteView() {
		return new ModelAndView("/manage/partWrite");
	}
	
	@GetMapping(value="/ad/part/Update")
	public ModelAndView partUpdateView() {
		return new ModelAndView("/manage/partWrite");
	}
	
	@GetMapping(value="/ad/part/Detail")
	public ModelAndView partDetailView() {
		return new ModelAndView("/manage/partDetail");
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
