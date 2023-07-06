<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_view2-2.jsp 상품상세 포토리뷰 전체보기페이지 -->
<%@include file="shop_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	var pqty = document.getElentById("pqty");
	//var prod_like = document.getElentById("prod_like");
	
	//javascript:getTotal()
</script>

<!-- ★★★ 센터로 보내는 div class ★★★ -->
<div class="d-flex justify-content-center">
	<div class="container px-5 py-3 bg-light border-bottom" id="featured-view1">
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
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="shop_view.do?prod_num=${getProd.prod_num}"><font color="black">상품상세</font></a></li>
			  </ol>
			</nav>
			<hr>
			</div>
			<div class="col-4">
				<img src="resources/img/game_bang.jpg" width="95%" height="300" alt="bang">
			</div>
			<div class="col-5 py-2" style="height:300px;">
				<h5><b>[${getProd.prod_company}] ${getProd.game_name}</b></h5>
				<h6><img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star1.png" width="20" height="20"></h6>
				<c:if test="${getProd.prod_discount eq 0}">
				<h6>정상가 ${df.format(getProd.prod_price)}원</h6>
				</c:if>
				<c:if test="${getProd.prod_discount > 0}">
				<h6>정상가 <del>${df.format(getProd.prod_price)}</del></h6>
				<h6><font color="red">할인가 <b>${getProd.prod_discount}% ${df.format(getProd.prod_price*(1-getProd.prod_discount/100))}원</b></font></h6>
				</c:if>
				<h6><font color="blue">적립금 ${getProd.prod_point}원 적립</font></h6>
				<h6>배송비 50,000원 이상 무료배송</h6>
				<hr>
				테마별&nbsp&nbsp&nbsp&nbsp&nbsp
				<a href="#"><button type="button" class="btn btn-sm" style="--bs-btn-padding-y: .13rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .90rem; background: rgb(255,216,216);">#추리</button></a>
				<a href="#"><button type="button" class="btn btn-sm" style="--bs-btn-padding-y: .13rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .90rem; background: rgb(250,244,192);">#전략</button></a>
				<br>
				인원수&nbsp&nbsp&nbsp&nbsp&nbsp
				<a href="#"><button type="button" class="btn btn-sm" style="--bs-btn-padding-y: .13rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .90rem; background: rgb(217,229,255);">#4인</button></a>
				<a href="#"><button type="button" class="btn btn-sm" style="--bs-btn-padding-y: .13rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .90rem; background: rgb(232,217,255);">#5인</button></a>
				<a href="#"><button type="button" class="btn btn-sm" style="--bs-btn-padding-y: .13rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .90rem; background: rgb(234,234,234);">#6인</button></a>
				<br>
				난이도&nbsp&nbsp&nbsp&nbsp&nbsp								
				<a href="#"><button type="button" class="btn btn-sm" style="--bs-btn-padding-y: .13rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .90rem; background: rgb(250,244,192);">#☆☆</button></a>
				<hr>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-4">
				<img src="resources/img/empty.jpg" width="100%" height="130">
			</div>
			<div class="col-5 py-2" style="height:130px;">
				<table border="1" width="100%">
					<tr height="35">
						<td align="center" width="33%">주문수량</td>
						<td width="33%"> </td>
						<td align="right" width="33%">
							<a href="#">						
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="currentColor" class="bi bi-file-minus" viewBox="0 0 16 16">
									<path d="M5.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
									<path d="M4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H4zm0 1h8a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
								</svg>
							</a>
							<input type="text" id="pqty" name="pqty" size="3" value="1" onchange="" v-model.number="pqty">
							<a href="#">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="30" fill="currentColor" class="bi bi-file-plus" viewBox="0 0 16 16">								  
							  <path d="M8.5 6a.5.5 0 0 0-1 0v1.5H6a.5.5 0 0 0 0 1h1.5V10a.5.5 0 0 0 1 0V8.5H10a.5.5 0 0 0 0-1H8.5V6z"/>
							  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2zm10-1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1z"/>
							</svg>	
							</a>					
						</td>
					</tr>
					<!-- 이걸로 안되면 위에서 script:getTotal()메소드로 실행해주기 -->
					<c:set var="totalPrice" value="${getProd.prod_price }"/><!--* pqty-->
					<tr height="35">
						<td align="center" width="33%">총 금액</td><!-- 5만원 이상일때만 배송비 0원 -->
						<td width="33%"> </td>
						<td id="totalPrice" align="right" width="33%">${df.format(getProd.prod_price * pqty)}원 </td>
					</tr>
				</table>
				<table border="0">
					<tr height="45">
						<td align="center" width="21.8%">
							<!-- 누르면 꽉찬 하트로 변경하고 f_shop_like에 저장 <<<이부분해야함 -->
							<a href="prod_insertLike.do">
								<c:if test="${empty like}">	<!-- 해당 회원의 상품찜하기가 없다면 빈하트 -->
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg>
								</c:if>
							</a>
							<!-- 누르면 빈 하트로 변경하고 f_shop_like에서 삭제 <<<이부분해야함 -->
							<a href="prod_deleteLike.do">
								<c:if test="${not empty like}">	<!-- 해당 회원의 상품찜하기가 있다면 꽉찬하트 -->
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
									</svg>									
								</c:if>
							</a>
						</td>
						<td align="center">
							<button class="btn btn-outline-dark" type="button" onclick="location.href='shop_cartList';">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp장바구니&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
						</td>
						<td align="center">
							<button class="btn btn-outline-dark" type="button" onclick="location.href='shop_order';">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp구매하기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
						</td>						
					</tr>
				</table>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-9">
			<hr>
			   <ul class="nav nav-tabs">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="shop_view.do?prod_num=${getProd.prod_num}">상세정보</a>
		       </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="shop_view2.do?prod_num=${getProd.prod_num}">상품리뷰</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="shop_view3.do?prod_num=${getProd.prod_num}">배송/반품/교환</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="shop_view4.do?prod_num=${getProd.prod_num}">Q&A</a>
		        </li>
			   </ul>		
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-9 bg-white" align="center">
			<br>
				<h5><img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star1.png" width="20" height="20">
				<b> 4.0/5</b>
				</h5>
			</div>
			<div class="col-4 bg-white border-bottom py-3 pb-2">
				<b>포토리뷰</b>
			</div>
			<div class="col-5 bg-white border-bottom py-3 pb-2" align="right">
				<a href="#"><button class="btn btn-outline-dark" type="button">전체보기</button></a>
			</div>
			<div class="col-9 py-3 bg-white">
				<a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
				<a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
				<a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>								
				<a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>								
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-4 bg-white border-bottom py-3 pb-2">
				<b>리뷰</b> (000)
			</div>
			<div class="col-5 bg-white border-bottom py-3 pb-2" align="right">
				<a href="#"><button class="btn btn-outline-dark" type="button">전체보기</button></a>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-7 bg-white border-bottom py-3 pb-2" height="300">
				<h6>
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star1.png" width="20" height="20">				
				</h6>
				<h6><b>배송 빠르고 재밌게 했어요</b></h6>
				<h6>밸런스 잘 잡혀있고 다른 시리즈도 사고싶어요</h6>
				<a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
			</div>
			<div class="col-1 bg-white border-bottom py-3 pb-2" height="300" align="right">
				<h6><font color="gray">작성자</font></h6>
				<h6><font color="gray">작성일</font></h6>		
				<br><br><br><br><br><br><br><br><br>
				<a href="#"><button class="btn btn-outline-dark" type="button">수정</button></a>	<!-- 로그인시 활성화 -->	
			</div>
			<div class="col-1 bg-white border-bottom py-3" height="300" align="left">
				<h6>jh9609**</h6>
				<h6>2023.06.19</h6>	
				<br><br><br><br><br><br><br><br><br>
				<a href="#"><button class="btn btn-outline-dark" type="button">삭제</button></a>	<!-- 로그인시 활성화 -->			
			</div>
			<div class="col-7 bg-white border-bottom py-3 pb-2" height="300">
				<h6>
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star2.png" width="20" height="20">
				<img src="resources/img/star1.png" width="20" height="20">				
				</h6>
				<h6><b>배송 빠르고 재밌게 했어요</b></h6>
				<h6>밸런스 잘 잡혀있고 다른 시리즈도 사고싶어요</h6>
				<a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
			</div>
			<div class="col-1 bg-white border-bottom py-3 pb-2" height="300" align="right">
				<h6><font color="gray">작성자</font></h6>
				<h6><font color="gray">작성일</font></h6>				
			</div>
			<div class="col-1 bg-white border-bottom py-3" height="300" align="left">
				<h6>jh9609**</h6>
				<h6>2023.06.19</h6>				
			</div>
			<div class="col-9 py-3 bg-white">
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center"">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>									<!-- 게임이랑 관리자 참고!!!<<<해야함 -->
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</div>

<%@include file="shop_bottom.jsp" %>