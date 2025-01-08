package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import kr.co.porkandspoon.dto.ApprovalDTO;
import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.DeptDTO;
import kr.co.porkandspoon.dto.DirectstoreDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface DeptDAO {

	List<DeptDTO> setChart();

	UserDTO getUserlist(Map<String, Object> params);

	List<DeptDTO> getOrgchart();

	List<DirectstoreDTO> getDeptdata(Map<String, Object> params);

	/**
	 * author yh.kim (24.12.29) 
	 * 조직도 데이터 조회
	 */
	List<DeptDTO> getChartData();

	/**
	 * author yh.kim (24.12.26)
	 * 부서 상세 페이지 이동
	 */
	DeptDTO deptDetail(String id);

	/**
	 * author yn.kim (24.12.27)
	 * 직영점 등록 요청 페이지 이동 및 조회
	 */
	ApprovalDTO storeWriteView(String idx);

	/**
	 * author yh.kim (24.12.25)
	 * 브랜드 생성 페이지 기안문 내용 조회
	 */
	ApprovalDTO deptWriteView(String idx);

	/**
	 * author yh.kim (24.12.27)
	 * 직영점 수정 페이지 이동 및 조회
	 */
	DeptDTO storeDetail(String id);

	/**
	 * author yh.kim (24.12.25)
	 * 부서코드 중복체크
	 */
	int deptCodeOverlay(DeptDTO dto);

	/**
	 * author yh.kim, (25.01.07)
	 * 브랜드 직원 등록 조직도 정보 조회
	 */
	UserDTO getUserDeptInfo(String username);

	/**
	 * author yh.kim, (25.01.07)
	 * 브랜드 수정 시 조직도 초기 데이터 조회
	 */
	List<UserDTO> deptUserDetail(String id);
}
