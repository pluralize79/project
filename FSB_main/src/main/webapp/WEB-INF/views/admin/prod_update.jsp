<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_update.jsp // 상품 수정 폼 -->

<%@include file="admin_top.jsp" %>

	<!-- 쇼핑몰관리 사이드바 -->
	<%@include file="shop_sidebar.jsp" %>
	
	<!-- 내용  // 상품 수정  -->
			<div class="container text-center">
			<p>
			<p>
			<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">상품 수정</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<form name="f" action="admin_prod_update.do" method="post" enctype="multipart/form-data">
					<table class="table align-middle" width="80%" height="80%">
						<tr align="center">
							<th width="15%">상품번호</th><td width="35%">${getProd.prod_num}
							<input type="hidden" name="prod_num" value="${getProd.prod_num}"></td>
							<th width="15%">상품 이름</th><td>${getProd.game_name}</td>
						</tr>
						<tr align="center">
							<th>상품 판매사</th><td><input type="text" class="form-control" name="prod_company" value="${getProd.prod_company}"></td>
							<th>상품 재고<br>(단위 : 개)</th><td><input type="text" class="form-control" name="prod_qty" value="${getProd.prod_qty}" size="15"></td>	
						</tr>
						<tr align="center">
							<th>상품 가격<br>(단위 : 원)</th>
							<td><input type="text" class="form-control" name="prod_price" value="${getProd.prod_price}"></td>
							<th>상품 포인트</th>
							<td><input type="text" class="form-control" name="prod_point" value="${getProd.prod_point}"></td>	
						</tr>
						<tr align="center">
							<th>상품 할인율<br>(단위 : %)</th>
							<td><input type="text" class="form-control" name="prod_discount" value="${getProd.prod_discount}"></td>
							<th>상품 배송비<br>(단위 : 원)</th>
							<td><input type="text" class="form-control" name="prod_delchar" value="${getProd.prod_delchar}"></td>	
						</tr>
						<tr align="center">
							<th>상품 별점</th><td>${getProd.prod_starrating}</td>
							<th>상품 찜수</th><td>${getProd.prod_like}</td>	
						</tr>
						<tr align="center">
							<th height="200">게임 이미지</th>
							<td>
								<c:if test="${empty getProd.game_img}">이미지 없음</c:if>
								<c:if test="${not empty getProd.game_img}"><img src="resources/img/${getProd.game_img}" width="150" height="150"></c:if>
							</td>
							<th height="200">상품 이미지</th>
							<td>
								<img src="resources/img/${getProd.prod_img}" width="150" height="150">
							</td>
						</tr>
						<tr align="left">
							<td colspan="4">
								<input type="file" class="form-control" name="prod_img">
								<input type="hidden" name="prod_img2" value="${getProd.prod_img}">
							</td>
						</tr>
						<tr align="center">
							<td colspan="4">
								<button type="submit" class="btn btn-secondary btn-sm">수정</button>
								<button type="reset" class="btn btn-secondary btn-sm">다시입력</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_prod_list.do?mode=all&sort=all'">목록으로 돌아가기</button>
							</td>	
						</tr>
					</table>
					</form>
		    		</div>
		    	</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>