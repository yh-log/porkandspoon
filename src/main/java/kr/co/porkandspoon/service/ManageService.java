package kr.co.porkandspoon.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.TemporalAdjusters;
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
	    manageDAO.setPartWrite(params);
	    String part_Idx = CommonUtil.toString(params.get("part_idx"));
	    params.put("part_Idx", part_Idx);
	    String getpay = params.get("pay");
	    String joinDate = params.get("join_date"); // 입사일 기준
	    
	    // 고정근무시간 추가
	    for (int i = 0; i < workDates.size(); i++) {
	    	Map<String, String> timeParams = new HashMap<>();
	    	timeParams.put("part_idx", part_Idx);
	    	timeParams.put("work_date", workDates.get(i));
	    	timeParams.put("start_time", startTimes.get(i));
	    	timeParams.put("end_time", endTimes.get(i));
	    	manageDAO.setPartTime(timeParams); // 새로운 데이터 삽입
	    }
	    
	    
	    for (int i = 0; i < workDates.size(); i++) {
	        addPartHistory(
	            getpay,
	            part_Idx,
	            workDates.get(i),
	            startTimes.get(i),
	            endTimes.get(i),
	            joinDate // 입사일 기준으로 처리
	        );
	    }

	    return 1;
	}


	private void addPartHistory(String getpay, String partIdx, String workDay, String startTime, String endTime, String baseDateStr) {
	    LocalDate baseDate = LocalDate.parse(baseDateStr); // 기준 날짜 (입사일 또는 수정일)
	    LocalDate today = LocalDate.now(); // 현재 날짜
	    LocalDate nextWorkDate = baseDate.with(TemporalAdjusters.nextOrSame(mapDayOfWeek(workDay))); // 기준 날짜 이후 첫 근무일
	    int pay = Integer.parseInt(getpay);

	    // 종료 조건: 해당 연말까지 반복
	    while (!nextWorkDate.isAfter(today.with(TemporalAdjusters.lastDayOfYear()))) {
	        // start_time과 end_time을 LocalTime으로 변환
	        LocalTime StartTime = LocalTime.parse(startTime); // 문자열 -> LocalTime
	        LocalTime EndTime = LocalTime.parse(endTime); // 문자열 -> LocalTime

	        Map<String, Object> historyParams = new HashMap<>();
	        historyParams.put("part_idx", partIdx);
	        historyParams.put("pay", pay); // 기본 값
	        historyParams.put("work_date", nextWorkDate.toString());
	        historyParams.put("start_time", StartTime.toString()); // LocalTime -> 문자열로 변환 후 삽입
	        historyParams.put("end_time", EndTime.toString()); // LocalTime -> 문자열로 변환 후 삽입
	        historyParams.put("is_done", "N");

	        manageDAO.setPartHistory(historyParams); // DB 삽입
	        nextWorkDate = nextWorkDate.plusWeeks(1); // 다음 주 동일 요일
	    }
	}


	// 요일 매핑 함수
	private DayOfWeek mapDayOfWeek(String workDate) {
	    switch (workDate) {
	        case "월": return DayOfWeek.MONDAY;
	        case "화": return DayOfWeek.TUESDAY;
	        case "수": return DayOfWeek.WEDNESDAY;
	        case "목": return DayOfWeek.THURSDAY;
	        case "금": return DayOfWeek.FRIDAY;
	        case "토": return DayOfWeek.SATURDAY;
	        case "일": return DayOfWeek.SUNDAY;
	        default: throw new IllegalArgumentException("Invalid work date: " + workDate);
	    }
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

	    manageDAO.deletePartTime(part_Idx); // 기존 데이터 삭제
	    for (int i = 0; i < workDates.size(); i++) {
	        Map<String, String> timeParams = new HashMap<>();
	        timeParams.put("part_idx", part_Idx);
	        timeParams.put("work_date", workDates.get(i));
	        timeParams.put("start_time", startTimes.get(i));
	        timeParams.put("end_time", endTimes.get(i));
	        manageDAO.setPartTime(timeParams); // 새로운 데이터 삽입
	    }

	    LocalDate today = LocalDate.now(); // 수정일 기준
	    manageDAO.deletePartHistory(part_Idx, today.toString()); // 수정일 이후 데이터 삭제

	    String getpay = params.get("pay");
	    for (int i = 0; i < workDates.size(); i++) {
	        addPartHistory(
	            getpay,
	            part_Idx,
	            workDates.get(i),
	            startTimes.get(i),
	            endTimes.get(i),
	            today.toString() // 수정일 기준으로 처리
	        );
	    }

	    return 1;
	}



	public int count(int cnt, String opt, String keyword) {
		
		return manageDAO.count(cnt,opt,keyword);
	}


	public List<ManageDTO> getPartList(String opt, String keyword, int limit, int offset) {
		
		return manageDAO.getPartList(opt,keyword,limit,offset);
	}



	public int Quitcount(int cnt, String opt, String keyword) {
		
		return manageDAO.Quitcount(cnt,opt,keyword);
	}



	public List<ManageDTO> getPartQuitList(String opt, String keyword, int limit, int offset) {
		
		return manageDAO.getPartQuitList(opt,keyword,limit,offset);
	}



	public List<ManageDTO> getPartTime(String owner) {
		
		return manageDAO.getPartTime(owner);
	}


	public void addPartHistory(Map<String, String> params) {
	
		
	}



	
	
	
}
