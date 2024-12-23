package kr.co.porkandspoon.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.service.CommonService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class CommonController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${upload.path}") private String paths;
	
	@Autowired CommonService commonService;
	
	/*
	 * author yh.kim (24.12.5) 
	 * 텍스트 에디터 사진 미리 보기
	 */
	@PostMapping(value="/textImage")
	public ResponseEntity<?> textImage(@RequestParam("files") MultipartFile files){
		
		logger.info("file => " + files.getOriginalFilename());
		
		try {
			Map<String, Object> resultFileMap = commonService.textImage(files);
			return ResponseEntity.ok(resultFileMap);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
		}
		
	}
	
	/*
	 * author yh.kim (24.12.13) 
	 * 파일 다운로드
	 */
	@GetMapping(value="/download")
    public ResponseEntity<Resource> downloadFile(@RequestParam String ori_filename, @RequestParam String new_filename) {
        return CommonUtil.download(paths, ori_filename, new_filename);
    }
	
//	@RequestMapping(value="{page}")
//	public ModelAndView matchPath(@PathVariable String page) {
//		return new ModelAndView(page);
//	}
//
//	@RequestMapping(value="{path}/{page}")
//	public ModelAndView matchPath(@PathVariable String path, @PathVariable String page) {
//		return new ModelAndView(path+"/"+page);
//	}
//	
//	@RequestMapping(value="{path1}/{path2}/{page}")
//	public ModelAndView matchPath(@PathVariable String path1, @PathVariable String path2, @PathVariable String page) {
//		return new ModelAndView(path1+"/"+path2+"/"+page);
//	}
	


}
