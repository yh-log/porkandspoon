package kr.co.porkandspoon.service;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.RestDTO;
import kr.co.porkandspoon.dto.UserDTO;
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
		logger.info("공지사항 idx => " + restBoardIdx);
		restDTO.setBoard_idx(restBoardIdx);
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
		restDTO.setMessage("휴점이 등록되었습니다.");

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
	public List<RestDTO> restList(int page, int cnt, String option, String keyword) {

		int limit = cnt; // 10
		int offset = (page -1) * cnt;

		Map<String, Object> listMap = new HashMap<>();
		listMap.put("limit", limit);
		listMap.put("offset", offset);
		listMap.put("option", option);
		listMap.put("keyword", keyword);

		List<RestDTO> restDTOList = manageDAO.restList(listMap);

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
}
