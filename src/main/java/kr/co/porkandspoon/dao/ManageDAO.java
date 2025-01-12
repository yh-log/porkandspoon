package kr.co.porkandspoon.dao;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import kr.co.porkandspoon.dto.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ManageDAO {

	//아르바이트 등록
	int setPartWrite(Map<String, String> params);

	int setPartTime(Map<String, String> params);

	ManageDTO partDetail(int part_idx);

	List<ManageDTO> scheduleDetail(int part_idx);

	int editPart(Map<String, String> params);
	
	int editPartTime(Map<String, String> timeParams);

	int deletePartTime(String part_Idx);

	
	//아르바이트 재직자 리스트
	int count(int cnt, String opt, String keyword, String owner, String is_quit);

	List<ManageDTO> getPartList(String opt, String keyword, int limit, int offset, String owner, String is_quit);

	
	
	
	//아르바이트 스케줄관리
	List<ManageDTO> getPartTime(String owner);


	void setPartHistory(Map<String, Object> historyParams);

	void deletePartHistory(String part_Idx, String today);

	void editPartHistory(Map<String, String> params);
	
	// 직영점에 해당하는 아르바이트 이름 정보 
	List<ManageDTO> getPartNames(String owner);
    
	 
	void OneDelPartHistory(Map<String, String> params);
	
	

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 페이지 이동 시 부서, 직영점명 조회
	 */
    UserDTO getUserStoreInfo(String username);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록
	 */
	int restWrite(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 content 이미지 등록
	 */
	int restFileWrite(FileDTO fileDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 직영점 휴점 정보 업데이트
	 */
	int storeRestUpdate(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 시 공지사항 등록
	 */
	int restBoardWrite(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 시 캘린더 등록
	 */
	int restCalenderWrite(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 상세보기, 휴점 수정 페이지 이동
	 */
	RestDTO getRestDetail(String idx);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정
	 */
	int restUpdate(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정 시 캘린더 수정
	 */
	int restCalenderUpdate(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정 시 공지사항 수정
	 */
	int restBoardUpdate(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 시 게시판, 스케쥴 idx Insert
	 */
	int restIdxWrite(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 비활성화
	 */
	int restDelete(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 비활성화 시 캘린더 삭제
	 */
	int restCalenderDelete(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 비활성화 시 공지사항 삭제
	 */
	int restBoardDelete(RestDTO restDTO);

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 리스트 조회
	 */
	List<RestDTO> restList(PagingDTO pagingDTO);

	/**
	 * author yh.kim (25.01.04)
	 * 휴점 활성 여부 체크 스케쥴러
	 * 매일 00:05 실행
	 */
	int restCheckScheduler();

	List<ManageDTO> getBrandList();
	
	
	List<ManageDTO> getDirectList(String id);
	ManageDTO getBrandInfo(String id);
	
	
	ManageDTO getDirectInfo(String owner);
	List<ManageDTO> getPartList5(String owner);

	String getCEOInfo();

	FileDTO getFile(String code_name, String id);

	ManageDTO getSpotName(String owner);

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 등록 시 과거 매출 내역 조회
	 */
    ManageDTO pastSeales(ManageDTO manageDTO);

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 등록
	 */
	int salesWrite(ManageDTO manageDTO);

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 수정
	 */
	int salesUpdate(ManageDTO manageDTO);

	/**
	 * author yh.kim, (25.01.09)
	 * 매출 통계 월별 데이터 저장 스케쥴러
	 * 매일 00:01 실행
	 */
	int salesMonthScheduler(String year, String month, String day);

	/**
	 * author yh.kim, (25.01.09)
	 * 매출 통계 일별 데이터 저장 스케쥴러
	 * 매일 00:01 실행
	 */
	int salesDailyScheduler(String year, String month, String day);

	/**
	 * author yh.kim, (25.01.10)
	 * 직영점 매출 통계 조회 (요일별)
	 */
	List<ChartDTO> getWeekChartStatistics(String id, String year);

	/**
	 * author yh.kim, (25.01.10)
	 * 직영점 매출 통계 조회 (연도 월별)
	 */
	List<ChartDTO> getMonhtChartStatistics(String id, String year);

	/**
	 * author yh.kim, (25.01.10)
	 * 브랜드별 매출 통계 조회 (브랜드별 연간)
	 */
	List<ChartDTO> getChartDirectStatistics(Map<String, String> params);

	/**
	 * author yh.kim, (25.01.10)
	 * 브랜드별 매출 통계 조회 (브랜드 총합 월간)
	 */
	List<ChartDTO> getMonhtDirectStatistics(Map<String, String> params);

	/**
	 * author yh.kim, (25.01.10)
	 * 브랜드 직영점 별 매출 통계
	 */
	List<ChartDTO> getChartBrandStatistics(Map<String, String> params);
}
