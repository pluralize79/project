<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_main.jsp 상세검색/인기상품/전체결과 메인페이지 -->
<%@include file="shop_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- ★★★ 센터로 보내는 div class ★★★ -->
<div class="d-flex justify-content-center">
	<div class="container px-5 py-3 border-bottom" id="featured-insertReview">
		<div class="row justify-content-center">
			<div class="col-8">
			<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="user_main.do">
			    	<font color="black"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
					  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
					</svg></font>
			    	<font color="black">Home</font>
			    </a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="shop_main.do"><font color="black">쇼핑몰</font></a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="#"><font color="black">주문목록</font></a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="#"><font color="black">리뷰작성</font></a></li>
			  </ol>
			</nav>
			<hr>
			</div>
			<h4 class="pb-2" align="center">상품 리뷰 수정</h4>
			<div class="col-8 py-2">
				<form name="f" action="shop_updateReview.do" method="post" enctype="multipart/form-data">
				<!-- <input type="hidden" name="mem_num" value="${param.mem_num}"> -->
				<table border="0" width="100%" height="80%" align="center">
					<tr height="50">
						<th width="20%" align="right">상품명</th>												<!-- prod_company와 game_name은 DTO에만 넣어둠! -->
						<%-- <td width="80%"><input type="text" class="form-control" name="game_name" value="${[getReview.prod_company]}${getReview.game_name}"> --%></td>
					</tr>
					<tr height="50">
						<th width="20%">별 &nbsp;점</th>
						<td width="80%">
							<c:if test="${getReview.sr_starrating eq 1}">
							<select name="sr_starrating" class="form-select">
								<option value="1">⭐</option>
								<option value="2">⭐⭐</option>
								<option value="3">⭐⭐⭐</option>
								<option value="4">⭐⭐⭐⭐</option>
								<option value="5">⭐⭐⭐⭐⭐</option>																
							</select>	
							</c:if>
							<c:if test="${getReview.sr_starrating eq 2}">
							<select name="sr_starrating" class="form-select">
								<option value="2">⭐⭐</option>
								<option value="3">⭐⭐⭐</option>
								<option value="4">⭐⭐⭐⭐</option>
								<option value="5">⭐⭐⭐⭐⭐</option>																
								<option value="1">⭐</option>
							</select>
							</c:if>
							<c:if test="${getReview.sr_starrating eq 3}">
							<select name="sr_starrating" class="form-select">
								<option value="3">⭐⭐⭐</option>
								<option value="4">⭐⭐⭐⭐</option>
								<option value="5">⭐⭐⭐⭐⭐</option>																
								<option value="1">⭐</option>
								<option value="2">⭐⭐</option>
							</select>
							</c:if>
							<c:if test="${getReview.sr_starrating eq 4}">
							<select name="sr_starrating" class="form-select">
								<option value="4">⭐⭐⭐⭐</option>
								<option value="5">⭐⭐⭐⭐⭐</option>																
								<option value="1">⭐</option>
								<option value="2">⭐⭐</option>
								<option value="3">⭐⭐⭐</option>
							</select>
							</c:if>
							<c:if test="${getReview.sr_starrating eq 5}">
							<select name="sr_starrating" class="form-select">
								<option value="5">⭐⭐⭐⭐⭐</option>																
								<option value="1">⭐</option>
								<option value="2">⭐⭐</option>
								<option value="3">⭐⭐⭐</option>
								<option value="4">⭐⭐⭐⭐</option>
							</select>
							</c:if>
						</td>			
					</tr>
					<tr height="60">
						<th width="20%">리뷰 제목</th>
						<td width="80%"><input type="text" class="form-control" name="sr_title" value="${getReview.sr_title}"></td>
					</tr>
					<tr height="60">
						<th width="20%">리뷰 내용</th>
						<td width="80%"><textarea name="sr_content" class="form-control" id="sr_content" rows="7" value="${getReview.sr_content}"></textarea></td>
					</tr>
					<tr height="60">
						<th width="20%">사진 첨부</th><!-- Ajex 활용해서 업로드하기!!!<<<해야함 -->
						<td width="80%">
							<input type="file" class="form-control" name="sr_img1">
							<input type="hidden" name="sr_img0" value="${getReview.sr_img1}">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button class="btn btn-outline-dark" type="submit">리뷰수정</button>
							<button class="btn btn-outline-dark" type="button" onclick="window.location='shop_review2.do">돌아가기</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="shop_bottom.jsp" %>