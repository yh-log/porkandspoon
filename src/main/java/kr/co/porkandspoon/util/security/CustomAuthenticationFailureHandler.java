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

//		if ("1111".equals(rawPassword)) {
//			// 실패 횟수 초기화 및 잠금 해제
//			customUserDetailService.resetFailedAttempts(username);
//			logger.info("User '{}' entered default password (1111). Lock is cleared on failure.", username);
//
//			response.sendRedirect("/changePassword/" + username);
//			return;
//		}

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

}


