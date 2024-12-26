package kr.co.porkandspoon.dto;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;



public class ApprovalDTO {
	// 기안문 테이블
	public String draft_idx;
	public String document_number;
	public String username; //사번
	public String target_type;
	public String action_type;
	public LocalDate create_date;
	public String subject;
	public String name;
	
	
	public String user_name; // 이름
	public String position; // 직책
	public String sign; // 서명
	
	// 부서이름
	public String dept_name;
	
	public String appr_user1;
	public String appr_user2;
	public String appr_user3;
	public String appr_user4;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public LocalDate from_date;
	public String content;
	public String address;
	public String address_detail;
	public String cooper_dept_id;
	public String status;
	public String dept_id;
	public LocalDate update_date;
	
	// 결재라인 테이블
	public String line_idx;
	public String order_num;
	public String approval_date;
	public String comment;
	
	public FileDTO fileDTO;
	
    public String getLine_idx() {
		return line_idx;
	}

	public String getOrder_num() {
		return order_num;
	}

	public String getApproval_date() {
		return approval_date;
	}

	public String getComment() {
		return comment;
	}

	public void setLine_idx(String line_idx) {
		this.line_idx = line_idx;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public void setApproval_date(String approval_date) {
		this.approval_date = approval_date;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	// 이미지 리스트
    private List<FileDTO> fileList;

	public String getDraft_idx() {
		return draft_idx;
	}

	public void setDraft_idx(String draft_idx) {
		this.draft_idx = draft_idx;
	}

	public String getDocument_number() {
		return document_number;
	}

	public void setDocument_number(String document_number) {
		this.document_number = document_number;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTarget_type() {
		return target_type;
	}

	public void setTarget_type(String target_type) {
		this.target_type = target_type;
	}

	public String getAction_type() {
		return action_type;
	}

	public void setAction_type(String action_type) {
		this.action_type = action_type;
	}

	public LocalDate getCreate_date() {
		return create_date;
	}

	public void setCreate_date(LocalDate create_date) {
		this.create_date = create_date;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDate getFrom_date() {
		return from_date;
	}

	public void setFrom_date(LocalDate from_date) {
		this.from_date = from_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getCooper_dept_id() {
		return cooper_dept_id;
	}

	public void setCooper_dept_id(String cooper_dept_id) {
		this.cooper_dept_id = cooper_dept_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public LocalDate getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(LocalDate update_date) {
		this.update_date = update_date;
	}

	public List<FileDTO> getFileList() {
		return fileList;
	}

	public void setFileList(List<FileDTO> fileList) {
		this.fileList = fileList;
	}

	public String getAppr_user1() {
		return appr_user1;
	}

	public String getAppr_user2() {
		return appr_user2;
	}

	public String getAppr_user3() {
		return appr_user3;
	}

	public String getAppr_user4() {
		return appr_user4;
	}

	public void setAppr_user1(String appr_user1) {
		this.appr_user1 = appr_user1;
	}

	public void setAppr_user2(String appr_user2) {
		this.appr_user2 = appr_user2;
	}

	public void setAppr_user3(String appr_user3) {
		this.appr_user3 = appr_user3;
	}

	public void setAppr_user4(String appr_user4) {
		this.appr_user4 = appr_user4;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public FileDTO getFileDTO() {
		return fileDTO;
	}

	public void setFileDTO(FileDTO fileDTO) {
		this.fileDTO = fileDTO;
	}


}
