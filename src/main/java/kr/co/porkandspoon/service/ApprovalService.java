package kr.co.porkandspoon.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import kr.co.porkandspoon.dao.ApprovalDAO;
import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class ApprovalService {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalDAO approvalDAO;
	
    @Value("${upload.path}") String paths;
    @Value("${uploadTem.path}") String tem_path;
	
	public UserDTO getUserInfo(String loginId) {
		return approvalDAO.getUserInfo(loginId);
	}
	
	public List<DeptDTO> getDeptList() {
		return approvalDAO.getDeptList();
	}

	public int saveDraft(ApprovalDTO approvalDTO) {
		approvalDTO.setDocument_number(generateDocumentNumber());
		logger.info("docNumber : "+ approvalDTO.getDocument_number());
		logger.info("getUsername : "+ approvalDTO.getUsername());
		
		int row = approvalDAO.saveDraft(approvalDTO);
		logger.info("row : "+ row);
		String draftIdx = approvalDTO.getDraft_idx();
		logger.info("draftIdx : "+ draftIdx);
		
	    // 이미지 정보 저장 (이미지가 있을 경우 반복문 사용)
        List<FileDTO> imgs = approvalDTO.getFileList();
        if (imgs != null && !imgs.isEmpty()) {
            for (FileDTO img : imgs) {
            	logger.info("img : "+ img);
            	logger.info("img.getOri_filename() : "+ img.getOri_filename());
                img.setPk_value(draftIdx);
                img.setCode_name("draft");
                img.setType("img"); //이게맞나...?check!!!
                fileWrite(img); // 게시글 이미지 파일 복사 저장
            }
        }
        return row;
	}
	
	
	// 이미지 파일 복사 저장
    private void fileWrite(FileDTO img) {
        logger.info("파일까지 가는 경로 가능하냐!!");

        // 복사할 파일
        File srcFile = new File(tem_path + img.getNew_filename());
        // 목적지 파일
        File descDir = new File(paths + img.getNew_filename());

        try {
            // 파일 복사
            Files.copy(srcFile.toPath(), descDir.toPath());
            logger.info("복사 되었니?");
            approvalDAO.fileWrite(img);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	// 문서번호 생성

		@Transactional
		public String generateDocumentNumber() {
		    String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		    
		    Integer maxNumber = approvalDAO.getMaxNumberForDate(date);
		    
		    int newNumber = (maxNumber == null) ? 1 : maxNumber + 1;
		    
		    return date + "-" + String.format("%06d", newNumber);
		}
	   // String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
	   //return date + "-" + String.format("%06d", documentId);  // "YYYYMMDD-000001" 형식

	

}
