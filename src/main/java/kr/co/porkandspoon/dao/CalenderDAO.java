package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.dto.UserDTO;
@Mapper
public interface CalenderDAO {

	//List<Map<String, Object>> calenderList(List<String> filters, String loginId, String dept);

	int calenderWrite(CalenderDTO calederDto);

	CalenderDTO calenderDetail(Map<String, Object> params);

	int calenderUpdate(String idx, CalenderDTO calenderDto);

	int calenderDelete(String idx);

	String dept(String loginId);

	List<CalenderDTO> calenderList(Map<String, Object> params);

	CalenderDTO calenderDetailA(Map<String, Object> params);

	CalenderDTO calenderDetailR(Map<String, Object> params);

	List<UserDTO> attendeesList(int idx);


}
