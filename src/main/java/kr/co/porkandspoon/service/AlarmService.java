package kr.co.porkandspoon.service;

import java.sql.Timestamp;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.AlarmDAO;
import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.NoticeDTO;

@Service
public class AlarmService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmDAO alarmDAO;
	List<NoticeDTO> noticedto = new ArrayList<NoticeDTO>();

	public void saveAlarm(NoticeDTO noticeDTO) {
		ZoneId koreaZone = ZoneId.of("Asia/Seoul");
	    ZonedDateTime  nowInKorea = ZonedDateTime.now(koreaZone);
	    Timestamp currentTimestamp = Timestamp.valueOf(nowInKorea.toLocalDateTime());

	    // 한국 시간으로 설정
	    noticeDTO.setCreate_date(currentTimestamp);
		// 대댓글 = 해당 게시글의 데이터 가져오기
		if (noticeDTO.getCode_name() == "ml004") {
			BoardDTO boarddto = new BoardDTO();
			boarddto.setBoard_idx(Integer.parseInt(noticeDTO.getBoard_idx()));
			boarddto.setFrom_idx(noticeDTO.getFrom_idx());
			boarddto = alarmDAO.getBoardUS(boarddto);
			noticeDTO.setSubject(boarddto.getSubject());
			noticeDTO.setUsername(boarddto.getUsername());
		}
		
		// 보낸 사람의 아이디를 통해 user 테이블의 name 가져오기
		String username = noticeDTO.getFrom_id();
		if(username != null) {
			username = alarmDAO.getUsername(username);
		}
		
		String sub = noticeDTO.getSubject();
		
		switch (noticeDTO.getCode_name()) {
		case "ml003":
			noticeDTO.setSubject("댓글");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;게시글에 댓글이 달렸습니다.");
			noticeDTO.setUrl("/boarddetail/View/" + noticeDTO.getFrom_idx());
			break;
		case "ml004":
			noticeDTO.setSubject("대댓글");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;게시물에 대댓글이 달렸습니다.");
			noticeDTO.setUrl("/boarddetail/View/" + noticeDTO.getBoard_idx());
			break;
		default:
			break;
		}
		alarmDAO.savaAlarm(noticeDTO);
	}


	public void setCheckAlarm(int alarmIdx) {
		// TODO Auto-generated method stub
		
	}

	public List<NoticeDTO> getAlarm(String username) {
		return alarmDAO.getAlarm(username);
	}

	public void updateConfirm(List<NoticeDTO> alarms) {
		for (NoticeDTO alarm : alarms) {
			alarmDAO.updateConfirm(alarm.getAlarm_idx());
		}
	}

	public List<NoticeDTO> getAlarmList(NoticeDTO dto) {
		return alarmDAO.getAlarmList(dto);
	}
	

}
