package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CalenderDTO;

@Mapper
public interface ResevationDAO {

	String info(String loginId);

	int articleWrite(Map<String, Object> params);

	List<CalenderDTO> list(int offset, int size);

}
