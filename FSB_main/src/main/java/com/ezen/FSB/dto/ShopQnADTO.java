package com.ezen.FSB.dto;

public class ShopQnADTO {
	private int sq_num;			//쇼핑몰문의글 번호
	private int prod_num;		//상품 번호(foreign key)
	private int mem_num;		//회원 번호(foreign key)
	private String sq_type;		//쇼핑몰문의글 종류
	private String sq_img1;		//쇼핑몰문의글 이미지1
	private String sq_img2;		//쇼핑몰문의글 이미지2
	private String sq_img3;		//쇼핑몰문의글 이미지3
	private String sq_img4;		//쇼핑몰문의글 이미지4
	private String sq_title;	//쇼핑몰문의글 제목
	private String sq_content;	//쇼핑몰문의글 내용
	private String sq_passwd;	//쇼핑몰문의글 비밀번호
	private String sq_regdate;	//쇼핑몰문의글 작성일
	private int sq_re_group;	//쇼핑몰문의글 답변그룹
	private int sq_re_step;		//쇼핑몰문의글 답변순서
	private int sq_re_level;	//쇼핑몰문의글 답변깊이
	private String sq_report;	//쇼핑몰문의글 신고유무
	private String sq_check;	//쇼핑몰문의글 처리유무
	private int sq_secret;		//쇼핑몰문의글 비밀글유무
	private String sq_reply;	//쇼핑몰문의글 관리자 답변

	// join 을 위한 멤버필드
	private String game_name;	//게임명(상품명)
	private String prod_company;//제조회사명(상품회사명)
	private String mem_nickname;//회원닉네임(작성자명)
	
	public int getSq_num() {
		return sq_num;
	}
	public void setSq_num(int sq_num) {
		this.sq_num = sq_num;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public String getSq_type() {
		return sq_type;
	}
	public void setSq_type(String sq_type) {
		this.sq_type = sq_type;
	}
	public String getSq_img1() {
		return sq_img1;
	}
	public void setSq_img1(String sq_img1) {
		this.sq_img1 = sq_img1;
	}
	public String getSq_img2() {
		return sq_img2;
	}
	public void setSq_img2(String sq_img2) {
		this.sq_img2 = sq_img2;
	}
	public String getSq_img3() {
		return sq_img3;
	}
	public void setSq_img3(String sq_img3) {
		this.sq_img3 = sq_img3;
	}
	public String getSq_img4() {
		return sq_img4;
	}
	public void setSq_img4(String sq_img4) {
		this.sq_img4 = sq_img4;
	}
	public String getSq_title() {
		return sq_title;
	}
	public void setSq_title(String sq_title) {
		this.sq_title = sq_title;
	}
	public String getSq_content() {
		return sq_content;
	}
	public void setSq_content(String sq_content) {
		this.sq_content = sq_content;
	}
	public String getSq_passwd() {
		return sq_passwd;
	}
	public void setSq_passwd(String sq_passwd) {
		this.sq_passwd = sq_passwd;
	}
	public String getSq_regdate() {
		return sq_regdate;
	}
	public void setSq_regdate(String sq_regdate) {
		this.sq_regdate = sq_regdate;
	}
	public int getSq_re_group() {
		return sq_re_group;
	}
	public void setSq_re_group(int sq_re_group) {
		this.sq_re_group = sq_re_group;
	}
	public int getSq_re_step() {
		return sq_re_step;
	}
	public void setSq_re_step(int sq_re_step) {
		this.sq_re_step = sq_re_step;
	}
	public int getSq_re_level() {
		return sq_re_level;
	}
	public void setSq_re_level(int sq_re_level) {
		this.sq_re_level = sq_re_level;
	}
	public String getSq_report() {
		return sq_report;
	}
	public void setSq_report(String sq_report) {
		this.sq_report = sq_report;
	}
	public String getSq_check() {
		return sq_check;
	}
	public void setSq_check(String sq_check) {
		this.sq_check = sq_check;
	}
	public int getSq_secret() {
		return sq_secret;
	}
	public void setSq_secret(int sq_secret) {
		this.sq_secret = sq_secret;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getSq_reply() {
		return sq_reply;
	}
	public void setSq_reply(String sq_reply) {
		this.sq_reply = sq_reply;
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
