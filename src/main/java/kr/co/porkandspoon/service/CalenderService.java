package kr.co.porkandspoon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.CalenderDAO;
import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class CalenderService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CalenderDAO calenderDao;
	
	// 일정리스트 호출
    public List<CalenderDTO> calenderList(List<String> filters, String loginId, String dept) {
        Map<String, Object> params = new HashMap<>();
        params.put("filters", filters);
        params.put("loginId", loginId);
        params.put("dept", dept);
        logger.info("서비스일때 필터항목 : "+filters);
        return calenderDao.calenderList(params);
    }
	
	// 일정 등록
	public boolean calenderWrite(CalenderDTO calederDto) {
		return calenderDao.calenderWrite(calederDto) > 0 ? true : false;
	}
	
	// 일정 상세보기
	public CalenderDTO calenderDetail(int idx, String filter) {
		
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("idx", idx);
		params.put("filter", filter);
		logger.info("파람 : "+params);
		
		if("A".equals(filter)) {
			return calenderDao.calenderDetailA(params);
		}else if("R".equals(filter)){			
			return calenderDao.calenderDetailR(params);
		}else {
			return calenderDao.calenderDetail(params);
		}		
		
	}
	// 일정 수정
	public boolean calenderUpdate(String idx, CalenderDTO calenderDto) {
		int result = calenderDao.calenderUpdate(idx, calenderDto);
		return result > 0;
	}
	// 일정 삭제
	public boolean calenderDelete(String idx) {	
		return calenderDao.calenderDelete(idx) > 0 ? true : false;
	}
	// 로그인한 유저의 부서정보
	public String dept(String loginId) {
		return calenderDao.dept(loginId);
		
	}

	public List<UserDTO> attendeesList(int idx) {
		return calenderDao.attendeesList(idx);
	}
	


}
