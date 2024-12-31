package kr.co.porkandspoon.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.MyPageService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService myPageService;
	
	private static final String UPLOAD_DIR = "C:/upload/";
	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동
	 */
	@GetMapping(value="/myPageView/{username}")
	public ModelAndView myPageView(@PathVariable String username) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myPage/myPage");
		mav.addObject("username", username);
		
		return mav;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 정보 조회
	 */
	@GetMapping(value="/myPageDetail")
	public UserDTO myPageDetail(@RequestParam String username) {
		
		logger.info("조회 하는 username => " + username);
		UserDTO dto = new UserDTO();
		
		if(username == null || username.equals("")) {
			dto.setStatus(404);
			dto.setMessage("직원 아이디가 존재하지 않습니다.");
			return dto;
		}
		
		dto = myPageService.myPageDetail(username);
		
		if(dto == null) {
			dto.setStatus(501);
			dto.setMessage("직원 정보를 불러오지 못했습니다.");
			return dto;
		}
		
		dto.setStatus(202);
		dto.setMessage("직원 정보를 불러오는데 성공했습니다.");
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 수정 페이지 이동
	 */
	@GetMapping(value="/myPage/update")
	public ModelAndView myPageUpdateView() {
		return new ModelAndView("/myPage/myPageUpdate");
	}
	
	
	/**
	 * author yh.kim (24.12.27)
	 * 마이페이지 정보 수정
	 */
	@PutMapping(value="/myPage/update")
	public UserDTO myPageUpdate(
			@RequestPart(value = "file", required = false) MultipartFile file, 
			@ModelAttribute UserDTO dto) {
		
		logger.info(file.getOriginalFilename());
		logger.info(CommonUtil.toString(dto));
		try {
			if(myPageService.myPageUpdate(file, dto)) {
				dto.setStatus(200);
				dto.setMessage("마이페이지 수정이 완료되었습니다.");
			}else {
				dto.setStatus(500);
				dto.setMessage("마이페이지 수정에 실패했습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("마이페이지 수정 중 에러 => ", e);
			dto.setStatus(500);
			dto.setMessage("마이페이지 수정 중 오류가 발생했습니다.");
		}
		return dto;
	}
	
	
	
	@GetMapping(value="/ad/myPageSign")
	public ModelAndView myPageSignView() {
		return new ModelAndView("/myPage/myPageSign");
	}
	
	@PostMapping("/ad/myPagesign/save")
    @ResponseBody
    public ResponseEntity<String> saveSignature( @RequestParam("file") MultipartFile file,
    		@AuthenticationPrincipal UserDetails userDetails) {
        try {
            // 기존 서명 파일 대체
        	
        	String pk_idx = userDetails.getUsername();
        	String code_name = "SG001";
            FileDTO dto = CommonUtil.uploadSingleFile(file);
            dto.setCode_name(code_name);
            dto.setPk_idx(pk_idx);
            myPageService.signSave(dto);
            
            
            // 파일 저장 성공 메시지 반환
            return ResponseEntity.ok("서명이 저장되었습니다: " + dto.getNew_filename());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("서명 저장 실패: " + e.getMessage());
        }
    }

    /**
     * 저장된 서명 불러오기
     */
	@GetMapping("/ad/myPagesign/get")
	@ResponseBody
	public ResponseEntity<Map<String, String>> getSignature(@AuthenticationPrincipal UserDetails userDetails) {
	    String pk_idx = userDetails.getUsername();
	    String code_name = "SG001";
	    FileDTO dto = myPageService.signExist(pk_idx, code_name);

	    logger.info("dto : {}", dto);

	    if (dto != null) {
	        try {
	            // dto에서 저장된 파일 이름 가져오기
	            String savedFileName = dto.getNew_filename();
	            Path filePath = Paths.get(UPLOAD_DIR, savedFileName);
	            logger.info("saveFileName :{}",savedFileName);
	            logger.info("filePath :{}",filePath);
	         
	            // 파일 존재 여부 확인
	            if (!Files.exists(filePath)) {
	                logger.warn("파일이 존재하지 않습니다: {}", filePath.toString());
	                return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                                     .body(Collections.singletonMap("error", "파일이 존재하지 않습니다."));
	            }

	            // 파일을 Base64로 변환
	            byte[] fileContent = Files.readAllBytes(filePath);
	            String base64Image = Base64.getEncoder().encodeToString(fileContent);
	            
	            logger.info("fileContent :{}",fileContent);
	            logger.info("base64Image :{}",base64Image);
	            
	            // Base64와 파일 이름 반환
	            Map<String, String> response = new HashMap<>();
	            response.put("base64Image", base64Image);
	            logger.info("response : {}",response);

	            return ResponseEntity.ok(response);
	        } catch (IOException e) {
	            logger.error("파일 로드 중 오류 발생", e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body(Collections.singletonMap("error", "파일 로드 중 오류 발생"));
	        }
	    } else {
	        logger.info("저장된 서명이 없습니다.");
	        return ResponseEntity.ok(Collections.singletonMap("base64Image", "")); // 저장된 서명 없음
	    }
	}
    /**
     * 저장된 서명 삭제
     */
    @DeleteMapping("/ad/myPagesign/delete")
    @ResponseBody
    public ResponseEntity<String> deleteSignature() {
        String savedFileName = "signature_user123.png"; // 사용자별 고유 파일명 지정
        Path filePath = Paths.get(UPLOAD_DIR, savedFileName);

        try {
            if (Files.exists(filePath)) {
                Files.delete(filePath);
                return ResponseEntity.ok("서명이 삭제되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("삭제할 서명이 없습니다.");
            }
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("서명 삭제 실패: " + e.getMessage());
        }
    }

	
	
	
	
	@GetMapping(value="/ad/myPageBuy")
	public ModelAndView myPageBuyListView() {
		return new ModelAndView("/myPage/myPageBuyList");
	}
	
	@GetMapping(value="/ad/myPageBuy/List")
	@ResponseBody
	public Map<String, Object> getBuyListView(@AuthenticationPrincipal UserDetails userDetails, 
			@RequestParam String page, String cnt,String opt,String keyword ) {
		 int page_ = Integer.parseInt(page);
         int cnt_ = Integer.parseInt(cnt);
         int limit = cnt_;
         int offset = (page_ - 1) * cnt_;
         
         logger.info("opt: {}", opt);
         logger.info("keyword: {}", keyword);
         String username = userDetails.getUsername();

         // 검색 조건을 반영하여 페이지 수를 계산
         int totalPages = myPageService.count(username,cnt_, opt, keyword);

         Map<String, Object> result = new HashMap<>();
         List<MealDTO> list = myPageService.buyList(username, opt, keyword, limit, offset);
         logger.info("총갯수" + totalPages);
         logger.info(page);
         result.put("totalPages", totalPages);
         result.put("currpage", page);

         for (MealDTO dto : list) {
        	
        	 
             if (dto.getTotal_cost() != null) {
                 try {
                     int rawCost = Integer.parseInt(dto.getTotal_cost());
                     String cost = CommonUtil.addCommaToNumber(rawCost, "#,###");
                     logger.info("Formatted cost: {}", cost);
                     dto.setTotal_cost(cost); // 콤마 추가
                 } catch (NumberFormatException e) {
                     logger.error("Invalid total_cost format: {}", dto.getTotal_cost(), e);
                     dto.setTotal_cost("0"); // 오류 발생 시 기본값 설정
                 }
             } else {
                 dto.setTotal_cost("-"); // total_cost가 null일 경우 '-'로 표시
             }
         }

         result.put("list", list);
         return result;
     }
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/list")
	public ModelAndView tripListView() {
		return new ModelAndView("/myPage/businessTripList");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/write")
	public ModelAndView tripWriteView() {
		return new ModelAndView("/myPage/businessTripWrite");
	}
	
	// 출장 리스트 이동 페이지
	@GetMapping(value="/trip/update")
	public ModelAndView tripUpdateView() {
		return new ModelAndView("/myPage/businessTripUpdate");
	}
	
		
	
}
