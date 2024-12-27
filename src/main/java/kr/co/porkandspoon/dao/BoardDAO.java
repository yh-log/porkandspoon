package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.FileDTO;

@Mapper
public interface BoardDAO {

	void setBoardfiles(List<FileDTO> results);

	int setBoardwrite(Map<String, Object> params);
	
	List<Map<String, Object>> getBoardList(int offset, int cnt, String option, String search);

	// 게시글 개수를 가져오는 메서드
	int getBoardCount(String option, String search);
    
    
    
}
