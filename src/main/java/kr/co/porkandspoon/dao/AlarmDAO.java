package kr.co.porkandspoon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.ApprovalDTO;
import kr.co.porkandspoon.dto.BoardDTO;
import kr.co.porkandspoon.dto.CalenderDTO;
import kr.co.porkandspoon.dto.NoticeDTO;

@Mapper
public interface AlarmDAO {

	void savaAlarm(NoticeDTO noticeDTO);

	String getUsername(String username);

	List<NoticeDTO> getNewAlarms(int lastChecked);

	List<NoticeDTO> getAlarm(String username);

	void updateConfirm(int alarm_idx);

	BoardDTO getBoardUS(BoardDTO boarddto);

	List<NoticeDTO> getAlarmList(NoticeDTO dto);

	ApprovalDTO getDraftLine(NoticeDTO noticeDTO);

	ApprovalDTO getDraft(ApprovalDTO appdto);

	NoticeDTO getRoomUser(NoticeDTO noticeDTO);

	void setUpdateUrl(NoticeDTO dto);

	List<NoticeDTO> getEdu(NoticeDTO noticeDTO);


}
