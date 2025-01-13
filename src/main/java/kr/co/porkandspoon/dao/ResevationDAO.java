package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface ResevationDAO {

	UserDTO info(String userId);

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

	List<CalenderDTO> selection(String selection);

	int itemWrite(CalenderDTO calederDto);

	CalenderDTO resDetail(int idx);

	int itemUpdate(String idx, CalenderDTO calenderDto);

	int itemDelete(String idx);

	List<CalenderDTO> room();

	CalenderDTO resRoomDetail(String no);

	List<CalenderDTO> roomList();

	void roomReservationWrite(CalenderDTO singleDto);

	void insertAttendee(Map<String, Object> params);

	CalenderDTO roomReservationDetail(int idx);

	List<UserDTO> attendeesList(int idx);

	int roomReservationUpdate(CalenderDTO calenderDto);

	void deleteAllAttendees(String idx);

	int roomDelete(String idx);

	int isDuplicate(int no, String start_date, String end_date);

	int roomDuplicate(int no, String start_date, String end_date);

	int total(String loginId);

	



}
