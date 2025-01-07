package kr.co.porkandspoon.dto;

public class PagingDTO {

    /**
     * author yh.kim, (25.01.07)
     * 페이징 처리 시 DTO 형태로 받아 처리
     * 추가 데이터 필요 시 아래 추가하여 사용
     */
    private int page;
    private int cnt;
    private String option;
    private String keyword;
    private String start_date;
    private String end_date;
    private int limit;
    private int offset;
    private String userYn;

    // page와 cnt를 기반으로 limit과 offset을 계산하는 메서드
    public void calculatePaging() {
        this.limit = this.cnt; // 페이지당 아이템 수
        this.offset = (this.page - 1) * this.cnt; // 시작점 계산
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        calculatePaging(); // page가 설정될 때 limit과 offset 자동 계산
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
        calculatePaging(); // cnt가 설정될 때 limit과 offset 자동 계산
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public String getUserYn() {
        return userYn;
    }

    public void setUserYn(String userYn) {
        this.userYn = userYn;
    }
}
