<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_list.jsp // 상품 목록 -->

<%@include file="admin_top.jsp" %>

	<!-- 쇼핑몰관리 사이드바 -->
	<%@include file="shop_sidebar.jsp" %>
	
<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(prod_num, prod_img){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f.prod_num.value = prod_num
			document.f.prod_img.value = prod_img
			document.f.submit()
		}
	}
</script>


	<!-- 내용  // 상품 목록 -->
			<div class="container text-center">
			<p>
			<p>
			<div class="row row-cols-1" style="width: 1200px;">
			    	<div class="col">
			    		<p class="fs-5">상품 목록</p>
			    	</div>
			    	<p>
		    		<div class="col">
		    			<form name="f2" action="admin_prod_list.do" method="post">
					<input type="hidden" name="mode" value="find">
					<select name="search">
						<option value="game_name">상품 이름</option>
						<option value="prod_company">제조사</option>
					</select>
					<input type="text" name="searchString">
					<button class="btn btn-secondary btn-sm" type="submit">찾기</button>
						</form>
						<div align="right">
							<button class="btn btn-secondary btn-sm" type="button" onclick="window.location='admin_prod_list.do?mode=all&sort=all'">
							전체 목록 보기</button>&nbsp;&nbsp;
							<div class="btn-group">
								 <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								  정렬
								 </button>
								 <ul class="dropdown-menu">
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=name_asc">상품 이름순 (ㄱ->ㅎ)</a></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=name_desc">상품 이름순 (ㅎ->ㄱ)</a></li>
									 <li><hr class="dropdown-divider"></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=price_asc">가격 순 (1->10)</a></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=price_desc">가격 순 (10->1)</a></li>
									 <li><hr class="dropdown-divider"></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=dis_asc">할인율 순 (1->10)</a></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=dis_desc">할인율 순 (10->1)</a></li>
									 <li><hr class="dropdown-divider"></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=regdate_asc">등록일 순 (오래된 순)</a></li>
									 <li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=regdate_desc">등록일 순 (최근 순)</a></li>
								 </ul>
							</div>
						</div>
					</div>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center">
						<th width="5%" height="50">#</th>
						<th width="15%">상품 이름</th>
						<th width="25%">이미지</th>
						<th width="15%">가격<br>[포인트]</th>
						<th width="10%">할인율</th>
						<th width="10%">제조사</th>
						<th width="10%">등록일</th>
						<th width="10%">삭제</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty listProd}">
						<tr>
							<td colspan="8">등록된 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty listProd}">
					<c:forEach items="${listProd}" var="dto">
						<tr align="center">
							<td  height="170">${dto.prod_num}</td>
							<td>${dto.game_name}</td>
							<td><a href="admin_prod_view.do?prod_num=${dto.prod_num}"><img src="resources/img/${dto.game_img}" width="150" height="150"></a></td>
							<td>
							<c:if test="${dto.prod_price eq 0}"> - 원</c:if>
							<c:if test="${dto.prod_price ne 0}">${df.format(dto.prod_price)} 원</c:if>
							<br><font color="green">[<c:if test="${dto.prod_point eq 0}"> - </c:if>
							<c:if test="${dto.prod_point ne 0}">${df.format(dto.prod_point)}</c:if> point]</font>
							</td>
							<td><font color="red">${dto.prod_discount} %</font></td>
							<td>${dto.prod_company}</td>
							<td>${dto.prod_regdate}</td>
							<td><a href="javascript:checkDel('${dto.prod_num}','${dto.prod_img}')">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<form name="f" action="admin_prod_delete.do" method="post">
					<input type="hidden" name="prod_num"/>
					<input type="hidden" name="prod_img"/>
				</form>
		    		</div>
		    	</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>
						