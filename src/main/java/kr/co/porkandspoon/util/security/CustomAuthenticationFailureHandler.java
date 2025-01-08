package kr.co.porkandspoon.util.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {


	private final CustomUserDetailService customUserDetailService;
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);

	public CustomAuthenticationFailureHandler(CustomUserDetailService customUserDetailService) {
		this.customUserDetailService = customUserDetailService;
	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
										AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter("username");
		String rawPassword = request.getParameter("password");

		if ("1111".equals(rawPassword)) {
			// 실패 횟수 초기화 및 잠금 해제
			customUserDetailService.resetFailedAttempts(username);
			logger.info("User '{}' entered default password (1111). Lock is cleared on failure.", username);

			response.sendRedirect("/changePassword/" + username);
			return;
		}

		try {
			customUserDetailService.increaseFailedAttempts(username);
		} catch (UsernameNotFoundException e) {
			logger.warn("Login attempt for non-existent user '{}'.", username);
		}

		int attempts = customUserDetailService.getFailedAttempts(username);
		boolean locked = customUserDetailService.isAccountLocked(username);

		if (locked) {
			logger.warn("User '{}' is locked after {} failed login attempts.", username, attempts);
			response.sendRedirect("/?error=locked");
			return;
		}

		response.sendRedirect("/?error=true");
	}

//	private final CustomUserDetailService customUserDetailService;
//	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);
//
//	public CustomAuthenticationFailureHandler(CustomUserDetailService customUserDetailService) {
//		this.customUserDetailService = customUserDetailService;
//	}
//
//	@Override
//	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
//										AuthenticationException exception) throws IOException, ServletException {
//		String username = request.getParameter("username");
//
//		try {
//			// 사용자 정보 로드
//			CustomUserDetails userDetails = (CustomUserDetails) customUserDetailService.loadUserByUsername(username);
//
//			// 실패 횟수 증가
//			customUserDetailService.increaseFailedAttempts(userDetails);
//
//			// 로그 추가
//			logger.info("Login failed for user '{}'. Failed attempts: {}", username, userDetails.getFailedAttempts());
//
//			// 계정 잠금 처리 확인
//			if (userDetails.isAccountLocked()) {
//				logger.warn("User '{}' is locked due to too many failed login attempts.", username);
//				response.sendRedirect("/?error=locked");
//				return;
//			}
//		} catch (UsernameNotFoundException e) {
//			// 사용자 계정이 없을 경우 처리
//			logger.error("Failed login attempt for non-existing user: {}", username);
//		}
//
//		// 기본 실패 메시지 전달
//		response.sendRedirect("/?error=true");
//	}

//	private final CustomUserDetailService customUserDetailService;
//
//	public CustomAuthenticationFailureHandler(CustomUserDetailService customUserDetailService) {
//		this.customUserDetailService = customUserDetailService;
//	}
//
//	@Override
//	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
//										AuthenticationException exception) throws IOException, ServletException {
//		String username = request.getParameter("username");
//
//		try {
//			// 사용자 정보 로드
//			CustomUserDetails userDetails = (CustomUserDetails) customUserDetailService.loadUserByUsername(username);
//
//			// 실패 횟수 증가
//			int failedAttempts = userDetails.getFailedAttempts() + 1;
//			userDetails.setFailedAttempts(failedAttempts);
//
//			// 계정 잠금 처리
//			if (failedAttempts >= 3) {
//				userDetails.setAccountLocked(true);
//				response.sendRedirect("/?error=locked"); // 계정 잠금 메시지 전달
//				return;
//			}
//		} catch (UsernameNotFoundException e) {
//			// 사용자 계정이 없을 경우 처리 (로그에 기록하거나 무시 가능)
//			System.out.println("Failed login attempt for non-existing user: " + username);
//		}
//
//		// 로그인 실패 처리
//		response.sendRedirect("/?error=true"); // 기본 실패 메시지 전달
//	}
}


