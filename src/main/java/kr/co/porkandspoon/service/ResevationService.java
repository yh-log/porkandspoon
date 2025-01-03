package kr.co.porkandspoon.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.ResevationDAO;
import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.dto.UserDTO;

@Service
public class ResevationService {
	
	@Autowired ResevationDAO resDao;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 물품 등록(작성자 정보)
	public UserDTO info(String loginId) {	
		return resDao.info(loginId);
	}

	public int articleWrite(Map<String, Object> params) {
		return resDao.articleWrite(params);
	}

	public List<CalenderDTO> list(int page, int size, String category) {
		int offset = (page - 1) * size;
		return resDao.list(offset,size,category);
	}

	public CalenderDTO articleDetail(String no) {		
		return resDao.articleDetail(no);
	}

	public int updateYN(String no, String filter) {
		return resDao.updateYN(no,filter);
	}

	public int articleUpdate(Map<String, Object> params) {
		return resDao.articleUpdate(params);
	}

	public int roomWrite(Map<String, Object> params) {
		return resDao.roomWrite(params);
	}

	public CalenderDTO roomDetail(String no) {		
		return resDao.roomDetail(no);
	}

	public int roomUpdate(Map<String, Object> params) {		
		return resDao.roomUpdate(params);
	}

	public int allDelete(String no, String filter) {
		return resDao.allDelete(no,filter);
	}

	public List<CalenderDTO> note() {
		return resDao.note();
	}

	public List<CalenderDTO> project() {
		return resDao.project();
	}

	public List<CalenderDTO> car() {
		return resDao.car();
	}

	public CalenderDTO itemDetail(String no) {
		return resDao.itemDetail(no);
	}

	public List<CalenderDTO> articleList() {		
		return resDao.articleList();
	}

	public List<CalenderDTO> selectList(String selection) {		
		return resDao.selection(selection);
	}

	public int itemWrite(CalenderDTO calederDto) {
		return resDao.itemWrite(calederDto);
	}

	public CalenderDTO resDetail(int idx) {
		return resDao.resDetail(idx);
	}

	public boolean itemUpdate(String idx, CalenderDTO calenderDto) {
		int result = resDao.itemUpdate(idx, calenderDto);
		return result > 0;
	}

	public int itemDelete(String idx) {
		return resDao.itemDelete(idx);
	}

	public List<CalenderDTO> room() {
		return resDao.room();
	}

	public CalenderDTO resRoomDetail(String no) {
		return resDao.resRoomDetail(no);
	}

	public List<CalenderDTO> roomList() {
		return resDao.roomList();
	}

	// 회의실 예약 작성 메서드
    @Transactional
    public boolean roomReservationWrite(CalenderDTO calenderDto) {
        List<String> attendees = calenderDto.getAttendees();
        if(attendees == null || attendees.isEmpty()) {
            return false;
        }

        // 예약 정보 삽입
        resDao.roomReservationWrite(calenderDto);

        // 마지막 삽입된 schedule_idx 가져오기
        String idx = calenderDto.getIdx();

        if(idx == null) {
            throw new RuntimeException("예약 정보를 삽입하는 데 실패했습니다.");
        }

        // 참석자 삽입
        for(String username : attendees) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("idx", idx);
            params.put("username", username);
            resDao.insertAttendee(params);
        }

        return true;
	}

	public Map<String, Object> roomReservationDetail(int idx) {
		
		Map<String, Object> result = new HashMap<>();
        
		try {
            // 예약 상세 정보 조회
            CalenderDTO schedule = resDao.roomReservationDetail(idx);
            if(schedule == null) {
                logger.warn("예약 정보를 찾을 수 없습니다. idx: {}", idx);
                return null;
            }
            
            // 참석자 목록 조회
            List<UserDTO> attendees = resDao.attendeesList(idx);
            
            // 결과 맵에 데이터 추가
            result.put("schedule", schedule);
            result.put("attendees", attendees);
            result.put("success", true);
            
            return result;
            
        } catch(Exception e) {
            logger.error("예약 상세 정보 조회 중 예외 발생: ", e);
            throw e; // 트랜잭션 롤백을 위해 예외 재발생
        }
	}




}
