package com.ezen.FSB.dto;

public class GameDTO {
	private int game_num;				// 보드게임 등록 번호
	private String game_img;			// 보드게임 이미지
	private String game_name;			// 보드게임 이름
	private String game_player;			// 인원
	private String game_playTime;		// 플레이 시간
	private String game_level;			// 난이도
	private String game_content;		// 게임설명
	private int game_starrating;		// 별점
	private int game_likeCount;			// 좋아요 총 개수
	
	public int getGame_num() {
		return game_num;
	}
	
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	
	public String getGame_img() {
		return game_img;
	}
	
	public void setGame_img(String game_img) {
		this.game_img = game_img;
	}
	
	public String getGame_name() {
		return game_name;
	}
	
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	
	public String getGame_player() {
		return game_player;
	}
	
	public void setGame_player(String game_player) {
		this.game_player = game_player;
	}
	
	public String getGame_playTime() {
		return game_playTime;
	}
	
	public void setGame_playTime(String game_playTime) {
		this.game_playTime = game_playTime;
	}
	
	public String getGame_level() {
		return game_level;
	}
	
	public void setGame_level(String game_level) {
		this.game_level = game_level;
	}
	
	public String getGame_content() {
		return game_content;
	}
	
	public void setGame_content(String game_content) {
		this.game_content = game_content;
	}
	
	public int getGame_starrating() {
		return game_starrating;
	}
	
	public void setGame_starrating(int game_starrating) {
		this.game_starrating = game_starrating;
	}

	public int getGame_likeCount() {
		return game_likeCount;
	}

	public void setGame_likeCount(int game_likeCount) {
		this.game_likeCount = game_likeCount;
	}
	
}
