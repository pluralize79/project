package com.ezen.FSB.dto;

public class PointHistoryDTO { // 포인트 상세 내역

	private int point_num;			// 포인트 상세내역 seq
	private int mem_num;			// 멤버 seq
	private String point_regdate;	// 발생일
	private String point_type;		// +, - (적립, 사용)
	private String point_content;	// 상세내용
	private int point_amount;		// 포인트 금액
	private int point_total;		// 해당 내역 발생 후, 멤버의 잔액
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getPoint_regdate() {
		return point_regdate;
	}
	public void setPoint_regdate(String point_regdate) {
		this.point_regdate = point_regdate;
	}
	public String getPoint_type() {
		return point_type;
	}
	public void setPoint_type(String point_type) {
		this.point_type = point_type;
	}
	public String getPoint_content() {
		return point_content;
	}
	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public int getPoint_total() {
		return point_total;
	}
	public void setPoint_total(int point_total) {
		this.point_total = point_total;
	}
	
}
