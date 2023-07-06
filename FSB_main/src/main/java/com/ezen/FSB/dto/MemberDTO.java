package com.ezen.FSB.dto;

public class MemberDTO {

	private int mem_num; //회원 번호
	private String mem_id; //회원 아이디
	private String mem_passwd; // 회원 비밀번호
	private String mem_name; //회원 이름
	private String mem_nickname;  //회원 닉네임
	private String mem_mode;  //회원 모드(사업자/개인)
	private String mem_join;  // 가입신청대기
	private int mem_report;  //회원 신고 누적 횟수
	private String mem_img; //회원 프로필 이미지
	private String mem_regdate;  //회원 가입일
	private String mem_msg; //회원 상태메세지
	private String mem_hp1; //회원 첫번호
	private String mem_hp2; //회원 가운데번호
	private String mem_hp3; //회원 끝 번호
	private String mem_recommend; //추천인
	private String mem_sel_agree; //선택동의
	private String mem_bg_img;   //회원이 획득한 뱃지 이미지
	private String mem_bg_name; //회원이 획득한 뱃지 이미지
	private String mem_ac_date; //회원 활동일(하루에 로그인1회만 인정)
	private String mem_tag; // 태그
	//커뮤니티 작성게시글 수   //회원 커뮤니티 작성게시글 수
	//커뮤니티 작성댓글 수    //회원 커뮤니티 작성 댓글 수
	
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_mode() {
		return mem_mode;
	}
	public void setMem_mode(String mem_mode) {
		this.mem_mode = mem_mode;
	}
	public String getMem_join() {
		return mem_join;
	}
	public void setMem_join(String mem_join) {
		this.mem_join = mem_join;
	}
	public int getMem_report() {
		return mem_report;
	}
	public void setMem_report(int mem_report) {
		this.mem_report = mem_report;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public String getMem_msg() {
		return mem_msg;
	}
	public void setMem_msg(String mem_msg) {
		this.mem_msg = mem_msg;
	}
	public String getMem_hp1() {
		return mem_hp1;
	}
	public void setMem_hp1(String mem_hp1) {
		this.mem_hp1 = mem_hp1;
	}
	public String getMem_hp2() {
		return mem_hp2;
	}
	public void setMem_hp2(String mem_hp2) {
		this.mem_hp2 = mem_hp2;
	}
	public String getMem_hp3() {
		return mem_hp3;
	}
	public void setMem_hp3(String mem_hp3) {
		this.mem_hp3 = mem_hp3;
	}
	
	public String getAllHp() {
		if(mem_hp1==null) return "전화없음";
		return mem_hp1+mem_hp2+mem_hp3;
	}
	
	public String getMem_recommend() {
		return mem_recommend;
	}
	public void setMem_recommend(String mem_recommend) {
		this.mem_recommend = mem_recommend;
	}
	public String getMem_sel_agree() {
		return mem_sel_agree;
	}
	public void setMem_sel_agree(String mem_sel_agree) {
		this.mem_sel_agree = mem_sel_agree;
	}
	public String getMem_bg_img() {
		return mem_bg_img;
	}
	public void setMem_bg_img(String mem_bg_img) {
		this.mem_bg_img = mem_bg_img;
	}
	public String getMem_bg_name() {
		return mem_bg_name;
	}
	public void setMem_bg_name(String mem_bg_name) {
		this.mem_bg_name = mem_bg_name;
	}
	public String getMem_ac_date() {
		return mem_ac_date;
	}
	public void setMem_ac_date(String mem_ac_date) {
		this.mem_ac_date = mem_ac_date;
	}
	public String getMem_tag() {
		return mem_tag;
	}
	public void setMem_tag(String mem_tag) {
		this.mem_tag = mem_tag;
	}
		
}
