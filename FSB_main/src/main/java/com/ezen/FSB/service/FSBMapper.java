package com.ezen.FSB.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.ShopLikeDTO;
import com.ezen.FSB.dto.ShopProductDTO;
import com.ezen.FSB.dto.ShopReviewDTO;

@Service
public class FSBMapper {
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
	//전체상품 정렬
	public List<ShopProductDTO> sortProd(String sort){
		return sqlSession.selectList("sortProd", sort);
	}
	//상품상세 찜하기 등록
	public int insertLike(ShopLikeDTO dto) {
		return sqlSession.delete("prodInsertLike", dto);
	}
	//상품 리뷰 등록
	public int insertReview(ShopReviewDTO dto) {
		return sqlSession.insert("shopInsertReview", dto);
	}
}
