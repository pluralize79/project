package com.ezen.FSB.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.MemberDTO;

@Service
public class LoginMapper {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO findMember(String id){ // 회원 찾기
        return sqlSession.selectOne("findMember",id);
     }
	
	public MemberDTO findId(String name){ // 이름으로 찾기
        return sqlSession.selectOne("findId", name);
     }
	
	public List<MemberDTO> idMember(String id){ // 아이디 일치 확인
        return sqlSession.selectList("idMember",id);
     }
	
	public String loginMember(String id){ // 비밀번호 일치 여부 확인
        return sqlSession.selectOne("loginMember", id);
     }
	
	 public int changePw(MemberDTO dto) {
		    return sqlSession.update("changePw", dto);
	 }
	/*
	public int insertStudent(StudentDTO dto) {//오토커밋됨 스프링 이용하면
		return sqlSession.insert("insertStudent", dto); // 루트에 세션등록해놨으니까 . sql문도 안쓰고 클로즈~ 뭐 어쩌구도 안씀
	}
	
	
	public List<StudentDTO> listStudent(){
		return sqlSession.selectList("listStudent");
	}
	
	public int deleteStudent(String id) {
		return sqlSession.delete("deleteStudent", id);
	}
	
	
	*/
}
