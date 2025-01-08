package kr.co.porkandspoon.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import kr.co.porkandspoon.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	/**
	 * author yh.kim (24.12.18) 
	 * 직원 리스트 조회
	 */
	@GetMapping(value="/ad/user/list")
	public List<UserDTO> userList(@ModelAttribute PagingDTO pagingDTO) {

		logger.info(CommonUtil.toString(pagingDTO));

		List<UserDTO> dtoList = userService.userList(pagingDTO);

		return dtoList;
	}

	/**
	 * author yh.kim (24.12.18) 
	 * 직원 리스트 페이지 이동
	 */
	@GetMapping(value="/ad/user/listView")
	public ModelAndView userListView() {

		return new ModelAndView("/user/userList");
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
	@GetMapping(value="/ad/user/writeView")
	public ModelAndView userWriteView() {

		return new ModelAndView("/user/userWrite");
	}
	
	/**
	 * author yh.kim (24.12.18) 
	 * 직원 상세 페이지 이동
	 */
	@GetMapping(value="/ad/user/detailView/{username}")
	public ModelAndView userDetailView(@PathVariable String username) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("username", username);
		mav.setViewName("/user/userDetail");
		
		return mav;
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 직원 수정 페이지 이동
	 */
	@GetMapping(value="/ad/user/update/{username}")
	public ModelAndView userUpdateView(@PathVariable String username) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("username", username);
		mav.setViewName("/user/userUpdate");
		
		return mav;
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
	@GetMapping(value="/changePassword/{username}")
	public ModelAndView changePasswordView(@PathVariable String username) {
		
		logger.info("username => " + username);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("username", username);
		mav.setViewName("/login/changePassword");
		
		return mav;
	}
	
	/**
	 * author yh.kim (24.12.19) 
	 * 아이디 제공 페이지 이동
	 */
	@GetMapping(value="/displayUserId/{username}")
	public ModelAndView displayUserIdView(@PathVariable String username) {
		
		logger.info("username => " + username);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login/displayUserId");
		mav.addObject("username", username);
		return mav;
	}
	
	/**
	 * author yh.kim (24.12.22) 
	 * 사용자 체크 및 메일 발송 메서드
	 * 사용자 체크 → 인증번호 생성 → 메일 발송
	 */
	@PostMapping(value="/sendMail")
	public UserDTO userCheck(@ModelAttribute UserDTO dto) {
		
		logger.info("인증메일 발송 요청 => " + CommonUtil.toString(dto));
		String username ="";
		
		if(dto.getType().equals("id")) {
			// 아이디 찾기 시 사용자 검증
			username = userService.findUserId(dto);
		}else {
			// 비밀번호 찾기 시 사용자 검증
			username = userService.findUserPw(dto);
		}
		
		// 예외일 경우 체크 (직원 정보가 없을 경우 리턴)
		if(username.equals("notFound")) {
			dto.setStatus(404);
			dto.setMessage("존재하지 않는 정보입니다.");
			return dto;
		}
		
		dto.setUsername(username);
		// 직원 정보가 있을 경우 랜덤 코드 생성
		Map<String, Object> authCodeMap = randomAuthenticationCode(dto);
		
		dto.setAuthentication((String) authCodeMap.get("authenticationCode"));
		
		// 생성한 코드로 메일 전송
		sendMail(dto);
		dto.setIdx((int) authCodeMap.get("codeIdx"));
		dto.setStatus(100);
		dto.setMessage("인증번호 발송을 완료했습니다.");
		
		return dto;
	}

	/**
	 * author yh.kim (24.12.22)
	 * 인증 코드 생성 메서드
	 */
	public Map<String, Object> randomAuthenticationCode(UserDTO dto) {
		
		logger.info("인증코드 생성");
		
		Random random = new Random();
		int randomNum = 0;
		
		String authenticationCode = "";
		
		// 랜덤 6자리 숫자 생성
		for (int i = 0; i < 6; i++) {
			randomNum = random.nextInt(10);
			authenticationCode += Integer.toString(randomNum);
		}
		
		dto.setAuthentication(authenticationCode);
		
		int codeIdx = userService.randomAuthenticationCode(dto);
		
		Map<String, Object> authCode = new HashMap<>();
		authCode.put("codeIdx", codeIdx);
		authCode.put("authenticationCode", authenticationCode);
		
		return authCode;
	}
	
	/**
	 * author yh.kim (24.12.22)
	 * 메일 발송 메서드
	 */
	private void sendMail(UserDTO dto) {
		
		logger.info("메일 발송");
		
		String receiverId = dto.getEmail();
		String subject = "포크앤스푼 인증코드입니다.";
		String authCode = dto.getAuthentication();
		
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
			
		} catch (MessagingException e) {
			e.printStackTrace();
			logger.info("이메일 전송 실패");
		}
		
	}
	
	/**
	 * author yh.kim (24.12.22)
	 * 인증코드 검증 메서드
	 */
	@PostMapping(value="/chackAuthCode")
	public UserDTO chackAuthCode(@ModelAttribute UserDTO dto) {
		
		logger.info("인증 코드 검증 dto => " + CommonUtil.toString(dto));
		
		if(userService.chackAuthCode(dto)) {
			dto.setStatus(200);
			dto.setMessage("인증 번호 확인 완료 아이디 제공 페이지로 이동");
			if(dto.getType().equals("pw")) {
				dto.setStatus(202);
				dto.setMessage("인증 번호 확인 완료 비밀번호 변경 페이지로 이동");
				logger.info("리턴할 dto => " + CommonUtil.toString(dto));
			
			}
			
		}else {
			dto.setStatus(400);
			dto.setMessage("잘못된 인증번호를 입력했습니다.");
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.22)
	 * 인증번호 생성 후 2분 경과 시 실행 메서드
	 */
	@PutMapping(value="/timeoutAction")
	public void timeoutAction(@ModelAttribute UserDTO dto) {
		
		logger.info("시간 초과됨 => "+CommonUtil.toString(dto));
		userService.timeoutAction(dto);
	}
	
	/**
	 * author yh.kim (24.12.22)
	 * 비밀번호 변경 메서드
	 */
	@PutMapping(value="/changePassword")
	public UserDTO changePassword(@ModelAttribute UserDTO dto) {
		
		logger.info(CommonUtil.toString(dto));
		String hash = encoder.encode(dto.getPassword());
		dto.setPassword(hash);
		if(userService.changePassword(dto)) {
			dto.setStatus(205);
			dto.setMessage("비밀번호 변경이 완료되었습니다.");
		}else {
			dto.setStatus(400);
			dto.setMessage("비밀번호 변경이 실패했습니다.");
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.23)
	 * 직원 아이디 중복 체크
	 */
	@GetMapping(value="/ad/user/overlay")
	public UserDTO usernameOverlay(@ModelAttribute UserDTO dto) {
		
		logger.info(CommonUtil.toString(dto));
		
		// null 일 경우 체크
		if(dto.getUsername() == null || dto.getUsername().equals("")) {
			dto.setStatus(400);
			dto.setMessage("아이디를 입력하지 않았습니다.");
			return dto;
		}
		
		if(userService.usernameOverlay(dto)) {
			dto.setStatus(200);
			dto.setMessage("사용 가능한 아이디 입니다.");
		}else {
			dto.setStatus(400);
			dto.setMessage("사용중인 아이디 입니다.");
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.23)
	 * 부서 리스트 조회
	 */
	@GetMapping(value="/ad/dept/list")
	public List<DeptDTO> deptList() {

		List<DeptDTO> deptList = userService.deptList();
		
		return deptList;
	}
	
	/**
	 * author yh.kim (24.12.23)
	 * 직원 등록 메서드
	 */
	@PostMapping(value="/ad/user/write")
	public UserDTO userWrite(@ModelAttribute UserDTO dto,
							 @RequestParam("careerStr") String careerStr,
							 @RequestPart(value = "file", required = false) MultipartFile file) {

		logger.info(CommonUtil.toString(dto));
		logger.info(CommonUtil.toString(careerStr));
		logger.info(file.getOriginalFilename());
		
		 UserDTO result = new UserDTO();
		
		try {
		    ObjectMapper objectMapper = new ObjectMapper();

		    // Map 형태로 변환
		    Map<String, List<CareerDTO>> careerMap = objectMapper.readValue(careerStr, new TypeReference<Map<String, List<CareerDTO>>>() {});
		    
		    // "career" 키의 리스트를 추출
		    List<CareerDTO> careerList = careerMap.get("career");

		    // DTO에 설정
		    dto.setCareer(careerList);
		    
		    // 로그 확인을 위함
		    careerList.forEach(career -> {
		        try {
		            String json = objectMapper.writeValueAsString(career);
		            logger.info("CareerDTO as JSON: " + json);
		        } catch (Exception e) {
		            logger.error("Error converting CareerDTO to JSON", e);
		        }
		    });
		    

		    logger.info("파싱된 DTO => " + CommonUtil.toString(dto));
		    
		    String hash = encoder.encode("1111");
			dto.setPassword(hash);
		    
		    result = userService.userWrite(dto, file);
		    logger.info("직원 등록 결과 => " + result);
		    
		} catch (JsonMappingException e) {
		    logger.error("JsonMappingException 예외 발생", e);
		    e.printStackTrace();
		} catch (JsonProcessingException e) {
		    logger.error("JsonProcessingException 예외 발생", e);
		    e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 조회 (수정 페이지)
	 */
	@PostMapping(value="/ad/user/detail/{username}")
	public UserDTO userDetail(@PathVariable String username) {
		
		logger.info("조회 하는 username => " + username);
		UserDTO dto = new UserDTO();
		dto.setType("D");
		
		if(username == null || username.equals("")) {
			dto.setStatus(404);
			dto.setMessage("직원 아이디가 존재하지 않습니다.");
			return dto;
		}
		
		dto = userService.userDetail(username);
		
		if(dto == null) {
			dto.setStatus(501);
			dto.setMessage("직원 정보를 불러오지 못했습니다.");
			return dto;
		}
		
		dto.setStatus(202);
		dto.setMessage("직원 정보를 불러오는데 성공했습니다.");
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 수정 
	 */
	@PutMapping(value="/ad/user/update")
	public UserDTO userUpdate(@ModelAttribute UserDTO dto,
			 @RequestParam("careerStr") String careerStr,
			 @RequestPart(value = "file", required = false) MultipartFile file) {
		
			logger.info(CommonUtil.toString(dto));
			logger.info(CommonUtil.toString(careerStr));
			logger.info(file.getOriginalFilename());
			
			UserDTO result = new UserDTO();
		
			try {
				ObjectMapper obj = new ObjectMapper();
				Map<String, List<CareerDTO>> careerMap = obj.readValue(careerStr, new TypeReference<Map<String, List<CareerDTO>>>() {});
				// "career" 키의 리스트를 추출
				List<CareerDTO> careerList = careerMap.get("career");
				
				// DTO에 설정
				dto.setCareer(careerList);
				
				result = userService.userUpdate(dto, file);
			    logger.info("직원 업데이트 결과 => " + result);
			    
			} catch (JsonMappingException e) {
				logger.error("JsonMappingException 예외 발생", e);
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				logger.error("JsonProcessingException 예외 발생", e);
				e.printStackTrace();
			}
			
		return result;
	}
	

	
	/**
	 * author yh.kim (24.12.25)
	 * 부서 등록 (작성)
	 */
	@PostMapping(value="/ad/dept/write")
	public DeptDTO deptWrite(MultipartFile file, @ModelAttribute DeptDTO dto,
			@RequestParam("imgsJson") String imgsJson) {


		logger.info(CommonUtil.toString(dto));
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;

		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));

			dto.setImgs(imgs);
			dto = userService.deptWrite(file, dto);

		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}

		return dto;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 부서 수정
	 */
	@PostMapping(value="/ad/dept/update")
	public DeptDTO deptUpdate(MultipartFile file, @ModelAttribute DeptDTO dto,
			@RequestParam("imgsJson") String imgsJson) {
		
		logger.info(CommonUtil.toString(dto));
		logger.info(CommonUtil.toString(file));
		logger.info(CommonUtil.toString(imgsJson));
		
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		
		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			
			dto.setImgs(imgs);
			dto = userService.deptUpdate(file, dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 리스트 조회
	 */
	@GetMapping(value="/ma/dept/getList")
	public List<DeptDTO> deptGetList(
			@RequestParam(value = "page", defaultValue = "1") int page, 
	        @RequestParam(value = "cnt", defaultValue = "10") int cnt,
	        @RequestParam(defaultValue = "", value = "option") String option,
	        @RequestParam(defaultValue = "", value="keyword") String keyword) {
		
		logger.info(keyword);
		logger.info(option);
		
		List<DeptDTO> dto = userService.deptGetList(page, cnt, option, keyword);
		
		for (DeptDTO deptDTO : dto) {
			String type = "B";
			deptDTO.setType(type);
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 생성 요청 리스트 조회
	 */
	@GetMapping(value="/ad/dept/createList")
	public List<ApprovalDTO> deptCreateList(@ModelAttribute PagingDTO pagingDTO) {
		
		List<ApprovalDTO> dto = userService.deptCreateList(pagingDTO);
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 삭제 요청 리스트 조회
	 */
	@GetMapping(value="/ad/dept/deleteList")
	public List<ApprovalDTO> deptDeleteList(@ModelAttribute PagingDTO pagingDTO) {
		
		List<ApprovalDTO> dto = userService.deptDeleteList(pagingDTO);
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.27)
	 * 직영점 등록
	 */
	@PostMapping(value="/ad/store/write")
	public DeptDTO storeWrite(@ModelAttribute DeptDTO dto,
			@RequestParam("imgsJson") String imgsJson) {
		
		logger.info(CommonUtil.toString(dto));
		logger.info(CommonUtil.toString(imgsJson));
		
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		
		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			
			dto.setImgs(imgs);
			dto = userService.storeWrite(dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	/**
	 * author yh.kim (24.12.27)
	 * 직영점 수정
	 */
	@PostMapping(value="/ad/store/update")
	public DeptDTO storeUpdate(@ModelAttribute DeptDTO dto,
			@RequestParam("imgsJson") String imgsJson) {
		logger.info(CommonUtil.toString(dto));
		logger.info(CommonUtil.toString(imgsJson));
		
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		
		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			
			dto.setImgs(imgs);
			dto = userService.storeUpdate(dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim (24.12.28)
	 * 직원 비밀번호 초기화
	 */
	@GetMapping(value="/ad/user/passwordReset")
	public boolean passwordReset(@ModelAttribute UserDTO dto) {
		
		logger.info("받아온 값 " + dto);
		
		if(dto == null) {
			return false;
		}
		
		dto.setPassword("1111");
		boolean result = userService.changePassword(dto);
		
		return result;
	}
	
	/**
	 * author yh.kim (24.12.29)
	 * 직영점 리스트 페이지 이동
	 */
	@GetMapping(value="/ma/store/list")
	public ModelAndView storeListView() {
		return new ModelAndView("/user/storeList");
	}
	
	/**
	 * author yh.kim (24.12.28)
	 * 직영점 리스트
	 */
	@GetMapping(value="/ma/store/getList")
	public List<DeptDTO> storeList(@ModelAttribute PagingDTO pagingDTO){
		
		System.out.println("실행됨?");
		
		List<DeptDTO> storeList = userService.storeList(pagingDTO);
		
		System.out.println(CommonUtil.toString(storeList));
		
		// Null 체크 및 빈 리스트 반환 방지
        if (storeList == null) {
            storeList = new ArrayList<>();
        }
		
     // 리스트의 각 요소 처리
		
		 for (DeptDTO deptDTO : storeList) { if (deptDTO != null) { String type = "S";
		 deptDTO.setType(type); } }
		 
		return storeList;
	}
	
	
	/**
	 * author yh.kim (24.12.29)
	 * 직영점 생성 요청 리스트 
	 */
	@GetMapping(value="/ad/store/createList")
	public List<ApprovalDTO> ceateStoreList(@ModelAttribute PagingDTO pagingDTO){
		
		System.out.println("실행됨? 신청 리스트임!! ");
		List<ApprovalDTO> storeList = userService.ceateStoreList(pagingDTO);
		
		return storeList;
	}
	
	/**
	 * author yh.kim (24.12.29)
	 * 직영점 폐점 요청 리스트
	 */
	@GetMapping(value="/ad/store/deleteList")
	public List<ApprovalDTO> deleteStoreList(@ModelAttribute PagingDTO pagingDTO){
		
		System.out.println("실행됨? 신청 리스트임!! ");
		List<ApprovalDTO> storeList = userService.deleteStoreList(pagingDTO);
		
		return storeList;
	}
	
	/**
	 * author yh.kim (24.12.31)
	 * 인사이동 리스트 조회
	 */
	@GetMapping(value="/ad/employeeTransferList")
	public List<UserDTO> employeeTransferList(
			@RequestParam(value = "page", defaultValue = "1") int page, 
	        @RequestParam(value = "cnt", defaultValue = "10") int cnt,
	        @RequestParam(defaultValue = "", value = "option") String option,
	        @RequestParam(defaultValue = "", value="keyword") String keyword,
	        @RequestParam(defaultValue = "", value ="start_date" ) String start_date,
	        @RequestParam(defaultValue = "", value = "end_date") String end_date){
		
		List<UserDTO> result = userService.employeeTransferList(page, cnt, option, keyword, start_date, end_date);
		
		return result;
	}

	/**
	 * author yh.ki, (25.1.1)
	 * 직영점 이동 리스트 조회
	 */
	@GetMapping(value="/ad/storeTransferList")
	public List<UserDTO> storeTransferList(
		@RequestParam(value = "page", defaultValue = "1") int page, 
	        @RequestParam(value = "cnt", defaultValue = "10") int cnt,
	        @RequestParam(defaultValue = "", value = "option") String option,
	        @RequestParam(defaultValue = "", value="keyword") String keyword,
	        @RequestParam(defaultValue = "", value ="start_date" ) String start_date,
	        @RequestParam(defaultValue = "", value = "end_date") String end_date){
		
		List<UserDTO> result = userService.storeTransferList(page, cnt, option, keyword, start_date, end_date);

		return result;
	}
	
	/**
	 * author yh.ki, (25.1.1)
	 * 미발령 직원 리스트 조회
	 */
	@GetMapping(value="/ad/notTransferList")
	public List<UserDTO> notTransferList(
		@RequestParam(value = "page", defaultValue = "1") int page, 
	        @RequestParam(value = "cnt", defaultValue = "10") int cnt,
	        @RequestParam(defaultValue = "", value = "option") String option,
	        @RequestParam(defaultValue = "", value="keyword") String keyword){
		
		List<UserDTO> result = userService.notTransferList(page, cnt, option, keyword);

		return result;
	}
	
	/**
	 * author yh.kim, (25.01.02)
	 * 인사이동 부서 및 직급 리스트 조회
	 */
	@GetMapping(value="/ad/userTransferInfo")
	public List<UserDTO> userTransferInfo(@RequestParam String selectedId){
		
		logger.info(selectedId);
		
		List<UserDTO> result = userService.userTransferInfo(selectedId);
		
		return result;
	}
	
	/**
	 * author yh.kim, (25.01.02)
	 * 직원 인사이동 
	 */
	// @ModelAttribute는 단일 객체를 바인딩하기 위해 설계
	@PutMapping(value="/ad/setEmployeeTransfer")
	public UserDTO setEmployeeTransfer(@RequestBody List<UserDTO> userDto) {
		logger.info(CommonUtil.toString(userDto));
		
		UserDTO dto = new UserDTO();

		boolean result = userService.setEmployeeTransfer(userDto);
		
		if(result) {
			dto.setStatus(200);
			dto.setMessage("인사이동이 완료되었습니다.");
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim, (25.01.02)
	 * 직영점 인사이동
	 */
	@PutMapping(value="/ad/setStoreTransfer")
	public UserDTO setStoreTransfer(@RequestBody List<UserDTO> userDto) {
		
		logger.info("컨트롤러 => " + CommonUtil.toString(userDto));
		
		boolean result = userService.setStoreTransfer(userDto);
		
		UserDTO dto = new UserDTO();
		
		if(result) {
			dto.setStatus(200);
			dto.setMessage("인사이동이 완료되었습니다.");
		}
		
		return dto;
	}
	
	/**
	 * author yh.kim, (25.01.02)
	 * 직원 퇴사 처리 
	 */
	@DeleteMapping(value="/ad/userQuitDelete")
	public UserDTO usrQuitDelete(@RequestBody List<UserDTO> userDto){
		logger.info(CommonUtil.toString(userDto));
		
		boolean result = userService.usrQuitDelete(userDto);
		
		UserDTO dto = new UserDTO();
		
		if(result) {
			dto.setStatus(200);
			dto.setMessage("인사이동이 완료되었습니다.");
		}
		
		return dto;
		
	}
	
	/**
	 * author yh.kim, (25.01.02)
	 * 직영점 이동 시 직영점 name 조회
	 */
	@GetMapping(value="/ad/storeTransferInfo")
	public List<DeptDTO> storeTransferInfo(@RequestParam String selectedId){
		
		logger.info(selectedId);
		
		List<DeptDTO> result = userService.storeTransferInfo(selectedId);
		
		return result;
	}
}
