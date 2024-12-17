package kr.co.porkandspoon.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.porkandspoon.dao.TestDAO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MemberDTO;
import kr.co.porkandspoon.dto.ResponseDTO;
import kr.co.porkandspoon.util.CommonUtil;



@Service
public class TestService {
	
	@Autowired TestDAO testDao;

	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${upload.path}") String paths; // 사용자 지정
	
	@Value("${uploadTem.path}") String paths_tem;
	
	public String login(MemberDTO dto) {
		return testDao.login(dto);
	}

	public boolean joinWrite(MemberDTO dto) {
		return testDao.joinWrite(dto) > 0 ? true : false;
	}
	

	
	/*
	 * author yh.kim (24.12.6)
	 * 일정 캘린더 작성
	 */
	public boolean scheduleWrite(Map<String, Object> params) {
		return testDao.scheduleWrite(params) > 0 ? true : false;
	}

	/*
	 * author yh.kim (24.12.6)
	 * 일정 캘린더 리스트 호출
	 */
	public List<Map<String, Object>> scheduleList() {
		return testDao.scheduleList();
	}
	

	
	public List<Map<String, Object>> fileList() {
		return testDao.fileList();
	}

	public List<Map<String, Object>> menu_tree() {
		return testDao.menu_tree();
	}

	
	
	/*
	 * 파일 등록
	 */
	public FileDTO saveFiles(MultipartFile[] files) {
		
		 List<FileDTO> fileDtos = CommonUtil.uploadFiles(files);
		 FileDTO dto = new FileDTO();
		 
		 int insertedRows = testDao.fileWrite(fileDtos);
		 if (insertedRows != fileDtos.size()) {
            throw new RuntimeException("일부 파일 저장 실패");
        }else {
        	// 응답 내용 사용 예시
        	dto.setStatus(200);
        	dto.setMessage("파일 등록이 완료되었습니다");
        }
		return dto;
	}

}
