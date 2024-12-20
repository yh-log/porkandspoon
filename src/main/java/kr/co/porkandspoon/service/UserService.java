package kr.co.porkandspoon.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.UserDAO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class UserService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserDAO userDao;
	
	/**
	 * author yh.kim (24.12.20) 
	 * 사용자 아이디 조회
	 */
	public String findUserId(UserDTO params) {
		
		return userDao.findUserId(params);
	}

	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	public boolean changePassword(UserDTO params) {
		return userDao.changePassword(params) > 0 ? true : false;
	}

}
