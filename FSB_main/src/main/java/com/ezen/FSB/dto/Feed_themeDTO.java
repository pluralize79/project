package com.ezen.FSB.dto;

public class Feed_themeDTO {
	private int feed_num;
	private int theme_num;
	private String feed_theme_hide;
	
	//join용 필드 
	private String theme_name;
	
	public int getFeed_num() {
		return feed_num;
	}
	public void setFeed_num(int feed_num) {
		this.feed_num = feed_num;
	}
	public int getTheme_num() {
		return theme_num;
	}
	public void setTheme_num(int theme_num) {
		this.theme_num = theme_num;
	}
	public String getFeed_theme_hide() {
		return feed_theme_hide;
	}
	public void setFeed_theme_hide(String feed_theme_hide) {
		this.feed_theme_hide = feed_theme_hide;
	}
	
	//join용 setter getter
	public String getTheme_name() {
		return theme_name;
	}
	public void setTheme_name(String theme_name) {
		this.theme_name = theme_name;
	}
	
}
