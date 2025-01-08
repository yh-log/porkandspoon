package kr.co.porkandspoon.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.util.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;
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
	
	/**
	 * author yh.kim (24.12.29) 
	 * 조직도 데이터 조회
	 */
	@GetMapping(value="/getOrgChartData")
	public List<DeptDTO> getChartData(){
		
		List<DeptDTO> result = deptService.getChartData();
		
		return result;
	}

	/**
	 * author yh.kim (24.12.18)
	 * 부서 리스트 이동
	 */
	@GetMapping(value="/ma/dept/listView")
	public ModelAndView deptListView() {
		return new ModelAndView("/user/deptList");
	}

	/**
	 * author yh.kim (24.12.19)
	 * 부서 상세 페이지 이동
	 */
	@GetMapping(value="/ma/dept/detail/{id}")
	public ModelAndView deptDetailView(@PathVariable String id) {

		ModelAndView mav = new ModelAndView();
		DeptDTO deptDto = new DeptDTO();

		if(id == null || id.isEmpty()) {
			deptDto.setStatus(400);
			deptDto.setMessage("입력된 부서코드가 없습니다.");
		}

		deptDto = deptService.deptDetsil(id);

		mav.addObject("deptInfo", deptDto);
		mav.setViewName("/user/deptDetail");

		return mav;
	}

	/**
	 * author yh.kim (24.12.19)
	 * 부서 수정 페이지 이동
	 */
	@GetMapping(value="/ad/dept/update/{id}")
	public ModelAndView deptUpdateView(@PathVariable String id) {

		ModelAndView mav = new ModelAndView();
		DeptDTO deptDto = new DeptDTO();
		List<UserDTO> userDTO  = new ArrayList<UserDTO>();

		if(id == null || id.isEmpty()) {
			deptDto.setStatus(400);
			deptDto.setMessage("입력된 부서코드가 없습니다.");
		}

		deptDto = deptService.deptDetsil(id);
		userDTO = deptService.deptUserDetail(id);

		// userInfo JSON 형태로 변환
		ObjectMapper obj = new ObjectMapper();

		try{
			mav.addObject("deptInfo", deptDto);
			mav.addObject("userInfo", obj.writeValueAsString(userDTO));

		}catch (Exception e){
			e.printStackTrace();
			mav.addObject("userInfo", "[]");
		}

		mav.setViewName("/user/deptUpdate");

		return mav;
	}

	/**
	 * author yh.kim (24.12.19)
	 * 직영점 등록 요청 페이지 이동 및 조회
	 */
	@GetMapping(value="/ad/store/write/{idx}")
	public ModelAndView storeWriteView(@PathVariable String idx) {

		if(idx == null || idx.equals("")) {
			return new ModelAndView("/user/storeList");
		}

		ModelAndView mav = new ModelAndView();

		ApprovalDTO apprDto = deptService.storeWriteView(idx);

		logger.info("받아온 브랜드 정보 => " + CommonUtil.toString(apprDto));

		mav.addObject("storeInfo", apprDto);
		mav.setViewName("/user/storeWrite");

		return mav;
	}

	/**
	 * author yh.kim (24.12.19)
	 * 브랜드 생성 페이지 기안문 내용 조회
	 */
	@GetMapping(value="/ad/dept/write/{idx}")
	public ModelAndView deptWriteView(@PathVariable String idx) {

		if(idx == null || idx.equals("")) {
			return new ModelAndView("/user/deptList");
		}

		ModelAndView mav = new ModelAndView();

		ApprovalDTO apprDto = deptService.deptWriteView(idx);

		logger.info("받아온 브랜드 정보 => " + CommonUtil.toString(apprDto));

		mav.addObject("deptInfo", apprDto);
		mav.setViewName("/user/deptWrite");

		return mav;
	}

	/**
	 * author yh.kim (24.12.19)
	 * 직영점 수정 페이지 이동 및 조회
	 */
	@GetMapping(value="/ad/store/update/{id}")
	public ModelAndView storeUpdateView(@PathVariable String id) {

		ModelAndView mav = new ModelAndView();
		DeptDTO storeDto = new DeptDTO();

		if(id == null || id.isEmpty()) {
			return new ModelAndView("/user/storeList");
		}

		storeDto = deptService.storeDetsil(id);

		mav.addObject("storeInfo", storeDto);
		mav.setViewName("/user/storeUpdate");

		return mav;
	}

	/**
	 * author yh.kim (24.12.19)
	 * 직영점 상세 페이지 이동
	 */
	@GetMapping(value="/ma/store/detail/{id}")
	public ModelAndView storeDetailView(@PathVariable String id) {
		ModelAndView mav = new ModelAndView();
		DeptDTO storeDto = new DeptDTO();

		if(id == null || id.isEmpty()) {
			return new ModelAndView("/user/storeList");
		}

		storeDto = deptService.storeDetsil(id);

		mav.addObject("storeInfo", storeDto);
		mav.setViewName("/user/storeDetail");

		return mav;
	}

	/**
	 * author yh.kim (24.12.25)
	 * 부서 코드 중복체크
	 */
	@GetMapping(value="/ad/user/deptCodeOverlay")
	public DeptDTO deptCodeOverlay(@ModelAttribute DeptDTO dto) {

		if(dto.getId() == null || dto.getId().isEmpty()) {
			dto.setStatus(400);
			dto.setMessage("부서 코드를 입력해주세요.");
			return dto;
		}

		if(deptService.deptCodeOverlay(dto)) {
			dto.setStatus(202);
			dto.setMessage("사용 가능한 코드입니다.");
		}else {
			dto.setStatus(500);
			dto.setMessage("사용 불가능한 코드입니다.");
		}
		return dto;
	}

	/**
	 * author yh.kim, (25.01.07)
	 * 브랜드 직원 등록 조직도 정보 조회
	 */
	@GetMapping(value="/ad/dept/userAppend")
	public UserDTO getDeptAppend(@RequestParam String username) {

		logger.info("받아온 username => " + username);

		return deptService.getUserDeptInfo(username);
	}




	
}
