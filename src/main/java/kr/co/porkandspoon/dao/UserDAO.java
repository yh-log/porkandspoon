package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.CareerDTO;
import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface UserDAO{

	/**
	 * author yh.kim (24.12.20) 
	 * 아이디 찾기 시 사용자 검증
	 */
	String findUserId(UserDTO params);

	/**
	 * author yh.kim (24.12.20) 
	 * 비밀번호 변경 메서드
	 */
	int changePassword(UserDTO params);

	/**
	 * author yh.kim (24.12.22)
	 * 기존 인증코드 조회 
	 */
	int randomCodeCheck(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 기존 인증코드 업데이트
	 */
	void randomCodeUpdate(int codeCheck);
	
	/**
	 * author yh.kim (24.12.22)
	 * 새로운 인증코드 삽입
	 */
	int randomCodeInsert(UserDTO dto);
	
	/**
	 * author yh.kim (24.12.22)
	 * 인증코드 검증 메서드
	 */
	int chackAuthCode(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 인증코드로 사용자 id 조회
	 */
	String findUsername(UserDTO dto);

	/**
	 * author yh.kim (24.12.22)
	 * 비밀번호 찾기 시 사용자 검증
	 */
	String findUserPw(UserDTO dto);

	/**
	 * author yh.kim (24.12.23)
	 * 직원 아이디 중복 체크
	 */
	int usernameOverlay(UserDTO dto);

	/**
	 * author yh.kim (24.12.23)
	 * 부서 리스트 조회
	 */
	List<DeptDTO> deptList();

	/**
	 * author yh.kim (24.12.24)
	 * 직원 등록
	 */
	int userWrite(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 이력 등록
	 */
	int userCareerWrite(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 프로필 이미지 등록
	 */
	int userFileWriet(FileDTO fileDtoList);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 조회 
	 */
	UserDTO userDetail(String username);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 이력 조회
	 */
	List<CareerDTO> userCareerDetail(String username);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 정보 수정
	 */
	int userUpdate(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 기존 직원 프로필 이미지 삭제
	 */
	int userFileDelete(UserDTO dto);

	/**
	 * author yh.kim (24.12.24)
	 * 직원 리스트 조회
	 */
	List<UserDTO> userList(Map<String, Object> parmeterMap);

	/**
	 * author yh.kim (24.12.25)
	 * 브랜드 생성 페이지 기안문 내용 조회
	 */
	ApprovalDTO deptWriteView(String idx);

	/**
	 * author yh.kim (24.12.25)
	 * 부서코드 중복체크
	 */
	int deptCodeOverlay(DeptDTO dto);

	/**
	 * author yh.kim (24.12.26) 
	 * 부서(브랜드) 등록
	 */
	int deptWrite(DeptDTO dto);

	/**
	 * author yh.kim (24.12.26) 
	 * 부서 상세 페이지 이동
	 */
	DeptDTO deptDetail(String id);

	/**
	 * author yh.kim (24.12.26)
	 * 부서 수정
	 */
	int deptUpdate(DeptDTO dto);

	/**
	 * author yh.kim (24.12.26)
	 * 기존 부서 이미지 삭제 
	 */
	int fileDelete(String pk_idx, String code_name);

	/**
	 * author yh.kim (24.12.26)
	 * 부서 리스트 조회
	 */
	List<DeptDTO> deptGetList(Map<String, Object> parmeterMap);

	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 생성 요청 리스트 조회
	 */
	List<ApprovalDTO> deptCreateList(Map<String, Object> parmeterMap);

	/**
	 * author yh.kim (24.12.26)
	 * 브랜드 삭제 요청 리스트 조회
	 */
	List<ApprovalDTO> deptDeleteList(Map<String, Object> parmeterMap);

	/**
	 * author yn.kim (24.12.27)
	 * 직영점 등록 요청 페이지 이동 및 조회
	 */
	ApprovalDTO storeWriteView(String idx);

	/**
	 * author yh.kim (24.12.27)
	 * 직영점 등록
	 */
	int storeWrite(DeptDTO dto);

	/**
	 * author yh.kim (24.12.27) 
	 * 직영점 수정 페이지 이동 및 조회
	 */
	DeptDTO storeDetail(String id);

	/**
	 * author yh.kim (24.12.27)
	 * 직영점 수정
	 */
	int storeUpdate(DeptDTO dto);




}
