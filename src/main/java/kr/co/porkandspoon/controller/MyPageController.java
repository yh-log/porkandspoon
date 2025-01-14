package kr.co.porkandspoon.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.porkandspoon.dto.*;
import kr.co.porkandspoon.util.security.CustomUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
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

import kr.co.porkandspoon.service.MyPageService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class MyPageController {

	@Value("${upload.path}") private String photo;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService myPageService;
	
	
	


	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동
	 */
	@GetMapping(value="/myPageView")
	public ModelAndView myPageView() {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();
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

		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myPage/myPageUpdate");
		mav.addObject("username", username);

		return mav;
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
	
	
	
	@GetMapping(value="/myPageSign")
	public ModelAndView myPageSignView() {
		return new ModelAndView("/myPage/myPageSign");
	}
	
	@PostMapping("/myPageSign/save")
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
	@GetMapping("/myPageSign/getImage")
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

		
	
	@GetMapping("/myPageSign/getBase64")
	@ResponseBody
	public ResponseEntity<Map<String, String>> getSignatureBase64(@AuthenticationPrincipal UserDetails userDetails) {
	    String pk_idx = userDetails.getUsername();
	    String code_name = "SG001";
	    FileDTO dto = myPageService.signExist(pk_idx, code_name);

	    if (dto != null) {
	        try {
	            String savedFileName = dto.getNew_filename();
	            Path filePath = Paths.get(photo, savedFileName); // photo 사용
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
	@DeleteMapping("/myPageSign/delete")
	@ResponseBody
	public ResponseEntity<Void> deleteSignature(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam("code_name") String code_name) {
	    try {
	        String pk_idx = userDetails.getUsername();

	        FileDTO dto = myPageService.signExist(pk_idx, code_name);
	        if (dto == null || dto.getNew_filename() == null) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
	        }

	        String savedFileName = dto.getNew_filename();
	        Path filePath = Paths.get(photo, savedFileName); // photo 사용

	        if (Files.exists(filePath)) {
	            Files.delete(filePath);
	            logger.info("파일 삭제 성공: " + savedFileName);
	        } else {
	            logger.warn("파일이 이미 존재하지 않습니다: " + savedFileName);
	        }

	        int row = myPageService.fileDelete(dto);
	        if (row > 0) {
	            return ResponseEntity.ok().build();
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    } catch (Exception e) {
	        logger.error("파일 삭제 중 오류 발생", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}

	
	@GetMapping(value="/myPageBuy")
	public ModelAndView myPageBuyListView() {
		return new ModelAndView("/myPage/myPageBuyList");
	}
	
	@GetMapping(value = "/myPageBuy/List")
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

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 리스트 페이지 이동
	 */
	@GetMapping(value="/trip/listView")
	public ModelAndView tripListView() {

		ModelAndView mav = new ModelAndView("/myPage/businessTripList");
//		mav.addObject("username", username);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 리스트 조회
	 */
	@GetMapping(value = "/trip/list")
	public List<TripDTO> tripList(@ModelAttribute PagingDTO pagingDTO) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		List<TripDTO> tripDTO = myPageService.tripList(pagingDTO, username);

		return tripDTO;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 상세 페이지 이동 및 조회
	 */
	@GetMapping(value="/trip/detail/{schedule_idx}")
	public ModelAndView tripDetail(@PathVariable int schedule_idx) {

		TripDTO tripDTO = myPageService.tripDetail(schedule_idx);

		ModelAndView mav = new ModelAndView("/myPage/businessTripDetail");
		mav.addObject("tripDTO", tripDTO);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 비활성화
	 */
	@DeleteMapping(value = "/trip/delete")
	public TripDTO tripDelete(@ModelAttribute TripDTO tripDTO) {
		logger.info(CommonUtil.toString(tripDTO));
		tripDTO = myPageService.tripDelete(tripDTO);
		return tripDTO;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 등록 페이지 이동
	 */
	@GetMapping(value="/trip/write")
	public ModelAndView tripWriteView() {

		ModelAndView mav = new ModelAndView("/myPage/businessTripWrite");
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		mav.addObject("username", username);

		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		mav.addObject("userName",userDetails.getName()); // 이름
		return mav;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 등록
	 */
	@PostMapping(value = "/trip/write")
	public TripDTO tripWrite(@ModelAttribute TripDTO tripDTO) {

		logger.info(CommonUtil.toString(tripDTO));

		tripDTO = myPageService.tripWrite(tripDTO);

		return tripDTO;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 수정 페이지 이동 및 조회
	 */
	@GetMapping(value="/trip/update/{schedule_idx}")
	public ModelAndView tripUpdate(@PathVariable int schedule_idx) {

		TripDTO tripDTO = myPageService.tripDetail(schedule_idx);

		ModelAndView mav = new ModelAndView("/myPage/businessTripUpdate");
		mav.addObject("tripDTO", tripDTO);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 수정
	 */
	@PutMapping(value = "/trip/update")
	public TripDTO tripUpdate(@ModelAttribute TripDTO tripDTO) {

		logger.info(CommonUtil.toString(tripDTO));

		tripDTO = myPageService.tripUpdate(tripDTO);

		return tripDTO;
	}

	
}
