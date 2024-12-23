package kr.co.porkandspoon.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.DeptDAO;
import kr.co.porkandspoon.dto.DeptDTO;

@Service
public class DeptService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DeptDAO deptDAO;

	public List<DeptDTO> setChart() {
		return deptDAO.setChart();
	}

}
