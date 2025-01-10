package kr.co.porkandspoon.dto;

import java.util.ArrayList;
import java.util.List;

public class MenuDTO {
  
	private int depth1_idx;
	private String depth1_name;
	private String depth1_url;
	private String depth1_role;
	private String depth1_icon;

	private int depth2_idx;
	private String depth2_name;
	private String depth2_url;
	private String depth2_role;
	private String depth2_icon;
    
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

	public String getDepth1_icon() {
		return depth1_icon;
	}

	public void setDepth1_icon(String depth1_icon) {
		this.depth1_icon = depth1_icon;
	}

	public int getDepth2_idx() {
		return depth2_idx;
	}

	public String getDepth2_name() {
		return depth2_name;
	}

	public String getDepth2_url() {
		return depth2_url;
	}

	public String getDepth2_role() {
		return depth2_role;
	}

	public String getDepth2_icon() {
		return depth2_icon;
	}

	public void setDepth2_idx(int depth2_idx) {
		this.depth2_idx = depth2_idx;
	}

	public void setDepth2_name(String depth2_name) {
		this.depth2_name = depth2_name;
	}

	public void setDepth2_url(String depth2_url) {
		this.depth2_url = depth2_url;
	}

	public void setDepth2_role(String depth2_role) {
		this.depth2_role = depth2_role;
	}

	public void setDepth2_icon(String depth2_icon) {
		this.depth2_icon = depth2_icon;
	}

	
}
