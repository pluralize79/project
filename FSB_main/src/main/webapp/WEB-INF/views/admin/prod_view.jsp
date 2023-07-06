<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- prod_view.jsp // 상품 상세보기 -->
<%@include file="admin_top.jsp" %>

	<!-- 쇼핑몰관리 사이드바 -->
	<%@include file="shop_sidebar.jsp" %>
	
<!-- 삭제 script -->
<script type="text/javascript">
	function imgView(sr_num){
		window.open("admin_prod_view_img.do?sr_num="+sr_num, "", "width=500, height=500")
}
</script>
	<!-- 내용  // 상품 상세보기 -->
			<div class="container text-center">
			<p>
			<p>
			<div class="row row-cols-2" style="width: 1400px;">
				<div class="col" style="overflow: scroll; width: 700px; height: 800px;">
					<p class="fs-5">상품 상세보기</p>
					<table class="table align-middle" width="80%" height="80%">
						<tr align="center">
							<th width="15%">상품번호</th><td width="35%">${getProd.prod_num}</td>
							<th width="15%">게임번호</th><td width="35%">${getProd.game_num}</td>
						</tr>
						<tr align="center">
							<th>상품 이름</th><td>${getProd.game_name}</td>
							<th>제조사</th><td>${getProd.prod_company}</td>	
						</tr>
						<tr align="center">
							<th>상품 가격<br><font color="green">[point]</font></th>
							<td>
								<c:if test="${getProd.prod_price eq 0}">
								- 원 <br>
									<c:if test="${getProd.prod_point eq 0}"> [- point]</c:if>
									<c:if test="${getProd.prod_point ne 0}"><font color="green">[${df.format(getProd.prod_point)} point]</font></c:if>
								
								</c:if>
								<c:if test="${getProd.prod_price ne 0}">
								${df.format(getProd.prod_price)} 원 <br>
									<c:if test="${getProd.prod_point eq 0}"> [- point]</c:if>
									<c:if test="${getProd.prod_point ne 0}"><font color="green">[${df.format(getProd.prod_point)} point]</font></c:if>
								</c:if>
							</td>
							<th>할인율</th>
							<td><font color="red">${getProd.prod_discount} %</font></td>	
						</tr>
						<tr align="center">
							<th>상품 재고</th>
							<td>
								<c:if test="${getProd.prod_qty eq 0}"> - 개</c:if>
								<c:if test="${getProd.prod_qty ne 0}">${df.format(getProd.prod_qty)} 개</c:if>
							</td>
							<th>배송비</th>
							<td>
								<c:if test="${getProd.prod_delchar eq 0}"> - 원</c:if>
								<c:if test="${getProd.prod_delchar ne 0}">${df.format(getProd.prod_delchar)} 원</c:if>
							</td>	
						</tr>
						<tr align="center">
							<th>상품 별점</th><td>
							<img src="resources/img/star2.png" width="25" height="25">&nbsp;
							<c:if test="${empty starrating}">-</c:if><c:if test="${not empty starrating}">${starrating}</c:if></td>
							<th>상품 찜수</th><td>
							❤${getProd.prod_like}</td>	
						</tr>
						<tr align="center">
							<th height="200">게임<br>이미지</th>
							<td>
								<c:if test="${empty getProd.game_img}">이미지 없음</c:if>
								<c:if test="${not empty getProd.game_img}"><img src="resources/img/${getProd.game_img}" width="150" height="150"></c:if>
							</td>
							<th height="200">상품<br>이미지</th>
							<td>
								<img src="resources/img/${getProd.prod_img}" width="150" height="150">
							</td>
						</tr>
						<tr align="center">
							<td colspan="4">
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_prod_update.do?prod_num=${getProd.prod_num}'">수정</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_game_view.do?mode=all&game_num=${getProd.game_num}'">게임 상세보기</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_prod_list.do?mode=all&sort=all'">목록으로 돌아가기</button>
							</td>	
						</tr>
					</table>
		    		</div>
		  	<div class="col" style="overflow: scroll; width:700px; height: 800px;" align="center">
				<p>
				<p class="fs-5">상품 리뷰</p>
				<div align="right">💬 리뷰 : ${reviewCount} 건</div>
				<table class="table" width="100%">
					<thead>
						<tr align="center">
							<th scope="col" height="40">번호</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">내용보기</th>
							<th scope="col">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty listReview}">
							<tr align="center">
								<th colspan="6">등록된 리뷰가 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${not empty listReview}">
							<c:forEach items="${listReview}" var="dto">
								<tr align="center">
									<td>${dto.sr_num}</td>
									<td>${dto.mem_nickname}</td>
									<td>${dto.sr_title}</td>
									<td>${dto.sr_regdate}</td>
									<td>
									<a data-bs-toggle="collapse" href="#collapseExample${dto.sr_num}" role="button" aria-expanded="false" aria-controls="collapseExample${dto.sr_num}">
										내용 보기
  									</a>
  									</td>
  									<td><a href="#">삭제</a>
  								</tr>
  								<tr>
  									<td colspan="6">
										<div class="collapse" id="collapseExample${dto.sr_num}">
	  										<div class="card card-body">
	  										<div align="left">
	  										별점 : 
	  										<c:forEach var="i" begin="1" end="5">
	  										<c:if test="${(dto.sr_starrating - i) >= 0}">
	  											<img src="resources/img/star2.png" width="25" height="25">
	  										</c:if>
	  										<c:if test="${(dto.sr_starrating - i) <0}">
	  											<img src="resources/img/star1.png" width="25" height="25">
	  										</c:if>
	  										</c:forEach>
											&nbsp;첨부파일 :
	  										<c:if test="${not empty dto.sr_img1}"><a href="javascript:imgView('${dto.sr_num}')"><img src="resources/img/camera.jpg" width="25" height="25"></a></c:if>
	  										<c:if test="${empty dto.sr_img1}">
	  											없음
	  										</c:if>
	  										</div>
	  										<br>${dto.sr_content}
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>