package kr.co.porkandspoon.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import kr.co.porkandspoon.dto.UserDTO;
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
	

	public MealDTO detailmealTicket(String meal_idx) {
		return mealDAO.detailmealTicket(meal_idx);
		
	}

	@Transactional
	public int editmealTicket(Map<String, String> params, FileDTO dto) {
	    if (params == null || params.isEmpty()) {
	        throw new IllegalArgumentException("params 값이 null이거나 비어 있습니다.");
	    }

	    // Meal 정보 업데이트
	    mealDAO.editmealTicket(params);

	    if (dto == null) {
	        logger.info("FileDTO가 null이므로 파일 업데이트를 건너뜁니다.");
	        return 1; // 정상 처리로 간주
	    }

	    // 파일 업데이트 처리
	    String meal_idx = params.get("meal_idx");
	    logger.info("meal_idx: {}", meal_idx);
	    dto.setPk_idx(meal_idx);

	    // 기존 파일 존재 여부 확인
	    FileDTO filedto = mealDAO.getFile(meal_idx);

	    if (filedto != null) {
	        // 기존 파일이 있으면 업데이트
	        if (dto.getOri_filename() == null || dto.getNew_filename() == null) {
	            throw new IllegalArgumentException("기존 파일 업데이트 시 ori_filename과 new_filename이 필요합니다.");
	        }
	        logger.info("기존 파일이 존재하므로 업데이트를 수행합니다.");
	        int updateResult = mealDAO.editmealFile(dto);
	        if (updateResult == 0) {
	            throw new RuntimeException("파일 업데이트 실패");
	        }
	    } else {
	        // 기존 파일이 없으면 새로 삽입
	        if (dto.getOri_filename() == null || dto.getNew_filename() == null) {
	            throw new IllegalArgumentException("새 파일 삽입 시 ori_filename과 new_filename이 필요합니다.");
	        }
	        logger.info("기존 파일이 없으므로 새 파일을 삽입합니다.");
	        int insertResult = mealDAO.setmealFile(dto);
	        if (insertResult == 0) {
	            throw new RuntimeException("파일 삽입 실패");
	        }
	    }

	    return 1; // 정상 처리 완료
	}

	
	

	public FileDTO getFile(String meal_idx) {
		
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
		
		LocalDateTime now = LocalDateTime.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    String formattedDate = now.format(formatter);
	    params.put("create_date", formattedDate); // 날짜를 params에 추가

		
		return mealDAO.setmealbuy(params);
	}

	public int getTicketCount(String username) {
		
		return mealDAO.getTicketCount(username);
	}

	public List<MealDTO> getmealList() {
		
		return mealDAO.getmealList();
	}

	public String getUserInfo(String username) {
		
		return mealDAO.getUserInfo(username);
	}

	

	
	
	
	
}
