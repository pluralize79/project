package com.ezen.FSB.dto;

public class SH_board_replyDTO {
	private int br_num;
	private String br_content;
	private String br_regdate;
	private int br_re_level;
	private int br_re_step;
	private int br_re_group;
	private int br_report;
	
	private int board_num;
	private int mem_num;
	private String mem_nickname;
	
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	private int board_replycount;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getBr_re_level() {
		return br_re_level;
	}
	public void setBr_re_level(int br_re_level) {
		this.br_re_level = br_re_level;
	}
	public int getBr_num() {
		return br_num;
	}
	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public String getBr_regdate() {
		return br_regdate;
	}
	public void setBr_regdate(String br_regdate) {
		this.br_regdate = br_regdate;
	}
	public int getBr_re_step() {
		return br_re_step;
	}
	public void setBr_re_step(int br_re_step) {
		this.br_re_step = br_re_step;
	}
	public int getBr_re_group() {
		return br_re_group;
	}
	public void setBr_re_group(int br_re_group) {
		this.br_re_group = br_re_group;
	}
	public int getBoard_replycount() {
		return board_replycount;
	}
	public void setBoard_replycount(int board_replycount) {
		this.board_replycount = board_replycount;
	}
	public int getBr_report() {
		return br_report;
	}
	public void setBr_report(int br_report) {
		this.br_report = br_report;
	}
	
}
