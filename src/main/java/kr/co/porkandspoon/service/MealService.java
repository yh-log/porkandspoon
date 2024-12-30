package kr.co.porkandspoon.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

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

	
	 @Transactional
	    public int setmealTicket(Map<String, String> params, FileDTO dto) {
	        // 첫 번째 데이터베이스 작업
	        mealDAO.setmealTicket(params);

	        // pk_idx 설정
	        String pk_idx = CommonUtil.toString(params.get("meal_idx"));
	        dto.setPk_idx(pk_idx);

	        // 두 번째 데이터베이스 작업
	        int result = mealDAO.setmealFile(dto);

	        // 결과가 0이거나 실패할 경우 예외를 던져 트랜잭션을 롤백
	        if (result == 0) {
	            throw new RuntimeException("Failed to execute setmealFile");
	        }

	        return result;
	    }
	

	public MealDTO detailmealTicket(int meal_idx) {
		return mealDAO.detailmealTicket(meal_idx);
		
	}

	 @Transactional
	public int editmealTicket(Map<String, String> params, FileDTO dto) {
		 mealDAO.editmealTicket(params);
		 String pk_idx = CommonUtil.toString(params.get("meal_idx"));
	        dto.setPk_idx(pk_idx);

	        // 두 번째 데이터베이스 작업
	        int result = mealDAO.editmealFile(dto);

	        // 결과가 0이거나 실패할 경우 예외를 던져 트랜잭션을 롤백
	        if (result == 0) {
	            throw new RuntimeException("Failed to execute setmealFile");
	        }

	        return result;
	    }
	

	public FileDTO getFile(int meal_idx) {
		
		return mealDAO.getFile(meal_idx);
	}

	public List<MealDTO> getmealTicket() {
		return mealDAO.getmealTicket();
		
	}

	public int menuOverlay(LocalDateTime start_date, LocalDateTime end_date) {
	    Integer menu_Idx = mealDAO.menuOverlay(start_date, end_date);
	    
	    logger.info("있니 {}:",menu_Idx);
	    if (menu_Idx != null) {
			return menu_Idx;
		}else {
			
			return menu_Idx = 0;
		}
	    
	    
	    
	}

	public int setmealbuy(Map<String, Object> params) {
		return mealDAO.setmealbuy(params);
	}

	public int getTicketCount(String username) {
		
		return mealDAO.getTicketCount(username);
	}

	

	
	
	
	
}
