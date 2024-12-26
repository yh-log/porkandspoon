package kr.co.porkandspoon.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.DirectstoreDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.DeptService;

@RestController
public class DeptController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DeptService deptService;
	
	// 조직도 차트 페이지 이동
	@GetMapping(value="/chartlist/View")
	public ModelAndView chartlist() {
		return new ModelAndView("/chart/chartList");
	}
	
	// 조직도 노드 페이지이동
	@GetMapping(value="/chartlisttest/View")
	public ModelAndView chartlisttest() {
		return new ModelAndView("/chart/chartListtest");
	}
	
	// 조직도 노드 불러오기
	@GetMapping(value="/setChart")
	public List<DeptDTO> setChart() {
	    return deptService.setChart();
	}
	
	// 조직도 결재할 사원의 정보 가져오기
	@GetMapping(value="/getUserlist")
	public UserDTO getUserlist(@RequestParam Map<String, Object> params) {
		logger.info("조직도 클릭 이벤트로 가져온 아이디 : {}", params);
		return deptService.getUserlist(params);
	}
	
	// 조직도 결재라인에 내 정보 추가하기
	@GetMapping(value="/getMydetail")
	public UserDTO getMydetail(@RequestParam Map<String, Object> params) {
		logger.info("조직도 클릭 이벤트로 가져온 아이디 : {}", params);
		return deptService.getUserlist(params);
	}
	
	@GetMapping(value="/getOrgchart")
	public List<DeptDTO> getOrgchart() {
	    return deptService.getOrgchart();
	}
	
	@GetMapping(value="/getUserdata")
	public UserDTO getUserdata(@RequestParam Map<String, Object> params) {
	    return deptService.getUserlist(params); 
	}
	
	@GetMapping(value="/getDeptdata")
	public List<DirectstoreDTO> getDeptdata(@RequestParam Map<String, Object> params) {
		logger.info("params : {}", params);
		return deptService.getDeptdata(params);
	}
}
