package kr.co.porkandspoon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.CareerDTO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface MyPageDAO {

	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동 및 정보 조회
	 */
	UserDTO myPageDetail(String username);

	/**
	 * author yh.kim (24.12.26)
	 * 직원 이력 조회
	 */
	List<CareerDTO> myPageCareerDetail(String username);

	int count(int cnt_, String opt, String keyword);

	List<MealDTO> buyList(String opt, String keyword, int limit, int offset);
	
	

}
