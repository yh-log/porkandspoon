package kr.co.porkandspoon.dao;

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

	MealDTO detailmealTicket(int meal_idx);

	int editmealTicket(Map<String, String> params);

	int setmealFile(FileDTO dto);

	

	
	
}
