package kr.co.porkandspoon.dao;

import java.util.List;

import kr.co.porkandspoon.dto.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyPageDAO {

	/**
	 * author yh.kim (24.12.26)
	 * 마이페이지 이동 및 정보 조회
	 */
	UserDTO myPageDetail(String username);

	/**
	 * author yh.kim (24.12.26)
	 * 직원 이력 조회
	 */
	List<CareerDTO> myPageCareerDetail(String username);


	int count(String username, int cnt_, String opt, String keyword);

	List<MealDTO> buyList(String username,String opt, String keyword, int limit, int offset);
	
	

	/**
	 * author yh.kim (24.12.27)
	 * 마이페이지 정보 수정
	 */
	int myPageUpdate(UserDTO dto);

	/**
	 * author yh.kim (24.12.27)
	 * 기존 파일 삭제 
	 */
	int fileDelete(FileDTO fileDto);

	/**
	 * author yh.kim (24.12.27)
	 * 파일 업데이트
	 */
	int fileUpdate(FileDTO fileDto);

	
	
	
	FileDTO signExist(String pk_idx, String code_name);


	/**
	 * author yh.kim, (25.01.08)
	 * 출장 리스트 조회
	 */
    List<TripDTO> tripList(PagingDTO pagingDTO);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 상세 페이지 이동 및 조회
	 */
	TripDTO tripDetail(int schedule_idx);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 비활성화
	 */
	int tripDelete(TripDTO tripDTO);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 등록
	 */
	int tripWrite(TripDTO tripDTO);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 등록 시 캘린더 등록
	 */
	int tripCalenderWrite(TripDTO tripDTO);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 비활성화 시 캘린더 삭제
	 */
	int tripCalenderDelete(TripDTO tripDTO);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 수정
	 */
	int tripUpdate(TripDTO tripDTO);

	/**
	 * author yh.kim, (25.01.08)
	 * 출장 수정 시 캘린더 수정
	 */
	int tripCalenderUpdate(TripDTO tripDTO);

}
