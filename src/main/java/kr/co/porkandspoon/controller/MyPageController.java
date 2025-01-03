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
	
	@PostMapping("/ad/myPageSign/save")
	@ResponseBody
	public ResponseEntity<String> saveSignature(
	        @RequestParam("file") MultipartFile file,
	        @RequestParam(value = "code_name", defaultValue = "SG001") String codeName, // code_name 파라미터 추가
	        @AuthenticationPrincipal UserDetails userDetails) {
	    try {
	        // 사용자 정보 가져오기
	        String pk_idx = userDetails.getUsername();
	        
	        // 파일 저장 로직
	        FileDTO dto = CommonUtil.uploadSingleFile(file);
	        dto.setCode_name(codeName); // 프론트에서 받은 code_name 사용
	        dto.setPk_idx(pk_idx);

	        // DB 저장
	        myPageService.signSave(dto);

	        // 성공 메시지 반환
	        return ResponseEntity.ok("파일이 저장되었습니다: " + dto.getNew_filename());
	    } catch (Exception e) {
	        // 실패 메시지 반환
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("파일 저장 실패: " + e.getMessage());
	    }
	}

    /**
     * 저장된 서명 불러오기
     */
	@GetMapping("/ad/myPageSign/getImage")
	@ResponseBody
	public ResponseEntity<Map<String, String>> getSignatureImage(@AuthenticationPrincipal UserDetails userDetails) {
	    String pk_idx = userDetails.getUsername();

	    // SG001(사인) 검색
	    FileDTO signature = myPageService.signExist(pk_idx, "SG001");
	    if (signature != null) {
	        Map<String, String> response = new HashMap<>();
	        response.put("imageUrl", "/photo/" + signature.getNew_filename());
	        response.put("codeName", "SG001"); // 사인인 경우
	        return ResponseEntity.ok(response);
	    }

	    // SG002(직인) 검색
	    FileDTO seal = myPageService.signExist(pk_idx, "SG002");
	    if (seal != null) {
	        Map<String, String> response = new HashMap<>();
	        response.put("imageUrl", "/photo/" + seal.getNew_filename());
	        response.put("codeName", "SG002"); // 직인인 경우
	        return ResponseEntity.ok(response);
	    }

	    // 아무 파일도 없을 경우
	    return ResponseEntity.ok(Collections.singletonMap("imageUrl", ""));
	}

		
	
	@GetMapping("/ad/myPageSign/getBase64")
	@ResponseBody
	public ResponseEntity<Map<String, String>> getSignatureBase64(@AuthenticationPrincipal UserDetails userDetails) {
	    String pk_idx = userDetails.getUsername();
	    String code_name = "SG001";
	    FileDTO dto = myPageService.signExist(pk_idx, code_name);

	    if (dto != null) {
	        try {
	            String savedFileName = dto.getNew_filename();
	            Path filePath = Paths.get(UPLOAD_DIR, savedFileName);
	            byte[] fileContent = Files.readAllBytes(filePath);
	            String base64Image = Base64.getEncoder().encodeToString(fileContent);

	            return ResponseEntity.ok(Collections.singletonMap("base64Image", base64Image));
	        } catch (IOException e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body(Collections.singletonMap("error", "파일 로드 중 오류 발생"));
	        }
	    } else {
	        return ResponseEntity.ok(Collections.singletonMap("base64Image", ""));
	    }
	}
    /**
     * 저장된 서명 삭제
     */
	@DeleteMapping("/ad/myPageSign/delete")
	@ResponseBody
	public ResponseEntity<String> deleteSignature(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam("code_name") String code_name) { // code_name을 동적으로 받음
	    try {
	        // 사용자 정보
	        String pk_idx = userDetails.getUsername();

	        // DB에서 파일 정보 조회
	        FileDTO dto = myPageService.signExist(pk_idx, code_name);

	        if (dto == null || dto.getNew_filename() == null) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("삭제할 파일이 없습니다.");
	        }

	        // 실제 파일 경로 생성
	        String savedFileName = dto.getNew_filename();
	        Path filePath = Paths.get(UPLOAD_DIR, savedFileName);

	        try {
	            if (Files.exists(filePath)) {
	                Files.delete(filePath); // 실제 파일 삭제
	                logger.info("파일 삭제 성공: " + savedFileName);
	            } else {
	                logger.warn("파일이 이미 존재하지 않습니다: " + savedFileName);
	            }
	        } catch (IOException e) {
	            logger.error("파일 삭제 중 오류 발생: " + savedFileName, e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body("파일 삭제 중 오류가 발생했습니다: " + e.getMessage());
	        }

	        // DB에서 파일 정보 삭제
	        int row = myPageService.fileDelete(dto);
	        if (row > 0) {
	            return ResponseEntity.ok("파일이 성공적으로 삭제되었습니다.");
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                                 .body("DB에서 파일 정보를 삭제하는 데 실패했습니다.");
	        }
	    } catch (Exception e) {
	        logger.error("파일 삭제 중 오류 발생", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                             .body("파일 삭제 중 오류 발생: " + e.getMessage());
	    }
	}
	
	@GetMapping(value="/ad/myPageBuy")
	public ModelAndView myPageBuyListView() {
		return new ModelAndView("/myPage/myPageBuyList");
	}
	
	@GetMapping(value = "/ad/myPageBuy/List")
	@ResponseBody
	public Map<String, Object> getBuyListView(
	        @AuthenticationPrincipal UserDetails userDetails, 
	      String page,  String cnt, String opt, String keyword) {

	    int page_ = Integer.parseInt(page);
	    int cnt_ = Integer.parseInt(cnt);
	    int limit = cnt_;
	    int offset = (page_ - 1) * cnt_;
	    String username = userDetails.getUsername();

	    // 로그 출력
	    logger.info("opt: {}", opt);
	    logger.info("keyword: {}", keyword);

	    // 검색 조건에 따른 전체 페이지 수 계산
	    int totalPages = myPageService.count(username, cnt_, opt, keyword);

	    // 구매 목록 조회
	    List<MealDTO> list = myPageService.buyList(username, opt, keyword, limit, offset);

	    // 금액 포맷팅
	    for (MealDTO dto : list) {
	        if (dto.getTotal_cost() != null) {
	            try {
	                int rawCost = Integer.parseInt(dto.getTotal_cost());
	                String cost = CommonUtil.addCommaToNumber(rawCost, "#,###");
	                dto.setTotal_cost(cost);
	            } catch (NumberFormatException e) {
	                logger.error("Invalid total_cost format: {}", dto.getTotal_cost(), e);
	                dto.setTotal_cost("0");
	            }
	        } else {
	            dto.setTotal_cost("-");
	        }
	    }

	    // 결과 반환
	    Map<String, Object> result = new HashMap<>();
	    result.put("totalPages", totalPages);
	    result.put("currpage", page);
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
