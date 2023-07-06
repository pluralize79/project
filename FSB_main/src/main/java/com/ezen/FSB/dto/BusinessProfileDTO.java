package com.ezen.FSB.dto;

public class BusinessProfileDTO {

	private int mem_num;
	private int bp_num;
	private String bp_location;
	private String bp_info;
	private String bp_img;
	private int bp_starRating;
	
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getBp_location() {
		return bp_location;
	}
	public void setBp_location(String bp_location) {
		this.bp_location = bp_location;
	}
	public int getBp_num() {
		return bp_num;
	}
	public void setBp_num(int bp_num) {
		this.bp_num = bp_num;
	}
	public String getBp_info() {
		return bp_info;
	}
	public void setBp_info(String bp_info) {
		this.bp_info = bp_info;
	}
	public String getBp_img() {
		return bp_img;
	}
	public void setBp_img(String bp_img) {
		this.bp_img = bp_img;
	}
	public int getBp_starRating() {
		return bp_starRating;
	}
	public void setBp_starRating(int bp_starRating) {
		this.bp_starRating = bp_starRating;
	}
}
