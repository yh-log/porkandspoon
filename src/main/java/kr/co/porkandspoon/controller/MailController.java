package kr.co.porkandspoon.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class MailController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MailService mailService;
	@Value("${upload.path}") String paths;
	
	// 메일리스트 view
	@GetMapping(value="/mail/listView/{listType}")
	public ModelAndView mailListView(@PathVariable String listType) {
		ModelAndView mav = new ModelAndView("/mail/mailList");  
		mav.addObject("listType", listType);
		return mav;
	}
	
	// 메일리스트 데이터가져오기
	@GetMapping(value="/mail/list/{listType}")
	public Map<String,Object> getMailListData(@PathVariable String listType, @RequestParam Map<String, Object> params, @AuthenticationPrincipal UserDetails userDetails) {
		//ModelAndView mav = new ModelAndView("/approval/approvalList");  
		//logger.info("filter!!@@@@@@ : "+params.get("filter") );
		logger.info("filter!!@@@@@@ : "+params.get("listType") );
		String loginId = userDetails.getUsername();
		Map<String,Object> result = new HashMap<String, Object>();
        params.put("loginId", loginId);
        params.put("listType", listType);
		result.put("mailList", mailService.getMailListData(params));
			
		return result;
	}

	// 메일작성 view
	@GetMapping(value="/mail/write")
	public ModelAndView MailWriteView() {
		ModelAndView mav = new ModelAndView("/mail/mailWrite");  
		return mav;
	}

	@Transactional
	@PostMapping(value="/mail/write/{status}")
	public Map<String, Object> MailWrite(@PathVariable String status, @AuthenticationPrincipal UserDetails userDetails, @RequestPart("attachedFiles") MultipartFile[] attachedFiles, @RequestParam("imgsJson") String imgsJson, @ModelAttribute MailDTO mailDTO, @RequestParam HashSet<String> username ) {
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
        
        String mailIdx = mailService.saveMail(username, mailDTO, attachedFiles, status);
        logger.info("여기서도 idx가져오기 가능??? : "+ mailDTO.getIdx());
        result.put("mailIdx", mailIdx);
        result.put("status", status);
		return result;
	}
	
	// 메일 상세페이지 view
	@GetMapping(value="/mail/detail/{idx}")
	public ModelAndView MailDetailView(@PathVariable String idx, @AuthenticationPrincipal UserDetails userDetails, HttpServletResponse response) {
		ModelAndView mav = null;
		String loginId = userDetails.getUsername();
		MailDTO mailInfo = mailService.getMailInfo(idx);
		
		// 받는사람 <> 괄호 안의 값을 추출
		String regex = "<([^>]+)>";  
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(mailInfo.getUsername());

        List<String> usernames = new ArrayList<>();
        while (matcher.find()) {
        	usernames.add(matcher.group(1));
        }
		
		// 권한체크
		boolean isReceiver = false;
		for (String user : usernames) {
			logger.info("user: {} / loginId: {}",user,loginId);
			if(user.equals(loginId)) {
				isReceiver = true;
				break;
			}
		}
		
		boolean isSender = mailInfo.getSender().equals(loginId);
		
		if(isReceiver || isSender) {
			List<FileDTO> fileList = mailService.getAttachedFiles(idx);
			// 파일 크기 가져오기
			for (FileDTO fileDTO : fileList) {
				String fileName = fileDTO.getNew_filename();
				
		        File file = new File(paths + fileName);
		        if (file.exists()) {
		            long fileSize = file.length();
		            fileDTO.setFile_size(fileSize);
				}
			}
			
			// 전송일시 
			LocalDateTime sendDate = mailInfo.getSend_date();
			 // 요일
	        String dayOfWeek = sendDate.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN); 
			String send_date = CommonUtil.formatDateTime(sendDate, "yyyy년 MM월 dd일 (" + dayOfWeek + ") a hh:mm");
			mailInfo.setSend_date_str(send_date);
			
			mav = new ModelAndView("/mail/mailDetail"); 
			mav.addObject("mailInfo", mailInfo);
			//mav.addObject("isBookmarked", mailService.isBookmarked(idx, loginId));
			mav.addObject("fileList", fileList);
			if(isReceiver) {
				mav.addObject("is_bookmark", mailService.getSentMailBookmark(idx, loginId));
			}else if (isSender) {
				mav.addObject("is_bookmark", mailService.getReceivedMailBookmark(idx, loginId));
			}
		}else {
			try {
				// 메시지를 URL 인코딩
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("<script>alert('열람 권한이 없습니다.'); history.back();</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(isReceiver) {
			// 읽음 처리
			List<String> idxList = new ArrayList<String>();
			idxList.add(idx);
			mailService.changeToRead(idxList, loginId);
		}
		
			return mav;
	}
	
	// 메일작성시 수신자 자동완성
	@GetMapping(value = "/json", produces="text/plain;charset=UTF-8")
	public String json(Locale locale, Model model) {    
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
	
	// 즐겨찾기 상태 변경
	@PutMapping(value = "/mail/bookmark")
	public Map<String, Object> updateBookmark(@RequestParam Map<String, String> params, @AuthenticationPrincipal UserDetails userDetails) {    
		//Map<String, Object> result = new HashMap<String, Object>();
//		String loginId = userDetails.getUsername();
//		params.put("username", loginId);
//		String isBookmarked = params.get("isBookmarked");
//		logger.info("bookmark? : "+params.get("isBookmarked"));
//		logger.info("idx? : "+params.get("idx"));
//		boolean success = mailService.updateBookmark(params);
		
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		String loginId = userDetails.getUsername();
		params.put("username", loginId);
		
		params.put("is_bookmark", params.get("is_bookmark").equals("Y") ? "N" : "Y");
		// 보낸 메일인지 확인
	    boolean isSender = mailService.isSender(params);
	    if (isSender) {
	        mailService.toggleSentMailBookmark(params);
	        success = true;
	    }

	    // 받은 메일인지 확인
	    boolean isReceiver = mailService.isReceiver(params);
	    if (isReceiver) {
	    	mailService.toggleReceivedMailBookmark(params);
	    	success = true;
	    }
	    result.put("success", success);
	    return result;
	}
	
	//다중 읽음 처리 기능
	@PutMapping(value = "/mail/changeToRead")
	public Map<String, Object> changeToRead(@RequestBody Map<String, List<String>> requestBody, @AuthenticationPrincipal UserDetails userDetails) {    
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		String loginId = userDetails.getUsername();
		 List<String> idxList = requestBody.get("idxList"); 
		success = mailService.changeToRead(idxList,loginId);
		result.put("success", success);
		return result;
	}
	
	// 전달
	@PostMapping(value="/mail/delivery")
	public ModelAndView deliverMail(@RequestBody Map<String, Object> params, @AuthenticationPrincipal UserDetails userDetails){
		String loginId = userDetails.getUsername();
		logger.info("params : "+params.get("mailInfo"));
		logger.info("params : "+params.get("fileList"));
		//MailDTO mailDTO = mailService.deliverMail(idx,loginId);
		//result.put("mailInfo", mailDTO);
		ModelAndView mav = new ModelAndView("/mail/mailWrite");
		mav.addObject("mailInfo", params.get("mailInfo"));
		mav.addObject("fileList", params.get("fileList"));
		return mav;
	}
	
	
}
