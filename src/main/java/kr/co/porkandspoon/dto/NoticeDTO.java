package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;

public class NoticeDTO {

	private int alarm_idx;
	private String username;
	private String code_name;
	private String subject;
	private String content;
	private LocalDateTime create_date;
	private String is_url;
	private String url;
	private String from_idx;
	private String is_confirm;
	private LocalDateTime check_date;
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	private String from_id;
	public int getAlarm_idx() {
		return alarm_idx;
	}
	public void setAlarm_idx(int alarm_idx) {
		this.alarm_idx = alarm_idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
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
	public LocalDateTime getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDateTime create_date) {
		this.create_date = create_date;
	}
	public String getIs_url() {
		return is_url;
	}
	public void setIs_url(String is_url) {
		this.is_url = is_url;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFrom_idx() {
		return from_idx;
	}
	public void setFrom_idx(String from_idx) {
		this.from_idx = from_idx;
	}
	public String getIs_confirm() {
		return is_confirm;
	}
	public void setIs_confirm(String is_confirm) {
		this.is_confirm = is_confirm;
	}
	public LocalDateTime getCheck_date() {
		return check_date;
	}
	public void setCheck_date(LocalDateTime check_date) {
		this.check_date = check_date;
	}
}
