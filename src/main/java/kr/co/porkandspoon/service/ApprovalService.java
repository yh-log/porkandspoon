package kr.co.porkandspoon.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.mail.Multipart;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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

	@Transactional
	public String saveDraft(String[] appr_user, ApprovalDTO approvalDTO, MultipartFile[] files, String status) {
		approvalDTO.setDocument_number(generateDocumentNumber());
		logger.info("docNumber : "+ approvalDTO.getDocument_number());
		logger.info("getUsername : "+ approvalDTO.getUsername());
		
		// draft_idx 가져오기 
		String draftIdx = approvalDTO.getDraft_idx();
		logger.info("draftIdx DTO : "+ draftIdx);
		if(draftIdx == null || draftIdx.isEmpty()) {
		    draftIdx = String.valueOf(approvalDAO.getDraftIdx());
			approvalDTO.setDraft_idx(draftIdx);
			logger.info("draftIdx db: "+ draftIdx);
		}
		int row = approvalDAO.saveDraft(approvalDTO);
		
	    // 결재라인이 저장되지 않은 경우에만 저장
	    int existingCount = approvalDAO.checkExistingApprovalLine(draftIdx);
	    if (existingCount == 0) {
	        approvalDAO.saveApprovalLine(draftIdx, appr_user);
	    }
		logger.info("row : "+ row);

		
	    // 이미지 정보 저장 (이미지가 있을 경우 반복문 사용)
        List<FileDTO> imgs = approvalDTO.getFileList();
        if (imgs != null && !imgs.isEmpty()) {
            for (FileDTO img : imgs) {
            	logger.info("img : "+ img);
            	logger.info("img.getOri_filename() : "+ img.getOri_filename());
                img.setPk_idx(draftIdx);
                img.setCode_name("draft");
                img.setType("img"); //이게맞나...?check!!!
                fileWrite(img); // 게시글 이미지 파일 복사 저장
            }
        }
        
        // 첨부파일 저장
        saveFile(files, draftIdx);
        
        return draftIdx;
	}
	
	
	private void saveFile(MultipartFile[] files, String draftIdx) {
		
		for(MultipartFile file : files) {
			try {
				//check!!! 얘도 if문안에 넣어야하는게 아닌가?
				String ori_filename = file.getOriginalFilename();
				logger.info("file 비어있나? : "+file.isEmpty()); // true
				
				if(!file.isEmpty()) {
					logger.info("파일이 있는 경우만 타야하는데");
					String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
					String new_filename = UUID.randomUUID()+ext;
					
					byte[] arr = file.getBytes();
					// check!! 경로바꾸기
					Path path = Paths.get("C:/upload/"+new_filename);
					Files.write(path, arr);
					
					// db에 저장
					FileDTO fileDto = new FileDTO();
					fileDto.setOri_filename(ori_filename);
					fileDto.setNew_filename(new_filename);
					fileDto.setCode_name("df000");
					fileDto.setPk_idx(draftIdx);
					fileDto.setType(file.getContentType());
					approvalDAO.fileSave(fileDto);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
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
            //approvalDAO.fileWrite(img);
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

		public ApprovalDTO getDraftInfo(String draft_idx) {
			
			return approvalDAO.getDraftInfo(draft_idx);
		}

		public List<ApprovalDTO> getApprLine(String draft_idx) {
			return approvalDAO.getApprLine(draft_idx);
		}

	

}
