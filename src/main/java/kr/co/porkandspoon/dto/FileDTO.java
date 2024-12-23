package kr.co.porkandspoon.dto;

public class FileDTO extends ResponseDTO{
	private int file_idx;
	private String code_name;
	private String ori_filename;
	private String new_filename;
	private String type;
	private String pk_value;
	
	// 생성자
	public FileDTO(String ori_filename, String new_filename, String type) {
		this.ori_filename = ori_filename;
		this.new_filename = new_filename;
		this.type = type;
	}
	
	public FileDTO() {};
	
	
	public String getOri_filename() {
		return ori_filename;
	}
	public void setOri_filename(String ori_filename) {
		this.ori_filename = ori_filename;
	}
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public String getCode_name() {
		return code_name;
	}

	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}

	public String getPk_value() {
		return pk_value;
	}

	public void setPk_value(String pk_value) {
		this.pk_value = pk_value;
	}
	
	
	
}
