package com.ezen.FSB.dto;

public class FriendDTO {
	private int mem_num;
	private int friend_num;
	private String friend_accept;
	private String friend_hide;
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getFriend_num() {
		return friend_num;
	}
	public void setFriend_num(int friend_num) {
		this.friend_num = friend_num;
	}
	public String getFriend_accept() {
		return friend_accept;
	}
	public void setFriend_accept(String friend_accept) {
		this.friend_accept = friend_accept;
	}
	public String getFriend_hide() {
		return friend_hide;
	}
	public void setFriend_hide(String friend_hide) {
		this.friend_hide = friend_hide;
	}
}
