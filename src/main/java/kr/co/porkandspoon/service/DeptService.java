package kr.co.porkandspoon.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.co.porkandspoon.dto.ApprovalDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.porkandspoon.dao.DeptDAO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.DirectstoreDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class DeptService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DeptDAO deptDAO;

	public List<DeptDTO> setChart() {
		return deptDAO.setChart();
	}

	public UserDTO getUserlist(Map<String, Object> params) {
		UserDTO user = deptDAO.getUserlist(params);
		user.setPosition(changePosition(user.getPosition()));
	    return user;
	}

	public List<DeptDTO> getOrgchart() {
	    return deptDAO.getOrgchart();
	}
	
	// user 테이블에 position의 값마다 직급 변환
	public String changePosition(String positionCode) {
	    if (positionCode == null) {
	        return "기타";
	    }
	    switch (positionCode) {
	        case "po0":
	            return "대표";
	        case "po1":
	            return "부장";
	        case "po2":
	            return "차장";
	        case "po3":
	            return "과장";
	        case "po4":
	            return "대리";
	        case "po5":
	            return "주임";
	        case "po6":
	            return "사원";
	        case "po7":
	            return "직영점주";
	        default:
	            return "기타";
	    }
	}

	public List<DirectstoreDTO> getDeptdata(Map<String, Object> params) {
		List<DirectstoreDTO> dsdto = deptDAO.getDeptdata(params);
		for(DirectstoreDTO dto : dsdto) {
			dto.setPosition(changePosition(dto.getPosition()));
		}
		return dsdto;
	}

	/**
	 * author yh.kim (24.12.29) 
	 * 조직도 데이터 조회
	 */
	public List<DeptDTO> getChartData() {
		
		List<DeptDTO> result = deptDAO.getChartData();
		
		if(result == null) {
			result = new ArrayList<>();

		}
		
		return result;
	}

	/**
	 * author yh.kim (24.12.26)
	 * 부서 상세 페이지 이동
	 */
	public DeptDTO deptDetsil(String id) {

		return deptDAO.deptDetail(id);
	}

	/**
	 * author yh.kim (24.12.27)
	 * 직영점 등록 요청 페이지 이동 및 조회
	 */
	public ApprovalDTO storeWriteView(String idx) {
		return deptDAO.storeWriteView(idx);
	}

	/**
	 * author yh.kim (24.12.25)
	 * 브랜드 생성 페이지 기안문 내용 조회
	 */
	public ApprovalDTO deptWriteView(String idx) {
		return deptDAO.deptWriteView(idx);
	}

	/**
	 * author yh.kim (24.12.27)
	 * 직영점 수정 페이지 이동 및 조회
	 */
	public DeptDTO storeDetsil(String id) {
		return deptDAO.storeDetail(id);
	}

	/**
	 * author yh.kim (24.12.25)
	 * 부서코드 중복체크
	 */
	public boolean deptCodeOverlay(DeptDTO dto) {
		return deptDAO.deptCodeOverlay(dto) == 0 ? true : false;
	}

	/**
	 * author yh.kim, (25.01.07)
	 * 브랜드 직원 등록 조직도 정보 조회
	 */
	public UserDTO getUserDeptInfo(String username) {
		UserDTO userDTO = deptDAO.getUserDeptInfo(username);

		if (userDTO == null){
			userDTO.setStatus(404);
			userDTO.setMessage("직원 정보를 조회하지 못했습니다.");
			return userDTO;
		}

		userDTO.setStatus(200);
		userDTO.setMessage("직원 정보 조회를 완료했습니다.");

		return userDTO;
	}
}
