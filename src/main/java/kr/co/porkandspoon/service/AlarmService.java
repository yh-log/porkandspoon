package kr.co.porkandspoon.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.porkandspoon.dao.AlarmDAO;
import kr.co.porkandspoon.dto.NoticeDTO;

@Service
public class AlarmService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmDAO alarmDAO;
	List<NoticeDTO> noticedto = new ArrayList<NoticeDTO>();

	public void saveAlarm(NoticeDTO noticeDTO) {
		// 보낸 사용자의 username 을 통해 name 가져오기
		String username = noticeDTO.getFrom_id();
		if(username != null) {
			username = alarmDAO.getUsername(username);
		}
		
		switch (noticeDTO.getCode_name()) {
		case "ml003":
			noticeDTO.setContent("<b>" + username + "</b> &nbsp;님이&nbsp; <b>" + noticeDTO.getSubject() + "</b> &nbsp;게시글에 댓글을 작성했습니다.");
			noticeDTO.setUrl("/boarddetail/View/" + noticeDTO.getFrom_idx());
			break;

		default:
			break;
		}
		alarmDAO.savaAlarm(noticeDTO);
	}

	public List<NoticeDTO> getAlarmList(String username) {
		// TODO Auto-generated method stub
		return null;
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
	

}
