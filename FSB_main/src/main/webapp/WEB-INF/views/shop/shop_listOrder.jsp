<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_cartList.jsp 상품상세 장바구니페이지 -->
<%@include file="shop_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	let usePoint = document.getElentById("point_amount").value;
	
	function checkDel(cart_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f3.cart_num.value = cart_num
			document.f3.submit()
		}
	}
</script>
<!-- ★★★ 센터로 보내는 div class ★★★ -->
<div class="d-flex justify-content-center">
	<div class="container px-5 py-3 border-bottom" id="featured-insertReview">
		<div class="row justify-content-center">
			<div class="col-9">
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
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="shop_listOrder.do"><font color="black">주문결제</font></a></li>
			  </ol>
			</nav>
			<hr>
			</div>
			<div class="col-9 py-2">
			<h4 class="pb-2" align="left">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
				  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z"/>
				  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>
				</svg>
			<b>주문결제 <font size="4px" color="gray">(${count}개의 상품)</font></b></h4>
				<table class="table" border="1" width="100%" align="center">
					<thead>
					<tr align="center">
						<th width="7%">번호</th>
						<th width="33%">상품명</th>
						<th width="12%">상품 가격</th>
						<th width="10%">수량</th>
						<th width="10%">적립</th>
						<th width="13%">주문 금액</th>
						<th width="5%"> </th>
					</tr>
					</thead>
				<c:set var="sum" value="0"/>
							<!-- 상품상세에서 그 상품만 주문할때! -->
				<c:if test="${mode == 'view'}">
					<c:set var="cartTotalPrice" value="0"/>
					<c:set var="cartTotalPoint" value="0"/>
					<c:set var="cartTotalDelchar" value="0"/>
				<c:forEach var="dto" items="${listCart}">
					<c:set var="cartTotalPrice" value="${cartTotalPrice + (dto.prod_price * dto.cart_qty)}"/>
					<c:set var="cartTotalPoint" value="${cartTotalPoint + (dto.prod_point * dto.cart_qty)}"/>
					<c:set var="cartTotalDelchar" value="${cartTotalDelchar + dto.prod_delchar}"/>
					<tr align="center" class="table-light">
						<td>${dto.cart_num}</td>
						<td align="left">[${dto.prod_company}] ${dto.game_name}</td>
						<td>${df.format(dto.prod_price)}원</td>
						<td>
							<form name="f" action="shop_updateCart.do" method="post">
								<div class="input-group input-group-sm">
								  <input type="text" name="cart_qty" class="form-control" placeholder="${dto.cart_qty}" aria-label="cart_qty" aria-describedby="button-addon2">
								  <button class="btn btn-outline-secondary" type="submit">수정</button>
								</div>
								<%-- <input type="text" class="form-control" name="cart_qty" value="${dto.cart_qty}" size="3">
								<button class="btn btn-secondary btn-sm" type="submit" onclick="location.href='shop_updateCart.do?cart_num=${dto.cart_num}'">수정</button> --%>
								<input type="hidden" name="prod_num" value="${dto.prod_num}"/>
								<input type="hidden" name="game_num" value="${dto.game_num}"/>
								<input type="hidden" name="cart_num" value="${dto.cart_num}"/>								
							</form>
						</td>
						<td><font color="blue">${df.format(dto.prod_point * dto.cart_qty)}P</font></td>
					<c:if test="${dto.prod_discount eq 0}">
						<td>${df.format(dto.prod_price * dto.cart_qty)}원</td>
					</c:if>
					<c:if test="${dto.prod_discount ne 0}">
						<td>${df.format((dto.prod_price * dto.cart_qty)-(dto.prod_price * dto.cart_qty * dto.prod_discount * 0.1))}원</td>
					</c:if>
						<td> <!-- 장바구니에 담긴 상품 삭제버튼(X) javascript(shop_view2참고)로 바로 적용되게끔! -->
							<a href="javascript:checkDel('${dto.cart_num}')">
							<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-x-lg" viewBox="0 -4 20 20">
							  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
							</svg>
							</a>
						</td>
					</tr>
				</c:forEach>
				</c:if>
				
				
				
				</table>
				<table width="40%" align="right">
					<tr align="right"> <!-- 선택한 상품 금액 보기! <<< 해야함 -->
						<td>장바구니 총 금액 <br>장바구니 총 적립</td>
						<td width="30%">			<!-- 선택한 상품 포인트 보기! <<< 해야함 -->
							<font color="red">${df.format(cartTotalPrice)}원</font><br>
							<font color="blue">${df.format(cartTotalPoint)}P</font>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-9 py-3">
				<table class="table" border="1" width="100%" align="center">
					<thead>
					<tr>
						<th colspan="3">할인 적용</th>
					</tr>
					</thead>
					<tr class="table-light">
						<td>쿠폰</td>				<!-- if문으로 구분해줘야함!!! type에 따라 다름 -->
						<td>원래 0원 / ${sc_discount}</td>
						<td><button class="btn btn-outline-dark" type="button" onclick="location.href='shop_main.do'">쿠폰 적용</button></td>
					</tr>
					<tr class="table-light">
						<td>포인트</td>	<!-- 사용포인트 -->
						<td><input id="point_amount"></td>
						<td><button class="btn btn-outline-dark" type="button" onclick="location.href='shop_main.do'">쿠폰 적용</button></td>
					</tr>
					<tr>
						<td colspan="2" align="right">보유 마일리지</td>
						<td align="right">${getPoint.point_total}점</td>
					</tr>
				</table>
			</div>			
			<div class="col-9 py-3">
				<table class="table" border="1" width="100%" align="center">
					<thead>
					<tr>
						<th>배송 정보</th>
					</tr>
					</thead>
					<tr class="table-light">
						<td>수령자</td>
						<td></td>
						<td> </td>
					</tr>
					<tr class="table-light">
						<td>휴대전화</td>
						<td><input></td>
						<td> </td>
					</tr>
					<tr class="table-light">
						<td>주소</td>
						<td><input></td>
						<td>주소찾기API</td>
					</tr>
					<tr class="table-light">
						<td>상세 주소</td>
						<td><input></td>
						<td> </td>
					</tr>
					<tr class="table-light">
						<td>배송시 전달사항</td>
						<td><select></select></td>
						<td><textarea rows="" cols=""></textarea></td>
					</tr>
				</table>
			</div>
			<div class="col-9">
				<table width="25%" align="center">
					<tr>
						<td><b>총 결제 금액<br>배송비(조건)<br>할인 적용</b></td>
						<td align="right"><b>${df.format(cartTotalPrice)}원<br>${df.format(cartTotalDelchar)}원<br>(-)${usePoint}</b></td>
					</tr>
				</table>
			</div>
			<div class="col-9 py-3" align="center">
				<button class="btn btn-outline-dark" type="button" onclick="location.href='shop_order.do?mode=cart'">주문결제</button>
				<button class="btn btn-outline-dark" type="button" onclick="location.href='shop_view.do?prod_num=${param.prod_num}'">돌아가기</button>
			</div>
		</div>
	</div>
</div>
					<form name="f3" action="shop_deleteCart.do" method="post">
						<input type="hidden" name="cart_num">
					</form>
<%@include file="shop_bottom.jsp" %>