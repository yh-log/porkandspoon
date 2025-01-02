package kr.co.porkandspoon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.porkandspoon.dto.NoticeDTO;
import kr.co.porkandspoon.service.AlarmService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
public class AlarmController {

    Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired AlarmService alarmService;
    
    @GetMapping("/getAlarm/{username}")
    public List<NoticeDTO> getUnconfirmedAlarms(@PathVariable String username) {
        // 로그인한 사용자의 is_confirm = 'N' 알림 가져오기
        List<NoticeDTO> alarms = alarmService.getAlarm(username);
        // 가져온 알림을 확인 상태로 업데이트
        List<NoticeDTO> filteredAlarms = new ArrayList<>();
        for (NoticeDTO alarm : alarms) {
            if (!alarm.getFrom_id().equals(username)) {
                filteredAlarms.add(alarm);
            }
        }

        // 가져온 알림을 확인 상태로 업데이트
        alarmService.updateConfirm(filteredAlarms);

        return filteredAlarms;
        
    }
    
    @GetMapping("/getAlarmList")
    public List<NoticeDTO> getAlarmList(@ModelAttribute NoticeDTO dto) {
    	logger.info("params : {}", dto);
    	List<NoticeDTO> noticedto = alarmService.getAlarmList(dto);
    	return noticedto;
    }
    
    
    
    
    
}
