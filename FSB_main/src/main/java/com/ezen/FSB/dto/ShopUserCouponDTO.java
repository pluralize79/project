package com.ezen.FSB.dto;

public class ShopUserCouponDTO { // 사용자 쿠폰 현황
	private int usc_num;		// seq
	private int mem_num;		// 회원 번호
	private int sc_num;			// 쿠폰 번호
	private String usc_regdate;	// 쿠폰 등록일 (사용자가 쿠폰을 등록한 날)
	private String usc_duedate;	// 쿠폰 만료일
	//sc_duedate 가 null : usc_regdate + 30 일로 usc_duedate 설정
	//sc_duedate 가 null 이 아닌 경우 : sc_date 와 동일하게 usc_duedate 설정
	
	// join을 위해 멤버필드만 생성
	private String sc_name;
	private String sc_type;
	private int sc_discount;
	
	// join 을 위한
	private String mem_nickname;
	
	public int getUsc_num() {
		return usc_num;
	}
	
	public void setUsc_num(int usc_num) {
		this.usc_num = usc_num;
	}
	
	public int getMem_num() {
		return mem_num;
	}
	
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	public int getSc_num() {
		return sc_num;
	}
	
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}
	
	public String getUsc_regdate() {
		return usc_regdate;
	}
	
	public void setUsc_regdate(String usc_regdate) {
		this.usc_regdate = usc_regdate;
	}
	
	public String getUsc_duedate() {
		return usc_duedate;
	}
	
	public void setUsc_duedate(String usc_duedate) {
		this.usc_duedate = usc_duedate;
	}
	
	public String getSc_name() {
		return sc_name;
	}
	
	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
	
	public String getSc_type() {
		return sc_type;
	}
	
	public void setSc_type(String sc_type) {
		this.sc_type = sc_type;
	}
	
	public int getSc_discount() {
		return sc_discount;
	}
	
	public void setSc_discount(int sc_discount) {
		this.sc_discount = sc_discount;
	}
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
}
