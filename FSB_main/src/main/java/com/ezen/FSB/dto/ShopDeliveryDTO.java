package com.ezen.FSB.dto;

public class ShopDeliveryDTO {
	private int del_num;		//배송지 번호
	private int mem_num;		//회원 번호(foreign key)
	private String del_name;	//배송지 수령인
	private String del_hp1;		//배송지 수령인휴대번호1
	private String del_hp2;		//배송지 수령인휴대번호2
	private String del_hp3;		//배송지 수령인휴대번호3
	private String del_address1;//배송지 수령인주소1(우편번호)
	private String del_address2;//배송지 수령인주소2(주소)
	private String del_address3;//배송지 수령인주소3(상세주소)
	private String del_msg;		//배송지 배송시요청사항
	
	public int getDel_num() {
		return del_num;
	}
	public void setDel_num(int del_num) {
		this.del_num = del_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getDel_name() {
		return del_name;
	}
	public void setDel_name(String del_name) {
		this.del_name = del_name;
	}
	public String getDel_hp1() {
		return del_hp1;
	}
	public void setDel_hp1(String del_hp1) {
		this.del_hp1 = del_hp1;
	}
	public String getDel_hp2() {
		return del_hp2;
	}
	public void setDel_hp2(String del_hp2) {
		this.del_hp2 = del_hp2;
	}
	public String getDel_hp3() {
		return del_hp3;
	}
	public void setDel_hp3(String del_hp3) {
		this.del_hp3 = del_hp3;
	}
	public String getDel_address1() {
		return del_address1;
	}
	public void setDel_address1(String del_address1) {
		this.del_address1 = del_address1;
	}
	public String getDel_address2() {
		return del_address2;
	}
	public void setDel_address2(String del_address2) {
		this.del_address2 = del_address2;
	}
	public String getDel_address3() {
		return del_address3;
	}
	public void setDel_address3(String del_address3) {
		this.del_address3 = del_address3;
	}
	public String getDel_msg() {
		return del_msg;
	}
	public void setDel_msg(String del_msg) {
		this.del_msg = del_msg;
	}
	
	
}
