package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ProjectController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/ad/project/Write")
	public ModelAndView projectWriteView() {
		return new ModelAndView("/project/projectWrite");
	}
	
	@GetMapping(value="/ad/project/Update")
	public ModelAndView projectUpdateView() {
		return new ModelAndView("/project/projectUpdate");
	}
	
	@GetMapping(value="/ad/project/List")
	public ModelAndView projectListView() {
		return new ModelAndView("/project/projectList");
	}
	
	@GetMapping(value="/ad/project/KanBan")
	public ModelAndView projectKanBanView() {
		return new ModelAndView("/project/projectKanBan");
	}
	
	
	
	
	
}
