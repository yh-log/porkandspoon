package kr.co.porkandspoon.util.security;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailService implements UserDetailsService {
	
	private final EmplRepository emplRepository;

	public CustomUserDetailService(EmplRepository emplRepository) {
		this.emplRepository = emplRepository;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Empl empl = emplRepository.findByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
		
		return User.builder()
				.username(empl.getUsername())
				.password(empl.getPassword()) // 암호화 된 비밀번호 그대로 사용
				.roles(empl.getRole()) // 기본 권한
				.build(); 
	}
}
