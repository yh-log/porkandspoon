package kr.co.porkandspoon.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.BoardService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class BoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardService boardService;
	
	// 공지사항 게시판 이동
	@GetMapping(value="/board/View")
	public ModelAndView boardView(Model model) {
		model.addAttribute("test", "hello");
		return new ModelAndView("/board/boardList");
	}
	
	// 내가 쓴 공지사항 이동
	@GetMapping(value="/boardmy/View")
	public ModelAndView boardmyView(Model model) {
		model.addAttribute("test", "hellow");
		return new ModelAndView("/board/boardList");
	}
	
	// 공지사항 등록 이동
	@GetMapping(value="/boardwrite/View")
	public ModelAndView boardwriteView() {
		return new ModelAndView("/board/boardWrite");
	}
	
	// 공지사항 수정 이동
	@GetMapping(value="/boardupdate/View")
	public ModelAndView boardupdateView() {
		return new ModelAndView("/board/boardUpdate");
	}
	
	// 공지사항 상세보기 이동
	@GetMapping(value="/boarddetail/View")
	public ModelAndView boarddetailView() {
		return new ModelAndView("/board/boardDetail");
	}
	
	@PostMapping(value="/board/write")
	public Map<String, Object> setBoardwrite(@RequestParam("filepond") MultipartFile[] files, @RequestParam Map<String, Object> params) {
		logger.info("파일 params: {}", params);
		List<FileDTO> results = new ArrayList<>();
		if (files != null && files.length > 0) {
		    for (MultipartFile file : files) {
		        if (!file.isEmpty()) { // 파일 유효성 검사
		            logger.info("파일 이름: {}", file.getOriginalFilename());
		            List<FileDTO> dto = CommonUtil.uploadFiles(file);
		            for (FileDTO fileDTO : dto) {
		            	fileDTO.setCode_name("fb001"); // 코드번호 하드코딩
		            	fileDTO.setPk_idx((String) params.get("username"));
		            	logger.info("업로드된 파일 - 원본 이름: {}, 저장 이름: {}, 파일 타입: {}, 파일 코드 : {}, pk_idx : {}",
            			fileDTO.getOri_filename(), fileDTO.getNew_filename(), fileDTO.getType(), fileDTO.getCode_name(), fileDTO.getPk_idx());
				        results.add(fileDTO);
				    }
		        } else {
		            logger.warn("빈 파일이 전송되었습니다.");
		        }
		    }
		} else {
		    logger.info("파일이 업로드되지 않았습니다.");
		}
		if (!results.isEmpty()) {
			boardService.setBoardfiles(results);
		}
		boardService.setBoardwrite(params);
		Map<String, Object> response = new HashMap<>();
		response.put("status", "success");
		response.put("URL", "/board/View");
		return response;
	}
	
	@PostMapping("/board/list")
	public Map<String, Object> getBoardList(@RequestBody BoardDTO boardDTO) {
	    // 페이지 계산
	    int offset = (boardDTO.getPage() - 1) * boardDTO.getCnt();

	    // 서비스 호출 (서비스에서 검색 옵션과 검색어만 처리)
	    return boardService.getBoardList(offset, boardDTO.getCnt(), boardDTO.getOption(), boardDTO.getSearch());
	}

	// 투표 리스트 이동 페이지
	@GetMapping(value="/vote/list")
	public ModelAndView voteListView() {
		return new ModelAndView("/board/voteList");
	}
	
	// 투표 상세보기 이동 페이지
	@GetMapping(value="/vote/detail")
	public ModelAndView voteDetailView() {
		return new ModelAndView("/board/voteDetail");
	}
	
	// 투표 등록 이동 페이지
	@GetMapping(value="/vote/write")
	public ModelAndView voteWriteView() {
		return new ModelAndView("/board/voteWrite");
	}
	
	// 투표 수정 이동 페이지
	@GetMapping(value="/vote/update")
	public ModelAndView voteUpdateView() {
		return new ModelAndView("/board/voteUpdate");
	}
	
	
	// 라이브러리 게시판 이동
	@GetMapping(value="/lbboardlist/View")
	public ModelAndView lbboardView() {
		return new ModelAndView("/board/lbboardList");
	}
	
	// 내가 쓴 라이브러리 게시판 이동
	@GetMapping(value="/lbboardmylist/View")
	public ModelAndView lbboardmyView() {
		return new ModelAndView("/board/lbboardList");
	}
	
	// 라이브러리 등록 이동
	@GetMapping(value="/lbboardwrite/View")
	public ModelAndView lbboardwriteView() {
		return new ModelAndView("/board/lbboardWrite");
	}
	
	// 라이브러리 상세보기 이동
	@GetMapping(value="/lbboarddetail/View")
	public ModelAndView lbboarddetailView() {
		return new ModelAndView("/board/lbboardDetail");
	}
	
	// 라이브러리 수정 이동
	@GetMapping(value="/lbboardupdate/View")
	public ModelAndView lbboardupdateView() {
		return new ModelAndView("/board/lbboardUpdate");
	}

}
