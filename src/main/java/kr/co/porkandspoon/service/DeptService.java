package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.porkandspoon.dao.DeptDAO;
import kr.co.porkandspoon.dto.DeptDTO;
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

	    // 직급명 변환
	    if (user.getPosition() != null) {
	        switch (user.getPosition()) {
	            case "po0":
	                user.setPosition("대표");
	                break;
	            case "po1":
	                user.setPosition("부장");
	                break;
	            case "po2":
	                user.setPosition("차장");
	                break;
	            case "po3":
	                user.setPosition("과장");
	                break;
	            case "po4":
	                user.setPosition("대리");
	                break;
	            case "po5":
	                user.setPosition("주임");
	                break;
	            case "po6":
	                user.setPosition("사원");
	                break;
	            case "po7":
	                user.setPosition("직영점주");
	                break;
	            default:
	                user.setPosition("기타");
	        }
	    }
	    return user;
	}

	public List<DeptDTO> getOrgchart() {
		return deptDAO.getOrgchart();
	}

}
