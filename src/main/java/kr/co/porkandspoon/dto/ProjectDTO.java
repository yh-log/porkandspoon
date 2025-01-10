package kr.co.porkandspoon.dto;

import java.sql.Date;
import java.time.LocalDateTime;

public class ProjectDTO extends ResponseDTO {
    
	private int project_idx;
	private String name;
	private String username;
	private String updater;
	private Date start_date; 
	private Date end_date; 
	private LocalDateTime create_date;
	private LocalDateTime update_date;
	private LocalDateTime update_start_date;
	private LocalDateTime update_end_date;
	private int percent;
	private int count;
	private String is_open;
	
	
	
	
	
	public int getProject_idx() {
		return project_idx;
	}
	public void setProject_idx(int project_idx) {
		this.project_idx = project_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getIs_open() {
		return is_open;
	}
	public void setIs_open(String is_open) {
		this.is_open = is_open;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public LocalDateTime getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDateTime create_date) {
		this.create_date = create_date;
	}
	public LocalDateTime getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(LocalDateTime update_date) {
		this.update_date = update_date;
	}
	public LocalDateTime getUpdate_start_date() {
		return update_start_date;
	}
	public void setUpdate_start_date(LocalDateTime update_start_date) {
		this.update_start_date = update_start_date;
	}
	public LocalDateTime getUpdate_end_date() {
		return update_end_date;
	}
	public void setUpdate_end_date(LocalDateTime update_end_date) {
		this.update_end_date = update_end_date;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
