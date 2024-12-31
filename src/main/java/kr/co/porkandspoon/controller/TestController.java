package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.TestService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class TestController {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	// pw 암호화, 복호화 시 사용
	@Autowired PasswordEncoder encoder;
	
	@Autowired TestService service;
	
	@Value("${upload.path}") private String paths;
	
	// 메인(로그인) 페이지 및 util 기능 사용 예시
	@RequestMapping(value="/")
	public ModelAndView main() {
		String dateString = CommonUtil.formatDate("2022-11-06", "yyyy-MM-dd", "MM/dd/yy");
		System.out.println("날짜 == " + dateString);
		
		String localDate = CommonUtil.formatDateTime(LocalDateTime.now(), "yyyy-mm-dd HH:mm:ss");
		System.out.println("시간 날짜 == " + localDate);
		
		String currentDate = CommonUtil.gerCurrentDateTime("yy/MM/dd HH");
		System.out.println("현재 일시 == " + currentDate);
		
		System.out.println("===================================================================================");
		
		System.out.println(CommonUtil.toString("Hello")); // "Hello"
        System.out.println(CommonUtil.toString(123)); // "123"
        System.out.println(CommonUtil.toString(true)); // "true"

        // 배열
        int[] intArray = {1, 2, 3};
        System.out.println(CommonUtil.toString(intArray)); // "[1, 2, 3]"

        // List
        List<String> list = Arrays.asList("A", "B", "C");
        System.out.println(CommonUtil.toString(list)); // "[A, B, C]"

        // Map
        Map<String, Integer> map = new HashMap<>();
        map.put("One", 1);
        map.put("Two", 2);
        System.out.println(CommonUtil.toString(map)); // "{One : 1, Two : 2}"

        // 혼합된 구조
        List<Object> mixedList = Arrays.asList("String", 42, Arrays.asList("Nested", 99), map);
        System.out.println(CommonUtil.toString(mixedList));
        // "[String, 42, [Nested, 99], {One : 1, Two : 2}]"

        // null
        System.out.println(CommonUtil.toString(null)); // "null"
        
        
        // 숫자 변환 -> 100,000,000
        String num = CommonUtil.addCommaToNumber(100000000, "#,###");
		System.out.println("변환한 숫자 ============== " + num);
		
		// 소수점 표시 (마지막 반올림) -> 123.467
		String num2 = CommonUtil.addCommaToNumber(123.466789, "###.###");
		System.out.println("변환한 숫자 ============== " + num2);
		
		// 소수점 표시 (없으면 0으로 표시) -> 123.46678900
		String num3 = CommonUtil.addCommaToNumber(123.466789, "000.00000000");
		System.out.println("변환한 숫자 ============== " + num3);
		
		// % : 100을 곱한 후 마지막에 "%" 붙임 -> 12346.679%
		String num4 = CommonUtil.addCommaToNumber(123.466789, "###.###%");
		System.out.println("변환한 숫자 ============== " + num4);
		
		return new ModelAndView("login");
	}
	
	
	/*
	 * 로그인 성공 시 이동 페이지
	 */
	@GetMapping(value="/loginTestView")
	public ModelAndView loginTestView() {
		
		System.out.println("접속 아이디 ");
		
		return new ModelAndView("loginTest");
	}
	
	// sa 권한 페이지
	@GetMapping(value="/sa/saTest")
	public ModelAndView saTest() {
		return new ModelAndView("saTest");
	}
	
	// ad 권한 페이지
	@GetMapping(value="/ad/aTest")
	public ModelAndView aTest() {
		return new ModelAndView("aTest");
	}
	
	// ma 권한 페이지
	@GetMapping(value="/ma/mTest")
	public ModelAndView mTest() {
		return new ModelAndView("mTest");
	}
	
	// us 권한 페이지
	@GetMapping(value="/us/uTest")
	public ModelAndView uTest() {
		return new ModelAndView("uTest");
	}

	
	// 회원 등록 페이지
	@GetMapping(value="/joinView")
	public ModelAndView joinView() {
		return new ModelAndView("/join");
	}
	
	// 캘린더, 텍스트 에디터 페이지
	@GetMapping(value="/us/testView")
	public ModelAndView testView() {
		return new ModelAndView("test");
	}
	
	// 조직도 페이지 
	@GetMapping(value="/chart")
	public ModelAndView chart() {
		return new ModelAndView("chart");
	}
	
	// index 페이지 
	@GetMapping(value="/intestfile")
	public ModelAndView intestfile() {
		return new ModelAndView("intestfile");
	}
	
	// 레이아웃 페이지
	@GetMapping(value="/layout")
	public ModelAndView layout() {
		return new ModelAndView("layout");
	}
	
	
	// 조직도 모달 test 페이지
	@GetMapping(value="/chartTestView")
	public ModelAndView chartTestView() {
		return new ModelAndView("/chart/chartTest");
	}
	
	/*
	 * author yh.kim (24.12.11)
	 * 회원 등록 기능 (비밀번호 암호화 해서 저장)
	 */
	@PostMapping(value="/joinWrite")
	public Map<String, Object> joinWrite(@ModelAttribute UserDTO dto){
		
		System.out.println("=======================" + CommonUtil.dtoToString(dto));
		
		
		// result 클래스를 만들어서 별도 맵 선언 없이도 보낼 수 있도록 작성!! 
		Map<String, Object> result = new HashMap<>();
		result.put("기본", dto.getPassword());
		
		// 비밀번호 암호화
		String hash = encoder.encode(dto.getPassword());
		dto.setPassword(hash);
		if(service.joinWrite(dto)) {
			result.put("msg", "등록 성공");
			result.put("암호화", hash);
		}else {
			result.put("error", "회원 등록 중 실패");
		}
		
		return result;
	}
	
	/*
	 * author yh.kim (24.12.6)
	 * 일정 캘린더 입력
	 */
	@PostMapping(value="/scheduleWrite")
	public Map<String, Object> scheduleWrite(@RequestParam Map<String, Object> params){
		
		logger.info("받아온 값 => " + params);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", service.scheduleWrite(params));
		
		return resultMap;
	}
	
	/*
	 * author yh.kim (24.12.6)
	 * 일정 캘린더 리스트 호출
	 */
	@GetMapping(value="/scheduleList")
	public Map<String, Object> scheduleList(){
		
		logger.info("일정 불러오기 실행");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", service.scheduleList());
		
		return resultMap;
	}
	
	
	/*
	 * author yh.kim (24.12.12) 수정 필요
	 * 파일 작성
	 */
	@PostMapping(value="/fileWrite")
	public FileDTO uploadFiles(@RequestParam("files") MultipartFile[] files) {

		FileDTO response = service.saveFiles(files);
		
		
		return response;
    }
	
	/*
	 * author yh.kim (24.12.13) 
	 * 파일 불러오기
	 */
	@GetMapping(value="/us/fileList")
	public Map<String, Object> fileList(){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", service.fileList());
		return result;
	}

	/**
	 * author yh.kim (24.12.14) 
	 * 조직도 리스트 조회
	 */
	@GetMapping(value="/menu_tree")
	public List<Map<String, Object>> menu_tree(){
		return service.menu_tree();
	}
	
	/**
	 * 페이지네이션 기능
	 * 
	 */
	@GetMapping(value="/pageListCall")
	public Map<String, Object> pageListCall(@RequestParam Map<String, Object> requestData){
		
		logger.info("페이지 네이션!!!!!!!!!!!!!!!!!!!!!!" + CommonUtil.toString(requestData));
		
		Map<String, Object> response = new HashMap<>();
	    response.put("status", "success");
	    response.put("data", requestData);

	    return response; 
	}
}
