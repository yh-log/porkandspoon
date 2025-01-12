package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.BoardReviewDTO;
import kr.co.porkandspoon.dto.FileDTO;

@Mapper
public interface BoardDAO {

	int setBoardfiles(FileDTO results);

	int setBoardwrite(BoardDTO dto);
	
	int setLbBoardwrite(BoardDTO dto);

	List<BoardDTO> boardList(Map<String, Object> parmeterMap);

	int boardUpdate(BoardDTO dto);
	
	BoardDTO boardDetail(String board_idx);
	
	BoardDTO lbboardDetail(String board_idx);

	List<FileDTO> getBoardFile(String board_idx);
	
	List<FileDTO> getlbBoardFile(String board_idx);

	int setBoardUpdate(BoardDTO dto);

	int setlbBoardUpdate(BoardDTO dto);
	
	int boardDelete(int board_idx);

	FileDTO getBoardphoto(String board_idx);
	
	FileDTO getlbBoardphoto(String board_idx);

	void boardUpCount(int board_idx);
	
	void lbboardUpCount(int board_idx);

	int boardListCheck(int board_idx, String username);

	void boardCheckInsert(int board_idx, String username);

	List<BoardDTO> getCheckList(Map<String, Object> params);

	void setReviewWrite(Map<String, Object> params);

	List<BoardReviewDTO> getReview(String board_idx);

	void setReviewDelete(Map<String, Object> params);

	void setReviewUpdate(Map<String, Object> params);

	void setRereviewWrite(Map<String, Object> params);

	int getCheckDept(Map<String, Object> params);

	void setNotice(String board_idx, String board_notice, String notice_date);

	void setOldNotice(String board_notice);

	BoardDTO getUsername(Map<String, Object> params);

	List<BoardDTO> lbboardList(Map<String, Object> parmeterMap);

	int lbboardDelete(int board_idx);

	List<BoardDTO> getTeamCode();

	int userList();
    
    
    
}
