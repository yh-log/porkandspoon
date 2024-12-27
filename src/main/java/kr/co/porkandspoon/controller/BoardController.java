package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	public BoardDTO setBoardwrite(@RequestParam("filepond") MultipartFile[] files,
			@ModelAttribute BoardDTO dto,
			@RequestParam("imgsJson") String content) {
		logger.info("파일 params: {}", dto);
		logger.info("content : {}", content);
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		try {
			imgs = obj.readValue(content, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			
			dto.setImgs(imgs);
			dto = boardService.setBoardwrite(files, dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return dto;
	}
	
	@GetMapping(value="/board/list")
	public List<BoardDTO> boardList(
			@RequestParam(value = "page", defaultValue = "1") int page, 
	        @RequestParam(value = "cnt", defaultValue = "10") int cnt,
	        @RequestParam(defaultValue = "", value = "option") String option,
	        @RequestParam(defaultValue = "", value="keyword") String keyword) {
		logger.info("keyword => " + keyword);
	    logger.info("option => " + option);
	    logger.info("page => " + page);
	    logger.info("cnt => " + cnt);
		List<BoardDTO> dtolist = boardService.boardList(page, cnt, option, keyword);
		for(BoardDTO dto : dtolist) {
			if(dto.getCreate_date() != null) {
				LocalDateTime time = dto.getCreate_date();
				String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
				dto.setRecreate_date(create_date);
			}
		}
		return dtolist;
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
