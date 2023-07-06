package com.ezen.FSB.dto;

public class BoardDTO {
	private int board_num; // 게시글 번호
	private int mem_num; // 멤버 넘버 
	private String board_title; // 게시글 제목
	private String board_regdate; // 게시글 작성일 
	private String board_content; // 게시글 내용 
	private String board_ip; // 작성자 아이피
	private String board_readcount; //게시글 조회수 
	
	private String board_img1; // 이미지 1 2 3 4 
	private String board_img2;
	private String board_img3;
	private String board_img4;
	
	private int board_re_level; // 게시글 답글
	private int board_re_step;
	private int board_re_group; // 게시글 그룹
	private int board_anony_check;// 자유, 익명 가름용 상수
	private int board_report; //게시글 신고
	private int board_replycount; // 해당 게시글 댓글 수 
	
	private String mem_nickname; // 테이블엔 없는 닉네임디티오...


	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getBoard_replycount() {
		return board_replycount;
	}
	public void setBoard_replycount(int board_replycount) {
		this.board_replycount = board_replycount;
	}
	public int getBoard_report() {
		return board_report;
	}
	public void setBoard_report(int board_report) {
		this.board_report = board_report;
	}
	
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	

	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
		
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_ip() {
		return board_ip;
	}
	public void setBoard_ip(String board_ip) {
		this.board_ip = board_ip;
	}
	public String getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(String board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_img1() {
		return board_img1;
	}
	public void setBoard_img1(String board_img1) {
		this.board_img1 = board_img1;
	}
	public String getBoard_img2() {
		return board_img2;
	}
	public void setBoard_img2(String board_img2) {
		this.board_img2 = board_img2;
	}
	public String getBoard_img3() {
		return board_img3;
	}
	public void setBoard_img3(String board_img3) {
		this.board_img3 = board_img3;
	}
	public String getBoard_img4() {
		return board_img4;
	}
	public void setBoard_img4(String board_img4) {
		this.board_img4 = board_img4;
	}
	public int getBoard_re_level() {
		return board_re_level;
	}
	public void setBoard_re_level(int board_re_level) {
		this.board_re_level = board_re_level;
	}
	public int getBoard_re_step() {
		return board_re_step;
	}
	public void setBoard_re_step(int board_re_step) {
		this.board_re_step = board_re_step;
	}
	public int getBoard_re_group() {
		return board_re_group;
	}
	public void setBoard_re_group(int board_re_group) {
		this.board_re_group = board_re_group;
	}
	public int getBoard_anony_check() {
		return board_anony_check;
	}
	public void setBoard_anony_check(int board_anony_check) {
		this.board_anony_check = board_anony_check;
	}
	
	
}
