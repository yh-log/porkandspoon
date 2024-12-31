package kr.co.porkandspoon.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		return deptDAO.getDeptdata(params);
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

}
