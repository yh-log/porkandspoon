package kr.co.porkandspoon.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MailDTO;
import kr.co.porkandspoon.service.MailService;

@RestController
public class MailController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MailService mailService;

	// 받은 메일함 view
	@GetMapping(value="/mail/list/receive")
	public ModelAndView receiveMailListView() {
		ModelAndView mav = new ModelAndView("/mail/mailList");  
		return mav;
	}

	// 메일작성 view
	@GetMapping(value="/mail/write")
	public ModelAndView MailWriteView() {
		ModelAndView mav = new ModelAndView("/mail/mailWrite");  
		return mav;
	}

	@Transactional
	@PostMapping(value="/mail/write/{status}")
	public Map<String, Object> MailWrite(@PathVariable String status, @AuthenticationPrincipal UserDetails userDetails, @RequestPart("files") MultipartFile[] files, @RequestParam("imgsJson") String imgsJson, @ModelAttribute MailDTO mailDTO, @RequestParam HashSet<String> username ) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		mailDTO.setSender(userDetails.getUsername());
		mailDTO.setSend_status(status);
		
		logger.info("getSender: "+mailDTO.getSender());
		for (String user : username) {
			logger.info("user::: "+user);
		}
		
		// JSON 문자열을 ImageDTO 리스트로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        List<FileDTO> imgs = null;
        try {
            // TypeFactory를 사용하여 제네릭 타입을 처리하여 변환
            imgs = objectMapper.readValue(imgsJson, objectMapper.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
            mailDTO.setFileList(imgs);  // 변환한 이미지 리스트를 DTO에 설정
        } catch (Exception e) {
            logger.error("파싱 오류 : {}", e.getMessage());
            return Map.of("error", e.getMessage());
        }
        
        // 변환된 이미지 리스트 확인
        if (imgs != null && !imgs.isEmpty()) {
            for (FileDTO img : imgs) {
                logger.info("Original Filename: " + img.getOri_filename());
                logger.info("New Filename: " + img.getNew_filename());
            }
        }
        
        String mailIdx = mailService.saveMail(username, mailDTO, files);
        logger.info("여기서도 idx가져오기 가능??? : "+ mailDTO.getIdx());
        result.put("mailIdx", mailIdx);
        result.put("status", status);
		return result;
	}
	
	// 메일 상세페이지 view
	@GetMapping(value="/mail/detail")
	public ModelAndView MailDetailView() {
		ModelAndView mav = new ModelAndView("/mail/mailDetail");  
		return mav;
	}
	
	// 메일작성시 수신자 자동완성
	@GetMapping(value = "/json", produces="text/plain;charset=UTF-8")
	public String json(Locale locale, Model model) {    
		/*ObjectMapper objectMapper = new ObjectMapper();
		String[] array = {"엽기떡볶이", "신전떡볶이", "걸작떡볶이", "신당동떡볶이"}; // 배열 생성
	    
	    String userList = "";
		try {
			userList = objectMapper.writeValueAsString(array);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

	    return userList; 
	    */
		
		ObjectMapper objectMapper = new ObjectMapper();
		List<Map<String, String>> userList = mailService.getUserList();
		String userListStr = "";
		try {
			userListStr = objectMapper.writeValueAsString(userList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return userListStr;
	}
	
}
