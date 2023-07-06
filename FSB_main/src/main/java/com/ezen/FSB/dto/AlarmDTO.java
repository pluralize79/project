package com.ezen.FSB.dto;

public class AlarmDTO {
	private String mem_id; //회원 아이디
	private String alm_cate; //알림 카테고리(쿠폰,친구,피드 등)
	private String alm_title; //알림 제목
	private String alm_content; //알림 내용
	private String alm_link;  //알림 눌렀을 때 연동된 링크
	private String alm_read;  //알림 읽음 여부
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAlm_cate() {
		return alm_cate;
	}
	public void setAlm_cate(String alm_cate) {
		this.alm_cate = alm_cate;
	}
	public String getAlm_title() {
		return alm_title;
	}
	public void setAlm_title(String alm_title) {
		this.alm_title = alm_title;
	}
	public String getAlm_content() {
		return alm_content;
	}
	public void setAlm_content(String alm_content) {
		this.alm_content = alm_content;
	}
	public String getAlm_link() {
		return alm_link;
	}
	public void setAlm_link(String alm_link) {
		this.alm_link = alm_link;
	}
	public String getAlm_read() {
		return alm_read;
	}
	public void setAlm_read(String alm_read) {
		this.alm_read = alm_read;
	}
	
			
}
