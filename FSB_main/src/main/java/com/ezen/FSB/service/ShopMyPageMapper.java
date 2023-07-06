package com.ezen.FSB.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.PointHistoryDTO;
import com.ezen.FSB.dto.ShopCouponDTO;
import com.ezen.FSB.dto.ShopQnADTO;
import com.ezen.FSB.dto.ShopReviewDTO;
import com.ezen.FSB.dto.ShopUserCouponDTO;

@Service
public class ShopMyPageMapper {
	@Autowired
	private SqlSession sqlSession;
	
	// 리뷰 리스트
	public List<ShopReviewDTO> myPageReview(Map<String, Integer> params) {
		return sqlSession.selectList("myPageReview", params);
	}
	
	// 리뷰 삭제
	public int deleteShopReview(int sr_num) {
		return sqlSession.delete("deleteShopReview", sr_num);
	}
	
	// 리뷰 가져오기
	public ShopReviewDTO getMyPageReivew(int sr_num) {
		return sqlSession.selectOne("getMyPageReivew", sr_num);
	}
	
	// 리뷰 수정 시 상품명 가져오기
	public ShopReviewDTO getProdName(int sr_num) {
		return sqlSession.selectOne("getProdName", sr_num);
	}
	
	// 리뷰 수정
	public int updateMyPageReivew(int sr_num) {
		return sqlSession.update("updateMyPageReivew", sr_num);
	}
	
	// 페이지 번호를 위한 shopReviewCount
	public int shopReviewCount(int mem_num) {
		return sqlSession.selectOne("shopReviewCount", mem_num);
	}
	
	// 상품 문의 리스트
	public List<ShopQnADTO> myPageQnA(Map<String, Integer> params) {
		return sqlSession.selectList("myPageQnA", params);
	}
	
	// 페이지 번호를 위한 shopQnACount
	public int shopQnACount(int mem_num) {
		return sqlSession.selectOne("shopQnACount", mem_num);
	}
	
	// 상품 문의 가져오기
	public ShopQnADTO getMyPageQnA(int sq_num) {
		return sqlSession.selectOne("getMyPageQnA", sq_num);
	}
	
	// 상문 문의 삭제
	public int deleteShopQnA(int sq_num) {
		return sqlSession.delete("deleteShopQnA", sq_num);
	}
	
	// 전체 쿠폰 리스트
	public List<ShopCouponDTO> couponList() {
		return sqlSession.selectList("couponList");
	}
	
	// 쿠폰 다운로드 (만료일이 지정 되어 있을 때)
	public int couponDownload(Map<String, Object> params) {
		return sqlSession.insert("couponDownload", params);
	}
	
	// 쿠폰 다운로드 (만료일이 지정 되어 있지 않을 때)
	public int couponDownload2(Map<String, Object> params) { 
		return sqlSession.insert("couponDownload2", params);
	}
	
	// 쿠폰 날짜 가져오기
	public String getCouponDate(int sc_num) {
		return sqlSession.selectOne("getCouponDate", sc_num);
	}
	
	// 내가 보유한 쿠폰 리스트
	public List<ShopUserCouponDTO> myPageCoupon(int mem_num) {
		return sqlSession.selectList("myPageCoupon", mem_num);
	}
	
	// 멤버 별 쿠폰 개수
	public int getCoupon(int mem_num) {
		return sqlSession.selectOne("getCoupon", mem_num);
	}
	
	// 멤버 별 첫 포인트 세팅
	public int memberPoint(PointHistoryDTO dto) {
		return sqlSession.insert("memberPoint", dto);
	}
	
	// 리뷰 작성 시 포인트 적립
	public int reviewPoint(PointHistoryDTO dto) {
		return sqlSession.insert("reviewPoint", dto);
	}
	
	// 멤버 별로 갖고있는 총 포인트
	public int getTotalPoint(int mem_num) {
		return sqlSession.selectOne("getTotalPoint", mem_num);
	}
	
	// 멤버 별로 포인트 내역
	public List<PointHistoryDTO> MemPointList(int mem_num) {
		return sqlSession.selectList("MemPointList", mem_num);
	}

}
