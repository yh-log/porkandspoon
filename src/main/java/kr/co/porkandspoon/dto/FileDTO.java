package kr.co.porkandspoon.dto;

public class FileDTO extends ResponseDTO{

	private String ori_filename;
	private String new_filename;
	private String type;
	
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
	
	
	
}
