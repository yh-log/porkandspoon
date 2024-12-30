package kr.co.porkandspoon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import kr.co.porkandspoon.dao.MyPageDAO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO myPageDao;

	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동 및 정보 조회
	 */
	public UserDTO myPageDetail(String username) {
		
		UserDTO dto = new UserDTO();
		
		dto= myPageDao.myPageDetail(username);
		
		if(dto == null) {
			dto.setStatus(400);
			dto.setMessage("직원 정보가 없습니다.");
		}
		
		// 직원 이력 조회
		dto.setCareer(myPageDao.myPageCareerDetail(username));
		
		dto.setStatus(200);
		dto.setMessage("직원 정보 조회를 완료했습니다.");
		
		return dto;
	}

	public int count(int cnt_, String opt, String keyword) {
		String username = "";
		return myPageDao.count(cnt_,opt,keyword);
	}

	public List<MealDTO> buyList(String opt, String keyword, int limit, int offset) {
		
		return myPageDao.buyList(opt,keyword,limit,offset);
	}
	
}
