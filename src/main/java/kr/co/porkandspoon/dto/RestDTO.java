package kr.co.porkandspoon.dto;

public class RestDTO extends ResponseDTO{

    private String id;      // 직영점 id
    private String reason;  // 휴점 사유
    private String start_date;
    private String end_date;
    private String creater;
    private String create_date;
    private String updater;
    private String update_date;

    public void setId(String id) {
        this.id = id;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getId() {
        return id;
    }

    public String getReason() {
        return reason;
    }

    public String getStart_date() {
        return start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public String getCreater() {
        return creater;
    }

    public String getCreate_date() {
        return create_date;
    }

    public String getUpdater() {
        return updater;
    }

    public String getUpdate_date() {
        return update_date;
    }
}
