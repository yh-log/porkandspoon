package kr.co.porkandspoon.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.porkandspoon.dao.BoardDAO;
import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardDAO boardDAO;

	// 게시글 작성 메서드
	public BoardDTO setBoardwrite(MultipartFile[] files, BoardDTO dto) {
		boardDAO.setBoardwrite(dto);
		String board_idx = String.valueOf(dto.getBoard_idx());
		List<FileDTO> imgs = dto.getImgs();
		List<FileDTO> boardfile = null;
		if (imgs.size() > 0 || imgs != null) {
			List<String> fileNames = imgs.stream()
                    .map(FileDTO::getNew_filename) // new_filename 추출
                    .filter(Objects::nonNull)      // null 값 필터링
                    .collect(Collectors.toList()); // List<String>으로 변환
			boolean moveResult = CommonUtil.moveFiles(fileNames);
			logger.info("파일 이동 결과: {}", moveResult);
			for (FileDTO img : imgs) {
				img.setPk_idx(board_idx);
				img.setCode_name("fb001");
				String type = img.getOri_filename().substring(img.getOri_filename().lastIndexOf("."));
				img.setType(type);
				boardDAO.setBoardfiles(img);
			}
		}
		if (files != null && files.length > 0) {
		    for (MultipartFile file : files) {
		        if (!file.isEmpty()) { // 파일 유효성 검사
		            logger.info("파일 이름: {}", file.getOriginalFilename());
		            boardfile = CommonUtil.uploadFiles(file);
		            for (FileDTO fileDTO : boardfile) {
		            	fileDTO.setCode_name("fb002"); // 코드번호 하드코딩
		            	fileDTO.setPk_idx(board_idx);
		            	logger.info("업로드된 파일 - 원본 이름: {}, 저장 이름: {}, 파일 타입: {}, 파일 코드 : {}, pk_idx : {}",
            			fileDTO.getOri_filename(), fileDTO.getNew_filename(), fileDTO.getType(), fileDTO.getCode_name(), fileDTO.getPk_idx());
				        boardDAO.setBoardfiles(fileDTO);
				    }
		        } else {
		            logger.warn("빈 파일이 전송되었습니다.");
		        }
		    }
		} else {
		    logger.info("파일이 업로드되지 않았습니다.");
		}
		
		return null;
	}

	public List<BoardDTO> boardList(int page, int cnt, String option, String keyword) {
		int limit = cnt;
		int offset = (page-1) * cnt;
		Map<String, Object> parmeterMap = new HashMap<>();
		parmeterMap.put("limit", limit);
		parmeterMap.put("offset", offset);
		parmeterMap.put("option", option);
		parmeterMap.put("keyword", keyword);
		return boardDAO.boardList(parmeterMap);
	}


	
	
	
	
}
