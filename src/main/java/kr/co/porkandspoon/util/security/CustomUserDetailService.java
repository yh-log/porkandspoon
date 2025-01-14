package kr.co.porkandspoon.util.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.ConcurrentHashMap;

@Service
public class CustomUserDetailService implements UserDetailsService {

	@Lazy
	@Autowired
	private PasswordEncoder passwordEncoder; // 필드 주입

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

		// DB 비번 로그 찍기
		logger.info("[loadUserByUsername] DB password for user '{}': '{}'", username, empl.getPassword());


		// `user_yn` 값 확인
		if ("N".equalsIgnoreCase(empl.getUser_yn())) {
			logger.warn("User '{}' is disabled (user_yn = N).", username);
			throw new LockedException("Account is disabled.");
		}

		// 2) 1111과 매칭되는지 확인 (암호화된 비밀번호가 정말 1111 해시인지)
		boolean is1111 = passwordEncoder.matches("1111", empl.getPassword());
		logger.info("[loadUserByUsername] matches('1111', DB password) => {}", is1111);

		// CustomUserDetails 생성
		CustomUserDetails userDetails = new CustomUserDetails(empl);


		// "기본 비밀번호 여부" 세팅
		if (is1111) {
			userDetails.setDefaultPassword(true);

			// 잠금 해제 로직 (기존)
			resetFailedAttempts(username);
			logger.info("User '{}' entered default password (1111). Lock is cleared.", username);
		}

		// 3) 1111 해시일 경우 잠금 해제 로직
//		if (is1111) {
//			resetFailedAttempts(username);
//			logger.info("User '{}' entered default password (1111). Lock is cleared.", username);
//		}
		// 비밀번호가 1111인지 확인하고 잠금 해제
//		if (passwordEncoder.matches("1111", empl.getPassword())) {
//			resetFailedAttempts(username);
//			logger.info("User '{}' entered default password (1111). Lock is cleared.", username);
//		}


		// 만약 이 username이 잠겨 있다면...
		if (Boolean.TRUE.equals(accountLocked.get(username))) {
			// 일단 DB 비번이 1111 해시인지 확인
			boolean is1111Check = passwordEncoder.matches("1111", empl.getPassword());
			if (is1111Check) {
				// => 잠금 해제
				accountLocked.remove(username);
				failedAttempts.remove(username);

				logger.warn("User '{}' was locked, but password is 1111 => unlock now.", username);
			} else {
				// => 여전히 잠김
				logger.warn("User '{}' is locked. Throw LockedException.", username);
				throw new LockedException("Account is locked.");
			}
		}

		// 계정이 잠겨 있는 경우 예외 발생
//		if (Boolean.TRUE.equals(accountLocked.get(username))) {
//			logger.warn("User '{}' is locked.", username);
//			//throw new LockedException("Account is locked.");
//		}

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
