package kr.co.porkandspoon.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface UserDAO{

	/**
	 * author yh.kim (24.12.20) 
	 * 사용자 아이디 조회
	 */
	String findUserId(UserDTO params);

	int changePassword(UserDTO params);

}
