package kr.co.porkandspoon.service;


import java.util.List;
import java.util.Map;

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

	public boolean roomReservationWrite(CalenderDTO calenderDto) {
		List<String> attendees = calenderDto.getAttendees();
        if(attendees == null || attendees.isEmpty()) {
            return false;
        }
        for(String username : attendees) {
            CalenderDTO singleDto = new CalenderDTO();
            singleDto.setNo(calenderDto.getNo());
            singleDto.setUsername(username);
            singleDto.setStart_date(calenderDto.getStart_date());
            singleDto.setEnd_date(calenderDto.getEnd_date());
            singleDto.setSubject(calenderDto.getSubject());
            singleDto.setContent(calenderDto.getContent());
            resDao.roomReservationWrite(singleDto);
        }
        return true;
	}




}
