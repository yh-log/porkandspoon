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
	
	


	/*
	 * 파일 등록
	 */
//    public ResponseDTO<List<FileDTO>> saveFiles(MultipartFile[] files) {
//        // 1. 유틸리티 클래스에서 파일 리스트 생성
//        List<FileDTO> fileDtos = CommonUtil.uploadFiles(files);
//
//        // 2. DB 저장
//        int insertedRows = testDao.fileWrite(fileDtos);
//        if (insertedRows != fileDtos.size()) {
//            throw new RuntimeException("일부 파일 저장 실패");
//        }
//
//        // 3. 성공 응답 생성
//        return new ResponseDTO<>(200, "파일 업로드 성공", fileDtos);
//    
//    
//		
//	    if (files == null || files.length == 0) {
//	        throw new IllegalArgumentException("업로드된 파일이 없습니다.");
//	    }
//
//	    for (MultipartFile file : files) {
//	        String oriFilename = file.getOriginalFilename();
//	        String ext = oriFilename.substring(oriFilename.lastIndexOf("."));
//	        String newFilename = UUID.randomUUID().toString() + ext;
//
//	        Map<String, Object> param = new HashMap<>();
//	        param.put("ori_filename", oriFilename);
//	        param.put("new_filename", newFilename);
//	        param.put("type", ext);
//
//	        try {
//	            byte[] arr = file.getBytes();
//	            Path path = Paths.get(paths + newFilename);
//
//	            // 파일 저장
//	            Files.write(path, arr);
//
//	            // DB 기록
//	            if (testDao.fileWrite(param) <= 0) {
//	                throw new RuntimeException("DB 기록 실패: " + newFilename);
//	            }
//	        } catch (IOException e) {
//	            logger.error("파일 저장 중 오류 발생: " + newFilename, e);
//	            return false; // 특정 파일 실패 시 false 반환
//	        }
//	    }
//	    return true; // 모든 파일 저장 성공
//	}

	
	public List<Map<String, Object>> fileList() {
		return testDao.fileList();
	}

	public List<Map<String, Object>> menu_tree() {
		return testDao.menu_tree();
	}



}
