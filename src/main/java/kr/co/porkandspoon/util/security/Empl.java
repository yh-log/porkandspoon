package kr.co.porkandspoon.util.security;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "empl")
public class Empl {
	
	/*
	 * @Id
	 * @GeneratedValue : int 만 가능 
	 * @GeneratedValue(strategy = GenerationType.IDENTITY) private Long id; // 기본 키
	 * (미정)
	 */	
	
	@Id
	private String username; // 사용자 id (기본키)
	
	private String password; // 사용자 pw
	
	private String role;


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
	
	
	

}
