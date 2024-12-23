package kr.co.porkandspoon.dto;

public class FoodieDTO {

	private int store_idx;
	private float store_latitude;
	private float store_longitude;
	private String store_address;
	private String store_name;
	private String store_category;
	public int getStore_idx() {
		return store_idx;
	}
	public void setStore_idx(int store_idx) {
		this.store_idx = store_idx;
	}
	public float getStore_latitude() {
		return store_latitude;
	}
	public void setStore_latitude(float store_latitude) {
		this.store_latitude = store_latitude;
	}
	public float getStore_longitude() {
		return store_longitude;
	}
	public void setStore_longitude(float store_longitude) {
		this.store_longitude = store_longitude;
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
