package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;

public class EducationDTO {
	
	// 교육 등록 테이블
	private int no;
	private String category;
	private String subject;
	private String content;
	private String url;
	private String username;
	private LocalDateTime create_date;
	private String reCreate_date;
	private String updater;
	private String id;
	private String total_time;
	private LocalDateTime education_date;
	
	// 부서정보
	private String text;
	private String name;
	private String parent;
	
	// 글 개수 카운트
	private int total_count;
	
	// 가상 컬럼
	private String dept_name;
	private String filter;
	
	
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public LocalDateTime getEducation_date() {
		return education_date;
	}
	public void setEducation_date(LocalDateTime education_date) {
		this.education_date = education_date;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public LocalDateTime getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDateTime create_date) {
		this.create_date = create_date;
	}
	public String getReCreate_date() {
		return reCreate_date;
	}
	public void setReCreate_date(String reCreate_date) {
		this.reCreate_date = reCreate_date;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTotal_time() {
		return total_time;
	}
	public void setTotal_time(String total_time) {
		this.total_time = total_time;
	}
	
	
	
	
}
