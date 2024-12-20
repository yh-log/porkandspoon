package kr.co.porkandspoon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping(value="/ad/mealMenu/{is_time}")
	public ModelAndView mealMenuView(@PathVariable String is_time) {
		List<MealDTO> list = mealService.getMealMenu();
		ModelAndView mav = new ModelAndView("/meal/mealMenu");
		logger.info("list: {}",list.get(0));
		mav.addObject("mealList",list);
		return mav;
	}
	
	@GetMapping(value="/ad/mealMenu/Write")
	public ModelAndView mealMenuWriteView() {
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
