package com.ezen.FSB.dto;

public class ShopCardDTO {
	private int card_num;			//보유카드 번호
	private int mem_num;			//회원 번호(foreign key)
	private String card_company;	//보유카드 카드사
	private String card_cnum1;		//보유카드 카드번호1
	private String card_cnum2;		//보유카드 카드번호2
	private String card_cnum3;		//보유카드 카드번호3
	private String card_cnum4;		//보유카드 카드번호4
	private String card_represent;	//보유카드 대표여부
	
	public int getCard_num() {
		return card_num;
	}
	public void setCard_num(int card_num) {
		this.card_num = card_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getCard_company() {
		return card_company;
	}
	public void setCard_company(String card_company) {
		this.card_company = card_company;
	}
	public String getCard_cnum1() {
		return card_cnum1;
	}
	public void setCard_cnum1(String card_cnum1) {
		this.card_cnum1 = card_cnum1;
	}
	public String getCard_cnum2() {
		return card_cnum2;
	}
	public void setCard_cnum2(String card_cnum2) {
		this.card_cnum2 = card_cnum2;
	}
	public String getCard_cnum3() {
		return card_cnum3;
	}
	public void setCard_cnum3(String card_cnum3) {
		this.card_cnum3 = card_cnum3;
	}
	public String getCard_cnum4() {
		return card_cnum4;
	}
	public void setCard_cnum4(String card_cnum4) {
		this.card_cnum4 = card_cnum4;
	}
	public String getCard_represent() {
		return card_represent;
	}
	public void setCard_represent(String card_represent) {
		this.card_represent = card_represent;
	}
	
	
}
