package kr.co.porkandspoon.dto;

import java.sql.Date;

public class MealDTO extends ResponseDTO{
	
	//menu 테이블
	private int menu_idx;
	private String is_time;
	private String content;
	private Date meal_date;
	
	//meal 테이블
	private int meal_idx;
	private String name;
	private int cost;
	private int count;
	private int creater;
	private Date create_date;
	
	
	
	//menu
	public int getMenu_idx() {
		return menu_idx;
	}
	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}
	public String getIs_time() {
		return is_time;
	}
	public void setIs_time(String is_time) {
		this.is_time = is_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getMeal_date() {
		return meal_date;
	}
	public void setMeal_date(Date meal_date) {
		this.meal_date = meal_date;
	}
	
	
	
	
	//meal
	public int getMeal_idx() {
		return meal_idx;
	}
	public void setMeal_idx(int meal_idx) {
		this.meal_idx = meal_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCreater() {
		return creater;
	}
	public void setCreater(int creater) {
		this.creater = creater;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getUpdater() {
		return updater;
	}
	public void setUpdater(int updater) {
		this.updater = updater;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	private int updater;
	private Date update_date;
	
	
	
	
	

}
