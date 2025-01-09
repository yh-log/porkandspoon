package kr.co.porkandspoon.service;

import java.util.List;

import kr.co.porkandspoon.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.porkandspoon.dao.MyPageDAO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyPageDAO myPageDao;

	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동 및 정보 조회
	 */
	public UserDTO myPageDetail(String username) {
		
		UserDTO dto = new UserDTO();
		
		dto= myPageDao.myPageDetail(username);
		
		if(dto == null) {
			dto.setStatus(400);
			dto.setMessage("직원 정보가 없습니다.");
		}
		
		// 직원 이력 조회
		dto.setCareer(myPageDao.myPageCareerDetail(username));
		
		dto.setStatus(200);
		dto.setMessage("직원 정보 조회를 완료했습니다.");
		
		return dto;
	}


	public int count(String username, int cnt_, String opt, String keyword) {
		
		return myPageDao.count(username,cnt_,opt,keyword);
	}

	public List<MealDTO> buyList(String username,String opt, String keyword, int limit, int offset) {
		
		return myPageDao.buyList(username,opt,keyword,limit,offset);

	}
	/**
	 * author yh.kim (24.12.27)
	 * 마이페이지 정보 수정
	 */
	public boolean myPageUpdate(MultipartFile file, UserDTO dto) {
		
		int updateRow = myPageDao.myPageUpdate(dto);
		logger.info("마이페이지 수정 로우 => " + updateRow);
		
		if(file != null && !file.isEmpty()) {
			try {
				FileDTO fileDto = new FileDTO();
				fileDto = CommonUtil.uploadSingleFile(file);
				fileDto.setCode_name("up100");
				fileDto.setPk_idx(dto.getUsername());
				
				int fileDeleteRow = myPageDao.fileDelete(fileDto);

				
				if(fileDeleteRow == 0) {
		    		logger.warn("삭제할 파일 정보가 없습니다.");
		    	}
				
				int fileUploadRow = myPageDao.fileUpdate(fileDto);
				logger.info("파일 수정 로우 => " + fileUploadRow);
				
			}catch (Exception e) {
				logger.error("파일 업로드 중 오류 발생", e);
				return false;
			}
			
		}else {
			logger.warn("프로필 이미지 파일이 없습니다.");
		}
		
		return true;

	}


	public int signSave(FileDTO dto) {
		
		return myPageDao.fileUpdate(dto);

	}


	public FileDTO signExist(String pk_idx, String code_name) {
		return myPageDao.signExist(pk_idx,code_name);
		
	}


	public int fileDelete(FileDTO dto) {
		return myPageDao.fileDelete(dto);
		
	}


	/**
	 * author yh.kim, (25.01.08)
	 * 출장 리스트 조회
	 */
    public List<TripDTO> tripList(PagingDTO pagingDTO, String username) {

		pagingDTO.setUsername(username);
		List<TripDTO> tripDTO = myPageDao.tripList(pagingDTO);
		return tripDTO;
    }

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 상세 페이지 이동 및 조회
	 */
	public TripDTO tripDetail(int schedule_idx) {

		TripDTO tripDTO = myPageDao.tripDetail(schedule_idx);

		return tripDTO;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 비활성화
	 */
	public TripDTO tripDelete(TripDTO tripDTO) {

		int tripDeleteRow = myPageDao.tripDelete(tripDTO);
		if(tripDeleteRow == 0){
			tripDTO.setStatus(500);
			tripDTO.setMessage("출장을 삭제하지 못했습니다.");
			return tripDTO;
		}

		// 캘린더 테이블에서 삭제 필요
		int tripCalenderDeleteRow = myPageDao.tripCalenderDelete(tripDTO);
		if(tripCalenderDeleteRow == 0){
			tripDTO.setStatus(500);
			tripDTO.setMessage("출장 캘린더 일정을 삭제하지 못했습니다.");
			return tripDTO;
		}

		tripDTO.setStatus(200);
		tripDTO.setMessage("출장을 삭제했습니다.");

		return tripDTO;

	}


	/**
	 * author yh.kim, (25.01.08)
	 * 출장 일정 데이터 가공
	 */
	public static String convertToTargetFormat(String dateString) {
		// 'T'를 공백으로 대체하고 ":00" 추가
		return dateString.replace("T", " ") + ":00";
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 등록
	 */
	public TripDTO tripWrite(TripDTO tripDTO) {

		tripDTO.setStart_date(convertToTargetFormat(tripDTO.getStart_date()));
		tripDTO.setEnd_date(convertToTargetFormat(tripDTO.getEnd_date()));

		// 출장 캘린더 등록
		int tripCalenderRow = myPageDao.tripCalenderWrite(tripDTO);
		if(tripCalenderRow == 0) {
			tripDTO.setStatus(500);
			tripDTO.setMessage("출장 캘린더 등록에 실패했습니다.");
			return tripDTO;
		}

		int writeRow = myPageDao.tripWrite(tripDTO);
		if(writeRow == 0) {
			tripDTO.setStatus(500);
			tripDTO.setMessage("출장 등록에 실패했습니다.");
			return tripDTO;
		}

		tripDTO.setStatus(200);
		tripDTO.setMessage("출장 등록에 성공했습니다.");
		return tripDTO;

	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 수정
	 */
	public TripDTO tripUpdate(TripDTO tripDTO) {

		tripDTO.setStart_date(convertToTargetFormat(tripDTO.getStart_date()));
		tripDTO.setEnd_date(convertToTargetFormat(tripDTO.getEnd_date()));

		// 출장 테이블 업데이트
		int tripUpdateRow = myPageDao.tripUpdate(tripDTO);
		if(tripUpdateRow == 0) {
			tripDTO.setStatus(500);
			tripDTO.setMessage("출장 수정이 미완료되었습니다.");
			return tripDTO;
		}


		// 캘린더 테이블 업데이트
		int tripCalenderRow = myPageDao.tripCalenderUpdate(tripDTO);
		if(tripCalenderRow == 0) {
			tripDTO.setStatus(500);
			tripDTO.setMessage("출장 수정이 미완료되었습니다.");
			return tripDTO;
		}

		tripDTO.setStatus(200);
		tripDTO.setMessage("출장 수정이 완료되었습니다.");

		return tripDTO;
	}
}
