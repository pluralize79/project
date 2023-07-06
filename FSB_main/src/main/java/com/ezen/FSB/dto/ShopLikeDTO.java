package com.ezen.FSB.dto;

public class ShopLikeDTO {
	private int sl_num;		//쇼핑몰상품 좋아요번호
	private int prod_num;	//상품 번호(foreign key)
	private int mem_num;	//회원 번호(foreign key)
	
	public int getSl_num() {
		return sl_num;
	}
	public void setSl_num(int sl_num) {
		this.sl_num = sl_num;
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
}
