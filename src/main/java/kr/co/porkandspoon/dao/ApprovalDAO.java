package kr.co.porkandspoon.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface ApprovalDAO {

	UserDTO getUserInfo(String loginId);

}
