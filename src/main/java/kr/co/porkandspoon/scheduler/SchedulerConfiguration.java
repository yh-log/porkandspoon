package kr.co.porkandspoon.scheduler;

import kr.co.porkandspoon.service.ManageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@EnableScheduling
@Component
public class SchedulerConfiguration {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    ManageService manageService;

    /**
     * author yh.kim (25.01.04)
     * 휴점 활성 여부 체크 스케쥴러
     * 매일 00:05 실행
     */
    // @Scheduled(fixedDelay = 5000)
    @Scheduled(cron = "0 5 0 * * *")
    public void restCheckScheduler() {
        logger.info("restCheckScheduler");
        manageService.restCheckScheduler();
    }


}
