package kr.co.porkandspoon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.MealDTO;

@Mapper
public interface MealDAO {

	List<MealDTO> getMealMenu(String is_time);

	
	
}
