package kr.co.porkandspoon.service;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ResevationDAO;
import kr.co.porkandspoon.dto.CalenderDTO;

@Service
public class ResevationService {
	
	@Autowired ResevationDAO resDao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 물품 등록(작성자 정보)
	public String info(String loginId) {	
		return resDao.info(loginId);
	}

	public int articleWrite(Map<String, Object> params) {
		return resDao.articleWrite(params);
	}

	public List<CalenderDTO> list(int page, int size) {
		int offset = (page - 1) * size;
		return resDao.list(offset,size);
	}

}
