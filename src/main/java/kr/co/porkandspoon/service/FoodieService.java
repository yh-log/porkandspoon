package kr.co.porkandspoon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.FoodieDAO;
import kr.co.porkandspoon.dto.FoodieDTO;

@Service
public class FoodieService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired FoodieDAO foodieDAO;
	
	// 매장 위도, 경도 중복 검사
	public int getOverlapStore(FoodieDTO dto) {
		return foodieDAO.getoverlapStore(dto);
	}
	
	
	
	public void setFoodieWrite(FoodieDTO dto) {
		foodieDAO.setStoreWrite(dto);
		foodieDAO.setReviewWrirte(dto);
	}



	public List<FoodieDTO> getFoodieList() {
		return foodieDAO.getFoodieList();
	}



	public List<FoodieDTO> getReviewList(FoodieDTO fdto) {
		return foodieDAO.getReviewList(fdto);
	}



	public int setReviewW(FoodieDTO dto) {
		return foodieDAO.setReviewWrirte(dto);
	}



	public int getstoreidx(FoodieDTO dto) {
		return foodieDAO.getstoreidx(dto);
	}



	public int serDeleteR(FoodieDTO dto) {
		return foodieDAO.setDeleteR(dto);
	}



	public int getStoreidx(FoodieDTO dto) {
		return foodieDAO.getStoreidx(dto);
	}


}
