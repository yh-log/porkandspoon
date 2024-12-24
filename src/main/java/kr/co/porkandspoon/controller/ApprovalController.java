package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ApprovalService;

@RestController
public class ApprovalController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService approvalService;
	
	
	//  기안문 작성페이지
	@GetMapping(value="/approval/write")
	public ModelAndView draftView(@AuthenticationPrincipal UserDetails userDetails, HttpSession session) {
		
		String loginId = userDetails.getUsername();
		logger.info("userId : "+loginId);
		ModelAndView mav = new ModelAndView("/approval/draftWrite");  
		UserDTO userDTO = approvalService.getUserInfo(loginId);
		mav.addObject("userDTO", userDTO);
		mav.addObject("deptList", approvalService.getDeptList());
		logger.info("deptDTO 두번"+userDTO.getDept().getId());
		return mav;
	}

//	@GetMapping(value="/approvalUserInfo/{loginId}")
//	public Map<String, Object> getUserInfo(@PathVariable String loginId, HttpSession session) {
//		Map<String, Object> result = new HashMap<String, Object>();
//		// check!!! 나중에 바꾸기 (java에서 가져오기(시큐리티))
//		//String loginId = (String) session.getAttribute("loginId");
//		logger.info("userId : "+loginId);
//		result.put("userDTO", approvalService.getUserInfo(loginId));
//		return result;
//	}
	
	// 기안문 저장
	@PostMapping(value="/draftWrite/{status}")
	public Map<String, Object> draftWrite(String[] appr_user, @RequestParam("imgsJson") String imgsJson, @ModelAttribute ApprovalDTO approvalDTO, MultipartFile[] files, @PathVariable String status) {
		logger.info("appr_user : "+ appr_user);
		logger.info("appr_user : "+ appr_user[0]);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		logger.info("fromdate체크: "+approvalDTO.getFrom_date());
		
		// JSON 문자열을 ImageDTO 리스트로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        List<FileDTO> imgs = null;
        try {
            // TypeFactory를 사용하여 제네릭 타입을 처리하여 변환
            imgs = objectMapper.readValue(imgsJson, objectMapper.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
            approvalDTO.setFileList(imgs);  // 변환한 이미지 리스트를 RunBoardDTO에 설정
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
        
       // logger.info("imgDTO : " + approvalDTO.toString());
       // logger.info("체크!! : " + approvalDTO.getFileList().get(0).getNew_filename());
       // logger.info("체크 getUsername!! : " + approvalDTO.getUsername());
        
        // 이거 살려 check!!!
        String draftIdx = approvalService.saveDraft(appr_user, approvalDTO, files, status);

        

		logger.info("여기까지옴: " );
		//approvalService.draftWrite();
		result.put("success", true);
		
		 // 이거 살려 check!!!
		result.put("draftIdx", draftIdx);
		return result;
	}
	
	@GetMapping(value="/approval/detail/{draft_idx}")
	public ModelAndView draftDetailView(@PathVariable String draft_idx) {
		ModelAndView mav = new ModelAndView("/approval/draftDetail");  
		ApprovalDTO DraftInfo = approvalService.getDraftInfo(draft_idx);
		mav.addObject("DraftInfo", DraftInfo);
		mav.addObject("ApprLine", approvalService.getApprLine(draft_idx));
		logger.info("DraftInfo!! : "+DraftInfo.getName());
		logger.info("DraftInfo!! : "+DraftInfo.getUsername());
		logger.info("DraftInfo!! : "+DraftInfo.getSubject());
		return mav;
	}
	
	@GetMapping(value="/approval/list/my")
	public ModelAndView approvbalMyListView() {
		ModelAndView mav = new ModelAndView("/approval/approvalList");  
		return mav;
	}

	@GetMapping(value="/approval/list/line")
	public ModelAndView approvbalLineListView() {
		ModelAndView mav = new ModelAndView("/approval/approvalLineList");  
		return mav;
	}
	
}
