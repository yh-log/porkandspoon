package kr.co.porkandspoon.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.porkandspoon.dao.MyPageDAO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.dto.UserDTO;
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


	public int count(int cnt_, String opt, String keyword) {
		String username = "";
		return myPageDao.count(cnt_,opt,keyword);
	}

	public List<MealDTO> buyList(String opt, String keyword, int limit, int offset) {
		
		return myPageDao.buyList(opt,keyword,limit,offset);

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
	
}
