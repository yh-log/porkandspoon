package kr.co.porkandspoon.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.MealDTO;
import kr.co.porkandspoon.service.MealService;

@RestController
public class MealController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MealService mealService;
	
	@GetMapping(value="/ad/mealTicket")// /ad/meal/Ticket
	//ad/meal/TickerWrite
	public ModelAndView mealTicketView() {
		return new ModelAndView("/meal/mealTicket");
	}
	
//	@GetMapping(value="/ad/mealMenu") // {is_time}
//	public ModelAndView mealMenuView() { 
//		
//		return new ModelAndView("/meal/mealMenu");
//	}
	
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
	
//	@PostMapping(value="/ad/mealMenu/{is_time}") // {is_time}
//	public ModelAndView mealMenuView(@RequestParam(defaultValue = "B") String is_time) { 
//		logger.info(is_time);
//		List<MealDTO> list = mealService.getMealMenu(is_time);
//		logger.info("list: {}",list.get(0));
//		ModelAndView mav = new ModelAndView("/meal/mealMenu");
//		mav.addObject("mealList",list);
//		return mav;
//	}
	
	@GetMapping(value = "/ad/mealMenu/{is_time}")
	public ResponseEntity<List<MealDTO>> getMealMenu(@PathVariable String is_time) {
	    logger.info("Requested is_time: {}", is_time);

	    List<MealDTO> mealList = mealService.getMealMenu(is_time);
	    if (mealList == null || mealList.isEmpty()) {
	        return ResponseEntity.noContent().build(); // 데이터가 없으면 204 반환
	    }
	    return ResponseEntity.ok(mealList); // JSON 형태로 반환
	}
	 
	
	
	@GetMapping(value="/ad/mealMenu/Write")
	public ModelAndView mealMenuWriteView() {
		return new ModelAndView("/meal/mealMenuWrite");
	}
	
	@PostMapping(value = "/ad/mealMenu/Write")
	public ModelAndView getmealMenuWrite(@RequestParam Map<String, String> params,HttpSession session) {
		
		String start = params.get("start_date");
		String end = params.get("end_date");
		logger.info(start);
		logger.info(end);
		params.put("creater", "admin");
		
		mealService.getmealMenu(params);
		
		return new ModelAndView("/meal/mealMenuWrite");
	}
	
	
	
	@GetMapping(value="/ad/mealTicket/Write")
	public ModelAndView mealTicketWriteView() {
		
		
		return new ModelAndView("/meal/mealTicketWrite");
	}
	
	@GetMapping(value="/ad/meal/List")
	public ModelAndView mealListView() {
		return new ModelAndView("/meal/mealList");
	}
	
	@GetMapping(value="/ad/mealTicket/Update")
	public ModelAndView mealTicketUpdateView() {
		return new ModelAndView("/meal/mealTicketUpdate");
	}
	
	
	
}
