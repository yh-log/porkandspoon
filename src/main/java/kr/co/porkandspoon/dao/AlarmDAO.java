package kr.co.porkandspoon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.porkandspoon.dto.NoticeDTO;

@Mapper
public interface AlarmDAO {

	void savaAlarm(NoticeDTO noticeDTO);

	String getUsername(String username);

	List<NoticeDTO> getNewAlarms(int lastChecked);

	List<NoticeDTO> getAlarm(String username);

	void updateConfirm(int alarm_idx);

}
