package kr.co.porkandspoon.util.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.ConcurrentHashMap;

@Service
public class CustomUserDetailService implements UserDetailsService {

	private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailService.class);
	private final EmplRepository emplRepository;

	// 메모리에서 실패 횟수와 잠금 상태 관리
	private final ConcurrentHashMap<String, Integer> failedAttempts = new ConcurrentHashMap<>();
	private final ConcurrentHashMap<String, Boolean> accountLocked = new ConcurrentHashMap<>();

	public CustomUserDetailService(EmplRepository emplRepository) {
		this.emplRepository = emplRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Empl empl = emplRepository.findByUsername(username)
				.orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));


		// user_yn 검증 로직
		if (!"Y".equalsIgnoreCase(empl.getUser_yn())) {
			throw new LockedException("Account is not active.");
		}

		// 비밀번호가 1111인지 확인하고 잠금 해제
		if ("1111".equals(empl.getPassword())) {
			resetFailedAttempts(username);
			logger.info("User '{}' entered default password (1111). Lock is cleared.", username);
		}

		// CustomUserDetails 생성
		CustomUserDetails userDetails = new CustomUserDetails(empl);

		// 계정이 잠겨 있는 경우 예외 발생
		if (Boolean.TRUE.equals(accountLocked.get(username))) {
			logger.warn("User '{}' is locked.", username);
			//throw new LockedException("Account is locked.");
		}

		return userDetails;
	}

	public void increaseFailedAttempts(String username) {
		// 계정이 잠겨 있으면 실패 횟수 증가하지 않음
		if (Boolean.TRUE.equals(accountLocked.get(username))) {
			logger.warn("User '{}' is locked. Failed attempts will not increase.", username);
			return;
		}

		// 실패 횟수 증가
		int attempts = failedAttempts.getOrDefault(username, 0) + 1;
		failedAttempts.put(username, attempts);

		// 계정 잠금 처리
		if (attempts >= 3) {
			accountLocked.put(username, true);
			logger.warn("User '{}' is locked after {} failed login attempts.", username, attempts);
		}

		// 로그 출력
		logger.info("Failed login attempt for user '{}'. Failed attempts: {}", username, attempts);
	}

	public void resetFailedAttempts(String username) {
		// 실패 횟수 초기화
		failedAttempts.remove(username);
		accountLocked.remove(username);

		// 로그 출력
		logger.info("Failed attempts reset for user '{}'.", username);
	}

	public int getFailedAttempts(String username) {
		return failedAttempts.getOrDefault(username, 0);
	}

	public boolean isAccountLocked(String username) {
		return Boolean.TRUE.equals(accountLocked.get(username));
	}

}
