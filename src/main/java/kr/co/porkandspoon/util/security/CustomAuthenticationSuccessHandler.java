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

//	private final CustomUserDetailService customUserDetailService;
//	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);
//
//	public CustomAuthenticationSuccessHandler(CustomUserDetailService customUserDetailService) {
//		this.customUserDetailService = customUserDetailService;
//	}
//
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//										Authentication authentication) throws IOException, ServletException {
//		String username = authentication.getName();
//
//		// 로그인 성공 시 실패 횟수 초기화
//		customUserDetailService.resetFailedAttempts(username);
//
//		logger.info("User '{}' logged in successfully. Failed attempts reset.", username);
//		response.sendRedirect("/loginTestView");
//	}

//	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);
//
//	private final CustomUserDetailService customUserDetailService;
//
//	public CustomAuthenticationSuccessHandler(CustomUserDetailService customUserDetailService) {
//		this.customUserDetailService = customUserDetailService;
//	}
//
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//										Authentication authentication) throws IOException, ServletException {
//		// CustomUserDetails를 통해 사용자 정보 가져오기
//		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
//
//		// 인증된 사용자의 비밀번호 가져오기 (암호화된 상태)
//		String encryptedPassword = userDetails.getPassword();
//
//		// 클라이언트로부터 입력받은 비밀번호 가져오기
//		String rawPassword = request.getParameter("password");
//
//		// 사용자 정보를 세션에 저장하거나 다른 작업 수행
//		request.getSession().setAttribute("userName", userDetails.getName());
//		request.getSession().setAttribute("userRole", userDetails.getAuthorities());
//
//		// 디버깅용 출력
//		System.out.println("Authenticated User: " + userDetails.getUsername());
//		System.out.println("Authorities: " + userDetails.getAuthorities());


//		// 비밀번호 검증 로직 추가 (1111인지 확인)
//		if ("1111".equals(rawPassword)) {
//			// 실패 횟수 초기화와 잠금 해제 로직을 서비스로 이동
//			customUserDetailService.resetFailedAttempts(userDetails);
//			// 비밀번호가 1111이면 특정 페이지로 강제 이동
//			response.sendRedirect("/changePassword/" + userDetails.getUsername());
//		} else {
//
//			// 실패 횟수 초기화 (비밀번호가 1111이 아닌 경우)
//			customUserDetailService.resetFailedAttempts(userDetails);
//			// 기본 성공 페이지로 이동
//			response.sendRedirect("/loginTestView");
//		}
//	}
//
//		if ("1111".equals(rawPassword)) {
//			customUserDetailService.resetFailedAttempts(userDetails);
//			logger.info("User '{}' reset failed attempts after entering default password.", userDetails.getUsername());
//			response.sendRedirect("/changePassword/" + userDetails.getUsername());
//			return;
//		}
//
//		customUserDetailService.resetFailedAttempts(userDetails);
//		logger.info("User '{}' logged in successfully. Failed attempts reset.", userDetails.getUsername());
//		response.sendRedirect("/loginTestView");
//	}
	

}
