package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
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
	
	@GetMapping(value="/ad/mealTicket")// /ad/meal/Ticket
	//ad/meal/TickerWrite
	public ModelAndView mealTicketView() {
		List<MealDTO> list = mealService.getmealTicket();
	    
	    // 파일 정보를 DTO에 추가
	    for (MealDTO dto : list) {
	        FileDTO fileDTO = mealService.getFile(dto.getMeal_idx());
	        dto.setFiledto(fileDTO);
	    }

	    // 리스트를 JSP로 전달
	    ModelAndView mav = new ModelAndView("/meal/mealTicket");
	    mav.addObject("list", list);
	    return mav;
	}
	
	
	
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
	
	
	@GetMapping(value = "/ad/mealMenu/{is_time}")
	public ResponseEntity<List<MealDTO>> getMealMenu(@PathVariable String is_time) {
	    logger.info("Requested is_time: {}", is_time);

	    List<MealDTO> mealList = mealService.getMealMenu(is_time);
	    
	    if (mealList == null || mealList.isEmpty()) {
	        return ResponseEntity.noContent().build(); // 데이터가 없으면 204 반환
	    }
	    
	    
	    return ResponseEntity.ok(mealList); // JSON 형태로 반환
	}
	 
	
	// 식단표 등록 - 등록되어있는게 있으면 어떻게 처리할지 작업해야 함.
	@GetMapping(value="/ad/mealMenu/Write")
	public ModelAndView mealMenuWriteView() {
		return new ModelAndView("/meal/mealMenuWrite");
	}
	
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
	
	
	@GetMapping(value="/ad/meal/List")
	public ModelAndView mealListView() {
		
		
		List<MealDTO> list = mealService.getmealTicket();
	    
		 list.forEach(ticket -> {
		        System.out.println("Ticket Name: " + ticket.getName());
		        System.out.println("Ticket Count: " + ticket.getCount());
		    });

		
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
	
	
	@GetMapping(value="/ad/mealTicket/Update/{meal_idx}")
	public ModelAndView mealTicketUpdateView(@PathVariable int meal_idx) {
		 MealDTO dto = mealService.detailmealTicket(meal_idx);
		    FileDTO fto = mealService.getFile(meal_idx);

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
	
	@PostMapping(value="/ad/mealTicket/Update")
	public ModelAndView editmealTicket(@RequestParam Map<String, String> params) {
		mealService.editmealTicket(params);
		return new ModelAndView("/meal/mealTicketUpdate");
	}
	

	
	
	
	
	
}
