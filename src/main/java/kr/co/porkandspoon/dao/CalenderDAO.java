package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CalenderDTO;
@Mapper
public interface CalenderDAO {

	List<Map<String, Object>> calenderList(String loginId, String dept);

	int calenderWrite(CalenderDTO calederDto);

	CalenderDTO calenderDetail(int idx);

	int calenderUpdate(String idx, CalenderDTO calenderDto);

	int calenderDelete(String idx);

	String dept(String loginId);


}
