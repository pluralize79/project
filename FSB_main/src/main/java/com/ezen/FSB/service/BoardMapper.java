package com.ezen.FSB.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.BoardDTO;
import com.ezen.FSB.dto.Board_replyDTO;
import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.NoticeDTO;
import com.ezen.FSB.dto.ReportDTO;
import com.ezen.FSB.dto.SH_boardDTO;
import com.ezen.FSB.dto.SH_board_replyDTO;


@Service
public class BoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 리스트 
	public List<NoticeDTO> nlistBoard(String mode) {
		List<NoticeDTO> list = null;
		if(mode.equals("")) {
			list = sqlSession.selectList("nlistBoard_free");
		}else if(mode.equals("anony")) {
			list = sqlSession.selectList("nlistBoard_anony");
		}else if(mode.equals("all")) { // 중고 소트때문에 모드 all로 넘어옴 ㅠ 
			list = sqlSession.selectList("nlistBoard_sh");
		}
		return list;
	}
	
	//사용자 게시판에서 공지사항 상세보긴
	public NoticeDTO getNotice(int n_num) {
		return sqlSession.selectOne("getNotice",n_num);
	}


	//자유, 익명게시판 리스트
	public  List<BoardDTO> listBoard(java.util.Map<String,Integer> params){
		List<BoardDTO> list;
		
		if(params.get("mode")==null) {	
		list = sqlSession.selectList("listBoard", params);
		}else{
		list = sqlSession.selectList("listBoard_anony", params);
			}
		return list;
		}
	
	//자유, 익명 게시판 검색
	public List<BoardDTO> findFree(java.util.Map<String,Object> params) {
		return sqlSession.selectList("findFree", params);
		}
	
	public List<BoardDTO> findAnony(java.util.Map<String,Object> params) {
		return sqlSession.selectList("findAnony", params);
	}
	
	public List<SH_boardDTO> findSH(Map<String, Object> params) {
		return sqlSession.selectList("findSH", params);
	}
	//검색용 페이지 쪽수 뽑기 자유게시판
	public int getCountFind(Map<String, Object> params) {
		int res;
		String search =(String) params.get("search");
		if(search.equals("m.mem_nickname")) {
			res= sqlSession.selectOne("getCountFind_nick", params);
		}else {	
		res= sqlSession.selectOne("getCountFind_Free", params);
		}
		return res;
	}
	//검색용 페이지 쪽수 뽑기 익명게시판
	public int getCountFind_anony(Map<String, Object> params) {
		return sqlSession.selectOne("getCountFind_anony", params);
	}
	
	//검색용 페이지 쪽수 뽑기 중고게시판
	public int getCountFind_sh(Map<String, Object> params) {
		int res;
		String search =(String) params.get("search");
		if(search.equals("m.mem_nickname")) {
			res= sqlSession.selectOne("getCountFind_nick_sh", params);
		}else {	
		res= sqlSession.selectOne("getCountFind_sh", params);
		}
		return res;
	}

	//자유, 익명 게시글 작성
	public  int insertBoard(BoardDTO dto) {
		if(dto.getBoard_num()==0) {
			int getcount;
			if(dto.getBoard_anony_check()==1) {
			getcount = getCountBoard_anony();
			}else {
			getcount = getCountBoard();
			}
			if(getcount ==0) {
				int res = 1;
				dto.setBoard_re_group(res+1);
			}else {
				int res = maxRe_group();
				dto.setBoard_re_group(res+1);
			}
		}else {
			int res = sqlSession.selectOne("maxRe_step", dto.getBoard_re_group());
			dto.setBoard_re_step(res+1);
			dto.setBoard_re_level(1);
		}
		int res = sqlSession.insert("insertBoard", dto);
			return res; 
	
	}
	//자유, 익명 답글
	public int maxRe_group() {
		int res = sqlSession.selectOne("maxRe_group");
		return res;
	}
	public int maxRe_step() {
		int res = sqlSession.selectOne("maxRe_step");
		return res;
	}
	//자유, 익명 게시글 수정
	public int updateBoard(BoardDTO dto) {
		int res = sqlSession.update("updateBoard",dto);
		return res;
	}
	//자유, 익명 게시글 삭제
	public int deleteBoard(int board_num) {
			int res = sqlSession.delete("deleteBoard", board_num);
				return res;
			
	}
	//자유,익명 게시글 상세
	public BoardDTO getBoard(int board_num, String mode) {
			if(mode.equals("content")) {
				sqlSession.update("plusReadcount",board_num);
			}
			
			BoardDTO dto = sqlSession.selectOne("getBoard",board_num);
			return dto;
	}
	//게시글 수 
	public int getCountBoard() {
		int res = sqlSession.selectOne("getCountBoard");
		return res;
	}
	//익명 게시글 수 
		public int getCountBoard_anony() {
			int res = sqlSession.selectOne("getCountBoard_anony");
			return res;
		}
		
	//신고dto 넘기기
		public int report(ReportDTO dto) {
			int res = sqlSession.insert("report", dto);
			return res; 
		}
	//자유, 익명 게시글 신고 
		public int reportBoard(int board_num) {
			int res = sqlSession.update("reportBoard",board_num);
			return res;
		}
	//자유, 익명 댓글 신고	
		public int reportReply(int br_num) {
			int res = sqlSession.update("reportReply",br_num);
			return res;
		}
	//중고 게시글 신고
		public int reportBoard_sh(int board_num) {
			int res = sqlSession.update("reportBoard_sh",board_num);
			return res;
		}
	//중고 댓글 신고 
		public int reportReply_sh(int br_num) {
			int res = sqlSession.update("reportReply_sh",br_num);
			return res;
		}
	
		
	//댓글리스트 
	public List<Board_replyDTO> listReply(Map<String, Integer> params) {
		List<Board_replyDTO> list = sqlSession.selectList("listReply", params);
		return list;
	}
	//중고 게시판 댓글 리스트 
	public List<SH_board_replyDTO> listReply_sh(Map<String, Integer> params) {
		List<SH_board_replyDTO> list = sqlSession.selectList("listReply_sh", params);
		return list;
	}
	//자유 익명  댓글 가져오기
	public Board_replyDTO getReply(int br_num) {
		Board_replyDTO dto = sqlSession.selectOne("getReply",br_num);
		return dto;
	}
	//중고 댓글 가져오기
	public SH_board_replyDTO getReply_sh(int br_num) {
		SH_board_replyDTO dto = sqlSession.selectOne("getReply_sh",br_num);
		return dto;
	}
	//댓글 작성 
	public  int insertReply(Board_replyDTO dto) {
		if(dto.getBr_num()==0) {
			int getcount = getCountReply(dto.getBoard_num());
			if(getcount ==0) {
				int res = 1;
				dto.setBr_re_group(res+1);
			}else {
				int res = maxRe_group_reply();
				dto.setBr_re_group(res+1);
			}
		}else {
			int res = sqlSession.selectOne("maxRe_step_reply", dto.getBr_re_group());
			System.out.println(dto.getBr_re_group());
			dto.setBr_re_step(res+1);
			dto.setBr_re_level(1);
			System.out.println("여기오니");

		}
			int res = sqlSession.insert("insertReply", dto);
			return res;  
		}
	//중고게시판 댓글 작성 
	public int insertReply_sh(SH_board_replyDTO dto) {
			if(dto.getBr_num()==0) {
				int getcount = getCountReply_sh(dto.getBoard_num());
				if(getcount ==0) {
					int res = 1;
					dto.setBr_re_group(res+1);
				}else {
					int res = maxRe_group_reply_sh();
					dto.setBr_re_group(res+1);
				}
			}else {
				int res = sqlSession.selectOne("maxRe_step_reply_sh", dto.getBr_re_group());
				dto.setBr_re_step(res+1);
				dto.setBr_re_level(1);
			}
			int res = sqlSession.insert("insertReply_sh", dto);
				return res;  
			}
	//자유, 익명 리스트에 뽑을 댓글 수 
	public int setReply(Map<String, Integer> params) {
		
		int res = sqlSession.update("setReplycount",params);
		return res;
	}
	public int maxRe_group_reply() {
		int res = sqlSession.selectOne("maxRe_group_reply");
		return res;
	}
	public int maxRe_step_reply() {
		int res = sqlSession.selectOne("maxRe_step_reply");
		return res;
	}
	//자유, 익명 댓글 수 
	public int getCountReply(int board_num) {
		int res = sqlSession.selectOne("getCountReply", board_num);
		return res;
	}
	//중고 댓글 수 
	public int getCountReply_sh(int board_num) {
		int res = sqlSession.selectOne("getCountReply_sh", board_num);
		return res;
	}
	public int maxRe_group_reply_sh() {
		int res = sqlSession.selectOne("maxRe_group_reply_sh");
		return res;
	}
	public int maxRe_step_reply_sh() {
		int res = sqlSession.selectOne("maxRe_step_reply_sh");
		return res;
	}
	//리스트에 뽑을 댓글
	public int setReply_sh(Map<String, Integer> params) {
		
		int res = sqlSession.update("setReplycount_sh",params);
		return res;
	}
	//자유, 익명 댓글 수정 
	public int updateReply(Board_replyDTO dto) {
		return sqlSession.update("updateReply",dto);
	}
	
	//중고 댓글 수정 
		public int updateReply_sh(SH_board_replyDTO dto) {
			return sqlSession.update("updateReply_sh",dto);
		}

	//자유, 익명 댓글 삭제
	public int deleteReply(int br_num) {
		int res = sqlSession.delete("deleteReply",br_num);
		return res;
	}
	
	//중고 댓글 삭제
		public int deleteReply_sh(int br_num) {
			int res = sqlSession.delete("deleteReply_sh",br_num);
			return res;
		}
	//자유 익명 게시글 삭제시 댓글 전체 밀기
		public int deleteReplyAll(int board_num) {
			int res = sqlSession.delete("deleteReplyAll",board_num);
			return res;
		}
	//중고 게시글 삭제 시 해당 게시판 댓글 전체 밀기
		public int deleteReplyAll_sh(int board_num) {
			int res = sqlSession.delete("deleteReplyAll_sh",board_num);
			return res;
		}
	//중고게시판 리스트 
	public  List<SH_boardDTO> listBoard_sh(java.util.Map<String,Object> params){
		List<SH_boardDTO> list;
		String mode = (String)params.get("mode");
		if(mode.equals("all")){
			list = sqlSession.selectList("listBoard_sh", params);
		}else{
			list = sqlSession.selectList("sortlist_sh", params);
		}
		return list;
		}
	
	//중고게시판 게시글 수 
	public int getCountBoard_sh(String mode) {
		int res;
		if(mode.equals("all")) {
			res = sqlSession.selectOne("getCountBoard_sh");
		}else {
			res = sqlSession.selectOne("getCountBoard_sort",mode);
		}
			return res;
		}
	//중고게시판 게시글 작성 
	public int insertBoard_sh(SH_boardDTO dto,String mode) {
		if(dto.getBoard_num()==0) {
			int getcount = getCountBoard_sh(mode);
			if(getcount ==0) {
				int res = 1;
				dto.setBoard_re_group(res+1);
				
			}else {
				int res = maxRe_group();
				dto.setBoard_re_group(res+1);
			}
		}else{
			int res = sqlSession.selectOne("maxRe_step_sh", dto.getBoard_re_group());
			dto.setBoard_re_step(res+1);
			dto.setBoard_re_level(1);
		}
		int res = sqlSession.insert("insertBoard_sh", dto);
			return res; 
	
	}
	
	//중고 게시글 수정
		public int updateBoard_sh(SH_boardDTO dto) {
			int res = sqlSession.update("updateBoard_sh",dto);
			return res;
		}
		//중고 게시글 삭제
		public int deleteBoard_sh(int board_num) {
			int res = sqlSession.delete("deleteBoard_sh", board_num);
					return res;
		}
		//중고 게시글 상세
		public SH_boardDTO getBoard_sh(int board_num, String mode) {
				if(mode.equals("content")) {
					sqlSession.update("plusReadcount_sh",board_num);
				}
				
				SH_boardDTO dto = sqlSession.selectOne("getBoard_sh",board_num);
				return dto;
		}


		
}
