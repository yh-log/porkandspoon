package kr.co.porkandspoon.service;


import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import kr.co.porkandspoon.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ManageDAO;
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

// 아르아이트 히스토리 테이블 날짜 변환후 인서트 기능
	private void addPartHistory(String getpay, String partIdx, String workDay, String startTime, String endTime, String baseDateStr) {
	    LocalDate baseDate = LocalDate.parse(baseDateStr); // 기준 날짜 (입사일 또는 수정일)
	    LocalDate today = LocalDate.now(); // 현재 날짜
	    LocalDate nextWorkDate = baseDate.with(TemporalAdjusters.nextOrSame(mapDayOfWeek(workDay))); // 기준 날짜 이후 첫 근무일
	    logger.info("기준날짜 : {}",baseDateStr);
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
	    
	    String quit = params.get("is_quit");
	   if (quit.equals("Y")) {
		   
		   LocalDate gettoday = LocalDate.now(); // 수정일 기준
			String today = gettoday.toString();
			logger.info(today);
			manageDAO.deletePartHistory(part_Idx,today ); // 수정일 이후 데이터 삭제
		
	} else {
		
		LocalDate gettoday = LocalDate.now(); // 수정일 기준
		String today = gettoday.toString();
		logger.info(today);
		manageDAO.deletePartHistory(part_Idx,today ); // 수정일 이후 데이터 삭제
		
		String getpay = params.get("pay");
		for (int i = 0; i < workDates.size(); i++) {
			addPartHistory(
					getpay,
					part_Idx,
					workDates.get(i),
					startTimes.get(i),
					endTimes.get(i),
					today // 수정일 기준으로 처리
					);
		}
	}
	    

	    return 1;
	}



	public int count(int cnt, String opt, String keyword, String owner, String is_quit) {
		
		return manageDAO.count(cnt,opt,keyword,owner,is_quit);
	}


	public List<ManageDTO> getPartList(String opt, String keyword, int limit, int offset, String owner, String is_quit) {
		
		return manageDAO.getPartList(opt,keyword,limit,offset,owner,is_quit);
	}


	public int delPart(String part_idx) {
			
			return manageDAO.delPart(part_idx);
		}
	



	public List<ManageDTO> getPartTime(String owner) {
		
		return manageDAO.getPartTime(owner);
	}


	

	public void editPartHistory(Map<String, String> params) {
		
		params.get("part_name");
		
		manageDAO.editPartHistory(params);

	}
	
	public void setPartHistory(Map<String, Object> params) {
		manageDAO.setPartHistory(params);
		
	}
	

	public List<ManageDTO> getPartNames(String owner) {
		
		return manageDAO.getPartNames(owner);
	}

	
	
	
	
	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 페이지 이동 시 부서, 직영점명 조회
	 */
    public UserDTO getUserStoreInfo(String username) {

		UserDTO userDTO = manageDAO.getUserStoreInfo(username);
		
		if (userDTO == null){
			userDTO.setStatus(500);
			userDTO.setMessage("직원 정보를 조회하지 못했습니다.");
			return userDTO;
		}
		
		return userDTO;

    }

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록
	 */
	public RestDTO restWrite(RestDTO restDTO) {

		int restRow = manageDAO.restWrite(restDTO);

		logger.info("idx 값 1 : " + restDTO.getRest_idx());
		logger.info("휴점 등록 로우 => " + restRow);

		if(restRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 등록에 실패했습니다.");
		}

		restDTO.setType("Y");
		int storeRestUpdateRow = manageDAO.storeRestUpdate(restDTO);

		logger.info("직영점 업데이트 로우 => " + storeRestUpdateRow);

		int contentImgRow = fileWrite(restDTO);
		logger.info("파일업로드 => " + contentImgRow);

		logger.info("idx 값 2 : " + restDTO.getRest_idx());

		// 공지사항 등록
		int restBoardIdx = restBoardWrite(restDTO, "W");
		logger.info("공지사항 로우 => " + restBoardIdx);
		logger.info("공지사항 idx === >  " + restDTO.getBoard_idx());
		//restDTO.setBoard_idx(restBoardIdx);
		if(restBoardIdx == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 공지 등록에 실패했습니다.");
			return restDTO;
		}

		logger.info("idx 값 3 : " + restDTO.getRest_idx());

		// 캘린더 등록
		int schedule_idx = manageDAO.restCalenderWrite(restDTO);
		logger.info(schedule_idx + "받아온 스케쥴 idx 값");
		restDTO.setSchedule_idx(restDTO.getIdx());
		logger.info("get 스케쥴 idx 값 : " + restDTO.getSchedule_idx());
		if(restDTO.getSchedule_idx() == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 일정 등록에 실패했습니다.");
			return restDTO;
		}

		logger.info("idx 값 4 : " + restDTO.getRest_idx());

		int idxInsertRow = manageDAO.restIdxWrite(restDTO);
		logger.info("idx insert row => " + idxInsertRow);

		logger.info("idx 값 5 : " + restDTO.getRest_idx());

		if(idxInsertRow == 0){
			logger.warn("휴점 idx insert 실패");
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 일정 등록에 실패했습니다.");
			return restDTO;
		}

		logger.info("idx 값 6 : " + restDTO.getRest_idx());

		restDTO.setStatus(200);
		restDTO.setMessage("휴점이 등록되었습니다.");

		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.04)
	 * 파일 insert
	 */
	private int fileWrite(RestDTO restDTO) {
		List<FileDTO> imgs = restDTO.getImgs();

		int row = 0;
		if(imgs.size() > 0 || imgs != null){
			List<String> fileNames = imgs.stream()
					.map(FileDTO::getNew_filename)
					.filter(Objects::nonNull)
					.collect(Collectors.toList());

			boolean fileMoveResult = CommonUtil.moveFiles(fileNames);
			logger.info("파일 이동 결과: {}", fileMoveResult);

			for (FileDTO fileDTO : imgs) {
				fileDTO.setPk_idx(Integer.toString(restDTO.getRest_idx()));
				fileDTO.setCode_name("rs1000");

				String type = fileDTO.getOri_filename().substring(fileDTO.getOri_filename().lastIndexOf("."));
				fileDTO.setType(type);

				int contentImgRow = manageDAO.restFileWrite(fileDTO);
				row = row + contentImgRow;
				logger.info("파일 등록 로우 => " + contentImgRow);
			}

		}

		return row;
	}


	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 시 공지사항 등록
	 */
	private int restBoardWrite(RestDTO restDTO, String type) {

		String subject = "[휴점]" + restDTO.getSubject() + " ※ 휴점 기간 : " + restDTO.getStart_date() + " ~ " + restDTO.getEnd_date();
		restDTO.setSubject(subject);

		int restBoardRow = 0;

		if(type.equals("W")){
			restBoardRow = manageDAO.restBoardWrite(restDTO);
		}else if(type.equals("S")){
			restBoardRow = manageDAO.restBoardUpdate(restDTO);
		}

		return restBoardRow;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 상세보기, 휴점 수정 페이지 이동
	 */
	public RestDTO getRestDetail(String idx) {

		RestDTO restDTO = new RestDTO();

		if(idx == null || idx.isEmpty()){
			restDTO.setStatus(500);
			restDTO.setMessage("등록된 휴점 정보가 없습니다.");

			return restDTO;
		}
		restDTO = manageDAO.getRestDetail(idx);

		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정
	 */
	@Transactional
	public RestDTO restUpdate(RestDTO restDTO) {

		logger.info("rest DTO 1 => " + CommonUtil.toString(restDTO));

		int restRow = manageDAO.restUpdate(restDTO);

		logger.info("휴점 수정 로우 => " + restRow);

		logger.info("rest DTO 2 => " + CommonUtil.toString(restDTO));

		if(restRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 등록에 실패했습니다.");
			return restDTO;
		}

		// int storeRestUpdateRow = manageDAO.storeRestUpdate(restDTO);

		// logger.info("직영점 업데이트 로우 => " + storeRestUpdateRow);

		int contentImgRow = fileWrite(restDTO);
		logger.info("파일업로드 로우 => " + contentImgRow);

		logger.info("rest DTO 3 => " + CommonUtil.toString(restDTO));

		// 공지사항 수정
		int restBoardUpdate = restBoardWrite(restDTO, "S");
		logger.info("공지 수정 로우 -> " + restBoardUpdate);
		if(restBoardUpdate == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 공지 등록에 실패했습니다.");
			return restDTO;
		}

		logger.info("rest DTO 4 => " + CommonUtil.toString(restDTO));

		// 캘린더 수정
		int restCalenderUpdateRow = manageDAO.restCalenderUpdate(restDTO);
		logger.info("캘린더 작성 로우 => " + restCalenderUpdateRow);

		logger.info("rest DTO 5 => " + CommonUtil.toString(restDTO));

		if(restCalenderUpdateRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 일정 등록에 실패했습니다.");
			return restDTO;
		}


		logger.info("rest DTO 6 => " + CommonUtil.toString(restDTO));

		restDTO.setStatus(200);
		restDTO.setMessage("휴점이 수정되었습니다.");

		return restDTO;

	}

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 비활성화
	 */
	public RestDTO restDelete(RestDTO restDTO) {

		// 휴점 테이블 업데이트
		int restDeleteRow = manageDAO.restDelete(restDTO);
		logger.info("휴점 삭제 로우 => " + restDeleteRow);

		if(restDeleteRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 삭제에 실패했습니다.");
			return restDTO;
		}

		// 직영점 테이블 업데이트
		restDTO.setType("N");
		int storeUpdateRow = manageDAO.storeRestUpdate(restDTO);
		logger.info("직영점 업데이트 로우 => " + storeUpdateRow);

		if(storeUpdateRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("직영점 휴점 정보 수정에 실패했습니다.");
			return restDTO;
		}
		
		// 캘린더 테이블 삭제
		int restCalenderDeleteRow = manageDAO.restCalenderDelete(restDTO);
		logger.info("캘린더 삭제 로우  => " + restCalenderDeleteRow);

		if(restCalenderDeleteRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 정보 삭제에 실패했습니다.");
			return restDTO;
		}

		// 공지사항 테이블 업데이트
		int restBoardDeleteRow = manageDAO.restBoardDelete(restDTO);
		logger.info("공지 삭제 로우  => " + restBoardDeleteRow);

		if(restBoardDeleteRow == 0){
			restDTO.setStatus(500);
			restDTO.setMessage("휴점 정보 삭제에 실패했습니다.");
			return restDTO;
		}

		restDTO.setStatus(200);
		restDTO.setMessage("휴점이 삭제되었습니다.");

		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 리스트 조회
	 */
	public List<RestDTO> restList(PagingDTO pagingDTO) {

//		int limit = cnt; // 10
//		int offset = (page -1) * cnt;
//
//		Map<String, Object> listMap = new HashMap<>();
//		listMap.put("limit", limit);
//		listMap.put("offset", offset);
//		listMap.put("option", option);
//		listMap.put("keyword", keyword);

		List<RestDTO> restDTOList = manageDAO.restList(pagingDTO);

		return restDTOList;
	}

	/**
	 * author yh.kim (25.01.04)
	 * 휴점 활성 여부 체크 스케쥴러
	 * 매일 00:05 실행
	 */
	public void restCheckScheduler() {
		int updateRow = manageDAO.restCheckScheduler();
		logger.info("엄데이트 된 로우 => " + updateRow);
	}


	public void OneDelPartHistory(Map<String, String> params) {
		manageDAO.OneDelPartHistory(params);
	}


	public  List<ManageDTO> getBrandList() {
		
		return manageDAO.getBrandList();
	}


	public List<ManageDTO> getPartList5(String owner) {
		
		return manageDAO.getPartList5(owner);
	}


	public ManageDTO getDirectInfo(String owner) {
		
		return manageDAO.getDirectInfo(owner);
	}


	public List<ManageDTO> getDirectList(String id) {
		
		return manageDAO.getDirectList(id);
	}


	public ManageDTO getBrandInfo(String id) {
		
		return manageDAO.getBrandInfo(id);
	}


	public String getCEOInfo() {
		
		return manageDAO.getCEOInfo();
	}


	public FileDTO getFile(String code_name, String id ) {
		
		return manageDAO.getFile(code_name,id);
	}


	public ManageDTO getSpotName(String owner) {
		return manageDAO.getSpotName(owner);
		
	}

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 등록 시 과거 매출 내역 조회
	 */
	public ManageDTO pastSeales(ManageDTO manageDTO) {

		manageDTO = manageDAO.pastSeales(manageDTO);

		if (manageDTO.getSale() == 0){
			manageDTO.setStatus(204);
			manageDTO.setMessage("과거 정보가 없습니다.");
			return manageDTO;
		}

		manageDTO.setStatus(200);
		manageDTO.setMessage("과거 매출 정보를 불러왔습니다.");

		return manageDTO;
	}

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 등록 or 수정
	 */
	public ManageDTO salesWrite(ManageDTO manageDTO) {

		// text 가 N일 경우 isnert
		if(manageDTO.getText().equals("N")){
			int writeRow = manageDAO.salesWrite(manageDTO);
			if(writeRow == 0){
				manageDTO.setStatus(500);
				manageDTO.setMessage("매출 등록에 실패했습니다.");
				return manageDTO;
			}
		// text 가 U일 경우 update
		}else{
			int updateRow = manageDAO.salesUpdate(manageDTO);
			if(updateRow == 0){
				manageDTO.setStatus(500);
				manageDTO.setMessage("매출 수정에 실패했습니다.");
				return manageDTO;
			}
		}

		manageDTO.setStatus(200);
		manageDTO.setMessage("매출 등록에 성공했습니다.");


		return manageDTO;

	}

	/**
	 * author yh.kim, (25.01.09)
	 * 매출 통계 월별 데이터 저장 스케쥴러
	 * 매일 00:01 실행
	 */
	public void salesMonthScheduler() {

		LocalDateTime time = LocalDateTime.now();
		String date = CommonUtil.formatDateTime(time.minusDays(1), "yyyy-MM-dd");

		String year = date.split("-")[0];
		String month = date.split("-")[1];
		String day = date.split("-")[2];

		int insertRow = manageDAO.salesMonthScheduler(year, month, day);
		logger.info("입력된 월별 데이터 된 로우 => " + insertRow);
	}

	/**
	 * author yh.kim, (25.01.09)
	 * 매출 통계 일별 데이터 저장 스케쥴러
	 * 매일 00:01 실행
	 */
	public void salesDailyScheduler() {

		LocalDateTime time = LocalDateTime.now();
		String date = CommonUtil.formatDateTime(time.minusDays(1), "yyyy-MM-dd");

		String year = date.split("-")[0];
		String month = date.split("-")[1];
		String day = date.split("-")[2];

		int insertRow = manageDAO.salesDailyScheduler(year, month, day);
		logger.info("입력된 일별 데이터 된 로우 => " + insertRow);
	}

	/**
	 * author yh.kim, (25.01.10)
	 * 직영점 매출 통계 조회
	 */
	public List<ChartDTO> getChartStatistics(String id, String year) {

		List<ChartDTO> chartDTO = new ArrayList<>();

		chartDTO.addAll(manageDAO.getWeekChartStatistics(id, year));
		logger.info("첫 " + CommonUtil.toString(chartDTO));

		chartDTO.addAll(manageDAO.getMonhtChartStatistics(id, year));
		logger.info("둘 " + CommonUtil.toString(chartDTO));

		return chartDTO;
	}

	/**
	 * author yh.kim, (25.01.10)
	 * 브랜드별 매출 통계 조회
	 */
	public List<ChartDTO> getChartDirectStatistics(String id, String year, String type) {

		List<ChartDTO> chartDTO = new ArrayList<>();

		Map<String, String> params = new HashMap<>();
		params.put("id", id);
		params.put("year", year);
		params.put("ctype", type);

		if(type.equals("S")){
			chartDTO.addAll(manageDAO.getChartBrandStatistics(params));
			logger.info("첫 " + CommonUtil.toString(chartDTO));
		}else {
			chartDTO.addAll(manageDAO.getChartDirectStatistics(params));
			logger.info("첫 " + CommonUtil.toString(chartDTO));

		}

		chartDTO.addAll(manageDAO.getMonhtDirectStatistics(params));
		logger.info("둘 " + CommonUtil.toString(chartDTO));

		return chartDTO;
	}

	
}
