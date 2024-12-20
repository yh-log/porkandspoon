package kr.co.porkandspoon.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import kr.co.porkandspoon.dto.ResponseDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.UserService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class UserController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
    @Value("${spring.mail.username}") private String emailId;

    @Value("${spring.mail.password}") private String emailPw;
	
	@Autowired private TemplateEngine templateEngine;
	
	@Autowired UserService userService;
	
	@Autowired PasswordEncoder encoder;
	
	final String host = "192.168.189.195";
	
	String authenticationCode = ""; 
	String userId = "";
	
	/**
	 * author yh.kim (24.12.18) 
	 * 직원 리스트 이동
	 */
	@GetMapping(value="/ad/user/list")
	public ModelAndView userListView() {
		return new ModelAndView("/user/userList");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 부서 리스트 이동
	 */
	@GetMapping(value="/ad/dept/list")
	public ModelAndView deptListView() {
		return new ModelAndView("/user/deptList");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 인사이동 리스트 이동
	 */
	@GetMapping(value="/ad/employeeTransfer")
	public ModelAndView employeeTransferView() {
		return new ModelAndView("/user/employeeTransfer");
	}

	/**
	 * author yh.kim (24.12.18) 
	 * 직원 등록 페이지 이동
	 */
	@GetMapping(value="/ad/user/write")
	public ModelAndView userWriteView() {
		return new ModelAndView("/user/userWrite");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 직원 상세 페이지 이동
	 */
	@GetMapping(value="/ad/user/detail")
	public ModelAndView userDetailView() {
		return new ModelAndView("/user/userDetail");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직원 수정 페이지 이동
	 */
	@GetMapping(value="/ad/user/update")
	public ModelAndView userUpdateView() {
		return new ModelAndView("/user/userUpdate");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 아이디 찾기 페이지 이동
	 */
	@GetMapping(value="/findUserId")
	public ModelAndView findUserIdView() {
		return new ModelAndView("/login/findUserId");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 비밀번호 찾기 페이지 이동
	 */
	@GetMapping(value="/findPassword")
	public ModelAndView findPasswordView() {
		return new ModelAndView("/login/findPassword");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 비밀번호 변경 페이지 이동
	 */
	@GetMapping(value="/changePassword")
	public ModelAndView changePasswordView() {
		return new ModelAndView("/login/changePassword");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 아이디 제공 페이지 이동
	 */
	@GetMapping(value="/displayUserId")
	public ModelAndView displayUserIdView() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("username", userId);
		mav.setViewName("/login/displayUserId");
		return mav;
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 부서 상세 페이지 이동
	 */
	@GetMapping(value="/ad/dept/detail")
	public ModelAndView deptDetailView() {
		return new ModelAndView("/user/deptDetail");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 부서 등록 페이지 이동
	 */
	@GetMapping(value="/ad/dept/write")
	public ModelAndView deptWriteView() {
		return new ModelAndView("/user/deptWrite");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 부서 수정 페이지 이동
	 */
	@GetMapping(value="/ad/dept/update")
	public ModelAndView deptUpdateView() {
		return new ModelAndView("/user/deptUpdate");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직영점 작성 페이지 이동
	 */
	@GetMapping(value="/ad/store/write")
	public ModelAndView storeWriteView() {
		return new ModelAndView("/user/storeWrite");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직영점 수정 페이지 이동
	 */
	@GetMapping(value="/ad/store/update")
	public ModelAndView storeUpdateView() {
		return new ModelAndView("/user/storeUpdate");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직영점 상세 페이지 이동
	 */
	@GetMapping(value="/ad/store/detail")
	public ModelAndView storeDetailView() {
		return new ModelAndView("/user/storeDetail");
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 메일 발송 기능
	 */
	@PostMapping(value="/sendMail")
    public ResponseDTO sendMail(@ModelAttribute UserDTO params) {
		
    	
    	// 클라이언트로 부터 받아온 값 사용
    	userId = userService.findUserId(params);
    	
    	if(!userId.equals("notFound")) {
    		String receiverId = params.getEmail();
    		String subject = "포크앤스푼 인증코드 발송"; // 제목
    		String authCode = randomAuthenticationCode(); // 인증코드
    		
    		Properties props = new Properties();
    		props.put("mail.smtp.host", "smtp.gmail.com");
    		props.put("mail.smtp.port", "465");
    		props.put("mail.smtp.auth", "true");
    		props.put("mail.smtp.ssl.enable", "true");
    		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
    		
    		Session session = Session.getInstance(props, new Authenticator() {
    			protected PasswordAuthentication getPasswordAuthentication() {
    				return new PasswordAuthentication(emailId, emailPw);
    			}
    		});
    		
    		// Thymeleaf Context 객체 생성 (컨테이너 역할)
    		Context context = new Context();
    		// html 템플릿에서 ${authCode} 로 접근 (동적으로 값 전달)
    		context.setVariable("authCode", authCode);
    		// 템플릿과 context 결합 (process)
    		String emailContent = templateEngine.process("template", context);
    		
    		MimeMessage message = new MimeMessage(session);
    		try {
    			message.setFrom(new InternetAddress(emailId));
    			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverId));
    			message.setSubject(subject);
    			message.setContent(emailContent, "text/html; charset=utf-8"); // 메일 content
    			
    			Transport.send(message);
    			
    			params.setStatus(200);
        		params.setMessage("이메일 전송 성공했습니다.");
    			
    		} catch (MessagingException e) {
    			e.printStackTrace();
    			logger.info("이메일 전송 실패");
    			params.setStatus(500);
    			params.setMessage("이메일 전송 실패했습니다.");
    		}
    	}else {
    		params.setStatus(400);
    		params.setMessage("존재하지 않은 직원입니다.");
    	}
    	return params;
    }
	
    /**
     * author yh.kim (24.12.19) 
     * 랜덤 인증 코드 생성 (숫자 6자리)
     */
	public String randomAuthenticationCode() {
		Random random = new Random();
		int randomNum = 0;
		
		// 기존 내용이 있다면 초기화
		if(authenticationCode.length() > 0) {
			authenticationCode = "";
		}

		for(int i = 0; i < 6; i++) {
			randomNum = random.nextInt(10);
			authenticationCode += Integer.toString(randomNum);
		}
		logger.info("발송 코드  ==> " + authenticationCode);
		return authenticationCode;
	}
	
	/**
	 * author yh.kim (24.12.20) 
	 * 사용자 아이디 조회
	 * 인증코드와 사용자 입력 코드를 비교해 동일할 경우 아이디 리턴
	 */
	@PostMapping(value="/chackAuthCode")
	public UserDTO chackAuthCode(@ModelAttribute UserDTO params){
		
		logger.info(CommonUtil.toString(params));
		
		String code = params.getAuthentication();
		
		// 아이디 찾기의 경우
		if(code.equals(authenticationCode)) {
			//userId = userService.findUserId(params);
			logger.info(CommonUtil.toString(params));
			
			if(!userId.equals(params.getUsername())) {
				params.setUsername(userId);
				params.setStatus(201);
				params.setMessage("입력 정보와 일치하는 아이디입니다.");
			}
			// 비밀번호 변경의 경우
			if(userId.equals(params.getUsername())) {
				logger.info(CommonUtil.toString(params));
				params.setStatus(202);
				params.setMessage("비밀번호 변경 페이지로 이동합니다.");
			}
			
		}else {
			logger.info("불일치합니다");
		}
		
		return params;
	}
	
	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	@PutMapping(value="/changePassword")
	public UserDTO changePassword(@ModelAttribute UserDTO params) {
		
		String hash = encoder.encode(params.getPassword());
		params.setPassword(hash);
		params.setUsername(userId);
		if(userService.changePassword(params)) {
			params.setStatus(205);
			params.setMessage("비밀번호 변경이 완료되었습니다.");
		}
		
		return params;
	}
}
