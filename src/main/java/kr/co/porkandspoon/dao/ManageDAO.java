package kr.co.porkandspoon.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManageDAO {

	int setpartWrite(Map<String, String> params);

	
	
}
