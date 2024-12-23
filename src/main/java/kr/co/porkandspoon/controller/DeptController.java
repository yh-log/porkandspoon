package kr.co.porkandspoon.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.service.DeptService;

@RestController
public class DeptController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DeptService deptService;
	
	@GetMapping(value="/chartlist/View")
	public ModelAndView chartlist() {
		return new ModelAndView("/chart/chartList");
	}
	
	@GetMapping(value="/setChart")
	public List<DeptDTO> setChart() {
		logger.info("조직도 js로 실행하기");
		logger.info("params : {}", deptService.setChart());
		return deptService.setChart();
	}
}
