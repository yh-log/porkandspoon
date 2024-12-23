package kr.co.porkandspoon.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface UserDAO{

	/**
	 * author yh.kim (24.12.20) 
	 * 아이디 찾기 시 사용자 검증
	 */
	String findUserId(UserDTO params);

	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	int changePassword(UserDTO params);

	/**
	 * author yh.kim (24.12.22)
	 * 기존 인증코드 조회 
	 */
	int randomCodeCheck(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 기존 인증코드 업데이트
	 */
	void randomCodeUpdate(int codeCheck);
	
	/**
	 * author yh.kim (24.12.22)
	 * 새로운 인증코드 삽입
	 */
	int randomCodeInsert(UserDTO dto);
	
	/**
	 * author yh.kim (24.12.22)
	 * 인증코드 검증 메서드
	 */
	int chackAuthCode(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 인증코드로 사용자 id 조회
	 */
	String findUsername(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 비밀번호 찾기 시 사용자 검증
	 */
	String findUserPw(UserDTO dto);

	/**
	 * author yh.kim (24.12.23)
	 * 직원 아이디 중복 체크
	 */
	int usernameOverlay(UserDTO dto);

}
