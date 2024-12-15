package kr.co.porkandspoon.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	
	@Value("${upload.path}") String paths; // 사용자 지정
	
	@Value("${uploadTem.path}") String pathsTem;
	
	/*
	 * author yh.kim (24.12.5) 
	 * 텍스트 에디터 사진 미리 보기
	 */
	public Map<String, Object> textImage(MultipartFile file) throws IllegalStateException, IOException {
		
		Map<String, Object> resultFileMap = new HashMap<String, Object>();
		
		String uploadDir = pathsTem;
		File dir = new File(uploadDir);
		
		// 폴더 없을 경우 생성
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String ori_filename = file.getOriginalFilename();
		String ext = ori_filename.substring(ori_filename.lastIndexOf("."));
		String new_filename = UUID.randomUUID().toString() + ext;
		
		resultFileMap.put("ori_filename", ori_filename);
		resultFileMap.put("new_filename", "/photoTem/" + new_filename);
		
		File targetFile = new File(uploadDir + new_filename); 
		file.transferTo(targetFile);
		
		return resultFileMap;
	}


}
