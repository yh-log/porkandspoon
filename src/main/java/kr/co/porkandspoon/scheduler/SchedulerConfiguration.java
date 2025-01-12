package kr.co.porkandspoon.scheduler;

import kr.co.porkandspoon.service.ManageService;
import kr.co.porkandspoon.service.UserService;
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
    @Autowired
    private UserService userService;

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

    /**
     * author yh.kim, (25.01.09)
     * 매출 통계 월별 데이터 저장 스케쥴러
     * 매일 00:01 실행
     */
    @Scheduled(cron = "0 1 0 * * *")
    public void salesMonthScheduler(){
        logger.info("salesMonthScheduler");
        manageService.salesMonthScheduler();
    }

    /**
     * author yh.kim, (25.01.09)
     * 매출 통계 일별 데이터 저장 스케쥴러
     * 매일 00:02 실행
     */
    @Scheduled(cron = "0 2 0 * * *")
    public void salesDailyScheduler(){
        logger.info("salesMonthScheduler");
        manageService.salesDailyScheduler();
    }

    /**
     * author yh.kim, (25.01.11)
     * 퇴사 직원 조회 및 처리
     * 매일 00:03 실행
     */
    //@Scheduled(fixedDelay = 5000)
    @Scheduled(cron = "0 3 0 * * *")
    public void resignationProcessing(){
        logger.info("resignationProcessing");
        userService.resignationProcessing();
    }

}
