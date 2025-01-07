package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.service.MealService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class MealController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MealService mealService;

	
	@PostMapping("/ad/mealTicket/payReady")
	@ResponseBody
	public Map<String, Object> prepareKakaoPay(
	        @RequestBody Map<String, Object> requestData,
	        HttpSession session) {

	    logger.info("Request received at /ad/mealTicket/payReady with POST method");
	    logger.info("Request data: {}", requestData);

	    String name = (String) requestData.get("name");
	    String costString = (String) requestData.get("cost"); // cost를 문자열로 받음
	    int count = Integer.parseInt(requestData.get("count").toString());
	    int meal_idx = Integer.parseInt(requestData.get("meal_idx").toString());

	    // 문자열 cost를 숫자로 변환
	    int cost;
	    try {
	        cost = Integer.parseInt(costString.replaceAll(",", "")); // 쉼표 제거 후 정수로 변환
	    } catch (NumberFormatException e) {
	        throw new IllegalArgumentException("Invalid cost value: " + costString, e);
	    }
	    
	    
	    session.setAttribute("name", name);
	    session.setAttribute("cost", cost);
	    session.setAttribute("count", count);
	    session.setAttribute("is_buy", "B");
	    
	    session.setAttribute("meal_idx", meal_idx);
	    
	    
	    

	    logger.info("name: {}", name);
	    logger.info("cost: {}", cost);
	    logger.info("count: {}", count);

	    RestTemplate restTemplate = new RestTemplate();
	    String url = "https://open-api.kakaopay.com/online/v1/payment/ready";

	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "SECRET_KEY DEV849F171133F9E34FF1FCA144F99D9423B4662");
	    headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

	    String partnerOrderId = "ORDER_ID_" + System.currentTimeMillis(); // 고유한 주문 번호 생성
	    session.setAttribute("partner_order_id", partnerOrderId); // 세션에 저장
	    logger.info( "usename"+session.getAttribute("user_id"));
	    Map<String, Object> body = new HashMap<>();
	    body.put("cid", "TC0ONETIME");
	    body.put("partner_order_id", partnerOrderId); // 저장된 주문 번호 사용
	    body.put("partner_user_id", "USER_ID_" + session.getAttribute("user_id"));
	    body.put("item_name", name);
	    body.put("quantity", 1);
	    body.put("total_amount", cost);
	    body.put("tax_free_amount", 0);

	    String domain = "http://localhost:8080"; // 등록된 도메인
	    body.put("approval_url", domain + "/ad/mealTicket/paySuccess");
	    body.put("cancel_url", domain + "/ad/mealTicket/payCancel");
	    body.put("fail_url", domain + "/ad/mealTicket/payFail");

	    HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
	    ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

	    if (response.getStatusCode().is2xxSuccessful()) {
	        Map<String, Object> responseBody = response.getBody();
	        String tid = (String) responseBody.get("tid");
	        session.setAttribute("tid", tid); // 세션에 tid 저장
	        
	        
	        
	        logger.info("tid and partner_order_id saved in session: {}, {}", tid, partnerOrderId);
	        return responseBody;
	    } else {
	        throw new RuntimeException("KakaoPay 결제 준비 실패");
	    }
	}

	@GetMapping("/ad/mealTicket/paySuccess")
	public ModelAndView kakaoPaySuccess(
			@AuthenticationPrincipal UserDetails userDetails,
	        @RequestParam("pg_token") String pgToken,
	        HttpSession session) {

	    RestTemplate restTemplate = new RestTemplate();
	    String tid = (String) session.getAttribute("tid");
	    String partnerOrderId = (String) session.getAttribute("partner_order_id");

	    if (tid == null || partnerOrderId == null) {
	        throw new RuntimeException("Required parameters (tid or partner_order_id) missing in session");
	    }

	    String url = "https://open-api.kakaopay.com/online/v1/payment/approve";
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Authorization", "SECRET_KEY DEV849F171133F9E34FF1FCA144F99D9423B4662");
	    headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);

	    Map<String, Object> body = new HashMap<>();
	    body.put("cid", "TC0ONETIME");
	    body.put("tid", tid);
	    body.put("partner_order_id", partnerOrderId); // 세션에서 가져온 partner_order_id 사용
	    body.put("partner_user_id", "USER_ID_" + session.getAttribute("user_id"));
	    body.put("pg_token", pgToken);

	    HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
	    ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

	    if (response.getStatusCode().is2xxSuccessful()) {
	    	
	    	//String name = (String) session.getAttribute("name");
	    	//int cost =  (int) session.getAttribute("cost");
	    	String username  =  userDetails.getUsername();
	    	int count  =  (int) session.getAttribute("count");
	    	String is_buy  =  (String) session.getAttribute("is_buy");
	    	int meal_idx  =  (int) session.getAttribute("meal_idx");
	    	
	    	 Map<String, Object> params = new HashMap<>();
	    	//params.put("name", name);
	    	//params.put("cost", cost);
	    	params.put("count", count);
	    	params.put("username", username);
	    	params.put("is_buy", is_buy);
	    	params.put("meal_idx", meal_idx);
	    	
	    	mealService.setmealbuy(params);

	    	Map<String, Object> result = response.getBody();
	        ModelAndView mav = new ModelAndView("redirect:/ad/mealTicket");
	        session.setAttribute("successMessage", "결제가 완료되었습니다!"); // 세션에 메시지 저장
	        mav.addObject("paymentInfo", result);
	        
	        return mav;
	    } else {
	        throw new RuntimeException("KakaoPay 결제 승인 실패");
	    }
	}
	
	
	@GetMapping(value="/ad/mealTicket")// /ad/meal/Ticket
	//ad/meal/TickerWrite
	public ModelAndView mealTicketView() {
		List<MealDTO> list = mealService.getmealTicket();
	    
		
		 for (MealDTO dto : list) {
		        int rawCost = Integer.parseInt(dto.getCost());
		        String cost = CommonUtil.addCommaToNumber(rawCost, "#,###");
				logger.info("cost :{},"+rawCost);
		        // 콤마 추가
		        dto.setCost(cost);
		    }
		
		
	    // 파일 정보를 DTO에 추가
	    for (MealDTO dto : list) {
	        FileDTO fileDTO = mealService.getFile(dto.getMeal_idx());
	        dto.setFiledto(fileDTO);
	    } 
        
	    // 식권 보유량 계산
	    //username 어캐 가져올까나
	    String username = "admin";
	    
	    int count = mealService.getTicketCount(username);
	    
	    // 리스트를 JSP로 전달
	    ModelAndView mav = new ModelAndView("/meal/mealTicket");
	    mav.addObject("list", list);
	    mav.addObject("count",count);
	    return mav;
	}
	
	
	//식권 등록 뷰이동
		@GetMapping(value="/ad/mealTicket/Write")
		public ModelAndView mealTicketWriteView() {

			return new ModelAndView("/meal/mealTicketWrite");
		}
		
		
		//식권 등록 
		@PostMapping(value="/ad/mealTicket/Write")
		public ModelAndView setmealTicket(
				@RequestParam("filepond") MultipartFile file,
				@RequestParam Map<String, String> params) {
			
			logger.info("Received params: {}", params);
			//CommonUtil.file
			params.put("creater", "admin"); // 생성자 임의로 넣기
			
			String sales = params.get("cost");
			if (sales == null || sales.isEmpty()) {
			    throw new IllegalArgumentException("cost 값이 비어 있습니다.");
			}
			double precost = Double.parseDouble(sales);
			
			
			//가격 표시 매서드에 넣기
			CommonUtil.addCommaToNumber(precost, "#,###");
			logger.info("cost :{},"+precost);
			String cost= CommonUtil.toString(precost);
			params.put("cost", cost);
			params.put("code_name", "MT001");
			FileDTO dto = CommonUtil.uploadSingleFile(file);
			logger.info("dto : {}",dto);
			
			
				dto.setCode_name("MT001");
				mealService.setmealTicket(params,dto);

			return new ModelAndView("/meal/mealTicketWrite");
		}
		
		//식권 수정 뷰이동
		@GetMapping(value="/ad/mealTicket/Update/{meal_idx}")
		public ModelAndView mealTicketUpdateView(@PathVariable int meal_idx) {
			 MealDTO dto = mealService.detailmealTicket(meal_idx);
			    FileDTO fto = mealService.getFile(meal_idx);
			    dto.setMeal_idx(meal_idx);

			    ModelAndView mav = new ModelAndView("/meal/mealTicketUpdate");
			    mav.addObject("info", dto);
			    
			    // 파일 경로 추가
			    if (fto != null) {
			        String fileUrl = "/C:/upload/" + fto.getNew_filename(); // 브라우저가 직접 접근할 수 있는 절대 경로
			        mav.addObject("fileUrl", fileUrl);
			        mav.addObject("fileName", fto.getOri_filename());
			    } else {
			        mav.addObject("fileUrl", null);
			        mav.addObject("fileName", null);
			    }

			    return mav;
			}
		
		//식권 수정 기능
		@PostMapping(value="/ad/mealTicket/Update/{meal_idx}")
		public ModelAndView editmealTicket(@RequestParam("filepond") MultipartFile file,@PathVariable String meal_idx,
				@RequestParam Map<String, String> params) {

			//사진/파일 업데이트 내용 추가 필요

			FileDTO dto = CommonUtil.uploadSingleFile(file);
			logger.info("dto : {}",dto);
			dto.setPk_idx(meal_idx);
			
				dto.setCode_name("MT001");
				params.put("meal_idx", meal_idx);
				mealService.editmealTicket(params,dto);
			
			
			return new ModelAndView("/meal/mealTicketUpdate/"+meal_idx);
		}
		
		
	//식단표
	@GetMapping(value = "/ad/mealMenu")
	public ModelAndView mealMenuView() {
	    String defaultIsTime = "B"; // 기본값: 아침
	    logger.info("Default is_time: {}", defaultIsTime);

	    // 기본 데이터를 로드
	    List<MealDTO> defaultMealList = mealService.getMealMenu(defaultIsTime);
	    logger.info("Default Meal List: {}", defaultMealList);

	    // ModelAndView로 데이터 전달
	    ModelAndView mav = new ModelAndView("/meal/mealMenu");
	    mav.addObject("mealList", defaultMealList); // 기본 데이터 전달
	    mav.addObject("defaultIsTime", defaultIsTime); // 기본 is_time 전달
	    return mav;
	}
			
	//식단표 시간필터 기능
	@GetMapping(value = "/ad/mealMenu/{is_time}")
	public ResponseEntity<List<MealDTO>> getMealMenu(@PathVariable String is_time) {
	    logger.info("Requested is_time: {}", is_time);

	    List<MealDTO> mealList = mealService.getMealMenu(is_time);
	    
	    if (mealList == null || mealList.isEmpty()) {
	        return ResponseEntity.noContent().build(); // 데이터가 없으면 204 반환
	    }

	    return ResponseEntity.ok(mealList); // JSON 형태로 반환
	}
	 
	
	// 식단표 등록 뷰이동
	@GetMapping(value="/ad/mealMenu/Write")
	public ModelAndView mealMenuWriteView() {
		return new ModelAndView("/meal/mealMenuWrite");
	}
	
	// 식단표 등록 기능
	@PostMapping(value = "/ad/mealMenu/Write")
	public ModelAndView setmealMenuWrite(@RequestParam Map<String, String> params,HttpSession session) {
		
		String start = params.get("start_date");
		String end = params.get("end_date");
		logger.info(start);
		logger.info(end);
		params.put("creater", "admin"); // 생성자 임의로 넣기
		mealService.setmealMenu(params);
		
		return new ModelAndView("/meal/mealMenuWrite");
	}
	
	//식단표 중복기능
	@GetMapping(value = "/ad/mealMenu/Overlay")
	@ResponseBody
	public Map<String, Integer> menuOverlay(String start, String end) {
	    logger.info("start date : {}", start);
	    logger.info("end date : {}", end);

	    if (start == null || end == null) {
	        throw new IllegalArgumentException("Start 또는 End 값이 null입니다.");
	    }

	    // String 값을 LocalDateTime으로 변환
	    LocalDateTime start_date = LocalDateTime.parse(start);
	    LocalDateTime end_date = LocalDateTime.parse(end);

	    // 서비스 호출
	    int menu_idx = mealService.menuOverlay(start_date, end_date);
	    logger.info("menu_idx 반환값: {}", menu_idx);

	    // JSON 형태의 응답 생성
	    Map<String, Integer> response = new HashMap<>();
	    response.put("menu_idx", menu_idx);
	    return response;
	}
	
	
	
	
	//식단표 수정
	@PutMapping(value = "/ad/mealMenu/Update")
	public ModelAndView editmealMenu(@RequestParam Map<String, String> params,HttpSession session) {
		params.put("creater", "admin"); // 생성자 임의로 넣기
		
		mealService.editmealMenu(params);
		
		return new ModelAndView("redirect:/ad/mealMenu");
	}
	
	
	
		
	
	
	@GetMapping(value="/ad/meal/List")
	public ModelAndView mealListView() {
	
		List<MealDTO> list = mealService.getmealList();
	    
		 list.forEach(ticket -> {
		        System.out.println("Ticket Name: " + ticket.getName());
		        System.out.println("Ticket Count: " + ticket.getCount());
		    });

		 for (MealDTO dto : list) {
		        int rawCost = Integer.parseInt(dto.getCost());
		        String cost = CommonUtil.addCommaToNumber(rawCost, "#,###");
				logger.info("cost :{},"+rawCost);
		        // 콤마 추가
		        dto.setCost(cost);
		    }
		 

	    // 파일 정보를 DTO에 추가
	    for (MealDTO dto : list) {
	        FileDTO fileDTO = mealService.getFile(dto.getMeal_idx());
	        dto.setFiledto(fileDTO);
	    }

	    // 리스트를 JSP로 전달
	    ModelAndView mav = new ModelAndView("/meal/mealList");
	    mav.addObject("list", list);
	    return mav;
	}
	
	
	
}
	
	

