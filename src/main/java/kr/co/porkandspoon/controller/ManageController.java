package kr.co.porkandspoon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.porkandspoon.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.porkandspoon.dao.UserDAO;
import kr.co.porkandspoon.service.ManageService;
import kr.co.porkandspoon.util.CommonUtil;
import kr.co.porkandspoon.util.security.CustomUserDetails;

@RestController
public class ManageController {
	
	@Autowired ManageService manageService;

	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private UserDAO userDAO;

	// 매장관리홈 직영점주 사용하는 기능
	@GetMapping(value="/ad/spotManage")
	public ModelAndView spotManageView(@AuthenticationPrincipal UserDetails userDetails) {
		String owner = userDetails.getUsername();
		List<ManageDTO> list = manageService.getPartList5(owner);
		ManageDTO dto = manageService.getDirectInfo(owner);
		ModelAndView mav = new ModelAndView("/manage/spotManage");
		mav.addObject("list",list);
		mav.addObject("info",dto);
		return mav;
	}
	
	// 직영점 관리 해당 브랜드팀만 사용하는 기능
	@GetMapping(value="/ma/directManage")
	public ModelAndView directManageView(@AuthenticationPrincipal UserDetails userDetails) {
		String id = userDetails.getUsername();
		List<ManageDTO> list = manageService.getDirectList(id);
		ManageDTO info = manageService.getBrandInfo(id);
		info.setCode_name("bl001");
		FileDTO fileDTO = manageService.getFile(info.getCode_name(),info.getParent());
		info.setFiledto(fileDTO);
		ModelAndView mav = new ModelAndView("/manage/directManage");
		mav.addObject("list",list);
		mav.addObject("info",info);
		
		return mav;
	}
	
	//브랜드 관리 브랜드팀,직영점주 제외한 본사직원이 볼 수 있는 기능
	@GetMapping(value="/ad/brandManage")
	public ModelAndView brandManageView(@AuthenticationPrincipal UserDetails userDetails) {
	    // CEO 정보 가져오기
	    String CEO = manageService.getCEOInfo();

	    // 브랜드 리스트 가져오기
	    List<ManageDTO> list = manageService.getBrandList();

	    // 각 DTO에 파일 정보 설정
	    for (ManageDTO dto : list) {
	        // code_name 셋팅
	        dto.setCode_name("bl001");

	        // code_name과 id로 파일 정보 가져오기
	        FileDTO fileDTO = manageService.getFile(dto.getCode_name(),dto.getId());
	        dto.setFiledto(fileDTO); // DTO에 파일 정보 설정
	    }

	    // ModelAndView에 데이터 추가
	    ModelAndView mav = new ModelAndView("/manage/brandManage");
	    mav.addObject("list", list);
	    mav.addObject("info", CEO);

	    return mav;
	}

	
	
	
	//아르바이트 리스트 페이지 뷰 이동
	@GetMapping(value="/ad/part")
	public ModelAndView partListView() {
		return new ModelAndView("/manage/partList");
	}
	
	//아르바이트 리스트 정보 조회
	@GetMapping(value="/ad/part/List")
	public Map<String, Object> getPartList(@AuthenticationPrincipal UserDetails userDetails,
			String pg,  String count, String opt, String keyword,String is_quit) {
		String owner = userDetails.getUsername();
		logger.info("가져왔니 ?: {}",is_quit);
		logger.info("가져왔니 ?: {}",pg);
		logger.info("가져왔니 ?: {}",count);
		logger.info("가져왔니 ?: {}",keyword);
		
		
		int page = Integer.parseInt(pg);
	    int cnt = Integer.parseInt(count);
	    int limit = cnt;
	    int offset = (page - 1) * cnt;
	    int totalPages = manageService.count(cnt, opt, keyword,owner,is_quit);
	    
	    List<ManageDTO> list = manageService.getPartList(opt, keyword, limit, offset,owner,is_quit);

	    // 로그 출력
	    logger.info("opt: {}", opt);
	    logger.info("keyword: {}", keyword);
	    logger.info("가져왔니 ?: {}",offset);

	    Map<String, Object> result = new HashMap<>();
	    result.put("totalPages", totalPages);
	    result.put("currpage", page);
	    result.put("list", list);

	    return result;
	}
	
	
	
	//아르바이트 등록
	@GetMapping(value="/ad/part/Write")
	public ModelAndView partWriteView(@AuthenticationPrincipal UserDetails userDetails) {
		String owner = userDetails.getUsername();
		ManageDTO mto = manageService.getSpotName(owner);
		
		
		ModelAndView mav = new ModelAndView("/manage/partWrite");
		mav.addObject("mto",mto);
		return mav;
	}
	
	@PostMapping(value = "/ad/part/Write")
	public ModelAndView setPartWrite(
		@AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam Map<String, String> params,
	    @RequestParam("work_date[]") List<String> workDates,
	    @RequestParam("start_time[]") List<String> startTimes,
	    @RequestParam("end_time[]") List<String> endTimes
	) {
	    // 기본 정보 저장
		String creater = userDetails.getUsername();
		params.put("creater", creater);
		
		logger.info("근무 요일 : {}",workDates);
		logger.info("시작 시간 : {}",startTimes);
		logger.info("종료 시간 : {}",endTimes);
		
		
	    manageService.setPartWrite(params, workDates, startTimes, endTimes);
	    return new ModelAndView("/manage/partWrite");
	}
	
	//아르바이트 상세페이지
	@GetMapping(value="/ad/part/Detail/{part_idx}")
	public ModelAndView partDetail(@PathVariable int part_idx,@AuthenticationPrincipal UserDetails userDetails) {
		String owner = userDetails.getUsername();
		ManageDTO dto =  manageService.partDetail(part_idx);
		List<ManageDTO>  list =  manageService.scheduleDetail(part_idx);
		ManageDTO mto = manageService.getSpotName(owner);
		ModelAndView mav = new ModelAndView("/manage/partDetail");
		mav.addObject("info",dto);
		mav.addObject("list",list);
		mav.addObject("mto",mto);
		return mav;
	}
	
	//아르바이트 수정 뷰이동
	@GetMapping(value="/ad/part/Update/{part_idx}")
	public ModelAndView partUpdateView(@PathVariable int part_idx,@AuthenticationPrincipal UserDetails userDetails) {
		String owner = userDetails.getUsername();
		ManageDTO dto =  manageService.partDetail(part_idx);
		List<ManageDTO>  list =  manageService.scheduleDetail(part_idx);
		ManageDTO mto = manageService.getSpotName(owner);
		ModelAndView mav = new ModelAndView("/manage/partUpdate");
		mav.addObject("info",dto);
		mav.addObject("list",list);
		mav.addObject("mto",mto);
		return mav;
	}
	
	//아르바이트 업데이트 기능 
	@PostMapping(value = "/ad/part/Update")
	public ModelAndView editPart(
	    @AuthenticationPrincipal UserDetails userDetails,
	    @RequestParam Map<String, String> params,
	    @RequestParam("work_date[]") List<String> workDates,
	    @RequestParam("start_time[]") List<String> startTimes,
	    @RequestParam("end_time[]") List<String> endTimes
	) {
	   
	    logger.info("params : {}",params);
	    
	    String updater = userDetails.getUsername();
	    params.put("updater", updater);
	    String part_idx = params.get("part_idx");
	    logger.info(part_idx);

	    manageService.editPart(params, workDates, startTimes, endTimes);

	    return new ModelAndView("redirect:/ad/part/Detail/" + part_idx);
	}

	
	// 아르바이트 스케줄 뷰 이동
	@GetMapping(value = "/ad/partSchedule")
	public ModelAndView partScheduleView() {
		return new ModelAndView("/manage/partSchedule");
	}
	
	// 아르바이트 스케줄 리스트 정보
	@GetMapping(value = "/ad/getPartTime")
	public List<ManageDTO> getPartTime(@AuthenticationPrincipal UserDetails userDetails) {
	    String owner = userDetails.getUsername();
	    List<ManageDTO> list = manageService.getPartTime(owner);
	   
	   
	    return list;
	}

	// 모달창 직원 선택 정보 가져오기
	@GetMapping(value = "/ad/getPartNames")
	@ResponseBody
	public List<ManageDTO> getPartNames(@AuthenticationPrincipal UserDetails userDetails
			) {
	    // 예: part 테이블에서 id와 name을 가져오는 로직
		String owner = userDetails.getUsername();
	    List<ManageDTO> partNames = manageService.getPartNames(owner); 
	    return partNames;
	}
	
	//아르바이트 스케줄 삭제 
	@DeleteMapping(value = "ad/PartHistory/Delete")
	public void OneDelPartHistory(@RequestBody Map<String,String> params) {

		manageService.OneDelPartHistory(params);
		
	}
	
	
	@PostMapping(value = "ad/PartHistory/Write")
	public void setPartHistory(@RequestBody Map<String, Object> params) {
		logger.info("받은 데이터: {}", params);
		manageService.setPartHistory(params);
		
	}
	
	@PutMapping(value = "ad/PartHistory/Update")
	public void editPartHistory(@RequestBody Map<String, String> params) {
		logger.info("받은 데이터: {}", params);
		
		manageService.editPartHistory(params);
		
	}
	
	
	
	
	
	
	
	
	//휴점
	
	@GetMapping(value="/us/rest/listView")
	public ModelAndView restListView() {
		return new ModelAndView("/manage/restList");
	}


	@GetMapping(value="/ad/rest/Update")
	public ModelAndView restUpdateView() {
		return new ModelAndView("/manage/restUpdate");
	}




	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록 페이지 이동
	 */
	@GetMapping(value="/us/rest/write")
	public ModelAndView restWriteView() {

		CustomUserDetails userDetails = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		UserDTO userDTO = manageService.getUserStoreInfo(username);

		ModelAndView mav = new ModelAndView("/manage/restWrite");
		mav.addObject("name",userDetails.getName());
		mav.addObject("username", username);
		mav.addObject("userDTO",userDTO);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 등록
	 */
	@PostMapping(value = "/us/rest/write")
	public RestDTO restWrite(@ModelAttribute RestDTO restDTO, @RequestParam("imgsJson") String imgsJson){

		logger.info(CommonUtil.toString(restDTO));
		logger.info(CommonUtil.toString(imgsJson));

		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;

		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			restDTO.setImgs(imgs);

			restDTO = manageService.restWrite(restDTO);

		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정 페이지 이동
	 */
	@GetMapping(value="/us/rest/update/{rest_idx}")
	public ModelAndView restUpdateView(@PathVariable String rest_idx) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		ModelAndView mav = new ModelAndView("/manage/restUpdate");
		mav.addObject("getRest", manageService.getRestDetail(rest_idx));
		mav.addObject("username", username);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 상세 페이지 이동
	 */
	@GetMapping(value="/us/rest/detail/{rest_idx}")
	public ModelAndView restDetailView(@PathVariable String rest_idx) {

		String username = SecurityContextHolder.getContext().getAuthentication().getName();

		ModelAndView mav = new ModelAndView("/manage/restDetail");
		mav.addObject("getRest", manageService.getRestDetail(rest_idx));
		mav.addObject("username", username);

		return mav;
	}

	/**
	 * author yh.kim, (25.01.03)
	 * 휴점 수정
	 */
	@PostMapping(value="/ma/rest/update")
	public RestDTO restUpdate(@ModelAttribute RestDTO restDTO, @RequestParam("imgsJson") String imgsJson) {
		logger.info(CommonUtil.toString(restDTO));
		logger.info(CommonUtil.toString(imgsJson));

		ObjectMapper obj = new ObjectMapper();
		List<FileDTO> imgs = null;

		try {
			imgs = obj.readValue(imgsJson, obj.getTypeFactory().constructCollectionType(List.class, FileDTO.class));
			restDTO.setImgs(imgs);

			restDTO = manageService.restUpdate(restDTO);

		} catch (JsonMappingException e) {
			logger.error("JsonMappingException 예외 발생", e);
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			logger.error("JsonProcessingException 예외 발생", e);
			e.printStackTrace();
		}
		return restDTO;
	}

	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 비활성화
	 */
	@DeleteMapping(value="/us/rest/delete")
	public RestDTO restDelete(@ModelAttribute RestDTO restDTO){

		restDTO = manageService.restDelete(restDTO);

		return restDTO;
	}


	/**
	 * author yh.kim, (25.01.04)
	 * 휴점 리스트 조회
	 */
	@GetMapping(value="/us/rest/list")
	public List<RestDTO> restList(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "cnt", defaultValue = "10") int cnt,
			@RequestParam(defaultValue = "", value = "option") String option,
			@RequestParam(defaultValue = "", value="keyword") String keyword){


		List<RestDTO> restDTOS = manageService.restList(page, cnt, option, keyword);

		return restDTOS;
	}

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 등록 시 과거 매출 내역 조회
	 */
	@GetMapping(value = "/us/pastSeales")
	public ManageDTO pastSeales(@ModelAttribute ManageDTO manageDTO){

		logger.info("받아온 정보 => " + CommonUtil.toString(manageDTO));

		manageDTO = manageService.pastSeales(manageDTO);

		return manageDTO;
	}

	/**
	 * author yh.kim, (25.01.09)
	 * 직영점 매출 등록 or 수정
	 */
	@PostMapping(value = "/us/salesWrite")
	public ManageDTO salesWrite(@ModelAttribute ManageDTO manageDTO){

		manageDTO = manageService.salesWrite(manageDTO);

		return manageDTO;
	}

	/**
	 * author yh.kim, (25.01.10)
	 * 직영점 매출 통계 조회
	 */
	@GetMapping(value = "/chart/store/statistics")
	public List<ChartDTO> getChartStatistics(@RequestParam String id, @RequestParam String year){
		// 추가로 날짜 데이터 받기! JSP 수정 후

		List<ChartDTO> chartDTO = manageService.getChartStatistics(id, year);

		return chartDTO;
	}

	/**
	 * author yh.kim, (25.01.10)
	 * 브랜드별 매출 통계 조회
	 */
	@GetMapping(value = "/chart/direct/statistics")
	public List<ChartDTO> getChartDirectStatistics(@RequestParam String id, @RequestParam String year, @RequestParam String type){

		logger.info("받아온 타이븐!!!!!!!!! " + type);
		List<ChartDTO> chartDTO = manageService.getChartDirectStatistics(id, year, type);

		return chartDTO;
	}

}
