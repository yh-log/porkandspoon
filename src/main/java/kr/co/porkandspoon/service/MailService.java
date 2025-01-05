package kr.co.porkandspoon.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.porkandspoon.dao.MailDAO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MailDTO;

@Service
public class MailService {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	
	@Autowired MailDAO mailDAO;
	
	 @Value("${upload.path}") String paths;
     @Value("${uploadTem.path}") String tem_path;
		

	public List<Map<String, String>> getUserList() {
		return mailDAO.getUserList();
	}

	@Transactional
	public String saveMail(HashSet<String> username, MailDTO mailDTO, MultipartFile[] files) {
		// summernote 이미지 서버 저장 (이미지가 있을 경우 반복문 사용)
        List<FileDTO> imgs = mailDTO.getFileList();
        if (imgs != null && !imgs.isEmpty()) {
            for (FileDTO img : imgs) {
            	logger.info("img : "+ img);
            	logger.info("img.getOri_filename() : "+ img.getOri_filename());
//                img.setPk_idx(draftIdx);
//                img.setCode_name("draft");
//                img.setType("img"); //이게맞나...?check!!!
                fileWrite(img); // 게시글 이미지 파일 복사 저장
            }
        }
        
        // idx 가져오고 없으면 생성
        String mailIdx = mailDTO.getIdx();
        logger.info("mailIdx 1 @@@ : "+mailIdx);
        if(mailIdx == null || mailIdx.isEmpty()) {
        	mailIdx = mailDAO.getmailIdx();
        	logger.info("mailIdx 2 @@@ : "+mailIdx);
 			mailDTO.setIdx(mailIdx);
        }
        mailDAO.saveMail(mailDTO);

        // 첨부파일 저장
        saveFile(files, mailIdx);
        
        // 메일수신 정보저장
        mailDAO.saveMailReceiver(mailIdx, username);
        
        return mailIdx;
	}
	
	// 이미지 파일 복사 저장
    private void fileWrite(FileDTO img) {
        logger.info("파일까지 가는 경로 가능하냐!!");
        
        // 복사할 파일
        File srcFile = new File(tem_path + img.getNew_filename());
        // 목적지 파일
        File descDir = new File(paths + img.getNew_filename());

        try {
            Path filePath = Paths.get(paths, img.getNew_filename());
	        if(Files.exists(filePath)) {
	        	 // 파일 복사
	            Files.copy(srcFile.toPath(), descDir.toPath());
	            logger.info("복사 되었니?");
	        }
           
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
private void saveFile(MultipartFile[] files, String mailIdx) {
		
		for(MultipartFile file : files) {
			try {
				
				logger.info("mailIdx 3 @@@ : "+mailIdx);
				if(!file.isEmpty()) {
					//check!!! 얘도 if문안에 넣어야하는게 아닌가?
					String ori_filename = file.getOriginalFilename();
					logger.info("file 비어있나? : "+file.isEmpty()); // true
					logger.info("ori_filename : "+ ori_filename); 
					logger.info("파일이 있는 경우만 타야하는데");
					
					String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
					String new_filename = UUID.randomUUID()+ext;
					
			        int existingFile = mailDAO.checkExistingFile(mailIdx, ori_filename);
			        logger.info("existingFile!!!! "+ existingFile);
				    if (existingFile == 0) {
						// db에 저장
						FileDTO fileDto = new FileDTO();
						fileDto.setOri_filename(ori_filename);
						fileDto.setNew_filename(new_filename);
						fileDto.setCode_name("ma001");
						fileDto.setPk_idx(mailIdx);
						fileDto.setType(file.getContentType());
						mailDAO.fileSave(fileDto);
						logger.info("db에 첨부파일 저장!!!! ");
				    	
				    	
				    	byte[] arr = file.getBytes();
						// check!! 경로바꾸기
						Path path = Paths.get(paths+new_filename);
						Files.write(path, arr);
						logger.info("c드라이브에 첨부파일 저장!!!! ");

				    }

					// 파일이 이미 존재하는지 확인
			        //Path filePath = Paths.get(paths, new_filename);
			        //Files.exists(filePath);
					
					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}



}
