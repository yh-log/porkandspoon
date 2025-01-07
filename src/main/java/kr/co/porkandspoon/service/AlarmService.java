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
import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.dto.NoticeDTO;

@Service
public class AlarmService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmDAO alarmDAO;
	List<NoticeDTO> noticedto = new ArrayList<NoticeDTO>();
	BoardDTO boarddto = new BoardDTO();
	
	
	public void saveAlarm(NoticeDTO noticeDTO) {
		ZoneId koreaZone = ZoneId.of("Asia/Seoul");
	    ZonedDateTime  nowInKorea = ZonedDateTime.now(koreaZone);
	    Timestamp currentTimestamp = Timestamp.valueOf(nowInKorea.toLocalDateTime());

	    // 한국 시간으로 설정
	    noticeDTO.setCreate_date(currentTimestamp);
		// 대댓글 = 해당 게시글의 데이터 가져오기
		if (noticeDTO.getCode_name() == "ml004") {
			boarddto.setBoard_idx(Integer.parseInt(noticeDTO.getBoard_idx()));
			boarddto.setFrom_idx(noticeDTO.getFrom_idx());
			boarddto = alarmDAO.getBoardUS(boarddto);
			noticeDTO.setSubject(boarddto.getSubject());
			noticeDTO.setUsername(boarddto.getUsername());
		}
		
		// 결재자에게 결재 요청 알림
		if (noticeDTO.getCode_name() == "ml007") {
			ApprovalDTO appdto =  alarmDAO.getDraftLine(noticeDTO);
			int orderNum = Integer.parseInt(appdto.getOrder_num()); // String -> int
	        appdto.setOrder_num(String.valueOf(orderNum + 1));
			appdto = alarmDAO.getDraft(appdto);
			noticeDTO.setFrom_idx(appdto.getDraft_idx());
			noticeDTO.setUsername(appdto.getUsername());
			noticeDTO.setFrom_id(appdto.getUser_name());
			noticeDTO.setSubject(appdto.getSubject());
		}
		
		// 기안자에게 결재 승인 알림
		if (noticeDTO.getCode_name() == "ml008") {
			ApprovalDTO appdto =  alarmDAO.getDraftLine(noticeDTO);
			noticeDTO.setFrom_id(appdto.getUsername());
	        appdto.setOrder_num("0");
			appdto = alarmDAO.getDraft(appdto);
			noticeDTO.setFrom_idx(appdto.getDraft_idx());
			noticeDTO.setUsername(appdto.getUser_name());
			noticeDTO.setSubject(appdto.getSubject());
		}
		
		// 기안자에게 반려 알림
		if (noticeDTO.getCode_name() == "ml009") {
			ApprovalDTO appdto =  alarmDAO.getDraftLine(noticeDTO);
			noticeDTO.setFrom_id(appdto.getUsername());
	        appdto.setOrder_num("0");
			appdto = alarmDAO.getDraft(appdto);
			noticeDTO.setFrom_idx(appdto.getDraft_idx());
			noticeDTO.setUsername(appdto.getUser_name());
			noticeDTO.setSubject(appdto.getSubject());
		}
		
		// 회의실 예약 알림
		if(noticeDTO.getCode_name() == "ml001") {
			NoticeDTO ndto = alarmDAO.getRoomUser(noticeDTO);
			noticeDTO.setFrom_id(ndto.getFrom_id());
			noticeDTO.setSubject(ndto.getSubject());
		}
		
		// 교육 시청 알림
		if(noticeDTO.getCode_name() == "ml005") {
			List<NoticeDTO> dto = alarmDAO.getEdu(noticeDTO);
			for(NoticeDTO noticedto : dto) {
				noticeDTO.setFrom_idx(noticedto.getFrom_idx());
			}
		}
	
		
		// 보낸 사람의 아이디를 통해 user 테이블의 name 가져오기
		String username = noticeDTO.getFrom_id();
		if(username != null) {
			username = alarmDAO.getUsername(username);
		}else {
			return;
		}
		
		String sub = noticeDTO.getSubject();
		
		switch (noticeDTO.getCode_name()) {
		case "ml001":
			noticeDTO.setSubject("회의 예약 알림이 왔습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;회의실에서 회의 예약이 있습니다.");
			noticeDTO.setUrl("/calender");
			break;
		case "ml002":
			noticeDTO.setSubject("메일이 왔습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp; 메일이 왔습니다.");
			noticeDTO.setUrl("/mail/detail/" + noticeDTO.getFrom_idx());
			break;
		case "ml003":
			noticeDTO.setSubject("게시글에 댓글이 달렸습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;에 댓글이 달렸습니다.");
			noticeDTO.setUrl("/boarddetail/View/" + noticeDTO.getFrom_idx());
			break;
		case "ml004":
			noticeDTO.setSubject("댓글에 답변이 달렸습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;에 대댓글이 달렸습니다.");
			noticeDTO.setUrl("/boarddetail/View/" + noticeDTO.getBoard_idx());
			break;
		case "ml005":
			noticeDTO.setSubject("교육 시청 알림이 왔습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp; 교육 시청 알림이 왔습니다.");
			noticeDTO.setUrl("/u/educationDetail/" + noticeDTO.getBoard_idx());
			break;
		case "ml007":
			noticeDTO.setSubject("결재요청이 왔습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;기안문에 결재 요청이 왔습니다.");
			noticeDTO.setUrl("/approval/detail/" + noticeDTO.getFrom_idx());
			break;
		case "ml008":
			noticeDTO.setSubject("결재가 승인되었습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;기안문 결재가 승인되었습니다.");
			noticeDTO.setUrl("/approval/detail/" + noticeDTO.getFrom_idx());
			break;
		case "ml009":
			noticeDTO.setSubject("결재가 반려되었습니다.");
			noticeDTO.setContent("<b>" + sub + "</b> &nbsp;기안문 결재가 반려되었습니다.");
			noticeDTO.setUrl("/approval/detail/" + noticeDTO.getFrom_idx());
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


	public void setUpdateUrl(NoticeDTO dto) {
		alarmDAO.setUpdateUrl(dto);
	}
	

}
