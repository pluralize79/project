package com.ezen.FSB.dto;

public class DirectMessageDTO {
	private int dm_num;
	private int dmr_num; 
	private int mem_num;
	private String dm_content;
	private String dm_time;
	private String dm_hide;
	
	public int getDm_num() {
		return dm_num;
	}
	public void setDm_num(int dm_num) {
		this.dm_num = dm_num;
	}
	public int getDmr_num() {
		return dmr_num;
	}
	public void setDmr_num(int dmr_num) {
		this.dmr_num = dmr_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getDm_content() {
		return dm_content;
	}
	public void setDm_content(String dm_content) {
		this.dm_content = dm_content;
	}
	public String getDm_time() {
		return dm_time;
	}
	public void setDm_time(String dm_time) {
		this.dm_time = dm_time;
	}
	public String getDm_hide() {
		return dm_hide;
	}
	public void setDm_hide(String dm_hide) {
		this.dm_hide = dm_hide;
	}
}
