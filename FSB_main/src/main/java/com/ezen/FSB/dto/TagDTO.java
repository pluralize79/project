package com.ezen.FSB.dto;

public class TagDTO {
	private int game_num;			// 보드게임 등록 번호
	private String tag_player;		// 인원 : 보류
	private int theme_num;			// 테마 등록 번호
	
	public int getGame_num() {
		return game_num;
	}
	
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	
	public String getTag_player() {
		return tag_player;
	}
	
	public void setTag_player(String tag_player) {
		this.tag_player = tag_player;
	}

	public int getTheme_num() {
		return theme_num;
	}

	public void setTheme_num(int theme_num) {
		this.theme_num = theme_num;
	}
	

}
