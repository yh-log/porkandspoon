package kr.co.porkandspoon.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.porkandspoon.dao.UserDAO;
import kr.co.porkandspoon.dto.CareerDTO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class UserService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserDAO userDao;
	
	private static final AtomicInteger counter = new AtomicInteger(1);
	
	/**
	 * author yh.kim (24.12.22)
	 * 아이디 찾기 시 사용자 검증
	 */
	public String findUserId(UserDTO dto) {
		return userDao.findUserId(dto);
	}


	/**
	 * author yh.kim (24.12.22)
	 * 인증 코드 생성 메서드
	 */
	public int randomAuthenticationCode(UserDTO dto) {
	
		// 1. 기존 코드 있는지 체크 (select - count)
		Integer codeCheck = userDao.randomCodeCheck(dto);
		
		
		// 코드가 없을 경우 기존 레코드 업데이트
		if (codeCheck != null && codeCheck > 0) {
		    userDao.randomCodeUpdate(codeCheck);
		}
		
		// 2. 없을 경우 바로 or 있을 경우 update 후 insert
		userDao.randomCodeInsert(dto);
		
		// 3. pk 리턴
		return dto.getIdx();
		
	}
	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	public boolean changePassword(UserDTO params) {
		return userDao.changePassword(params) > 0 ? true : false;
	}


	/**
	 * author yh.kim (24.12.22)
	 * 인증코드 검증 메서드
	 */
	public boolean chackAuthCode(UserDTO dto) {
		
		int resultRow = userDao.chackAuthCode(dto);
	
		if(resultRow < 0) {
			return false;
		}
		
		dto.setUsername(userDao.findUsername(dto));
		
		return true;
	}


	/**
	 * author yh.kim (24.12.22)
	 * 인증번호 생성 후 2분 경과 시 실행 메서드
	 */
	public void timeoutAction(UserDTO dto) {
		
		int idx = dto.getIdx();
		userDao.randomCodeUpdate(idx);
	}


	/**
	 * author yh.kim (24.12.22)
	 * 비밀번호 찾기 시 사용자 검증
	 */
	public String findUserPw(UserDTO dto) {
		return userDao.findUserPw(dto);
	}

	/**
	 * author yh.kim (24.12.23)
	 * 직원 아이디 중복 체크
	 */
	public boolean usernameOverlay(UserDTO dto) {
		return userDao.usernameOverlay(dto) ==  0 ? true : false;
	}

	/**
	 * author yh.kim (24.12.23)
	 * 부서 리스트 조회
	 */
	public List<DeptDTO> deptList() {
		
		
		List<DeptDTO> deptList = userDao.deptList();
		DeptDTO dto = new DeptDTO();
		
		if(deptList.size() < 1) {
			
			deptList = new ArrayList<DeptDTO>();
			
			
			dto.setStatus(400);
			dto.setMessage("부서가 존재하지 않습니다.");
			
			deptList.add(dto);
			
			return deptList;
		}
		
		dto.setStatus(205);
		
		return deptList;
	}

	/**
	 * author yh.kim (24.12.24)
	 * 직원등록 메서드 (직원 등록, 이력 등록, 파일 등록 진행)
	 */
	public boolean userWrite(UserDTO dto, MultipartFile file) {
		
		// 사번 생성 메서드
		String num = generateCompanyNumber(dto);
		dto.setPerson_num(num);
		
		// 권한 생성 메서드 (권한 A 로 시작하면 admin 권한 B로 시작하면 manager 권한 B에 직급이 6이면 user 권한)
		String role = authorityCreate(dto);
		dto.setRole(role);
		
		int row = userDao.userWrite(dto);
		
		logger.info("직원 등록 row => " + row);
		
		if(row == 0) {
			return false;
		}
		
		// UserDTO의 career 리스트에 username 설정
	    if (dto.getCareer() != null) { // career 리스트가 비어있지 않은 경우에만 처리
	        for (CareerDTO career : dto.getCareer()) {
	            career.setUsername(dto.getUsername()); // UserDTO의 username을 CareerDTO에 설정
	        }
	    }
		
		// 이력 등록 메서드
		int careerRow = userDao.userCareerWrite(dto);
				
		logger.info("이력 등록 로우 => " + careerRow);
		
	    // 프로필 이미지 처리
	    if (file != null && !file.isEmpty()) { // 파일이 null이 아니고 비어있지 않은 경우에만 처리
	        try {
	            FileDTO fileDto = CommonUtil.uploadSingleFile(file);
	            logger.info(CommonUtil.toString(fileDto));
	            fileDto.setCode_name("up100");
	            fileDto.setPk_idx(dto.getUsername());

	            int fileRow = userDao.userFileWriet(fileDto);
	            logger.info("업로드된 파일 로우 => " + fileRow);
	        } catch (Exception e) {
	            logger.error("파일 업로드 중 오류 발생", e);
	            return false; 
	        }
	    } else {
	        logger.warn("프로필 이미지 파일이 없습니다. 기본 프로필 이미지 사용");
	        // 기본 프로필 이미지 설정 로직이 필요하면 여기에 추가
	    }

		return true;
	}

	/**
	 * author yh.kim (24.12.24)
	 * 사번 생성 메서드
	 */
	public String generateCompanyNumber(UserDTO dto) {
		
		if(dto.getParent() == null || dto.getParent().isEmpty()) {
			return "입력된 부서가 없습니다.";
		}
		
	    // 부서 번호를 알파벳으로 변환
	    String firstTwoChars = dto.getParent().substring(0, 2);
	    
	    int year = LocalDate.now().getYear();
        
        // 뒤의 2자리 숫자만 추출
        int lastTwoDigits = year % 100;
       
        // 고유번호 생성 (4자리)
        String uniqueNumber = String.format("%04d", counter.getAndIncrement());

        // 사번 형태 (부서코드 - 240001 : AD-240001
	    String companyNumber = firstTwoChars + "-" + lastTwoDigits + uniqueNumber;
	    logger.info("생성된 사번 => " + companyNumber);
		
		return companyNumber;
	}
	
	/**
	 * author yh.kim (24.12.24)
	 * 권한 생성 메서드
	 */
	private String authorityCreate(UserDTO dto) {
		
		String deptFirst = dto.getParent().substring(0,1);
		
		String role = "superadmin";
		
		if(deptFirst == null || deptFirst == "") {
			return "입력된 부서가 없어 권한 생성이 미완료되었습니다.";
		}
		
		if(deptFirst.equals("A")) {
			role = "admin";
			return role;
		}else if(deptFirst.equals("M")) {
			role = "manager";
			return role;
		}else if(deptFirst.equals("M") && dto.getPosition().equals("po7")) {
			role = "user";
			return role;
		}else {
			role = "user"; // 기타 부서
		}
		
		return role;
	}

	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 조회 
	 */
	public UserDTO userDetail(String username) {
		
		UserDTO dto = new UserDTO();
		// 직원 정보 (+프로필) + 이력도????
		dto = userDao.userDetail(username);
		
		logger.info(CommonUtil.toString(dto));
		
		if(dto == null) {
			dto.setStatus(400);
			dto.setMessage("직원 정보가 없습니다.");
		}
		
		// 직원 이력 조회
		dto.setCareer(userDao.userCareerDetail(username));
		
		logger.info(CommonUtil.toString(dto));
		
		return dto;
	}

	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 수정 
	 */
	public boolean userUpdate(UserDTO dto, MultipartFile file) {
		
		// 수정할 때 update 부서 x -> 사번 o 
		// 만약 이동되면 권한은 다시 검사!  일단 권한 x
		
		int row = userDao.userUpdate(dto);
		logger.info("직원 수정 로우 => " + row);
		
		// 기존에 없던 데이터일 경우 insert 이니까 근데 그거 판단을 어려우니까 delete하고 insert? - 일단이건 가능
		// 기존 이력 제거 후 insert
		// 이력은 남기고 type중 create_date가 가장 빠른 일자로 select 할 수 있도록 조회 쿼리 수정
		
		if (dto.getCareer() != null) { // career 리스트가 비어있지 않은 경우에만 처리
	        for (CareerDTO career : dto.getCareer()) {
	            career.setUsername(dto.getUsername()); // UserDTO의 username을 CareerDTO에 설정
	        }
	    }
		
		int careerInsertRow = userDao.userCareerWrite(dto);
		
		logger.info("이력 삽입 로우 => " + careerInsertRow);
		
		 // 프로필 이미지 처리
	    if (file != null && !file.isEmpty()) { // 파일이 null이 아니고 비어있지 않은 경우에만 처리
	    	
	    	// 파일도 삭제 후 입력 진행
	    	int fileDeleteRow = userDao.userFileDelete(dto);
	    	
	    	logger.info("파일 삭제 로우 => " + fileDeleteRow);
	    	
	    	if(fileDeleteRow == 0) {
	    		logger.warn("삭제할 파일 정보가 없습니다.");
	    	}
	    	
	        try {
	            FileDTO fileDto = CommonUtil.uploadSingleFile(file);
	            logger.info(CommonUtil.toString(fileDto));
	            fileDto.setCode_name("up100");
	            fileDto.setPk_idx(dto.getUsername());

	            int fileRow = userDao.userFileWriet(fileDto);
	            logger.info("업로드된 파일 로우 => " + fileRow);
	        } catch (Exception e) {
	            logger.error("파일 업로드 중 오류 발생", e);
	            return false; 
	        }
	    } else {
	        logger.warn("프로필 이미지 파일이 없습니다. 기본 프로필 이미지 사용");
	    }
		
		return false;
	}

	/**
	 * author yh.kim (24.12.24)
	 * 직원 리스트 조회
	 */
	public List<UserDTO> userList() {
		return userDao.userList();
	}


}
