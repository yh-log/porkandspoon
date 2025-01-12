package kr.co.porkandspoon.dto;

import java.time.LocalDate;
import java.util.List;

public class UserDTO extends ResponseDTO{
   
   private String username;
   private String password;
   private String role; // 권한 Role
   
   
   private String person_num;       // 사번
   private String name;          //이름
   private String email;         // 이메일
   private String birth;         // 생년월일
   private String phone;         // 핸드폰번호
   private String company_num;      // 사내번호
   private String address;         // 주소
   private String gender;         // 성별
   private String join_date;   // 입사일
   
   private String creater;         // 등록자
   private LocalDate create_date;   // 생성일
   private String updater;         // 수정자
   private LocalDate update_date;   // 수정일
   private String leave_date;   // 퇴사일
   private String user_yn;         // 퇴사 여부
   
   //private String parent;            // 부서코드
   
   private String position;          // 직급
   private String title;		  // 직책
   private String code_name;      // 코드분류
   
   private DeptDTO dept;		// 부서 dto 객체
   
   private String authentication; // 인증코드
   private Integer idx;            // 인증코드 idx
   
   private String parent;		// 부서 코드
   private String dept_name; 	// 부서 이름
   
   private List<CareerDTO> career;
   
   private String type;

   private String profile;
   
   private String position_content;
   
   private int menuOrder;
   private String text;
   private String new_filename;
   private int totalpage;
 
   // 인사 이동
   private String transfer_date;
   private String old_position;
   private String new_position;
   private String old_department;
   private String new_department;
   
   private String owner;

   private String storeId;

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getTransfer_date() {
		return transfer_date;
	}
	
	public void setTransfer_date(String transfer_date) {
		this.transfer_date = transfer_date;
	}
	
	public String getOld_position() {
		return old_position;
	}
	
	public void setOld_position(String old_position) {
		this.old_position = old_position;
	}
	
	public String getNew_position() {
		return new_position;
	}
	
	public void setNew_position(String new_position) {
		this.new_position = new_position;
	}
	
	public String getOld_department() {
		return old_department;
	}
	
	public void setOld_department(String old_department) {
		this.old_department = old_department;
	}
	
	public String getNew_department() {
		return new_department;
	}
	
	public void setNew_department(String new_department) {
		this.new_department = new_department;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public String getNew_filename() {
		return new_filename;
	}
	
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}


   
   public int getMenuOrder() {
	   return menuOrder;
	}
	
	public void setMenuOrder(int menuOrder) {
	   this.menuOrder = menuOrder;
	}

   
   
   
   
	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public String getDept_name() {
		return dept_name;
	}
	
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getPosition_content() {
		return position_content;
	}
	
	public void setPosition_content(String position_content) {
		this.position_content = position_content;
	}

	public String getProfile() {
		return profile;
	}
	
	public void setProfile(String profile) {
		this.profile = profile;
	}

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
	
	public String getJoin_date() {
		return join_date;
	}
	
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	
	public String getCreater() {
		return creater;
	}
	
	public void setCreater(String creater) {
		this.creater = creater;
	}
	
	public LocalDate getCreate_date() {
		return create_date;
	}
	
	public void setCreate_date(LocalDate create_date) {
		this.create_date = create_date;
	}
	
	public String getUpdater() {
		return updater;
	}
	
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	
	public LocalDate getUpdate_date() {
		return update_date;
	}
	
	public void setUpdate_date(LocalDate update_date) {
		this.update_date = update_date;
	}
	
	public String getLeave_date() {
		return leave_date;
	}
	
	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}
	
	public String getUser_yn() {
		return user_yn;
	}
	
	public void setUser_yn(String user_yn) {
		this.user_yn = user_yn;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getCode_name() {
		return code_name;
	}
	
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	
	public DeptDTO getDept() {
		return dept;
	}
	
	public void setDept(DeptDTO dept) {
		this.dept = dept;
	}
	
	public String getAuthentication() {
		return authentication;
	}
	
	public void setAuthentication(String authentication) {
		this.authentication = authentication;
	}
	
	public Integer getIdx() {
		return idx;
	}
	
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
	
	public List<CareerDTO> getCareer() {
		return career;
	}

	public void setCareer(List<CareerDTO> career) {
		this.career = career;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
}



