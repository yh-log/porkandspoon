package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MealController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping(value="/ad/mealTicket")// /ad/meal/Ticket
	//ad/meal/TickerWrite
	public ModelAndView mealTicketView() {
		return new ModelAndView("/meal/mealTicket");
	}
	
	@GetMapping(value="/ad/mealMenu")
	public ModelAndView mealMenuView() {
		return new ModelAndView("/meal/mealMenu");
	}
	
	@GetMapping(value="/ad/mealMenuWrite")
	public ModelAndView mealMenuWriteView() {
		return new ModelAndView("/meal/mealMenuWrite");
	}
	
	@GetMapping(value="/ad/mealTicketWrite")
	public ModelAndView mealTicketWriteView() {
		return new ModelAndView("/meal/mealTicketWrite");
	}
	
	@GetMapping(value="/ad/mealList")
	public ModelAndView mealListView() {
		return new ModelAndView("/meal/mealList");
	}
	
	
	
}
