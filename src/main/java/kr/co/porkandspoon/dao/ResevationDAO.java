package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CalenderDTO;

@Mapper
public interface ResevationDAO {

	String info(String loginId);

	int articleWrite(Map<String, Object> params);

	List<CalenderDTO> list(int offset, int size, String category);

	CalenderDTO articleDetail(String no);

	int updateYN(String no, String filter);

	int articleUpdate(Map<String, Object> params);

	int roomWrite(Map<String, Object> params);

	CalenderDTO roomDetail(String no);

	int roomUpdate(Map<String, Object> params);

	int allDelete(String no, String filter);

	List<CalenderDTO> note();

	List<CalenderDTO> project();
	
	List<CalenderDTO> car();

	CalenderDTO itemDetail(String no);

	List<CalenderDTO> articleList();

}
