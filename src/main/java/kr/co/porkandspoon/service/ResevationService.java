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

	public List<CalenderDTO> list(int page, int size, String category) {
		int offset = (page - 1) * size;
		return resDao.list(offset,size,category);
	}

	public CalenderDTO articleDetail(String no) {		
		return resDao.articleDetail(no);
	}

	public int updateYN(String no, String filter) {
		return resDao.updateYN(no,filter);
	}

	public int articleUpdate(Map<String, Object> params) {
		return resDao.articleUpdate(params);
	}

	public int roomWrite(Map<String, Object> params) {
		return resDao.roomWrite(params);
	}

	public CalenderDTO roomDetail(String no) {		
		return resDao.roomDetail(no);
	}

	public int roomUpdate(Map<String, Object> params) {		
		return resDao.roomUpdate(params);
	}

	public int allDelete(String no, String filter) {
		return resDao.allDelete(no,filter);
	}

	public List<CalenderDTO> note() {
		return resDao.note();
	}

	public List<CalenderDTO> project() {
		return resDao.project();
	}

	public List<CalenderDTO> car() {
		return resDao.car();
	}

	public CalenderDTO itemDetail(String no) {
		return resDao.itemDetail(no);
	}


}
