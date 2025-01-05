package kr.co.porkandspoon.dto;

import java.util.List;

public class MailDTO {
	// 메일 테이블
	private String idx;
	private String sender;
	private String title;
	private String content;
	private String start_date;
	private String send_status;
	private String use_yn;
	private String use_from_date;
	private String is_bookmark;

	// 메일 수신테이블
	private String username;
	private String is_read;
	private String read_date;
	
	 // 이미지 리스트
	private List<FileDTO> fileList;
    
	public String getIdx() {
		return idx;
	}
	public String getSender() {
		return sender;
	}
	public String getUsername() {
		return username;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getStart_date() {
		return start_date;
	}
	public String getSend_status() {
		return send_status;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public String getUse_from_date() {
		return use_from_date;
	}
	public String getIs_bookmark() {
		return is_bookmark;
	}
	public String getIs_read() {
		return is_read;
	}
	public String getRead_date() {
		return read_date;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public void setSend_status(String send_status) {
		this.send_status = send_status;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public void setUse_from_date(String use_from_date) {
		this.use_from_date = use_from_date;
	}
	public void setIs_bookmark(String is_bookmark) {
		this.is_bookmark = is_bookmark;
	}
	public void setIs_read(String is_read) {
		this.is_read = is_read;
	}
	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}
	public List<FileDTO> getFileList() {
		return fileList;
	}
	public void setFileList(List<FileDTO> fileList) {
		this.fileList = fileList;
	}
	


};
