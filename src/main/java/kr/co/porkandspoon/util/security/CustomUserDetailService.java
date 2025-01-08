package kr.co.porkandspoon.util.security;

import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

//		// CustomUserDetails 생성
//		CustomUserDetails userDetails = new CustomUserDetails(empl);
//
//		// 계정이 잠겨 있는 경우 예외 발생
//		if (userDetails.isAccountLocked()) {
//			throw new LockedException("Account is locked.");
//		}

		// CustomUserDetails 반환
		return new CustomUserDetails(empl);
	}

//	@Transactional
//	public void increaseFailedAttempts(CustomUserDetails userDetails) {
//		int failedAttempts = userDetails.getFailedAttempts();
//		userDetails.setFailedAttempts(++failedAttempts);
//
//		if(failedAttempts + 1 >= 3) {
//			userDetails.setAccountLocked(true);
//		}
//	}
//
//	@Transactional
//	public void resetFailedAttempts(CustomUserDetails userDetails) {
//		userDetails.setFailedAttempts(0);
//		userDetails.setAccountLocked(false);
//	}

}
