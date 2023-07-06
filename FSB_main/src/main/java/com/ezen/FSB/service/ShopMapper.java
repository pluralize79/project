package com.ezen.FSB.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.ShopCartDTO;
import com.ezen.FSB.dto.ShopLikeDTO;
import com.ezen.FSB.dto.ShopProductDTO;
import com.ezen.FSB.dto.ShopQnADTO;
import com.ezen.FSB.dto.ShopReviewDTO;

@Service
public class ShopMapper {
	@Autowired
	private SqlSession sqlSession;
	
	//인기상품 목록, 상품상세
	public ShopProductDTO getProd(int prod_num) {
		return sqlSession.selectOne("getProd", prod_num);
	}
	//상품 검색
	public List<ShopProductDTO> findProd(String search, String searchString){
		Map<String, String> params = new HashMap<>();
		params.put("search", search);
		params.put("searchString", searchString);
		return sqlSession.selectList("findProd", params);
	}
	//전체상품 목록
	public List<ShopProductDTO> listProd(){
		return sqlSession.selectList("listProd");
	}
	//전체상품 이름순 정렬
	public List<ShopProductDTO> sortProd1(String sort){
		return sqlSession.selectList("sortProd1", sort);
	}
	//전체상품 판매순 정렬
	public List<ShopProductDTO> sortProd2(String sort){
		return sqlSession.selectList("sortProd2", sort);
	}
	//전체상품 인기순 정렬
	public List<ShopProductDTO> sortProd3(String sort){
		return sqlSession.selectList("sortProd3", sort);
	}	
	//전체상품 최신순 정렬
	public List<ShopProductDTO> sortProd4(String sort){
		return sqlSession.selectList("sortProd4", sort);
	}	
	//상품상세페이지(view1, view2, view3, view4)-------------------------------------------
	
	//상품상세 리뷰 별점 평균
	public int reviewAvg(int prod_num) {
		return sqlSession.selectOne("shopReviewAvg", prod_num);
	}
	//상품상세 찜하기 등록
	public int insertLike(ShopLikeDTO dto) {
		return sqlSession.delete("prodInsertLike", dto);
	}
	//상품 리뷰 등록
	public int insertReview(ShopReviewDTO dto) {
		return sqlSession.insert("shopinsertReview", dto);
	}
	//상품 리뷰 전체목록(관리자한테 필요할듯?)
	public List<ShopReviewDTO> listReview() {
		return sqlSession.selectList("shoplistReview");
	}
	//상품 리뷰 개수 및 목록 페이지번호
	public int shopviewReviewCount(int prod_num) {
		return sqlSession.selectOne("shopviewReviewCount", prod_num);
	}
	//상품 리뷰 꺼내기(상품상세페이지에서 꺼내기)
	public List<ShopReviewDTO> getViewReview(java.util.Map<String, Integer> params) {
		return sqlSession.selectList("shopgetViewReview", params);
	}	
	//상품 리뷰 꺼내기(수정폼에서 씀)
	public ShopReviewDTO getReview(int sr_num) {
		return sqlSession.selectOne("shopgetReview", sr_num);
	}
	//상품 리뷰 삭제
	public int deleteReview(int sr_num) {
		return sqlSession.delete("shopdeleteReview", sr_num);
	}
	//상품 리뷰 수정
	public int updateReview(ShopReviewDTO dto) {
		return sqlSession.update("shopupdateReview", dto);
	}
	//상품 문의 작성
	public int insertQnA(ShopQnADTO dto) {
		return sqlSession.insert("shopinsertQnA", dto);
	}
	//상품 문의 전체목록(관리자한테 필요할듯?)
	public List<ShopQnADTO> listQnA() {
		return sqlSession.selectList("shoplistQnA");
	}	
	//상품 문의 목록 페이지번호
	public int shopviewQnACount(int prod_num) {
		return sqlSession.selectOne("shopviewQnACount", prod_num);
	}
	//상품 문의 꺼내기(상품상세페이지에서 꺼내기)
	public List<ShopQnADTO> getViewQnA(java.util.Map<String, Integer> params) {
		return sqlSession.selectList("shopgetViewQnA", params);
	}		
	//상품 장바구니 등록
	public int insertCart(ShopCartDTO dto) {
		return sqlSession.insert("shopInsertCart", dto);
	}
	//상품 장바구니 목록
	public List<ShopCartDTO> listCart(){
		return sqlSession.selectList("shopListCart");
	}
	//상품 장바구니 개수구하기
	public int shopCartCount(int prod_num) {
		return sqlSession.selectOne("shopCartCount", prod_num);
	}	
	//상품 장바구니 수정
	public int updateCart(ShopCartDTO dto) {
		return sqlSession.update("shopUpdateCart", dto);
	}
	//상품 장바구니 삭제
	public int deleteCart(int cart_num) {
		return sqlSession.delete("shopDeleteCart", cart_num);
	}
}
