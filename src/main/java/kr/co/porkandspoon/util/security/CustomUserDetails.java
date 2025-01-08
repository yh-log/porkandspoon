package kr.co.porkandspoon.util.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

// User : UserDetails 인터페이스를 구현한 기본 구현체로, Spring Security에서 사용자 인증과 권한 관리에 사용
public class CustomUserDetails extends User {

    private final String name;


    private int failedAttempts; // 로그인 실패 횟수
    private boolean accountLocked; // 계정 잠금 여부

    public CustomUserDetails(Empl empl) {
        super(empl.getUsername(), empl.getPassword(), AuthorityUtils.createAuthorityList("ROLE_" + empl.getRole().toUpperCase()));
        this.name = empl.getName();
        this.failedAttempts = 0; // 초기값 설정
        this.accountLocked = false; // 초기값 설정
    }

    public String getName() {
        return name;
    }

    public int getFailedAttempts() {
        return failedAttempts;
    }

    public void setFailedAttempts(int failedAttempts) {
        this.failedAttempts = failedAttempts;
    }

    public boolean isAccountLocked() {
        return accountLocked;
    }

    public void setAccountLocked(boolean accountLocked) {
        this.accountLocked = accountLocked;
    }

}
