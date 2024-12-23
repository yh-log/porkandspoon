package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.MealDAO;
import kr.co.porkandspoon.dto.MealDTO;

@Service
public class MealService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MealDAO mealDAO;

	public List<MealDTO> getMealMenu(String is_time) {
		
		return mealDAO.getMealMenu(is_time);
	}

	public int getmealMenu(Map<String, String> params) {
		
		return mealDAO.getmealMenu(params);
	}
	
	
	
	
}
