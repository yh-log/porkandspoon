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
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		
		if ("1111".equals(password)) {
            // 비밀번호가 1111이면 특정 페이지로 강제 이동
            response.sendRedirect("/changePassword/" + username);
        } else {
            // 기본 성공 페이지로 이동
            response.sendRedirect("/loginTestView");
        }

	}
	

}
