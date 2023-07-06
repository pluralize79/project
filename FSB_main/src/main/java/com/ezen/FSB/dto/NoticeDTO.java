package com.ezen.FSB.dto;

public class NoticeDTO { // 관리자 작성글
	private int n_num;			// 관리자 글 등록 번호
	private String n_mode;		// 관리자 글 종류 // notice(마이페이지 공지), qna (마이페이지 자주묻는 질문), anony(익명게시판), secondhand(중고게시판), free(자유게시판)
	private String n_title;		// 관리자 글 제목
	private String n_content;	// 관리자 글 내용
	private String n_regdate;	// 관리자 글 작성일
	
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_mode() {
		return n_mode;
	}
	public void setN_mode(String n_mode) {
		this.n_mode = n_mode;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
}
