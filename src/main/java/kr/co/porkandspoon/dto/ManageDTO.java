package kr.co.porkandspoon.dto;

import java.sql.Date;
import java.sql.Time;

public class ManageDTO extends ResponseDTO {
    
	//part 테이블
	private String name;
	private String part_name;
	private Date birth;
	private Date join_date;
	private Date quit_date;
	private String gender;
	private String is_quit;
	private String phone;
	private String address;
	private Time start_time;
	private Time end_time;
    
	private String text;
	private Date  create_date; 
 
	private FileDTO filedto;
	private String code_name;

	private String work_date;
	
	private String creater;
	private int pay;
	private int part_idx;
	private int history_idx;
	private String is_done;
	


    
	private String id;
	private String spotName;
	private String address_detail;
	private String owner;
	private String parent;
	//브랜드 리스트
	
	
	
	public int getPart_idx() {
		return part_idx;
	}
	
	
	public void setPart_idx(int part_idx) {
		this.part_idx = part_idx;
	}
	
	public int getPay() {
		return pay;
	}
	
	
	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPart_name() {
		return part_name;
	}


	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}


	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getIs_quit() {
		return is_quit;
	}


	public void setIs_quit(String is_quit) {
		this.is_quit = is_quit;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public Time getStart_time() {
		return start_time;
	}


	public void setStart_time(Time start_time) {
		this.start_time = start_time;
	}


	public Time getEnd_time() {
		return end_time;
	}


	public void setEnd_time(Time end_time) {
		this.end_time = end_time;
	}


	


	public String getWork_date() {
		return work_date;
	}


	public void setWork_date(String work_date) {
		this.work_date = work_date;
	}


	public String getCreater() {
		return creater;
	}


	public void setCreater(String creater) {
		this.creater = creater;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSpotName() {
		return spotName;
	}


	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}


	public Date getJoin_date() {
		return join_date;
	}


	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}


	public FileDTO getFiledto() {
		return filedto;
	}


	public void setFiledto(FileDTO filedto) {
		this.filedto = filedto;
	}


	public Date getQuit_date() {
		return quit_date;
	}


	public void setQuit_date(Date quit_date) {
		this.quit_date = quit_date;
	}
	
	
	public String getIs_done() {
		return is_done;
	}
	
	
	public void setIs_done(String is_done) {
		this.is_done = is_done;
	}


	public int getHistory_idx() {
		return history_idx;
	}


	public void setHistory_idx(int history_idx) {
		this.history_idx = history_idx;
	}
	
	
	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}

	public Date getCreate_date() {
		return create_date;
	}
	

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}


	public String getAddress_detail() {
		return address_detail;
	}


	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}


	public String getOwner() {
		return owner;
	}


	public void setOwner(String owner) {
		this.owner = owner;
	}


	public String getCode_name() {
		return code_name;
	}


	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}


	public String getParent() {
		return parent;
	}


	public void setParent(String parent) {
		this.parent = parent;
	}
	
}

