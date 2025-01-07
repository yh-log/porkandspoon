package kr.co.porkandspoon.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MealDTO;

@Mapper
public interface MealDAO {

	//식단표
	List<MealDTO> getMealMenu(String is_time);

	int setmealMenu(Map<String, String> params);

	int editmealMenu(Map<String, String> params);

	
	//식권
	int setmealTicket(Map<String, String> params);

	MealDTO detailmealTicket(String meal_idx);

	int editmealTicket(Map<String, String> params);

	int setmealFile(FileDTO dto);

	FileDTO getFile(String meal_idx);

	List<MealDTO> getmealTicket();

	Integer menuOverlay(LocalDateTime start_date, LocalDateTime end_date);

	

	int setmealbuy(Map<String, Object> params);

	int getTicketCount(String username);

	int editmealFile(FileDTO dto);

	List<MealDTO> getmealList();

	

	
	
}
