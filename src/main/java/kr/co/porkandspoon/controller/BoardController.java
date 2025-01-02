package kr.co.porkandspoon.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledFuture;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import kr.co.porkandspoon.dto.BoardReviewDTO;
import kr.co.porkandspoon.dto.FileDTO;
import kr.co.porkandspoon.dto.NoticeDTO;
import kr.co.porkandspoon.dto.UserDTO;
import kr.co.porkandspoon.service.AlarmService;
import kr.co.porkandspoon.service.BoardService;
import kr.co.porkandspoon.util.CommonUtil;

@RestController
public class BoardController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired BoardService boardService;
	@Autowired AlarmService alarmService;
	private final TaskScheduler taskScheduler;
	private final Map<String, ScheduledFuture<?>> scheduledTasks = new ConcurrentHashMap<>();

    public BoardController(BoardService boardService, TaskScheduler taskScheduler) {
        this.boardService = boardService;
        this.taskScheduler = taskScheduler;
    }
	
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
	
	// 글쓰기 페이지 이동
	@GetMapping(value="/boardwrite/View")
	public ModelAndView boardwriteView() {
		return new ModelAndView("/board/boardWrite");
	}
	
	// 공지사항 수정페이지 이동
	@GetMapping(value="/boardupdate/View/{board_idx}")
	public ModelAndView boardUpdate(@PathVariable String board_idx) {
		BoardDTO boarddto = new BoardDTO();
		ModelAndView mav = new ModelAndView();
		List<FileDTO> file = boardService.getBoardFile(board_idx);
		boarddto = boardService.boardDetail(board_idx);
		mav.addObject("fileInfo", file);
		mav.addObject("boardInfo", boarddto);
		mav.setViewName("/board/boardUpdate");
		return mav;
	}
	
	// 라이브러리 수정페이지 이동
	@GetMapping(value="/lbboardupdate/View/{board_idx}")
	public ModelAndView lbboardUpdate(@PathVariable String board_idx) {
		BoardDTO boarddto = new BoardDTO();
		ModelAndView mav = new ModelAndView();
		List<FileDTO> file = boardService.getlbBoardFile(board_idx);
		boarddto = boardService.lbboardDetail(board_idx);
		mav.addObject("fileInfo", file);
		mav.addObject("boardInfo", boarddto);
		mav.setViewName("/board/lbboardUpdate");
		return mav;
	}
	
	// 라이브러리 상세보기
	@GetMapping(value="/lbboarddetail/View/{board_idx}")
	public ModelAndView lbboardDetail(@PathVariable String board_idx) {
		BoardDTO boarddto = new BoardDTO();
		ModelAndView mav = new ModelAndView();
		List<FileDTO> file = boardService.getlbBoardFile(board_idx);
		FileDTO photo = boardService.getlbBoardphoto(board_idx);
		boarddto = boardService.lbboardDetail(board_idx);
		if(boarddto != null) {
			int boardidx = Integer.parseInt(board_idx);
			// 조회수 + 1 메서드
			boardService.lbboardUpCount(boardidx);
		}
		mav.addObject("photoInfo", photo);
		mav.addObject("fileInfo", file);
		mav.addObject("boardInfo", boarddto);
		mav.setViewName("/board/lbboardDetail");
		return mav;
	}
	
	// 공지사항 상세보기
	@GetMapping(value="/boarddetail/View/{board_idx}")
	public ModelAndView boardDetail(@PathVariable String board_idx) {
		BoardDTO boarddto = new BoardDTO();
		ModelAndView mav = new ModelAndView();
		List<BoardReviewDTO> reviewdto = boardService.getReview(board_idx);
		for(BoardReviewDTO dto : reviewdto) {
			if(dto.getReview_date() != null) {
				LocalDateTime time = dto.getReview_date();
				String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
				dto.setRereview_date(create_date);
			}
		}
		List<FileDTO> file = boardService.getBoardFile(board_idx);
		FileDTO photo = boardService.getBoardphoto(board_idx);
		boarddto = boardService.boardDetail(board_idx);
		
		String username = boarddto.getUsername();
		if(boarddto != null) {
			int boardidx = Integer.parseInt(board_idx);
			// 조회수 + 1 메서드
			boardService.boardUpCount(boardidx);
			boardService.boardListCheck(boardidx, username);
			
		}
		mav.addObject("reviewInfo", reviewdto);
		mav.addObject("photoInfo", photo);
		mav.addObject("fileInfo", file);
		mav.addObject("boardInfo", boarddto);
		mav.setViewName("/board/boardDetail");
		return mav;
	}
	
	// 글쓰기에 이름 가져오기
	@GetMapping(value="/getUsername")
	public BoardDTO getUsername(@RequestParam Map<String, Object> params) {
		BoardDTO dto = new BoardDTO();
		dto = boardService.getUsername(params);
		dto.setStatus("username");
		return dto;
	}
	
	// 공지사항 수정하기
	@PostMapping(value="/board/update")
	public BoardDTO setBoardUpdate(@RequestParam("filepond") MultipartFile[] files,
			@ModelAttribute BoardDTO dto,
			@RequestParam("imgsJson") String content) {
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		try {
			imgs = obj.readValue(content, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			dto.setImgs(imgs);
			dto = boardService.setBoardupdate(files, dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return dto;
	}
	
	// 라이브러리 수정하기
	@PostMapping(value="/lbboard/update")
	public BoardDTO setlbBoardUpdate(@RequestParam("filepond") MultipartFile[] files,
			@ModelAttribute BoardDTO dto,
			@RequestParam("imgsJson") String content) {
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		try {
			imgs = obj.readValue(content, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			dto.setImgs(imgs);
			dto = boardService.setlbBoardupdate(files, dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return dto;
	}
	
	
	// 공지사항 설정
    @PostMapping("/set/notice")
    public Map<String, Object> setNotice(@RequestParam("board_idx") String board_idx,
                            @RequestParam("notice1") String notice1,
                            @RequestParam("notice2") String notice2) {
    	Map<String, Object> response = new HashMap<>();
        LocalDateTime startAt = LocalDateTime.parse(notice1 + "T00:00:00");
        LocalDateTime endAt = LocalDateTime.parse(notice2 + "T00:00:00");
        response.put("success", true);
        response.put("status", "notice");
        LocalDateTime now = LocalDateTime.now();
        String currentDateTime = now.toString(); // 현재 날짜와 시간
        // 시작일 작업 등록
        if (!startAt.isAfter(now)) {
            logger.info("공지 즉시 설정 " + board_idx);
            boardService.setNotice(board_idx, "Y", currentDateTime);
        } else {
            scheduleTask(
                "start-" + board_idx,
                startAt,
                () -> {
                    logger.info("공지 시작일 " + board_idx);
                    boardService.setNotice(board_idx, "Y", startAt.toString());
                }
            );
        }

        // 종료일 작업 등록
        scheduleTask(
            "end-" + board_idx,
            endAt,
            () -> {
            	logger.info("공지 종료일 " + board_idx);
                boardService.setNotice(board_idx, "N", startAt.toString());
            }
        );
        return response;
    }
	
    // 스케줄러 확인 로직
    private void scheduleTask(String taskId, LocalDateTime executeAt, Runnable task) {
        if (scheduledTasks.containsKey(taskId)) {
            cancelTask(taskId); // 기존 작업 제거
        }
        ScheduledFuture<?> scheduledTask = taskScheduler.schedule(task, 
            Date.from(executeAt.atZone(ZoneId.systemDefault()).toInstant()));
        scheduledTasks.put(taskId, scheduledTask);
        logger.info("작업 추가됨: " + taskId + " 실행 시점: " + executeAt);
    }
    
    // 중복 스케줄러 제거 로직
    private void cancelTask(String taskId) {
        ScheduledFuture<?> scheduledTask = scheduledTasks.get(taskId);
        if (scheduledTask != null) {
            scheduledTask.cancel(false);
            scheduledTasks.remove(taskId);
            logger.info("중복 작업 취소됨: " + taskId);
        }
    }
    
	// 공지사항 게시글 삭제
	@PostMapping(value="/board/delete")
	public Map<String, Object> boardDelete(@RequestParam Map<String, Object> params) {
		logger.info("삭제할 idx : {}", params);
		int board_idx = Integer.parseInt(params.get("board_idx").toString());
		Map<String, Object> response = new HashMap<String, Object>();
		if(boardService.boardDelete(board_idx) > 0) {
			response.put("status", "deleteboard");
		}else {
			response.put("status", "deleteboard");
		}
		return response;
	}
	
	// 라이브러리 게시글 삭제
	@PostMapping(value="/lbboard/delete")
	public Map<String, Object> lbboardDelete(@RequestParam Map<String, Object> params) {
		logger.info("삭제할 idx : {}", params);
		int board_idx = Integer.parseInt(params.get("board_idx").toString());
		Map<String, Object> response = new HashMap<String, Object>();
		if(boardService.lbboardDelete(board_idx) > 0) {
			response.put("status", "deleteboard");
		}else {
			response.put("status", "deleteboard");
		}
		return response;
	}
	
	// 공지사항 게시판 글 쓰기
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
	
	// 라이브러리 게시판 글 쓰기
	@PostMapping(value="/lbboard/write")
	public BoardDTO setLbBoardwrite(@RequestParam("filepond") MultipartFile[] files,
			@ModelAttribute BoardDTO dto,
			@RequestParam("imgsJson") String content) {
		logger.info("파일 params: {}", dto);
		logger.info("content : {}", content);
		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;
		try {
			imgs = obj.readValue(content, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			
			dto.setImgs(imgs);
			dto = boardService.setLbBoardwrite(files, dto);
			
		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return dto;
	}
	
	// 공지사항 게시판 리스트
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
	
	// 라이브러리 게시판 리스트
	@GetMapping(value="/lbboard/list")
	public List<BoardDTO> lbboardList(
			@RequestParam(value = "page", defaultValue = "1") int page, 
	        @RequestParam(value = "cnt", defaultValue = "10") int cnt,
	        @RequestParam(defaultValue = "", value = "option") String option,
	        @RequestParam(defaultValue = "", value="keyword") String keyword) {
		logger.info("keyword => " + keyword);
	    logger.info("option => " + option);
	    logger.info("page => " + page);
	    logger.info("cnt => " + cnt);
		List<BoardDTO> dtolist = boardService.lbboardList(page, cnt, option, keyword);
		for(BoardDTO dto : dtolist) {
			if(dto.getCreate_date() != null) {
				LocalDateTime time = dto.getCreate_date();
				String create_date = CommonUtil.formatDateTime(time, "yyyy-MM-dd");
				dto.setRecreate_date(create_date);
			}
		}
		return dtolist;
	}
	
	// 댓글 삭제
	@PostMapping(value="/review/delete")
	public Map<String, Object> setReviewDelele(@RequestParam Map<String, Object> params) {
		logger.info("댓글 idx : {} ", params);
		Map<String, Object> response = new HashMap<>();
		boardService.setReviewDelete(params);
		response.put("sucess", true);
		response.put("status", "delete");
		return response;
	}
	
	// 댓글 수정
	@PostMapping(value="/review/update")
	public Map<String, Object> setReviewUpdate(@RequestParam Map<String, Object> params) {
		logger.info("댓글 내용 : {}", params);
		boardService.setReviewUpdate(params);
		Map<String, Object> response = new HashMap<>();
		response.put("sucess", true);
		response.put("status", "update");
		return response;
	}
	
	// 비공개 게시글 부서 찾아오기
	@GetMapping(value="/checkDept")
	public Map<String, Object> getCheckDept(@RequestParam Map<String, Object> params) {
		Map<String, Object> response = new HashMap<>();
		response.put("status", false);
		response.put("msg", "권한이 없습니다.");
		if(boardService.getCheckDept(params) > 0) {
			response.put("status", true);
		}else {
			response.put("status", false);
			response.put("msg", "권한이 없습니다.");
		}
		
		return response;
	}
	
	// 댓글 쓰기
	@PostMapping(value="/board/review/write")
	public Map<String, Object> setReviewWrite(@RequestParam Map<String, Object> params) {
		logger.info("댓글 밧 : {} ", params);
		boardService.setReviewWrite(params);
		Map<String, Object> response = new HashMap<>();
		NoticeDTO noticedto = new NoticeDTO();
		noticedto.setUsername((String) params.get("board_username"));
		noticedto.setFrom_idx((String) params.get("board_idx"));
		noticedto.setCode_name("ml003");
		noticedto.setFrom_id((String) params.get("username"));
		noticedto.setSubject((String) params.get("subject"));
		alarmService.saveAlarm(noticedto);
		response.put("success", true);
		response.put("status", "write");
		return response;
	}
	
	// 대댓글 쓰기
	@PostMapping(value="/reReview/write")
	public Map<String, Object> setRereviewWrite(@RequestParam Map<String, Object> params) {
		logger.info("댓글 내용 : {}", params);
		boardService.setRereviewWrite(params);
		Map<String, Object> response = new HashMap<>();
		response.put("success", true);
		response.put("status", "rewrite");
		return response;
	}
	
	// 읽음 리스트 가져오기
	@GetMapping(value="/check/list")
	public List<BoardDTO> getCheckList(@RequestParam Map<String, Object> params) {
		logger.info("반응체크: {}", params);
		List<BoardDTO> dto = boardService.getCheckList(params);
		return dto;
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
