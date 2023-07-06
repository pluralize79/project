package com.ezen.FSB.dto;

public class FeedDTO {
	private int feed_num;
	private int mem_num;
	private int bp_num;
	private String feed_content;
	private String feed_img1;
	private String feed_img2;
	private String feed_img3;
	private String feed_img4;
	private int feed_like;
	private int feed_report;
	private String feed_regdate;
	private String feed_open;
	private String feed_hide;
	
	//join용
	private String mem_id; //회원 아이디
	private String mem_nickname; //회원 닉네임
	
	private String prof_img;
	private String prof_open;
	private String prof_hide;
	
	private int friend_num;
	private String friend_accept;
	
	
	public int getFeed_num() {
		return feed_num;
	}
	public void setFeed_num(int feed_num) {
		this.feed_num = feed_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getBp_num() {
		return bp_num;
	}
	public void setBp_num(int bp_num) {
		this.bp_num = bp_num;
	}
	public String getFeed_content() {
		return feed_content;
	}
	public void setFeed_content(String feed_content) {
		this.feed_content = feed_content;
	}
	public String getFeed_img1() {
		return feed_img1;
	}
	public void setFeed_img1(String feed_img1) {
		this.feed_img1 = feed_img1;
	}
	public String getFeed_img2() {
		return feed_img2;
	}
	public void setFeed_img2(String feed_img2) {
		this.feed_img2 = feed_img2;
	}
	public String getFeed_img3() {
		return feed_img3;
	}
	public void setFeed_img3(String feed_img3) {
		this.feed_img3 = feed_img3;
	}
	public String getFeed_img4() {
		return feed_img4;
	}
	public void setFeed_img4(String feed_img4) {
		this.feed_img4 = feed_img4;
	}
	public int getFeed_like() {
		return feed_like;
	}
	public void setFeed_like(int feed_like) {
		this.feed_like = feed_like;
	}
	public int getFeed_report() {
		return feed_report;
	}
	public void setFeed_report(int feed_report) {
		this.feed_report = feed_report;
	}
	public String getFeed_regdate() {
		return feed_regdate;
	}
	public void setFeed_regdate(String feed_regdate) {
		this.feed_regdate = feed_regdate;
	}
	public String getFeed_open() {
		return feed_open;
	}
	public void setFeed_open(String feed_open) {
		this.feed_open = feed_open;
	}
	public String getFeed_hide() {
		return feed_hide;
	}
	public void setFeed_hide(String feed_hide) {
		this.feed_hide = feed_hide;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getProf_img() {
		return prof_img;
	}
	public void setProf_img(String prof_img) {
		this.prof_img = prof_img;
	}
	public String getProf_open() {
		return prof_open;
	}
	public void setProf_open(String prof_open) {
		this.prof_open = prof_open;
	}
	public String getProf_hide() {
		return prof_hide;
	}
	public void setProf_hide(String prof_hide) {
		this.prof_hide = prof_hide;
	}
	public int getFriend_num() {
		return friend_num;
	}
	public void setFriend_num(int friend_num) {
		this.friend_num = friend_num;
	}
	public String getFriend_accept() {
		return friend_accept;
	}
	public void setFriend_accept(String friend_accept) {
		this.friend_accept = friend_accept;
	}
}
