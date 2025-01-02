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

	
	
}
