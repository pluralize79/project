package com.ezen.FSB.dto;

public class GameLikeDTO {
	private int game_like;			// 좋아요 등록 번호(pk)
	private int game_num;			// 보드게임 등록 번호(fk)
	private int mem_num;			// 멤버 번호(fk)
//	private int like_count;			// 좋아요 총 개수	

	
	public int getGame_like() {
		return game_like;
	}
	
	public void setGame_like(int game_like) {
		this.game_like = game_like;
	}
	
	public int getGame_num() {
		return game_num;
	}
	
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	
	public int getMem_num() {
		return mem_num;
	}
	
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

//	public int getLike_count() {
//		return like_count;
//	}
//
//	public void setLike_count(int like_count) {
//		this.like_count = like_count;
//	}
	
	
}