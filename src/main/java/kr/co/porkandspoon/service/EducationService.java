package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.EducationDAO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.EducationDTO;

@Service
public class EducationService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired EducationDAO eduDao;
	
	public List<DeptDTO> dept() {
		return eduDao.dept();
	}

	public int educationWrite(Map<String, Object> params) {
		return eduDao.educationWrite(params);
	}

	public Object educationList(Map<String, Object> params) {
		int page_ = Integer.parseInt((String)params.get("page"));
        int cnt_ = Integer.parseInt((String)params.get("cnt"));
        int limit = cnt_;
        int offset = (page_ - 1) * cnt_;
        params.put("limit", limit);
        params.put("offset", offset);
       
        return eduDao.educationList(params);
	}

	public EducationDTO detail(int no) {	
		return eduDao.detail(no);
	}

	public int educationUpdate(Map<String, Object> params) {		
		return eduDao.educationUpdate(params);
	}

	public boolean educationHistory(int no, String username) {
		
        // 이수 기록이 이미 존재하는지 확인 (중복 방지)
        int count = eduDao.history(no, username);
        if (count > 0) {
        	// 이미 이수 기록이 존재하므로 삽입하지 않음
        	return false;
        }
            
        // 이수 기록 삽입
        eduDao.educationHistory(no, username);
        return true;

	}

	public int eduDelete(int no) {	
		return eduDao.eduDelete(no);
	}

}
