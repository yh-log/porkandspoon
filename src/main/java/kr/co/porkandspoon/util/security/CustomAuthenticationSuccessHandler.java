package kr.co.porkandspoon.util.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private final CustomUserDetailService customUserDetailService;

	@Lazy
	@Autowired
	private PasswordEncoder passwordEncoder; // 필드 주입

	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);

	public CustomAuthenticationSuccessHandler(CustomUserDetailService customUserDetailService) {
		this.customUserDetailService = customUserDetailService;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws IOException, ServletException {
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		String username = userDetails.getUsername();
		String rawPassword = request.getParameter("password"); // 사용자가 입력한 비밀번호
		String encryptedPassword = userDetails.getPassword(); // DB에 저장된 암호화된 비밀번호

		// 비밀번호가 "1111"인지 확인
		if (passwordEncoder.matches("1111", encryptedPassword)) {
			// 실패 횟수 초기화
			customUserDetailService.resetFailedAttempts(username);

			// 로그 출력
			logger.info("User '{}' entered default password (1111). Redirecting to change password page.", username);

			// 비밀번호 변경 페이지로 리다이렉트
			response.sendRedirect("/changePassword/" + username);
			return;
		}

		// 비밀번호가 "1111"이 아닌 경우: 실패 횟수 초기화
		customUserDetailService.resetFailedAttempts(username);

		// 로그 출력
		logger.info("User '{}' logged in successfully. Failed attempts reset.", username);

		// 기본 성공 페이지로 이동
		response.sendRedirect("/loginTestView");
	}
	

}
