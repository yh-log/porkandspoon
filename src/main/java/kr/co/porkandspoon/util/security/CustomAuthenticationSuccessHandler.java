package kr.co.porkandspoon.util.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws IOException, ServletException {
		// CustomUserDetails를 통해 사용자 정보 가져오기
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();

		// 인증된 사용자의 비밀번호 가져오기 (암호화된 상태)
		String encryptedPassword = userDetails.getPassword();

		// 클라이언트로부터 입력받은 비밀번호 가져오기
		String rawPassword = request.getParameter("password");

		// 사용자 정보를 세션에 저장하거나 다른 작업 수행
		request.getSession().setAttribute("userName", userDetails.getName());
		request.getSession().setAttribute("userRole", userDetails.getAuthorities());

		// 디버깅용 출력
		System.out.println("Authenticated User: " + userDetails.getUsername());
		System.out.println("Authorities: " + userDetails.getAuthorities());


		// 비밀번호 검증 로직 추가 (1111인지 확인)
		if ("1111".equals(rawPassword)) {
			// 비밀번호가 1111이면 특정 페이지로 강제 이동
			response.sendRedirect("/changePassword/" + userDetails.getUsername());
		} else {
			// 기본 성공 페이지로 이동
			response.sendRedirect("/loginTestView");
		}
	}
	

}
