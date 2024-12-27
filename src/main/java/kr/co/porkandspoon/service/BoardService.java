package kr.co.porkandspoon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.BoardDAO;
import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.FileDTO;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardDAO boardDAO;
	
	// 멀티 파일 저장
	public void setBoardfiles(List<FileDTO> results) {
		boardDAO.setBoardfiles(results);
	}
	
	// 공지사항 글 작성
	public int setBoardwrite(Map<String, Object> params) {
		return boardDAO.setBoardwrite(params);
	}

	public Map<String, Object> getBoardList(int offset, int cnt, String option, String search) {
	    // 게시글 목록을 가져오는 메서드 호출
	    List<Map<String, Object>> list = boardDAO.getBoardList(offset, cnt, option, search);
	    // 게시글 개수를 가져오는 메서드 호출
	    int totalCount = boardDAO.getBoardCount(option, search);

	    // 페이지 정보 계산
	    int totalPages = (int) Math.ceil((double) totalCount / cnt);

	    // 응답 데이터 구성
	    Map<String, Object> response = new HashMap<>();
	    response.put("currentPage", (offset / cnt) + 1);  // 현재 페이지 계산
	    response.put("totalPages", totalPages);
	    response.put("data", list);

	    return response;
	}


	
	
	
	
}
