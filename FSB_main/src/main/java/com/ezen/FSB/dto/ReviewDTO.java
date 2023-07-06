package com.ezen.FSB.dto;

public class ReviewDTO {
	private int review_num;				// 한줄평 등록 번호
	private int game_num;				// 보드게임 등록 번호
	private int mem_num;				// 회원 번호
	private int review_starrating;		// 별점 (보드게임과 별도)
	private String review_content;		// 한줄 평
	private String review_report;		// 신고 유무 // 신고 X : 0 // 신고 O : 1, 2, 3, 4, 5
	private String review_regdate;		// 등록일
	
	//join 을 위한
	private String mem_nickname;
	
	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getReview_num() {
		return review_num;
	}
	
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	
	public int getGame_num() {
		return game_num;
	}
	
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	public int getReview_starrating() {
		return review_starrating;
	}
	
	public void setReview_starrating(int review_starrating) {
		this.review_starrating = review_starrating;
	}
	
	public String getReview_content() {
		return review_content;
	}
	
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public String getReview_report() {
		return review_report;
	}
	
	public void setReview_report(String review_report) {
		this.review_report = review_report;
	}
	
	public String getReview_regdate() {
		return review_regdate;
	}
	
	public void setReview_regdate(String review_regdate) {
		this.review_regdate = review_regdate;
	}
}
