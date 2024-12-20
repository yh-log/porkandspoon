package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;

public class UserDTO {
	// 유저 테이블
	private String username;
	private String password;
	private String role;
	private String person_num;
	private String name;
	private String email;
	private String birth;
	private String phone;
	private String company_num;
	private String address;
	private String gender;
	private LocalDateTime join_date;
	private String creater;
	private LocalDateTime create_date;
	private String updater;
	private LocalDateTime update_date;
	private String user_yn;
	private LocalDateTime leave_date;
	private int position_idx;
	private int parent;
	private String code_name;
	
	//	부서테이블
	private String text;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPerson_num() {
		return person_num;
	}
	public void setPerson_num(String person_num) {
		this.person_num = person_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCompany_num() {
		return company_num;
	}
	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public LocalDateTime getJoin_date() {
		return join_date;
	}
	public void setJoin_date(LocalDateTime join_date) {
		this.join_date = join_date;
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
	public String getUser_yn() {
		return user_yn;
	}
	public void setUser_yn(String user_yn) {
		this.user_yn = user_yn;
	}
	public LocalDateTime getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(LocalDateTime leave_date) {
		this.leave_date = leave_date;
	}
	public int getPosition_idx() {
		return position_idx;
	}
	public void setPosition_idx(int position_idx) {
		this.position_idx = position_idx;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}
