<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_main.jsp 상세검색/인기상품/전체결과 메인페이지 -->
<%@include file="shop_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- ★★★ 센터로 보내는 div class ★★★ -->
<div class="d-flex justify-content-center">
	<!-- https://getbootstrap.com/docs/5.3/components/navbar/ 네비게이션바 검색창 -->
	<nav class="navbar bg-body-tertiary">
	  <div class="container-fluid" align="center">
	    <form class="d-flex" role="search" action="prod_find.do" method="post">
	      <input class="form-control me-2" name="searchString" type="search" placeholder="검색" aria-label="Search">
	      <!-- https://icons.getbootstrap.com/icons/search/ 아이콘 검색돋보기버튼 -->
			<button name="search" value="search" type="submit" class="btn btn-secondary">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			 	 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
				</svg>
			</button>
	    </form>
	  </div>
	</nav>
</div>
<div align="center">
   <p>
      <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
          	상세보기
      </button>
   </p>
   <div class="collapse collapse-horizontal" id="collapseWidthExample">
    <div class="card card-body" style="width: 1000px;">
     <form name="f" action="game_checkFind.do" method="post">
	   <table width="100%">
	      <tr height="50" align="center">
	         <th bgcolor="#CCCCCC" rowspan="2">테마별</th>
	            <%-- <c:forEach var="tdto" items="${listTheme}"> --%>      
	            <td><input type="checkbox" value="">전략</td>
				<td><input type="checkbox" value="">추리</td>
				<td><input type="checkbox" value="">카드</td>
				<td><input type="checkbox" value="">스릴러/공포</td>
				<td><input type="checkbox" value="">판타지</td>
				<td><input type="checkbox" value="">역사</td>
				<td><input type="checkbox" value="">공상과학</td>
				<td><input type="checkbox" value="">스포츠</td>
	           <%--  </c:forEach> --%>
	      </tr>
	      <tr>
	         <!-- 일단 버튼을 나눠놨는데 마지막에 최종으로 나눌지 합칠지(합쳐서 데이터 표현이 될지)생각하기 -->
	         <td colspan="8" align="right">
	            <button type="submit" class="btn btn-dark">검색하기</button>
	         </td>
	      </tr>
	      <tr height="50" align="center">
	         <th bgcolor="#CCCCCC" rowspan="2">인원별</th>
	         <td><input type="checkbox" name="game_player" value="1"> 1인</td>
	         <td><input type="checkbox" name="game_player" value="2"> 2~4인</td>
	         <td><input type="checkbox" name="game_player" value="3"> 5~6인</td>
	         <td><input type="checkbox" name="game_player" value="4"> 7인 이상</td>
	      </tr>
	      <tr>
	         <td colspan="8" align="right">
	            <button type="submit" class="btn btn-dark">검색하기</button>
	         </td>
	      </tr>
	      <tr height="50" align="center">
	         <th bgcolor="#CCCCCC" rowspan="2">난이도별</th>
						<td><input type="checkbox" value="1">★</td>
						<td><input type="checkbox" value="2">★★</td>
						<td><input type="checkbox" value="3">★★★</td>
						<td><input type="checkbox" value="4">★★★★</td>
						<td><input type="checkbox" value="5">★★★★★</td>
	      </tr>
	      <tr>
	         <td colspan="8" align="right">
	            <button type="submit" class="btn btn-dark">검색하기</button>
	         </td>
	      </tr>
	   </table>
      </form>
     </div>
   </div>
</div>

<!-- <div class="d-flex justify-content-center">
	<button class="btn btn-primary justify-content-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
    	상세보기
  	</button>
  	
	<div class="collapse collapse-horizontal" id="collapseWidthExample">
    	<div class="card card-body" style="width: 1000px;">
			<table width="100%">
				<tr height="50" align="center">
					<th bgcolor="#CCCCCC">테마별</th>
					<td><input type="checkbox" value="">전략</td>
					<td><input type="checkbox" value="">추리</td>
					<td><input type="checkbox" value="">카드</td>
					<td><input type="checkbox" value="">스릴러/공포</td>
					<td><input type="checkbox" value="">판타지</td>
					<td><input type="checkbox" value="">역사</td>
					<td><input type="checkbox" value="">공상과학</td>
					<td><input type="checkbox" value="">스포츠</td>
				</tr>
				<tr height="50" align="center">
					<th bgcolor="#CCCCCC">인원별</th>
					<td><input type="checkbox" value="">1인</td>
					<td><input type="checkbox" value="">2~4인</td>
					<td><input type="checkbox" value="">5~6인</td>
					<td><input type="checkbox" value="">7인 이상</td>
				</tr>
				<tr height="50" align="center">
					<th bgcolor="#CCCCCC">난이도별</th>
					<td><input type="checkbox" value="1">★</td>
					<td><input type="checkbox" value="2">★★</td>
					<td><input type="checkbox" value="3">★★★</td>
					<td><input type="checkbox" value="4">★★★★</td>
					<td><input type="checkbox" value="5">★★★★★</td>
				</tr>
			</table>
  		</div>
	</div>
</div> -->
<br>
<div class="d-flex justify-content-center">
					<!-- padding x,y축 여백 -->
	<div class="container px-3 py-3 bg-light" id="featured-best">
		<!-- 인기 보드게임은 판매수량이 많은 또는 찜수가 많은!!!  -->
		<h4 class="pb-2 border-bottom">인기 보드게임</h4>
		<div class="row row-cols-4">
			<div class="feature col">
				<a href="shop_view.do"><img src="resources/img/game_bang.jpg" width="270" height="270" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
				<h5><a href="shop_view.do">[코리아보드게임즈] 뱅</a></h5>
				<h5>23% <del>28,000원</del></h5>
				<h5><font color="red"><b>21,560원</b></font></h5>
			</div>
			<div class="feature col">
				<a href="shop_view.do"><img src="resources/img/game_bang.jpg" width="270" height="270" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
				<h5><a href="shop_view.do">[코리아보드게임즈] 뱅</a></h5>
				<h5>23% <del>28,000원</del></h5>
				<h5><font color="red"><b>21,560원</b></font></h5>
			</div>
			<div class="feature col">
				<a href="shop_view.do"><img src="resources/img/game_bang.jpg" width="270" height="270" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
				<h5><a href="shop_view.do">[코리아보드게임즈] 뱅</a></h5>
				<h5>23% <del>28,000원</del></h5>
				<h5><font color="red"><b>21,560원</b></font></h5>
			</div>
			<div class="feature col">
				<a href="shop_view.do"><img src="resources/img/game_bang.jpg" width="270" height="270" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
				<h5><a href="shop_view.do">[코리아보드게임즈] 뱅</a></h5>
				<h5>23% <del>28,000원</del></h5>
				<h5><font color="red"><b>21,560원</b></font></h5>
			</div>
		</div>
	</div>
</div>

<div class="d-flex justify-content-center">
	<div class="container px-3 py-5" id="featured-all">
		<h4 class="pb-2 border-bottom">검색된 보드게임</h4>
		<div class="d-flex justify-content-end">
			<div class="input-group mb-3">
			  <select class="form-select" id="inputGroupSelect01" style="width:100px;">
			    <option value="sale" onchange="shop_main.do?sort=#">판매순</option>
			    <option value="best" onchange="shop_main.do?sort=#">인기순</option>
			    <option value="new" onchange="shop_main.do?sort=prod_redate">최신순</option>
			  </select>
			  <select class="form-select" id="inputGroupSelect02" style="width:100px;">
			    <option value="twenty" onchange="shop_main.do?sort=#">20개씩</option>
			    <option value="forty" onchange="shop_main.do?sort=#">40개씩</option>
			    <option value="sixty" onchange="shop_main.do?sort=prod_redate">60개씩</option>
			  </select>
			</div>
		</div>
		<div class="row row-cols-4">
			<c:forEach var="dto" items="${listProd}">
			<div class="feature col">			
				<a href="shop_view.do"><img src="resources/img/${dto.game_img}" width="270" height="270" class="img-responsive img-rounded img-thumbnail"></a>
				<h5><a href="shop_view.do" class="link-dark">[${dto.prod_company}] ${dto.game_name}</a></h5>
				<c:if test="${dto.prod_discount eq 0}">
				<h5><b>${df.format(dto.prod_price)}원</b></h5>
				<h6><font color="orange">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-dots-fill" viewBox="0 0 16 16">
					  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>
					</font>
					<font color="gray">
					<a href="#" class="link-dark d-inline-flex text-decoration-none rounded">후기 000</a>	
					</font>
				</h6>
				</c:if>
				<c:if test="${dto.prod_discount >0}">
				<h5><b><font color="red">${dto.prod_discount}%</font>${df.format(dto.prod_price*(1-dto.prod_discount/100))}원</b></h5>
				<h5><del>${df.format(dto.prod_price)}원</del></h5>
				<h6><font color="blue">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-dots-fill" viewBox="0 0 16 16">
					  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2h-2.5a1 1 0 0 0-.8.4l-1.9 2.533a1 1 0 0 1-1.6 0L5.3 12.4a1 1 0 0 0-.8-.4H2a2 2 0 0 1-2-2V2zm5 4a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>
					</font>
					<font color="gray">
					<a href="#" class="link-dark d-inline-flex text-decoration-none rounded">후기 000</a>	
					</font>
				</h6>
				</c:if>
			</div>
			</c:forEach>
		</div>
	</div>
</div>


<br>
<div class="d-grid gap-2 col-2 mx-auto">
  <a href="#"><button class="btn btn-outline-dark" type="button">더보기</button></a>
</div>
<br>
<%@include file="shop_bottom.jsp" %>