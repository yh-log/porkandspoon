package kr.co.porkandspoon.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.ApprovalService;

@RestController
public class ApprovalController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ApprovalService approvalService;
	
	@Value("${upload.path}") String paths;
	
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
	@PostMapping(value="/draftWrite/{status}") //check!! 이거 status 사용안하고 있는듯??
	public Map<String, Object> draftWrite(@RequestPart("logoFile") MultipartFile[] logoFile, @RequestPart("files") MultipartFile[] files, String[] appr_user, @RequestParam("imgsJson") String imgsJson, @ModelAttribute ApprovalDTO approvalDTO, @PathVariable String status, String[] new_filename) {
//		해당부서에 속한사람만 직영점등록이 가능하도록하는 로직
//		if(approvalDTO.getTarget_type().equals("df002")) {
//			
//		}
		
		//logger.info("logoFile: " + logoFile);
	//	logger.info("Files: " + Arrays.toString(files));
		//logger.info("OriginalFilename : " + logo.getOriginalFilename());
		
		logger.info("new filename 받아와지나?!!!!! : "+ new_filename);
		//logger.info("appr_user : "+ appr_user);
		//logger.info("appr_user : "+ appr_user[0]);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		logger.info("fromdate체크: "+approvalDTO.getFrom_date());
		
		// JSON 문자열을 ImageDTO 리스트로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        List<FileDTO> imgs = null;
        try {
            // TypeFactory를 사용하여 제네릭 타입을 처리하여 변환
            imgs = objectMapper.readValue(imgsJson, objectMapper.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
            approvalDTO.setFileList(imgs);  // 변환한 이미지 리스트를 DTO에 설정
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
       // logger.i fo("체크!! : " + approvalDTO.getFileList().get(0).getNew_filename());
       // logger.info("체크 getUsername!! : " + approvalDTO.getUsername());
        
        // 이거 살려 check!!!
        String draftIdx = approvalService.saveDraft(appr_user, approvalDTO, files, logoFile, status, new_filename);
        
		/*
		 * if(!logoFile.isEmpty()) { logger.info("로고파일 있음"); }
		 */

//        // 로고 파일 저장 처리
//        if (logoFile != null && !logoFile.isEmpty()) {
//            logger.info("로고 파일 있음: " + logoFile.getOriginalFilename());
//            String oriLogoFilename = logoFile.getOriginalFilename();
//            String logoExt = oriLogoFilename.substring(oriLogoFilename.lastIndexOf("."));
//            String newLogoFilename = UUID.randomUUID() + logoExt;
//
//            try {
//                byte[] logoBytes = logoFile.getBytes();
//                Path logoPath = Paths.get(paths + newLogoFilename);
//                Files.write(logoPath, logoBytes);
//                logger.info("로고 파일 저장 완료: " + newLogoFilename);
//            } catch (IOException e) {
//                logger.error("로고 파일 저장 오류", e);
//            }
//        }

        

		logger.info("여기까지옴: " );
		//approvalService.draftWrite();
		result.put("success", true);
		
		 // 이거 살려 check!!!
		result.put("draftIdx", draftIdx);
		return result;
	}
	
	@GetMapping(value="/approval/update/{draft_idx}/{reapproval}")
	public ModelAndView draftUpdateView(@PathVariable String draft_idx, @PathVariable boolean reapproval, @AuthenticationPrincipal UserDetails userDetails, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/approval/draftUpdate");  

		String loginId = userDetails.getUsername();
		// 부서정보
		//String userDept = approvalService.getUserDept(loginId);
		// 기안자 여부
		boolean permission = false;
		boolean isDraftSender = approvalService.isDraftSender(draft_idx,loginId);
		// 전송 메세지
		String message = "";
		if(!isDraftSender) {
			message = "기안문 수정권한이 없습니다.";
		}
		
		// 수정인 경우(재기안x)
		if(!reapproval) {
			// 임시저장 상태인지 체크
			boolean isSavedDraft =  approvalService.getDraftStatus(draft_idx).equals("sv");
			permission = isDraftSender && isSavedDraft ? true : false;
			
			if(!isSavedDraft) {
				message = "상신된 기안문은 수정할 수 없습니다.";
			}
			mav.addObject("reapproval", false);
		}else {
			// 재기안의 경우
			permission = isDraftSender ? true : false;
			mav.addObject("reapproval", true);
		}
		
		// 상세페이지 리턴 여부
		boolean returnValue = checkDraftPermission(draft_idx, response, mav, permission, message);
		return returnValue ? mav : null;
	}
	
	@GetMapping(value="/approval/detail/{draft_idx}")
	public ModelAndView draftDetailView(@PathVariable String draft_idx, @AuthenticationPrincipal UserDetails userDetails, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/approval/draftDetail");  
		
		
		String loginId = userDetails.getUsername();
		// 부서정보
		String userDept = approvalService.getUserDept(loginId);
		/* 권한체크*/
		// 기안자여부
		boolean isDraftSender = approvalService.isDraftSender(draft_idx,loginId);
		// 본인의 결재상태
		String approverStatus = approvalService.approverStatus(draft_idx,loginId);
		//logger.info("approverStatus !!!!!!!!!: "+ approverStatus);
		// 이전 결재자들의 결재상태 (내 순서인지 체크)
		List<String> otherApproversStatus = approvalService.otherApproversStatus(draft_idx,loginId);
		logger.info("otherApproversStatus !!!!!!! : "+otherApproversStatus);
		boolean approverTurn = true;
		for (String status : otherApproversStatus) {
			logger.info("status: !!!! : "+status);
			if(!status.equals("ap004")) {
				approverTurn = false;
				break;
			}
		}
		logger.info("approverTurn: !!!! : "+approverTurn);
		// 협력부서여부
		boolean isCooperDept = approvalService.isCooperDept(draft_idx,userDept);
		// 기안부서여부
		boolean isApproveDept = approvalService.isApproveDept(draft_idx,userDept);
		// 삭제여부
		boolean isDeleted = approvalService.getDraftStatus(draft_idx).equals("de");
				
		boolean permission = (isDraftSender || approverStatus != null || isCooperDept || isApproveDept) && !isDeleted ? true : false;
		
		mav.addObject("isDraftSender", isDraftSender);
		mav.addObject("approverStatus", approverStatus);
		mav.addObject("approverTurn", approverTurn);
		
		String message = "";
		//전송메세지
		if(!permission) {			
			message = "해당 기안문의 열람권한이 없습니다.";
		}
		if(isDeleted) {
			message = "삭제된 기안문입니다.";
		}
		
		// 상세페이지 리턴 여부
		boolean returnValue = checkDraftPermission(draft_idx, response, mav, permission, message);
		return returnValue ? mav : null;
	}
	
	// 기안문 열람권한 체크후 이동
	boolean checkDraftPermission(String draft_idx, HttpServletResponse response, ModelAndView mav, boolean permission, String message) {

		boolean returnValue = false;
		if(permission) {
			getDetailInfo(draft_idx, mav);
			returnValue = true;
		}else {
			try {
				// 메시지를 URL 인코딩
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("<script>alert('" + message + "'); history.back();</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return returnValue;
	}
	
	// 기안문 정보 가져오기
	private void getDetailInfo(String draft_idx, ModelAndView mav) {
		ApprovalDTO DraftInfo = approvalService.getDraftInfo(draft_idx);
		mav.addObject("DraftInfo", DraftInfo);
		mav.addObject("ApprLine", approvalService.getApprLine(draft_idx));
		mav.addObject("logoFile", approvalService.getLogoFile(draft_idx));
		mav.addObject("attachedFiles", approvalService.getAttachedFiles(draft_idx));
		mav.addObject("deptList", approvalService.getDeptList());
		logger.info("DraftInfo getCreate_date!!!! : "+DraftInfo.getCreate_date());
	}
	
	// 결재자 상태변경(결재중으로)
	@PutMapping(value="/approval/changeStatusToRead/{draft_idx}")
	public Map<String, Object> changeStatusToRead(@PathVariable String draft_idx, @AuthenticationPrincipal UserDetails userDetails) {
		logger.info("결재자 상태변경(결재중으로)!!!!!!!!!!!!!!!!!!!!!!!!! ");
		boolean success = false;
		String loginId = userDetails.getUsername();
		logger.info("loginid : " + loginId);
		logger.info("draft_idx : " + draft_idx);
		if(approvalService.changeStatusToRead(loginId, draft_idx) > 0) {
			success = true;
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success", success);
		return result;
	}

	

	
	
	
	
	
	
//	// 기안문 저장
//		@PostMapping(value="/draftWrite/{status}")
//		public Map<String, Object> draftWrite(String[] appr_user, @RequestParam("imgsJson") String imgsJson, @ModelAttribute ApprovalDTO approvalDTO, MultipartFile[] files, @PathVariable String status) {
//			logger.info("appr_user : "+ appr_user);
//			logger.info("appr_user : "+ appr_user[0]);
//			
//			Map<String, Object> result = new HashMap<String, Object>();
//			
//			logger.info("fromdate체크: "+approvalDTO.getFrom_date());
//			
//			// JSON 문자열을 ImageDTO 리스트로 변환
//	        ObjectMapper objectMapper = new ObjectMapper();
//	        List<FileDTO> imgs = null;
//	        try {
//	            // TypeFactory를 사용하여 제네릭 타입을 처리하여 변환
//	            imgs = objectMapper.readValue(imgsJson, objectMapper.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
//	            approvalDTO.setFileList(imgs);  // 변환한 이미지 리스트를 RunBoardDTO에 설정
//	        } catch (Exception e) {
//	            logger.error("파싱 오류 : {}", e.getMessage());
//	            return Map.of("error", e.getMessage());
//	        }
//	        
//	        // 변환된 이미지 리스트 확인
//	        if (imgs != null && !imgs.isEmpty()) {
//	            for (FileDTO img : imgs) {
//	                logger.info("Original Filename: " + img.getOri_filename());
//	                logger.info("New Filename: " + img.getNew_filename());
//	            }
//	        }
//	        
//	       // logger.info("imgDTO : " + approvalDTO.toString());
//	       // logger.info("체크!! : " + approvalDTO.getFileList().get(0).getNew_filename());
//	       // logger.info("체크 getUsername!! : " + approvalDTO.getUsername());
//	        
//	        // 이거 살려 check!!!
//	        String draftIdx = approvalService.saveDraft(appr_user, approvalDTO, files, status);
//
//	        
//
//			logger.info("여기까지옴: " );
//			//approvalService.draftWrite();
//			result.put("success", true);
//			
//			 // 이거 살려 check!!!
//			result.put("draftIdx", draftIdx);
//			return result;
//		}
		
	@Transactional
	@PostMapping(value="/draftUpdate")
	public Map<String, Object> draftUpdate(@RequestPart("logoFile") MultipartFile[] logoFile, @RequestPart("files") MultipartFile[] files, String[] appr_user, @RequestParam("imgsJson") String imgsJson, @RequestParam("deleteFiles") String deleteFilesJson, @ModelAttribute ApprovalDTO approvalDTO) {
		logger.info("연결!!!!!!");
		//logger.info("deleteFiles : "+ deleteFiles);
		logger.info("appr_user[0] : "+ appr_user[0]);
		
		
		 // deleteFilesJson을 List<FileDTO>로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        List<FileDTO> deleteFiles = null;
		try {
			deleteFiles = objectMapper.readValue(deleteFilesJson, new TypeReference<List<FileDTO>>(){});
			// 받은 데이터 확인
			System.out.println("Deleted Files: " + deleteFiles);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		approvalService.deleteFiles(deleteFiles, approvalDTO.getDraft_idx());
		
		
		
		//logger.info("deletedFiles.get(0)"+deleteFiles.get(0));
		
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		logger.info("fromdate체크: "+approvalDTO.getFrom_date());
		
		// JSON 문자열을 ImageDTO 리스트로 변환

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
        
        approvalService.updateDraft(appr_user, approvalDTO, files, logoFile);

        

		logger.info("여기까지옴: " );
		//approvalService.draftWrite();
		result.put("success", true);
		result.put("draftIdx", approvalDTO.getDraft_idx());

		return result;
	}
	
	@GetMapping(value="/approval/listView/{listType}")
	public ModelAndView approvalMyListView(@PathVariable String listType) {
		ModelAndView mav = new ModelAndView("/approval/approvalList");  
		mav.addObject("listType", listType);
		return mav;
	}

	@GetMapping(value="/approval/list/{listType}")
	public Map<String,Object> getApprovalMyListData(@PathVariable String listType, @RequestParam Map<String, Object> params, @AuthenticationPrincipal UserDetails userDetails) {
		//ModelAndView mav = new ModelAndView("/approval/approvalList");  
		logger.info("filter!!@@@@@@ : "+params.get("filter") );
		logger.info("filter!!@@@@@@ : "+params.get("listType") );
		String loginId = userDetails.getUsername();
		Map<String,Object> result = new HashMap<String, Object>();
        params.put("loginId", loginId);
        params.put("listType", listType);
		result.put("approvalList", approvalService.getApprovalMyListData(params));
			
		return result;
	}

	@GetMapping(value="/approval/list/line")
	public ModelAndView approvbalLineListView() {
		ModelAndView mav = new ModelAndView("/approval/approvalLineList");  
		return mav;
	}
	
	// 기안문 반려
	@PutMapping(value="/approval/returnDraft") 
	public Map<String, Object> returnDraft(@ModelAttribute ApprovalDTO approvalDTO, @AuthenticationPrincipal UserDetails userDetails) {
		logger.info("approvalDTO.getComment : "+approvalDTO.getComment());
		approvalDTO.setUsername(userDetails.getUsername());
		boolean success = approvalService.returnDraft(approvalDTO);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success",success);
		return result;
	}

	// 기안문 승인
	@PostMapping(value="/approval/ApprovalDraft") 
	public Map<String, Object> approvalDraft(@ModelAttribute ApprovalDTO approvalDTO, @AuthenticationPrincipal UserDetails userDetails) {
		boolean success = false;
		logger.info("approvalDTO.getComment : "+approvalDTO.getComment());
		approvalDTO.setUsername(userDetails.getUsername());
		// 결재라인 테이블 결재자 상태코드 변경
		int approvalRow = approvalService.ApprovalDraft(approvalDTO);
		// 기안문 테이블 상태코드 변경(결재완료)
		int statusRow = approvalService.changeStatusToApproved(approvalDTO.getDraft_idx());
		if(approvalRow > 0 && statusRow > 0) {
			success = true;
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("success",success);
		return result;
	}
	
	// 기안문 회수
	@PutMapping(value="/approval/recall/{draft_idx}")
	public Map<String, Object> approvalRecall(@PathVariable String draft_idx, @AuthenticationPrincipal UserDetails userDetails){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		String loginId = userDetails.getUsername();
		// 기안자여부
		boolean isDraftSender = approvalService.isDraftSender(draft_idx,loginId);
		// 기안문 결재진행중 여부
		boolean ongoingApproval =  approvalService.getDraftStatus(draft_idx).equals("sd");
		if(isDraftSender && ongoingApproval) {
			approvalService.approvalRecall(draft_idx);
			success = true;
		}
		result.put("success", success);
		
		return result;
	}
	
	// 임시저장 -> 상신
	@PutMapping(value="/approval/changeStatusToSend/{draft_idx}")
	public Map<String, Object> changeStatusToSend(@PathVariable String draft_idx, @AuthenticationPrincipal UserDetails userDetails){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		String loginId = userDetails.getUsername();
		// 기안자여부
		boolean isDraftSender = approvalService.isDraftSender(draft_idx,loginId);
		if(isDraftSender) {
			approvalService.changeStatusToSend(draft_idx);
			success = true;
		}
		result.put("success", success);
		return result;
	}

	// 임시저장 -> 상신
	@PutMapping(value="/approval/changeStatusToDelete/{draft_idx}")
	public Map<String, Object> changeStatusToDelete(@PathVariable String draft_idx, @AuthenticationPrincipal UserDetails userDetails){
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = false;
		String loginId = userDetails.getUsername();
		// 기안자여부
		boolean isDraftSender = approvalService.isDraftSender(draft_idx,loginId);
		// 기안문 상태 확인(임시저장or회수)
		String draftStatus = approvalService.getDraftStatus(draft_idx);
		boolean deletable = draftStatus.equals("sv") || draftStatus.equals("ca");
		logger.info("어디까지1");
		if(isDraftSender && deletable) {
			logger.info("어디까지2");
			approvalService.changeStatusToDelete(draft_idx);
			success = true;
			logger.info("어디까지3");
		}
		result.put("success", success);
		return result;
	}
	

}
