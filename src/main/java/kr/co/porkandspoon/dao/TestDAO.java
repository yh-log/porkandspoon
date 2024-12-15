package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.MemberDTO;

@Mapper
public interface TestDAO {

	int joinWrite(MemberDTO dto);

	String login(MemberDTO dto);
	
	
	
	
	
	
	
	
	
	
	int scheduleWrite(Map<String, Object> params);

	List<Map<String, Object>> scheduleList();

//	int fileWrite(Map<String, Object> param);

//	List<FileDTO> fileWrite(List<FileDTO> uploadFiles);

	int fileWrite(List<FileDTO> files); 
	
	List<Map<String, Object>> fileList();


}
