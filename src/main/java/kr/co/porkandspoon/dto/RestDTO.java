package kr.co.porkandspoon.dto;

import java.util.List;

public class RestDTO extends ResponseDTO{

    private int rest_idx;
    private String id;      // 직영점 id
    private String content;  // 휴점 사유
    private String start_date;
    private String end_date;
    private String creater;
    private String create_date;
    private String updater;
    private String update_date;
    private List<FileDTO> imgs;
    private String subject;
    private String username;
    private String position;
    private String store_name;
    private String dept_name;
    private int board_idx;
    private int schedule_idx;
    private int idx;
    private String type;
    private int totalpage;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    private String name;



    public int getTotalpage() {
        return totalpage;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setTotalpage(int totalpage) {
        this.totalpage = totalpage;
    }

    public String getType() {
        return type;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public int getIdx() {
        return idx;
    }

    public void setBoard_idx(int board_idx) {
        this.board_idx = board_idx;
    }

    public void setSchedule_idx(int schedule_idx) {
        this.schedule_idx = schedule_idx;
    }

    public int getBoard_idx() {
        return board_idx;
    }

    public int getSchedule_idx() {
        return schedule_idx;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setStore_name(String store_name) {
        this.store_name = store_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public String getPosition() {
        return position;
    }

    public String getStore_name() {
        return store_name;
    }

    public String getDept_name() {
        return dept_name;
    }

    public String getUsername() {return username;}

    public void setUsername(String username) {this.username = username;}

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getSubject() {return subject;}

    public int getRest_idx() {
        return rest_idx;
    }

    public void setRest_idx(int rest_idx) {
        this.rest_idx = rest_idx;
    }

    public List<FileDTO> getImgs() {
        return imgs;
    }

    public void setImgs(List<FileDTO> imgs) {
        this.imgs = imgs;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getContent() {
        return content;
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
