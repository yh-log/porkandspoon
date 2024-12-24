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
	 * author yh.kim (24.12.22)
	 * 아이디 찾기 시 사용자 검증
	 */
	public String findUserId(UserDTO dto) {
		return userDao.findUserId(dto);
	}


	/**
	 * author yh.kim (24.12.22)
	 * 인증 코드 생성 메서드
	 */
	public int randomAuthenticationCode(UserDTO dto) {
	
		// 1. 기존 코드 있는지 체크 (select - count)
		Integer codeCheck = userDao.randomCodeCheck(dto);
		
		
		// 코드가 없을 경우 기존 레코드 업데이트
		if (codeCheck != null && codeCheck > 0) {
		    userDao.randomCodeUpdate(codeCheck);
		}
		
		// 2. 없을 경우 바로 or 있을 경우 update 후 insert
		userDao.randomCodeInsert(dto);
		
		// 3. pk 리턴
		return dto.getIdx();
		
	}
	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	public boolean changePassword(UserDTO params) {
		return userDao.changePassword(params) > 0 ? true : false;
	}


	/**
	 * author yh.kim (24.12.22)
	 * 인증코드 검증 메서드
	 */
	public boolean chackAuthCode(UserDTO dto) {
		
		int resultRow = userDao.chackAuthCode(dto);
	
		if(resultRow < 0) {
			return false;
		}
		
		dto.setUsername(userDao.findUsername(dto));
		
		return true;
	}


	/**
	 * author yh.kim (24.12.22)
	 * 인증번호 생성 후 2분 경과 시 실행 메서드
	 */
	public void timeoutAction(UserDTO dto) {
		
		int idx = dto.getIdx();
		userDao.randomCodeUpdate(idx);
	}


	/**
	 * author yh.kim (24.12.22)
	 * 비밀번호 찾기 시 사용자 검증
	 */
	public String findUserPw(UserDTO dto) {
		return userDao.findUserPw(dto);
	}

	/**
	 * author yh.kim (24.12.23)
	 * 직원 아이디 중복 체크
	 */
	public boolean usernameOverlay(UserDTO dto) {
		return userDao.usernameOverlay(dto) <= 0? true : false;
	}




}
