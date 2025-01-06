package kr.co.porkandspoon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.FoodieDTO;

@Mapper
public interface FoodieDAO {

	// 매장 위도, 경도 중복검사
	int getoverlapStore(FoodieDTO dto);
	
	int setStoreWrite(FoodieDTO dto);

	void setReviewWrirte(FoodieDTO dto);

	List<FoodieDTO> getFoodieList();


}
