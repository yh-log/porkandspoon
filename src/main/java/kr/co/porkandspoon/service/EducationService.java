package kr.co.porkandspoon.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.EducationDAO;
import kr.co.porkandspoon.dto.DeptDTO;

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

}
