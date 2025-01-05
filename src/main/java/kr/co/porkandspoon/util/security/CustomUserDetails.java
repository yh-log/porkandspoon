package kr.co.porkandspoon.util.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

// User : UserDetails 인터페이스를 구현한 기본 구현체로, Spring Security에서 사용자 인증과 권한 관리에 사용
public class CustomUserDetails extends User {

    private final String name;

    public CustomUserDetails(Empl empl) {
        super(empl.getUsername(), empl.getPassword(), AuthorityUtils.createAuthorityList("ROLE_" + empl.getRole().toUpperCase()));
        this.name = empl.getName();
    }

    public String getName() {
        return name;
    }

}
