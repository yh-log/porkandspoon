package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.FileDTO;

@Mapper
public interface BoardDAO {

	int setBoardfiles(FileDTO results);

	int setBoardwrite(BoardDTO dto);

	List<BoardDTO> boardList(Map<String, Object> parmeterMap);
    
    
    
}
