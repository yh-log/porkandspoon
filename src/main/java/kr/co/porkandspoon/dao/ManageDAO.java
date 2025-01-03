package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.ManageDTO;

@Mapper
public interface ManageDAO {

	int setPartWrite(Map<String, String> params);

	int setPartTime(Map<String, String> params);

	ManageDTO partDetail(int part_idx);

	List<ManageDTO> scheduleDetail(int part_idx);

	int editPart(Map<String, String> params);
	
	int editPartTime(Map<String, String> timeParams);

	int deletePartTime(String part_Idx);

	//아르바이트 재직자 리스트
	int count(int cnt, String opt, String keyword);

	List<ManageDTO> getPartList(String opt, String keyword, int limit, int offset);

	//아르바이트 퇴직자 리스트
	int Quitcount(int cnt, String opt, String keyword);

	List<ManageDTO> getPartQuitList(String opt, String keyword, int limit, int offset);

	//아르바이트 스케줄관리
	List<ManageDTO> getPartTime(String owner);

	
	
}
