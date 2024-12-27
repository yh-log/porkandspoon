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
   private int menuOrder;
   private String position;
   
   // 시행일
   private String use_date;
   // 부서 설명
   private String content;
   
   private List<FileDTO> imgs;
   
   // 브랜드 로고
   private String logo;
   
   
   
   public String getLogo() {
	return logo;
}
public void setLogo(String logo) {
	this.logo = logo;
}
public List<FileDTO> getImgs() {
		return imgs;
	}
	public void setImgs(List<FileDTO> imgs) {
		this.imgs = imgs;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getMenuOrder() {
		return menuOrder;
	}
	public void setMenuOrder(int menuOrder) {
		this.menuOrder = menuOrder;
	}
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
	   
   

}
