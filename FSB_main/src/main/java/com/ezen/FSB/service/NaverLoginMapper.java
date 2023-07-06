package com.ezen.FSB.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.MemberDTO;

@Service
public class NaverLoginMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertNaverMember(MemberDTO dto) {
		return sqlSession.insert("insertNaverMember", dto);
	}
	
	public int checkNaverMember(String mem_id) {
		return sqlSession.selectOne("checkNaverMember", mem_id);
	}
}
