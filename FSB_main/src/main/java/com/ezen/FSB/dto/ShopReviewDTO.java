package com.ezen.FSB.dto;

public class ShopReviewDTO {
	private int sr_num;			//쇼핑몰리뷰 번호
	private int prod_num;		//상품 번호(foreign key)
	private int mem_num;		//회원 번호(foreign key)
	private int game_num;		//게임 번호(foreign key)
	private int sr_starrating;	//쇼핑몰리뷰 별점
	private String sr_img1;		//쇼핑몰리뷰 이미지1
	private String sr_img2;		//쇼핑몰리뷰 이미지2
	private String sr_img3;		//쇼핑몰리뷰 이미지3
	private String sr_img4;		//쇼핑몰리뷰 이미지4
	private String sr_title;	//쇼핑몰리뷰 제목
	private String sr_content;	//쇼핑몰리뷰 내용
	private String sr_regdate;	//쇼핑몰리뷰 작성일
	
	// join 을 위한 멤버필드
	private String game_name;	//게임명(상품명)
	private String prod_company;//제조회사명(상품회사명)
	private String mem_nickname;//회원닉네임(작성자명)
	
	public int getSr_num() {
		return sr_num;
	}
	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getSr_starrating() {
		return sr_starrating;
	}
	public void setSr_starrating(int sr_starrating) {
		this.sr_starrating = sr_starrating;
	}
	public String getSr_img1() {
		return sr_img1;
	}
	public void setSr_img1(String sr_img1) {
		this.sr_img1 = sr_img1;
	}
	public String getSr_img2() {
		return sr_img2;
	}
	public void setSr_img2(String sr_img2) {
		this.sr_img2 = sr_img2;
	}
	public String getSr_img3() {
		return sr_img3;
	}
	public void setSr_img3(String sr_img3) {
		this.sr_img3 = sr_img3;
	}
	public String getSr_img4() {
		return sr_img4;
	}
	public void setSr_img4(String sr_img4) {
		this.sr_img4 = sr_img4;
	}
	public String getSr_title() {
		return sr_title;
	}
	public void setSr_title(String sr_title) {
		this.sr_title = sr_title;
	}
	public String getSr_content() {
		return sr_content;
	}
	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}
	public String getSr_regdate() {
		return sr_regdate;
	}
	public void setSr_regdate(String sr_regdate) {
		this.sr_regdate = sr_regdate;
	}
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public String getProd_company() {
		return prod_company;
	}
	public void setProd_company(String prod_company) {
		this.prod_company = prod_company;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	
}
