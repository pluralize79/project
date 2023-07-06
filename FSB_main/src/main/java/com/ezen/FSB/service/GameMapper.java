package com.ezen.FSB.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.GameLikeDTO;
import com.ezen.FSB.dto.ReportDTO;
import com.ezen.FSB.dto.ReviewDTO;
import com.ezen.FSB.dto.TagDTO;

@Service
public class GameMapper {
	
	@Autowired
	private SqlSession sqlSession;
// 보드게임
	// 검색으로 찾기
	public List<GameDTO> findGame(String searchString) {
		return sqlSession.selectList("findGame", searchString);
	}
	
	// 상세보기로 찾기(테마별)
	public List<GameDTO> checkListGame1(int tag) {
		return sqlSession.selectList("checkListGame1", tag);
	}
	
	// 상세보기로 찾기(인원별)
	public List<GameDTO> checkListGame2 (int game_player) {
		return sqlSession.selectList("checkListGame2", game_player);
	}
	
	// 상세보기로 찾기(별점별)
	public List<GameDTO> checkListGame3(int game_level) {
		return sqlSession.selectList("checkListGame3", game_level);
	}
	
	// 게임 리스트
	public List<GameDTO> listGame() {
		return sqlSession.selectList("listGame");
	}
	
	// 이름 순으로 정렬
	public List<GameDTO> sortGame1(String sort) {
		return sqlSession.selectList("sortGame1", sort);
	}
	
	// 인원 순으로 정렬
	public List<GameDTO> sortGame2(String sort) {
		return sqlSession.selectList("sortGame2", sort);
	}
	
	// 별점 순으로 정렬
	public List<GameDTO> sortGame3(String sort) {
		return sqlSession.selectList("sortGame3", sort);
	}
	
	// 좋아요 순으로 정렬
	public List<GameDTO> sortGame4(String sort) {
		return sqlSession.selectList("sortGame4", sort);
	}
	
	// 게임 상세설명
	public GameDTO getGame(int game_num) {
		return sqlSession.selectOne("getGame", game_num);
	}
	
	// 게임 상세설명의 별점 평균
	public int reviewAvg(int game_num) {
		return sqlSession.selectOne("reviewAvg", game_num);
	}
	
	// 게임 상세보기 시 뜨는 태그
	public List<TagDTO> gameTag(int game_num) {
		return sqlSession.selectList("gameTag", game_num);
	}

// 한줄평
	//	한줄평 등록
	public int insertReview(ReviewDTO dto) {
		return sqlSession.insert("insertReview", dto);
	}
	
	// 한줄평 리스트
	public List<ReviewDTO> listReview(java.util.Map<String, Integer> params) {
		return sqlSession.selectList("listReview", params);
	}
	
	// 한줄평 목록(최신 순)
	public List<ReviewDTO> sortReview1(Map<String, Integer> params) {
		return sqlSession.selectList("sortReview1", params);
	}
	
	// 한줄평 목록(오래된 순)
	public List<ReviewDTO> sortReview2(Map<String, Integer> params) {
		return sqlSession.selectList("sortReview2", params);
	}
	
	// 한줄평 목록(별점 높은 순)
	public List<ReviewDTO> sortReview3(Map<String, Integer> params) {
		return sqlSession.selectList("sortReview3", params);
	}
	
	// 한줄평 목록(별점 낮은 순)
	public List<ReviewDTO> sortReview4(Map<String, Integer> params) {
		return sqlSession.selectList("sortReview4", params);
	}
	
	// 페이지 번호를 위한 getCount
	public int getCount(int game_num) {
		return sqlSession.selectOne("getCount", game_num);
	}
	
	// 한줄평 삭제
	public int deleteReview(int review_num) {
		return sqlSession.delete("deleteReview", review_num);
	}
	
	// 한줄평 신고를 위한 메소드
	public int GameReviewReport(ReportDTO dto) {
		return sqlSession.insert("GameReviewReport", dto);
	}
	
	// 신고를 눌렀을 때 +1 증가
	public int updateReviewReport(int review_num) {
		return sqlSession.update("updateReviewReport", review_num);
	}
	
	// 좋아요를 누른 회원인지 아닌지 구분하기 위해 구하는 리스트
	public List<GameLikeDTO> likeCheckMem(Map<String, Integer> params) {
		return sqlSession.selectList("likeCheckMem", params);
	}
	
	// 좋아요DTO에 insert
	public int GameLike(GameLikeDTO dto) {
		return sqlSession.insert("gameLike", dto);
	}
	
	// 좋아요 누른 총 개수
	public int gameLikeCount(int game_num) {
		return sqlSession.selectOne("gameLikeCount", game_num);
	}
	
	// 좋아요 누른거 해제
	public int gameLikeDelete(Map<String, Integer> params) {
		return sqlSession.delete("gameLikeDelete", params);
	}
	
	// 좋아요 정렬 시키기 위해 update
	public int gameLikeUpdate(Map<String, Integer> params) {
		return sqlSession.update("gameLikeUpdate", params);
	}
	
}
