package kr.co.porkandspoon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.porkandspoon.service.BoardService;

@RestController
public class BoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardService boardService;
	
	@GetMapping(value="/board/View")
	public ModelAndView boardView(Model model) {
		model.addAttribute("test", "hello");
		return new ModelAndView("/board/boardList");
	}
	
	@GetMapping(value="/boardmy/View")
	public ModelAndView boardmyView(Model model) {
		model.addAttribute("test", "hellow");
		return new ModelAndView("/board/boardList");
	}
	
	@GetMapping(value="/boardwrite/View")
	public ModelAndView boardwriteView() {
		return new ModelAndView("/board/boardWrite");
	}
	
	@GetMapping(value="/boardupdate/View")
	public ModelAndView boardupdateView() {
		return new ModelAndView("/board/boardUpdate");
	}
	
	@GetMapping(value="/boarddetail/View")
	public ModelAndView boarddetailView() {
		return new ModelAndView("/board/boardDetail");
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
	
	

	@GetMapping(value="/lbboardlist/View")
	public ModelAndView lbboardView() {
		return new ModelAndView("/board/lbboardList");
	}
	
	@GetMapping(value="/lbboardmylist/View")
	public ModelAndView lbboardmyView() {
		return new ModelAndView("/board/lbboardList");
	}
	
	@GetMapping(value="/lbboardwrite/View")
	public ModelAndView lbboardwriteView() {
		return new ModelAndView("/board/lbboardWrite");
	}
	
	@GetMapping(value="/lbboarddetail/View")
	public ModelAndView lbboarddetailView() {
		return new ModelAndView("/board/lbboardDetail");
	}
	
	@GetMapping(value="/lbboardupdate/View")
	public ModelAndView lbboardupdateView() {
		return new ModelAndView("/board/lbboardUpdate");
	}

}
