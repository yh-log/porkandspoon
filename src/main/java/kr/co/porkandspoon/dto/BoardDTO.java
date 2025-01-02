package kr.co.porkandspoon.dto;

import java.time.LocalDateTime;
import java.util.List;

public class BoardDTO {

	private int board_idx;
	private String username;
	private String newname;
	public String getNewname() {
		return newname;
	}
	public void setNewname(String newname) {
		this.newname = newname;
	}
	private String subject;
	private String content;
	private int count;
	private LocalDateTime create_date;
	private String board_state;
	private String use_yn;
	private String board_notice;
	private String userNick;
	private String recreate_date;
	private String new_filename;
	private String status;
	private int sort_order;
	private String name;
	private String from_idx;
	public String getFrom_idx() {
		return from_idx;
	}
	public void setFrom_idx(String from_idx) {
		this.from_idx = from_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSort_order() {
		return sort_order;
	}
	public void setSort_order(int sort_order) {
		this.sort_order = sort_order;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	private int listrow;
	private int reviewrow;
	public int getReviewrow() {
		return reviewrow;
	}
	public void setReviewrow(int reviewrow) {
		this.reviewrow = reviewrow;
	}
	public int getListrow() {
		return listrow;
	}
	public void setListrow(int listrow) {
		this.listrow = listrow;
	}
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}
	public String getRecreate_date() {
		return recreate_date;
	}
	public void setRecreate_date(String recreate_date) {
		this.recreate_date = recreate_date;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	private String updater;
	private LocalDateTime update_date;
	private String department;
	private int page;
	private int cnt;
	private String option;
	private String search;
	private String filtering;
	private List<FileDTO> imgs;
	private int totalpage;
	private String parent;
	private String text;
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<FileDTO> getImgs() {
		return imgs;
	}
	public void setImgs(List<FileDTO> imgs) {
		this.imgs = imgs;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public LocalDateTime getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDateTime create_date) {
		this.create_date = create_date;
	}
	public String getBoard_state() {
		return board_state;
	}
	public void setBoard_state(String board_state) {
		this.board_state = board_state;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getBoard_notice() {
		return board_notice;
	}
	public void setBoard_notice(String board_notice) {
		this.board_notice = board_notice;
	}
	public String getUpdater() {
		return updater;
	}
	public void setUpdater(String updater) {
		this.updater = updater;
	}
	public LocalDateTime getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(LocalDateTime update_date) {
		this.update_date = update_date;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFiltering() {
		return filtering;
	}
	public void setFiltering(String filtering) {
		this.filtering = filtering;
	}
	
	
}
