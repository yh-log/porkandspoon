package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.MealDAO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class MealService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MealDAO mealDAO;

	public List<MealDTO> getMealMenu(String is_time) {
		
		return mealDAO.getMealMenu(is_time);
	}

	public int setmealMenu(Map<String, String> params) {
		
		return mealDAO.setmealMenu(params);
	}

	public int editmealMenu(Map<String, String> params) {
		return mealDAO.editmealMenu(params);
		
	}

	public int setmealTicket(Map<String, String> params) {
		return mealDAO.setmealTicket(params);
		
	}
	
	public int setmealTicket(Map<String, String> params, FileDTO dto) {
		mealDAO.setmealTicket(params);
		 String idx =CommonUtil.toString(params.get("meal_idx"));
		dto.setPk_idx(idx);
		
		
		return mealDAO.setmealFile(dto);
		
	}
	

	public MealDTO detailmealTicket(int meal_idx) {
		return mealDAO.detailmealTicket(meal_idx);
		
	}

	public int editmealTicket(Map<String, String> params) {
		return mealDAO.editmealTicket(params);
		
	}

	
	
	
	
}
