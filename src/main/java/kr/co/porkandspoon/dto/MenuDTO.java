package kr.co.porkandspoon.dto;

import java.util.ArrayList;
import java.util.List;

public class MenuDTO {
  
	private int depth1_idx;
	private String depth1_name;
	private String depth1_url;
	private String depth1_role;
    private List<MenuDepth2DTO> childMenus = new ArrayList<MenuDepth2DTO>();
    

	public int getDepth1_idx() {
		return depth1_idx;
	}

	public String getDepth1_name() {
		return depth1_name;
	}

	public String getDepth1_url() {
		return depth1_url;
	}

	public String getDepth1_role() {
		return depth1_role;
	}

	public List<MenuDepth2DTO> getChildMenus() {
		return childMenus;
	}

	public void setDepth1_idx(int depth1_idx) {
		this.depth1_idx = depth1_idx;
	}

	public void setDepth1_name(String depth1_name) {
		this.depth1_name = depth1_name;
	}

	public void setDepth1_url(String depth1_url) {
		this.depth1_url = depth1_url;
	}

	public void setDepth1_role(String depth1_role) {
		this.depth1_role = depth1_role;
	}

	public void setChildMenus(List<MenuDepth2DTO> childMenus) {
		this.childMenus = childMenus;
	}

	
}
