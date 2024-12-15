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
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MemberDTO;
import kr.co.porkandspoon.dto.ResponseDTO;
import kr.co.porkandspoon.service.TestService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class TestController {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	// pw 암호화, 복호화 시 사용
	@Autowired PasswordEncoder encoder;
	
	@Autowired TestService service;
	
	@Value("${upload.path}") private String paths;
	
	
	/*
	 * 메인 페이지 (로그인 페이지)
	 */
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
		
		return new ModelAndView("main");
	}
	
	
	/*
	 * 로그인 성공 시 이동 페이지
	 */
	@GetMapping(value="/loginTestView")
	public ModelAndView loginTestView() {
		return new ModelAndView("loginTest");
	}
	
	
	/*
	 * 페이지 이동 4개
	 */
	@GetMapping(value="/sa/saTest")
	public ModelAndView saTest() {
		return new ModelAndView("saTest");
	}
	
	@GetMapping(value="/a/aTest")
	public ModelAndView aTest() {
		return new ModelAndView("aTest");
	}
	
	@GetMapping(value="/m/mTest")
	public ModelAndView mTest() {
		return new ModelAndView("mTest");
	}
	
	@GetMapping(value="/u/uTest")
	public ModelAndView uTest() {
		return new ModelAndView("uTest");
	}

	
	/*
	 * 회원 등록 페이지
	 */
	@GetMapping(value="/joinView")
	public ModelAndView joinView() {
		return new ModelAndView("/join");
	}
	
	/*
	 * 회원 등록 기능 (비밀번호 암호화 해서 저장)
	 */
	@PostMapping(value="/joinWrite")
	public Map<String, Object> joinWrite(@ModelAttribute MemberDTO dto){
		
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
	
	
	
	
	
	@GetMapping(value="/u/testView")
	public ModelAndView testView() {
		return new ModelAndView("test");
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
	 * 
	 * 일정 수정
	 */
	@PutMapping(value="/scheduleUpdate")
	public Map<String, Object> scheduleUpdate(@RequestParam Map<String, Object> params){
		
		logger.info("받아온 값 => " + params);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		//resultMap.put("success", service.scheduleUpdate(params));
		
		return resultMap;
		
	}
	

	/*
	 * author yh.kim (24.12.12) 
	 * 파일 작성
	 */
	@PostMapping(value="/fileWrite")
	public ResponseEntity<ResponseDTO<List<FileDTO>>> uploadFiles(@RequestParam("files") MultipartFile[] files) {
        try {
            // 1. 서비스 호출
            ResponseDTO<List<FileDTO>> response = service.saveFiles(files);

            // 2. 성공 응답 반환
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            // 3. 에러 발생 시 실패 응답 반환
            ResponseDTO<List<FileDTO>> errorResponse = new ResponseDTO<>(500, "파일 업로드 중 오류 발생: " + e.getMessage(), null);
            return ResponseEntity.status(500).body(errorResponse);
        }
    }
	
	
	
	
	/*
	 * author yh.kim (24.12.13) 
	 * 파일 불러오기
	 */
	@GetMapping(value="/u/fileList")
	public Map<String, Object> fileList(){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", service.fileList());
		return result;
	}

	
	
	
	@GetMapping(value="/chart")
	public ModelAndView chart() {
		return new ModelAndView("chart");
	}
	
	
	
}
