package com.ezen.FSB.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.FeedDTO;
import com.ezen.FSB.dto.Feed_themeDTO;

@Service
public class FeedMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<FeedDTO> getTimeline(int mem_num){
		List<FeedDTO> list = sqlSession.selectList("getTimeline", mem_num);
		System.out.println(list);
		return list;
	}
	
	public List<FeedDTO> listTempFeed(){
		List<FeedDTO> list = sqlSession.selectList("listTempFeed");
		return list;
	}
	
	public int insertFeed(FeedDTO dto) {
		int res = sqlSession.insert("insertFeed", dto);
		return res;
	}
	
	public int insertFeed_noBP(FeedDTO dto) {
		int res = sqlSession.insert("insertFeed_noBP", dto);
		return res;
	}
	
	public FeedDTO getFeed(int feed_num){
		FeedDTO dto = sqlSession.selectOne("getFeed", feed_num);
		return dto;
	}
	
	public int deleteFeed(int feed_num) {
		int res = sqlSession.delete("deleteFeed", feed_num);
		return res;
	}
	
	public int updateFeed(FeedDTO dto) {
		int res = sqlSession.update("updateFeed", dto);
		return res;
	}
	
	public int updateReportFeed(int feed_num, int report) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("feed_num", feed_num);
		map.put("feed_num", report);
		int res = sqlSession.update("updateReportFeed", map);
		return res;
	}
	
	public int addLikeFeed(int feed_num) {
		int res = sqlSession.update("updateFeed", feed_num);
		return res;
	}
	
	public int removeLikeFeed(int feed_num) {
		int res = sqlSession.update("removeLikeFeed", feed_num);
		return res;
	}
	
	public int getNextFeedNum() {
		int res = sqlSession.selectOne("getNextFeedNum");
		return res;
	}
	
	public int insertFeedTheme(int feed_num, String[] list) {
		for(String theme :list) {
			int theme_num = Integer.parseInt(theme);
			Feed_themeDTO dto = new Feed_themeDTO();
			dto.setFeed_num(feed_num);
			dto.setTheme_num(theme_num);
			int res = sqlSession.insert("insertFeedTheme",dto);
			if(res != 1) {
				return -1; //���� �߻�
			}
		}
		return 0; //���� 0, ������ -1
	}
	
	public int updateFeedTheme(int feed_num, String[] list) {
		int res = sqlSession.delete("deleteFeedTheme", feed_num);
		res = insertFeedTheme(feed_num, list);
				
		return res; //���� 0, ������ -1
	}
	
	public List<String> getFeedTheme(int feed_num) {
		List<String> list = sqlSession.selectList("getFeedTheme");
		return list;
	}
}
