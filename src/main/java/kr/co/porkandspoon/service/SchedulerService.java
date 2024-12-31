package kr.co.porkandspoon.service;

import org.springframework.stereotype.Service;
import org.springframework.scheduling.TaskScheduler;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledFuture;

@Service
public class SchedulerService {

    private final TaskScheduler taskScheduler;
    private final Map<String, ScheduledFuture<?>> scheduledTasks = new ConcurrentHashMap<>();

    public SchedulerService(TaskScheduler taskScheduler) {
        this.taskScheduler = taskScheduler;
    }

 // 동적 작업 추가
    public void scheduleTask(String boardIdx, LocalDateTime executeAt, Runnable task) {
        String taskId = "notice-" + boardIdx; // 작업 ID 생성

        // 기존 작업 확인
        if (scheduledTasks.containsKey(taskId)) {
            ScheduledFuture<?> existingTask = scheduledTasks.get(taskId);
            if (existingTask != null && !existingTask.isDone() && !existingTask.isCancelled()) {
                throw new IllegalStateException("이미 스케줄된 작업이 실행 대기 중입니다: " + taskId);
            }
            cancelTask(taskId); // 기존 작업 제거
        }

        try {
            // 새로운 작업 추가
            ScheduledFuture<?> scheduledTask = taskScheduler.schedule(task,
                    Date.from(executeAt.atZone(ZoneId.systemDefault()).toInstant()));
            scheduledTasks.put(taskId, scheduledTask);
            System.out.println("작업 추가됨: " + taskId + " 실행 시점: " + executeAt);
        } catch (Exception e) {
            throw new RuntimeException("스케줄 작업 추가 중 오류 발생: " + taskId, e);
        }
    }

    // 작업 취소
    public void cancelTask(String taskId) {
        ScheduledFuture<?> scheduledTask = scheduledTasks.get(taskId);
        if (scheduledTask != null) {
            try {
                scheduledTask.cancel(false);
                scheduledTasks.remove(taskId);
                System.out.println("작업 취소됨: " + taskId);
            } catch (Exception e) {
                throw new RuntimeException("스케줄 작업 취소 중 오류 발생: " + taskId, e);
            }
        } else {
            System.out.println("취소하려는 작업이 존재하지 않습니다: " + taskId);
        }
    }

    // 작업 상태 확인
    public String getTaskStatus(String taskId) {
        ScheduledFuture<?> scheduledTask = scheduledTasks.get(taskId);
        if (scheduledTask == null) {
            return "작업이 존재하지 않습니다.";
        }

        if (scheduledTask.isCancelled()) {
            return "작업이 취소되었습니다.";
        } else if (scheduledTask.isDone()) {
            return "작업이 완료되었습니다.";
        } else {
            return "작업이 대기 중입니다.";
        }
    }

    // 작업 전체 조회
    public Map<String, String> getScheduledTasksStatus() {
        Map<String, String> taskStatusMap = new HashMap<>();
        scheduledTasks.forEach((taskId, scheduledTask) -> {
            if (scheduledTask.isCancelled()) {
                taskStatusMap.put(taskId, "취소됨");
            } else if (scheduledTask.isDone()) {
                taskStatusMap.put(taskId, "완료됨");
            } else {
                taskStatusMap.put(taskId, "대기 중");
            }
        });
        return taskStatusMap;
    }
}