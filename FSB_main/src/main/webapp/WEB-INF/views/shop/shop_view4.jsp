<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_view.jsp 상세검색/인기상품/전체결과 메인페이지 -->
<%@include file="shop_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	let cart_qty = document.getElentById("cart_qty").value;
	//let prod_like = document.getElentById("prod_like").value;

	function goCart(){
		f.action="shop_insertCart.do;"
		f.submit();
	}
	function goOrder(){
		f.action="shop_order.do?mode=view";//현재 상품만 주문
		f.submit();
	}
	
	function checkLogin() {
		alert("회원 전용 입니다. 로그인 후 이용해 주세요.")
	 }
</script>
<!-- ★★★ 센터로 보내는 div class ★★★ -->
<div class="d-flex justify-content-center">
	<div class="container px-5 py-3 bg-light border-bottom" id="featured-view1">
		<div class="row justify-content-center">
			<div class="col-9 pb-2">
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
				<img src="resources/img/${getProd.game_img}" width="95%" height="350">
			</div>
			<div class="col-5 py-3" style="height:350px;">
				<h5><b>[${getProd.prod_company}] ${getProd.game_name}</b></h5>
				<h6>${getProd.game_content}</h6>
				<c:if test="${reviewAvg eq null}">
				<h6>
					<c:forEach begin="1" end="5">
		           	 <img src="resources/img/star1.png" width="20" height="20">	
		            </c:forEach>				
				</h6>
				</c:if>
				<c:if test="${reviewAvg ne null}">
				<h6>
					<c:if test="${reviewAvg eq 1}">
       					<c:forEach begin="1" end="${reviewAvg}">
       						<img src="resources/img/star2.png" width="20" height="20">
       					</c:forEach>
       					<c:forEach begin="1" end="${5-reviewAvg}">
       						<img src="resources/img/star1.png" width="20" height="20">
       					</c:forEach>
					</c:if>
					<c:if test="${reviewAvg eq 2}">
       					<c:forEach begin="1" end="${reviewAvg}">
       						<img src="resources/img/star2.png" width="20" height="20">
       					</c:forEach>
       					<c:forEach begin="1" end="${5-reviewAvg}">
       						<img src="resources/img/star1.png" width="20" height="20">
       					</c:forEach>
					</c:if>
					<c:if test="${reviewAvg eq 3}">
       					<c:forEach begin="1" end="${reviewAvg}">
       						<img src="resources/img/star2.png" width="20" height="20">
       					</c:forEach>
       					<c:forEach begin="1" end="${5-reviewAvg}">
       						<img src="resources/img/star1.png" width="20" height="20">
       					</c:forEach>
					</c:if>
					<c:if test="${reviewAvg eq 4}">
       					<c:forEach begin="1" end="${reviewAvg}">
       						<img src="resources/img/star2.png" width="20" height="20">
       					</c:forEach>
       					<c:forEach begin="1" end="${5-reviewAvg}">
       						<img src="resources/img/star1.png" width="20" height="20">
       					</c:forEach>
					</c:if>
					<c:if test="${reviewAvg eq 5}">
       					<c:forEach begin="1" end="${reviewAvg}">
       						<img src="resources/img/star2.png" width="20" height="20">
       					</c:forEach>
       					<c:forEach begin="1" end="${5-reviewAvg}">
       						<img src="resources/img/star1.png" width="20" height="20">
       					</c:forEach>
					</c:if>
				</h6>
				</c:if>
				<c:if test="${getProd.prod_discount eq 0}">
				<h5><font size="3">정상가</font> <b>${sessionScope.df.format(getProd.prod_price)}</b><font size="3">원</font></h5>
				</c:if>
				<c:if test="${getProd.prod_discount > 0}">
				<h6>정상가</h6> <h5><del>${sessionScope.df.format(getProd.prod_price)}</del></h5>
				<h6><font color="red">할인가 <b>${getProd.prod_discount}% ${sessionScope.df.format(getProd.prod_price*(1-getProd.prod_discount/100))}원</b></font></h6>
				</c:if>
				<h6><font color="blue">구매적립금 ${getProd.prod_point}원 적립</font></h6>
				<h6><font color="green">리뷰적립금 300원 적립</font></h6>
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
			<br>
            <div align="center">
            <p>
				<button class="btn btn-outline-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
    					전체 쿠폰 다운 받기
  				</button>
			</p>
				<div style="min-height: 100px;">
  				<div class="collapse collapse-horizontal" id="collapseWidthExample">
    				<div class="card card-body" style="width: 300px;">
      					<!-- 쿠폰 중복 다운 막기... -->
      					<c:forEach var="clist" items="${couponList }">
      						${clist.sc_name }
      					<c:if test="${empty sessionScope.mbId }">
							<a href="javascript:checkLogin()">	
								<button type="button" class="btn btn-outline-primary btn-sm">다운로드</button>
							</a>
						</c:if>
						<c:if test="${not empty sessionScope.mbId }">
							<c:forEach var="list" items="${myPageCoupon }">
								<c:if test="${clist.sc_num eq list.sc_num }">
      								<a href="shop_couponDownload.do?sc_num=${clist.sc_num }&prod_num=${getProd.prod_num}&sc_duedate=${clist.sc_duedate}"><button type="button" class="btn btn-outline-primary btn-sm" disabled>다운로드</button></a>
    							</c:if>
    							<%-- <c:if test="${clist.sc_num ne list.sc_num}"> --%>
    								<a href="shop_couponDownload.do?sc_num=${clist.sc_num }&prod_num=${getProd.prod_num}&sc_duedate=${clist.sc_duedate}"><button type="button" class="btn btn-outline-primary btn-sm">다운로드</button></a>
    							<%-- </c:if> --%>
    						</c:forEach>
    					</c:if>
    					</c:forEach>
    				</div>
  				</div>
				</div>
				</div>
			</div>
			<div class="col-5 py-2" style="height:130px;">
				<table border="1" width="100%">
					<tr height="35">
						<td align="center" width="33%">주문수량</td>
						<td width="33%"> </td>
						<td align="right" width="33%">
                  <form name="f" method="post">
                     <div class="input-group input-group-sm">
                       <button class="btn btn-outline-secondary" type="button" onclick="javascript:updateQty()">-</button>
                       <input type="text" name="cart_qty" value="1" class="form-control" placeholder="1" aria-label="cart_qty"  aria-describedby="button-addon2">
                       <button class="btn btn-outline-secondary" type="button" onclick="javascript:updateQty()">+</button>
                     </div>
                     <input type="hidden" name="prod_num" value="${getProd.prod_num}">
                     <input type="hidden" name="game_num" value="${getProd.game_num}">   
                  </form>
						</td>
					</tr>
					<!-- 이걸로 안되면 위에서 script:getTotal()메소드로 실행해주기 -->
					<c:set var="totalPrice" value="${getProd.prod_price * cart_qty}"/>
					<tr height="35">
						<td align="center" width="33%">총 금액</td><!-- 5만원 이상일때만 배송비 0원 -->
						<td width="33%"> </td>
						<td id="totalPrice" align="right" width="33%">${sessionScope.df.format(getProd.prod_price)}원 </td>
					</tr>
				</table>
				<table border="0">
					<tr height="45">
						<td align="center" width="21.8%">
							<!-- 누르면 꽉찬 하트로 변경하고 f_shop_like에 저장 <<<이부분해야함 -->
							<a href="prod_insertLike.do">
								<c:if test="${empty like}">	<!-- 해당 회원의 상품찜하기가 없다면 빈하트 -->
									<font color="red">
									<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg>
									</font>
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
							<button class="btn btn-outline-dark" type="button" onclick="javascript:goCart()">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp장바구니&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
						</td>
						<td align="center">
							<a href="javascript:goOrder()"><button class="btn btn-outline-dark" type="button" onclick="javascript:goOrder()">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp구매하기&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button></a>
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
			<div class="col-9 bg-white">
				<h6 class="py-3 pb-2 border-bottom"><b>문의내역</b></h6>
				<table class="table">
					<thead>
					<tr align="center">
						<th class="table-light">번호</th>
						<th class="table-light">제목</th>
						<th class="table-light">작성자</th>
						<th class="table-light">작성일</th>
					</tr>
					</thead>
<c:if test="${empty getViewQnA}">
	<tr align="center">
		<td colspan="4">등록된 문의 글이 없습니다.</td>
	</tr>				
</c:if>
<c:if test="${not empty getViewQnA}">
					<c:forEach var="dto" items="${getViewQnA}">
					<tr align="center">
						<td>${dto.sq_num}</td>
						<td align="left">
							<c:if test="${dto.sq_secret eq 0 && dto.sq_check eq 0}">
							<a class="link-body-emphasis text-decoration-none" href="shop_viewQnA.do?sq_num=${dto.sq_num}">[${dto.sq_type}]${dto.sq_title} <span class="badge bg-primary-subtle border border-primary-subtle text-primary-emphasis"><font color="black">답변 완료</font></span></a>
							</c:if>
							<c:if test="${dto.sq_secret eq 0 && dto.sq_check eq 1}">
							<a class="link-body-emphasis text-decoration-none" href="shop_viewQnA.do?sq_num=${dto.sq_num}">[${dto.sq_type}]${dto.sq_title} <span class="badge bg-primary-subtle border border-primary-subtle text-primary-emphasis"><font color="black">답변 완료</font></span></a>
							</c:if>
							<c:if test="${dto.sq_secret eq 1 && dto.sq_check eq 0}">
							<a class="link-body-emphasis text-decoration-none" href="shop_viewQnA.do?sq_num=${dto.sq_num}">🔒 [${dto.sq_type}]${dto.sq_title} <span class="badge bg-primary-subtle border border-primary-subtle text-primary-emphasis"><font color="black">답변 완료</font></span></a>
							</c:if>
							<c:if test="${dto.sq_secret eq 1 && dto.sq_check eq 1}">
							<a class="link-body-emphasis text-decoration-none" href="shop_viewQnA.do?sq_num=${dto.sq_num}">🔒[${dto.sq_type}]${dto.sq_title} <font color="black">[답변 완료]</font></a>
							</c:if>
						</td>		
						<td>${dto.mem_nickname}</td>
						<td>${dto.sq_regdate}</td>
					</tr>
					</c:forEach>
</c:if>
				</table>
				<div align="right">
					<a href="shop_insertQnA.do"><button class="btn btn-outline-dark" type="button">문의하기</button></a>
				</div>
			</div>
<form name="f" action="shop_view4.do" method="post">
	<div class="row justify-content-center">
         <div class="col-9 py-3 bg-white">
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
               <c:if test="${count > 0}">
               <c:if test="${startPage > pageBlock}">             
                <li class="page-item">
                  <a class="page-link" href="shop_view4.do?prod_num=${prod_num}&pageNum=${startPage - pageBlock}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li> 
               </c:if>                       
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="page-item"><a class="page-link" href="shop_view4.do?prod_num=${prod_num}&pageNum=${i}">${i}</a></li>
               </c:forEach>
               <c:if test="${endPage < pageCount}">
                <li class="page-item">
                  <a class="page-link" href="shop_view4.do?prod_num=${prod_num}&pageNum=${startPage + pageBlock}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
               </c:if>
               </c:if>
              </ul>
            </nav>
         </div>
	</div>
</form>  
		</div>
	</div>
</div>

<%@include file="shop_bottom.jsp" %>