package com.ezen.FSB.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.FriendDTO;
import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.ProfileDTO;

@Service
public class ProfileMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//(임시)(삭제) 멤버 가져오기
	public MemberDTO getMember(int mem_num) {
		MemberDTO dto = sqlSession.selectOne("getMember", mem_num);
		return dto;
	}
	
	//받은 요청 리스트
	public List<ProfileDTO> requestGotList(int mem_num) {
		List<ProfileDTO> list = sqlSession.selectList("requestGotList", mem_num);
		return list;
	}
	
	//보낸 요청 리스트
	public List<ProfileDTO> requestSentList(int mem_num) {
		List<ProfileDTO> list = sqlSession.selectList("requestSentList", mem_num);
		return list;
	}
	
	//닉네임 자동완성 가져오기
	public List<ProfileDTO> getAutoNickname(String text) {
		List<ProfileDTO> list = sqlSession.selectList("getAutoNickname", text);
		return list;
	}
	
	//프로필 하나 가져오기
	public ProfileDTO getProfile(int mem_num) {
		ProfileDTO dto = sqlSession.selectOne("getProfile", mem_num);
		return dto;
	}
	
	//팔로잉 팔로워 가져오기
	public int[] getFollows(int mem_num) {
		int[] ff = new int[2];
		ff[0] = sqlSession.selectOne("getFollowing", mem_num);
		ff[1] = sqlSession.selectOne("getFollower", mem_num);
		return ff;
	}
	
	//팔로우 상태 확인
	public String[] followCheck(int mem_num, int friend_num) {
		Map<String, Integer> map1 = new Hashtable<>();
		map1.put("mem_num", mem_num);
		map1.put("friend_num", friend_num);
		String myState = sqlSession.selectOne("myFollowCheck", map1);
		String friendState = sqlSession.selectOne("friendFollowCheck", map1);
		String[] states = {myState, friendState};
		return states;
	}
	
	//팔로우
	public int follow(int mem_num, int friend_num) {
		Map map = new Hashtable();
		map.put("mem_num", mem_num);
		map.put("friend_num", friend_num);
		map.put("friend_accept", "follow");
		int res = sqlSession.insert("followNew", map);
		return res;
	}
	
	//팔로우 요청
	public int followRequest(int mem_num, int friend_num) {
		Map map = new Hashtable();
		map.put("mem_num", mem_num);
		map.put("friend_num", friend_num);
		map.put("friend_accept", "request");
		int res = sqlSession.insert("followNew", map);
		return res;
	}
	
	//차단
	public int followBlock(int mem_num, int friend_num) {
		Map map = new Hashtable();
		map.put("mem_num", mem_num);
		map.put("friend_num", friend_num);
		map.put("friend_accept", "block");
		int res = sqlSession.update("followUpdate", map); //기존 친구(혹은 후보) 차단
		if(res==0) {
			res = sqlSession.insert("followNew", map); //낯선사람 일방 차단
		}
		return res;
	}
	
	//언팔로우&팔로우 요청 취소&차단 해제
	public int resetFriend(int mem_num, int friend_num) {
		Map map = new Hashtable();
		map.put("mem_num", mem_num);
		map.put("friend_num", friend_num);
		int res = sqlSession.delete("followDelete", map);
		return res;
	}
	
	//팔로우 요청 승인
	public int followConfirm(int mem_num, int friend_num) {
		Map map = new Hashtable();
		map.put("mem_num", friend_num);
		map.put("friend_num", mem_num);
		map.put("friend_accept", "follow");
		int res = sqlSession.update("followUpdate", map);
		return res;
	}
	
	//팔로우 요청 거절
	public int followReject(int mem_num, int friend_num) {
		Map map = new Hashtable();
		map.put("mem_num", friend_num);
		map.put("friend_num", mem_num);
		int res = sqlSession.delete("followDelete", map);
		return res;
	}
	
}
