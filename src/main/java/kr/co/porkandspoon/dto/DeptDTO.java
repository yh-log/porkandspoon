package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;
import java.util.List;

public class DeptDTO extends ResponseDTO{


   private String id;
   private String text;
   private String parent;
   private String type;
   private String creater;
   private LocalDateTime create_date;
   private String updater;
   private LocalDateTime update_date;
   private String use_yn;
   private String menuOrder;
   private String menuDepth;
   private String position;
   
   private String parent_date;
   
   // 시행일
   private String use_date;
   // 부서 설명
   private String content;
   
   private List<FileDTO> imgs;
   
   // 브랜드 로고
   private String logo;
   
   // 직영점 관련
   private String address;
   private String address_detail;
   private String name;
   private String owner;
   
   private String user_name;
   private String username;
   
   private String is_close;
   
   // 휴점 관련
   private String reason;
   private String start_date;
   private String end_date;

   private String hiddenFile;

   private int totalpage;

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
public String getParent() {
	return parent;
}
public void setParent(String parent) {
	this.parent = parent;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getCreater() {
	return creater;
}
public void setCreater(String creater) {
	this.creater = creater;
}
public LocalDateTime getCreate_date() {
	return create_date;
}
public void setCreate_date(LocalDateTime create_date) {
	this.create_date = create_date;
}
public String getUpdater() {
	return updater;
}
public void setUpdater(String updater) {
	this.updater = updater;
}
public LocalDateTime getUpdate_date() {
	return update_date;
}
public void setUpdate_date(LocalDateTime update_date) {
	this.update_date = update_date;
}
public String getUse_yn() {
	return use_yn;
}
public void setUse_yn(String use_yn) {
	this.use_yn = use_yn;
}

public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public String getParent_date() {
	return parent_date;
}
public void setParent_date(String parent_date) {
	this.parent_date = parent_date;
}
public String getUse_date() {
	return use_date;
}
public void setUse_date(String use_date) {
	this.use_date = use_date;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public List<FileDTO> getImgs() {
	return imgs;
}
public void setImgs(List<FileDTO> imgs) {
	this.imgs = imgs;
}
public String getLogo() {
	return logo;
}
public void setLogo(String logo) {
	this.logo = logo;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getAddress_detail() {
	return address_detail;
}
public void setAddress_detail(String address_detail) {
	this.address_detail = address_detail;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getOwner() {
	return owner;
}
public void setOwner(String owner) {
	this.owner = owner;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getIs_close() {
	return is_close;
}
public void setIs_close(String is_close) {
	this.is_close = is_close;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public String getStart_date() {
	return start_date;
}
public void setStart_date(String start_date) {
	this.start_date = start_date;
}
public String getEnd_date() {
	return end_date;
}
public void setEnd_date(String end_date) {
	this.end_date = end_date;
}
public String getMenuOrder() {
	return menuOrder;
}
public void setMenuOrder(String menuOrder) {
	this.menuOrder = menuOrder;
}
public String getMenuDepth() {
	return menuDepth;
}
public void setMenuDepth(String menuDepth) {
	this.menuDepth = menuDepth;
}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getHiddenFile() {
		return hiddenFile;
	}

	public void setHiddenFile(String hiddenFile) {
		this.hiddenFile = hiddenFile;
	}


	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
}
