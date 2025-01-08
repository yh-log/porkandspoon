package kr.co.porkandspoon.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ProjectDAO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class ProjectService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ProjectDAO projectDAO;

	public UserDTO getUserInfo(String username) {
		
		return projectDAO.getUserInfo(username);
	}
	
	// 매장 위도, 경도 중복 검사
	
}
