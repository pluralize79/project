package com.ezen.FSB.dto;

public class ShopCartDTO {
	private int cart_num;	//장바구니 번호
	private int mem_num;	//회원 번호(foreign key)
	private int game_num;	//게임 번호(foreign key)
	private int prod_num;	//상품 번호(foreign key)
	private int cart_qty;	//장바구니 상품개수
	
	// 이렇게 DTO에 넣어주는 이유는 : resultType이 DTO이기때문에
	// join 을 위한 멤버필드
	private String game_name;
	private String prod_company;
	private int prod_price;
	private int prod_point;
	private int prod_delchar;
	private int prod_discount;
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
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
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_point() {
		return prod_point;
	}
	public void setProd_point(int prod_point) {
		this.prod_point = prod_point;
	}
	public int getProd_delchar() {
		return prod_delchar;
	}
	public void setProd_delchar(int prod_delchar) {
		this.prod_delchar = prod_delchar;
	}
	public int getProd_discount() {
		return prod_discount;
	}
	public void setProd_discount(int prod_discount) {
		this.prod_discount = prod_discount;
	}
	public String getProd_company() {
		return prod_company;
	}
	public void setProd_company(String prod_company) {
		this.prod_company = prod_company;
	}
	
}
