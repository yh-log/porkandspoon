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
import kr.co.porkandspoon.dto.BoardReviewDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.util.CommonUtil;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardDAO boardDAO;

	// 공지사항 게시글 작성 메서드
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
	
	// 라이브러리 게시글 작성 메서드
	public BoardDTO setLbBoardwrite(MultipartFile[] files, BoardDTO dto) {
		boardDAO.setLbBoardwrite(dto);
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
				img.setCode_name("lb001");
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
		            	fileDTO.setCode_name("lb002"); // 코드번호 하드코딩
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
	
	// 공지사항 게시글 수정
	public BoardDTO setBoardupdate(MultipartFile[] files, BoardDTO dto) {
		boardDAO.setBoardUpdate(dto);
		String board_idx = String.valueOf(dto.getBoard_idx());
		logger.info("방금 업데이트한 board_idx : " + board_idx);
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
	
	// 라이브러리 게시글 수정
	public BoardDTO setlbBoardupdate(MultipartFile[] files, BoardDTO dto) {
		boardDAO.setlbBoardUpdate(dto);
		String board_idx = String.valueOf(dto.getBoard_idx());
		logger.info("방금 업데이트한 board_idx : " + board_idx);
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
				img.setCode_name("lb001");
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
		            	fileDTO.setCode_name("lb002"); // 코드번호 하드코딩
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
	
	
	// 공지사항 게시판 리스트 가져오기
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
	
	// 라이브러리 게시판 리스트 가져오기
	public List<BoardDTO> lbboardList(int page, int cnt, String option, String keyword) {
		int limit = cnt;
		int offset = (page-1) * cnt;
		Map<String, Object> parmeterMap = new HashMap<>();
		parmeterMap.put("limit", limit);
		parmeterMap.put("offset", offset);
		parmeterMap.put("option", option);
		parmeterMap.put("keyword", keyword);
		return boardDAO.lbboardList(parmeterMap);
	}

	// 해당 공지사항 게시글 정보 가져오기
	public BoardDTO boardDetail(String board_idx) {
		return boardDAO.boardDetail(board_idx);
	}
	
	// 해당 라이브러리 게시글 정보 가져오기
	public BoardDTO lbboardDetail(String board_idx) {
		return boardDAO.lbboardDetail(board_idx);
	}

	// 해당 게시글의 파일 정보 가져오기
	public List<FileDTO> getBoardFile(String board_idx) {
		return boardDAO.getBoardFile(board_idx);
	}
	
	// 해당 게시글의 파일 정보 가져오기
	public List<FileDTO> getlbBoardFile(String board_idx) {
		return boardDAO.getlbBoardFile(board_idx);
	}

	// 해당 공지사항 게시글 삭제하기
	public int boardDelete(int board_idx) {
		return boardDAO.boardDelete(board_idx);
	}
	
	// 해당 라이브러리 게시글 삭제하기
	public int lbboardDelete(int board_idx) {
		return boardDAO.lbboardDelete(board_idx);
	}

	// 해당 공지사항 게시글 작성자의 사진 가져오기
	public FileDTO getBoardphoto(String board_idx) {
		return boardDAO.getBoardphoto(board_idx);
	}
	
	// 해당 라이브러리 게시글 작성자의 사진 가져오기
	public FileDTO getlbBoardphoto(String board_idx) {
		return boardDAO.getlbBoardphoto(board_idx);
	}
	
	// 조회수 증가
	public void boardUpCount(int boardidx) {
		boardDAO.boardUpCount(boardidx);
	}
	
	// 조회수 증가
	public void lbboardUpCount(int boardidx) {
		boardDAO.lbboardUpCount(boardidx);
	}

	// 해당 게시글 확인한 사원 저장시키기
	public void boardListCheck(int boardidx, String username) {
		int check = boardDAO.boardListCheck(boardidx, username);
		if(check == 0) {
			boardDAO.boardCheckInsert(boardidx, username);
		}
		
	}

	// 해당 게시글을 확인한 사원 리스트 가져오기
	public List<BoardDTO> getCheckList(Map<String, Object> params) {
		return boardDAO.getCheckList(params);
	}

	// 게시판 댓글쓰기
	public void setReviewWrite(Map<String, Object> params) {
		boardDAO.setReviewWrite(params);
	}

	// 게시글 댓글 가져오기
	public List<BoardReviewDTO> getReview(String board_idx) {
		return boardDAO.getReview(board_idx);
	}

	// 게시글 댓글 삭제하기
	public void setReviewDelete(Map<String, Object> params) {
		boardDAO.setReviewDelete(params);
	}
	
	// 게시글 댓글 수정하기
	public void setReviewUpdate(Map<String, Object> params) {
		boardDAO.setReviewUpdate(params);
	}

	public void setRereviewWrite(Map<String, Object> params) {
		boardDAO.setRereviewWrite(params);
	}

	public int getCheckDept(Map<String, Object> params) {
		return boardDAO.getCheckDept(params);
	}

	public void setNotice(String board_idx, String board_notice, String currentDateTime) {
		boardDAO.setNotice(board_idx, board_notice, currentDateTime);
		if ("Y".equals(board_notice)) {
			boardDAO.setOldNotice(board_notice);
		}
	}

	public BoardDTO getUsername(Map<String, Object> params) {
		return boardDAO.getUsername(params);
	}

	public List<BoardDTO> getTeamCode() {
		return boardDAO.getTeamCode();
	}



	

	
	
	
	
}
