<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_cartList.jsp 상품상세 장바구니페이지 -->
<%@include file="shop_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	var checkCart = $('input:checkbox[id='checkCart']').val();

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
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="shop_listCart.do"><font color="black">장바구니</font></a></li>
			  </ol>
			</nav>
			<hr>
			</div>
			<div class="col-9 py-2">
			<h4 class="pb-2" align="left">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart4" viewBox="0 0 18 18">
				  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				</svg>			
			<b>장바구니 <font size="4px" color="gray">(${count}개의 상품)</font></b></h4>
				<table class="table" border="1" width="100%" align="center">
					<thead>
					<tr align="center">
						<th width="5%"> </th>
						<th width="7%">번호</th>
						<th width="28%">상품명</th>
						<th width="12%">상품 가격</th>
						<th width="10%">수량</th>
						<th width="10%">적립</th>
						<th width="13%">주문 금액</th>
						<th width="5%"> </th>
					</tr>
					</thead>
				<c:if test="${empty listCart}">
					<tr align="center" class="table-light">
						<td colspan="6">등록된 상품이  없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty listCart}">
					<c:set var="cartTotalPrice" value="0"/>
					<c:set var="cartTotalPoint" value="0"/>
					<c:set var="cartTotalDelchar" value="0"/>
				<c:forEach var="dto" items="${listCart}">
					<c:set var="cartTotalPrice" value="${cartTotalPrice + (dto.prod_price * dto.cart_qty)}"/>
					<c:set var="cartTotalPoint" value="${cartTotalPoint + (dto.prod_point * dto.cart_qty)}"/>
					<c:set var="cartTotalDelchar" value="${cartTotalDelchar + dto.prod_delchar}"/>
					<tr align="center" class="table-light">
						<td>
							<input type="checkbox" name="checkCart" id="checkCart" value="${dto.cart_num}" checked>
						</td>
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
					<tr align="center">
						<th>판매자</th>
						<th>배송 정보</th>
						<th>총 배송비</th>
					</tr>
					</thead>
				<c:if test="${empty listCart}">
					<tr align="center" class="table-light">
						<td colspan="5">배송 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty listCart}">
				<c:forEach var="dto" items="${listCart}">
					<tr align="center" class="table-light">
						<td>${dto.prod_company}</td>
						<td align="left">상품 <font color="#8000FF">50,000원 이상</font> 구매 시 배송비 <b><font color="#8000FF">무료</font></b></td>
					<!-- 체크박스로 상품 선택시 dto로 선택여부 파악해서 ~ 선택한상품가격에 대한 배송비 적용시키기! <<< 해야함!  -->
					<c:if test="${dto.prod_price*dto.cart_qty < 50000}">
						<td>${df.format(dto.prod_delchar)}원</td>
					</c:if>
					<c:if test="${dto.prod_price*dto.cart_qty >= 50000}">
						<td>무료</td>
					</c:if>
					</tr>
				</c:forEach>
				</c:if>
				</table>
				<table width="40%" align="right">
					<tr align="right"> <!-- 선택한 상품 배송비 보기! <<< 해야함 -->
						<td>장바구니 총 배송비</td>
					<c:if test="${cartTotalPrice < 50000}">
						<td width="30%"><font color="#8000FF">3,000원</font></td>
					</c:if>
					<c:if test="${cartTotalPrice >= 50000}">
						<td width="30%"><font color="#8000FF">무료</font></td>
					</c:if>					
					</tr>	
				</table>			
			</div>			
			<div class="col-9 py-3">
				<table class="table" border="1" width="100%" align="center">
					<thead>
					<tr align="left">
						<th>구매 관련 참고사항</th>
					</tr>
					</thead>
					<tr class="table-light">
						<td>
							❕주문결제 시 해당 상품의 품절로 주문이 안 될 수 있습니다.<br>
							❕결제금액의 총합계는 마일리지 적용 전의 가격입니다.<br>
							❕보유하고 계신 마일리지는 주문 상품결제 시 사용 가능합니다.<br>
							❕배송기간은 등록업체 및 배송사의 사정에 의해 다소 차이가 있을 수 있습니다.<br>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-9">
				<table width="25%" align="center">
					<tr>
						<td><b>총 결제 금액<br>배송비(조건)</b></td>
						<td align="right"><b>${df.format(cartTotalPrice)}원<br>${df.format(cartTotalDelchar)}원</b></td>
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