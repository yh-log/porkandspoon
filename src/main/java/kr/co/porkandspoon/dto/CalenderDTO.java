package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;

public class CalenderDTO {
	
	private String idx;
	private String username;
	private LocalDateTime start_date;
	private LocalDateTime end_date;
	private String subject;
	private String content;
	private String type; // 캘린더 유형(전사P,팀T,개인S)
	private String reservation_type;
	private String no; // 물품,회의실 no
	private String personnel;
	private String id; // 부서,직영 코드
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public LocalDateTime getStart_date() {
		return start_date;
	}
	public void setStart_date(LocalDateTime string) {
		this.start_date = string;
	}
	public LocalDateTime getEnd_date() {
		return end_date;
	}
	public void setEnd_date(LocalDateTime end_date) {
		this.end_date = end_date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReservation_type() {
		return reservation_type;
	}
	public void setReservation_type(String reservation_type) {
		this.reservation_type = reservation_type;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPersonnel() {
		return personnel;
	}
	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	

}
