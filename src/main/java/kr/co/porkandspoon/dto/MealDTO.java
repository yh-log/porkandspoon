package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;



public class MealDTO extends ResponseDTO {
    // menu 테이블
    private int menu_idx;
    private String is_time;
    private String is_buy;

	private String content;
    private LocalDateTime start_date;  // 변경된 타입
    private LocalDateTime end_date;    // 변경된 타입

    // meal 테이블
    private String meal_idx;
    private String name;
    private String meal_name;
    private String total_cost;
   
    private String cost;
    private int count;
    private String creater;
    private LocalDateTime create_date; // 변경된 타입
    private String updater;
    private LocalDateTime update_date; // 변경된 타입
    private String use_yn;
    
    private FileDTO filedto;
    private int idx;
    private String username;
    
   
    
    public String getIs_buy() {
    	return is_buy;
    }
    
    public void setIs_buy(String is_buy) {
    	this.is_buy = is_buy;
    }
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getMenu_idx() {
        return menu_idx;
    }

    public void setMenu_idx(int menu_idx) {
        this.menu_idx = menu_idx;
    }

    public String getIs_time() {
        return is_time;
    }

    public void setIs_time(String is_time) {
        this.is_time = is_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getStart_date() {
        return start_date;
    }

    public void setStart_date(LocalDateTime start_date) {
        this.start_date = start_date;
    }

    public LocalDateTime getEnd_date() {
        return end_date;
    }

    public void setEnd_date(LocalDateTime end_date) {
        this.end_date = end_date;
    }

    // Getter and Setter for meal
    public String getMeal_idx() {
        return meal_idx;
    }

    public void setMeal_idx(String meal_idx) {
        this.meal_idx = meal_idx;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

  

    public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
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

	public FileDTO getFiledto() {
		return filedto;
	}

	public void setFiledto(FileDTO filedto) {
		this.filedto = filedto;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMeal_name() {
		return meal_name;
	}

	public void setMeal_name(String meal_name) {
		this.meal_name = meal_name;
	}

	public String getTotal_cost() {
		return total_cost;
	}

	public void setTotal_cost(String total_cost) {
		this.total_cost = total_cost;
	}
	
	
	
	
}
