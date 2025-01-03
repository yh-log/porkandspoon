package kr.co.porkandspoon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ManageDAO;
import kr.co.porkandspoon.dto.ManageDTO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class ManageService {

Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ManageDAO manageDAO;

	

	@Transactional
	 public int setPartWrite(Map<String, String> params, List<String> workDates, List<String> startTimes, List<String> endTimes) {
	        // part 테이블 저장
	        manageDAO.setPartWrite(params);
	        String part_Idx = CommonUtil.toString(params.get("part_idx"));
	        params.put("part_Idx", part_Idx);
	        
	        // part_time 테이블 저장 (반복)
	        for (int i = 0; i < workDates.size(); i++) {
	            Map<String, String> timeParams = new HashMap<>();
	            timeParams.put("part_idx", part_Idx);
	            timeParams.put("work_date", workDates.get(i));
	            timeParams.put("start_time", startTimes.get(i));
	            timeParams.put("end_time", endTimes.get(i));
	            logger.info("timesParmas : {}",timeParams);
	            manageDAO.setPartTime(timeParams);
	        }

	        return 1;
	    }



	public ManageDTO partDetail(int part_idx) {
		return manageDAO.partDetail(part_idx);
		
	}



	public List<ManageDTO> scheduleDetail(int part_idx) {
		// TODO Auto-generated method stub
		return manageDAO.scheduleDetail(part_idx);
	}


	@Transactional
	public int editPart(Map<String, String> params, List<String> workDates, List<String> startTimes, List<String> endTimes) {
		manageDAO.editPart(params);
		String part_Idx = CommonUtil.toString(params.get("part_idx"));
        params.put("part_Idx", part_Idx);
        
        manageDAO.deletePartTime(part_Idx);
        
		for (int i = 0; i < workDates.size(); i++) {
            Map<String, String> timeParams = new HashMap<>();
            timeParams.put("part_idx", part_Idx);
            timeParams.put("work_date", workDates.get(i));
            timeParams.put("start_time", startTimes.get(i));
            timeParams.put("end_time", endTimes.get(i));
            logger.info("timesParmas : {}",timeParams);
            manageDAO.setPartTime(timeParams);
        }
		
		return   1; 
		

		
	}



	
	
	
}
