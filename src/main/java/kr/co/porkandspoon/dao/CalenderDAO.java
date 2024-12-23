package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CalenderDTO;
@Mapper
public interface CalenderDAO {

	List<Map<String, Object>> calenderList();

	int calenderWrite(CalenderDTO calederDto);

	CalenderDTO calenderDetail(int idx);

}
