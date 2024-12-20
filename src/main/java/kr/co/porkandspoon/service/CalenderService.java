package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.CalenderDAO;

@Service
public class CalenderService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CalenderDAO calenderDao;
	
	// 일정리스트 호출
	public List<Map<String, Object>> calenderList() {
		return calenderDao.calenderList();
	}
	
	// 일정 등록
	public boolean calenderWrite(Map<String, Object> params) {
		return calenderDao.calenderWrite(params) > 0 ? true : false;
	}
	

}
