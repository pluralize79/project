package com.ezen.FSB.dto;

public class ScouponDTO {

	private int sc_num; //쿠폰 넘버
	private String sc_name; //쿠폰 이름
	private String sc_type; //쿠폰 타입(금액/비율)
	private int sc_discount; //쿠폰 할인율
	private String sc_regdate; //쿠폰 등록일
	private String sc_duedate; //쿠폰 만료일
	
	public int getSc_num() {
		return sc_num;
	}
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
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
	public String getSc_regdate() {
		return sc_regdate;
	}
	public void setSc_regdate(String sc_regdate) {
		this.sc_regdate = sc_regdate;
	}
	public String getSc_duedate() {
		return sc_duedate;
	}
	public void setSc_duedate(String sc_duedate) {
		this.sc_duedate = sc_duedate;
	}
		
}
