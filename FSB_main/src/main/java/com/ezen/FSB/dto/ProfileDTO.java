package com.ezen.FSB.dto;

public class ProfileDTO {
	private int mem_num;
	private String prof_nickname_separated;
	private String prof_img;
	private String prof_msg;
	private int prof_following;
	private int prof_follower;
	private String prof_open;
	private String prof_hide;
	
	//join용 필드
	private String mem_id; //회원 아이디
	private String mem_nickname;  //회원 닉네임
	private String m_friend_accept; //이 프로필에 대한 본인의 친구 상태
	private String f_friend_accept; //나에 대한 이 프로필의 친구 상태
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getProf_nickname_separated() {
		return prof_nickname_separated;
	}
	public void setProf_nickname_separated(String prof_nickname_separated) {
		this.prof_nickname_separated = prof_nickname_separated;
	}
	public String getProf_img() {
		return prof_img;
	}
	public void setProf_img(String prof_img) {
		this.prof_img = prof_img;
	}
	public String getProf_msg() {
		return prof_msg;
	}
	public void setProf_msg(String prof_msg) {
		this.prof_msg = prof_msg;
	}
	public int getProf_following() {
		return prof_following;
	}
	public void setProf_following(int prof_following) {
		this.prof_following = prof_following;
	}
	public int getProf_follower() {
		return prof_follower;
	}
	public void setProf_follower(int prof_follower) {
		this.prof_follower = prof_follower;
	}
	public String getProf_open() {
		return prof_open;
	}
	public void setProf_open(String prof_open) {
		this.prof_open = prof_open;
	}
	public String getProf_hide() {
		return prof_hide;
	}
	public void setProf_hide(String prof_hide) {
		this.prof_hide = prof_hide;
	}
	
	//join용
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getM_friend_accept() {
		return m_friend_accept;
	}
	public void setM_friend_accept(String m_friend_accept) {
		this.m_friend_accept = m_friend_accept;
	}
	public String getF_friend_accept() {
		return f_friend_accept;
	}
	public void setF_friend_accept(String f_friend_accept) {
		this.f_friend_accept = f_friend_accept;
	}
}
