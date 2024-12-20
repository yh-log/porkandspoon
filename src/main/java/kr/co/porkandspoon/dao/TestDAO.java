package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Mapper
public interface TestDAO {

	// 직원 id, pw 등록
	int joinWrite(UserDTO dto);

	// 캘린더 일정 작성
	int scheduleWrite(Map<String, Object> params);

	// 캘린더 일정 조회
	List<Map<String, Object>> scheduleList();

	// 파일 작성
	int fileWrite(List<FileDTO> files); 
	
	// 파일 데이터 조회
	List<Map<String, Object>> fileList();

	// 조직도 데이터 조회
	List<Map<String, Object>> menu_tree();


}
