package kr.co.porkandspoon.util.security;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user")
public class Empl {
	
	
	@Id
	private String username; // 사용자 id (기본키)
	
	private String password; // 사용자 pw
	
	private String role;

	private String name;

	//@Transient // DB에 관리되지 않도록 하기 위해 선언
	

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	

}
