package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;

public class FoodieDTO extends ResponseDTO {

	private int store_idx;
	private double  store_latitude;
	private double  store_longitude;
	private String store_address;
	private String store_name;
	private String store_category;
	
	public double getTotal_review_star() {
		return total_review_star;
	}
	public void setTotal_review_star(double total_review_star) {
		this.total_review_star = total_review_star;
	}
	private double total_review_star;
	private int review_idx;
	private String username;
	private String content;
	private LocalDateTime create_date;
	private int review_star;
	private String use_yn;
	private String name;
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDateTime create_date) {
		this.create_date = create_date;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public double  getStore_latitude() {
		return store_latitude;
	}
	public void setStore_latitude(double  store_latitude) {
		this.store_latitude = Math.round(store_latitude * 1000000) / 1000000.0;
	}
	public double  getStore_longitude() {
		return store_longitude;
	}
	public void setStore_longitude(double  store_longitude) {
		this.store_longitude = Math.round(store_longitude * 1000000) / 1000000.0;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_category() {
		return store_category;
	}
	public void setStore_category(String store_category) {
		this.store_category = store_category;
	}
}
