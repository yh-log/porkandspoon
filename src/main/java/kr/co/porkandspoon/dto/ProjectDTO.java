package kr.co.porkandspoon.dto;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public class ProjectDTO extends ResponseDTO {
    
	private List<String> approvalLines;
	
	private String project_idx;
	private String name;
	private String username;
	private String updater;
	private Date start_date; 
	private Date end_date; 
	private String create_date; // 변경된 타입
	private String update_date;
	private Date update_start_date;
	private Date update_end_date;
	private int percent;
	private int count;
	private String is_open;
	
	//칸반보드
	private String creater;
	private int kanban_idx;
	private String subject;
	private String content;
	private String is_class;
	
	
	
	
	public String getProject_idx() {
		return project_idx;
	}
	public void setProject_idx(String project_idx) {
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
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public Date getUpdate_start_date() {
		return update_start_date;
	}
	public void setUpdate_start_date(Date update_start_date) {
		this.update_start_date = update_start_date;
	}
	public Date getUpdate_end_date() {
		return update_end_date;
	}
	public void setUpdate_end_date(Date update_end_date) {
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
	public int getKanban_idx() {
		return kanban_idx;
	}
	public void setKanban_idx(int kanban_idx) {
		this.kanban_idx = kanban_idx;
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
	public String getIs_class() {
		return is_class;
	}
	public void setIs_class(String is_class) {
		this.is_class = is_class;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public List<String> getApprovalLines() {
		return approvalLines;
	}
	public void setApprovalLines(List<String> approvalLines) {
		this.approvalLines = approvalLines;
	}
	
}
