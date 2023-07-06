<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- shop_myPage_review.jsp -->
<%@include file="shop_myPage_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 리뷰 데이터 끌어오기 부터 천천히 시작하고,
그 다음에 페이지 넘버 적용하기,
sr_num 보낼 방식 찾기 -->
<td>
      <div class="row justify-content-center">
         <div class="col-4 bg-white border-bottom py-3 pb-2">
            <b>리뷰</b> (000)
         </div>
         <div class="col-5 bg-white border-bottom py-3 pb-2" align="right">
         	<!-- <a href="shop_myPage_insert.do">글쓰기</a> -->
            <a href="#">+전체보기</a>
         </div>
      </div>
      <div class="row justify-content-center">
      	 <c:forEach var="dto" items="${listShopReview }">
         <div class="col-7 bg-white border-bottom py-3 pb-2" height="300">
            <h6>
            <img src="resources/img/star2.png" width="20" height="20">
            <img src="resources/img/star2.png" width="20" height="20">
            <img src="resources/img/star2.png" width="20" height="20">
            <img src="resources/img/star2.png" width="20" height="20">
            <img src="resources/img/star1.png" width="20" height="20">            
            </h6>
            <h6><b>${dto.sr_title }</b></h6>
            <h6>${dto.sr_content }</h6>
            <a href="#"><img src="resources/img/game_bang.jpg" width="222" height="222" class="img-responsive img-rounded img-thumbnail" alt="bang"></a>
         </div>
         <div class="col-1 bg-white border-bottom py-3 pb-2" height="300" align="right">
            <h6><font color="gray">작성자</font></h6>
            <h6><font color="gray">작성일</font></h6>            
         </div>
         <div class="col-1 bg-white border-bottom py-3" height="300" align="left">
            <h6>${dto.mem_num }</h6>
            <h6>${dto.sr_regdate }</h6>  
         </div>
         </c:forEach>
         </div>
     </td>
   </tr>
</table>
<%-- <form name="f" action="shop_myPage_review.do" method="post">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
   <c:if test="${count > 0}">
	         <c:if test="${startPage > pageBlock}">
	             <li class="page-item">
	            <a class="page-link" href="shop_myPage_review.do?sr_num=${getGame.game_num}&pageNum=${startPage - pageBlock}" aria-label="Previous">
	              <span aria-hidden="true">&laquo;</span>
	            </a>
	            </li>
	         </c:if>
	         
	         <c:forEach var="i" begin="${startPage}" end="${endPage}">
	             <li class="page-item">
	              <a class="page-link" href="shop_myPage_review.do?sr_num=${getGame.game_num}&pageNum=${i}">${i}</a></li>
	       </c:forEach>
	    
	   <c:if test="${endPage < pageCount}">
	             <li class="page-item">
	               <a class="page-link" href="shop_myPage_review.do?sr_num=${getGame.game_num}&pageNum=${startPage + pageBlock}" aria-label="Next">
	                 <span aria-hidden="true">&raquo;</span>
	              </a>
	          </li>
	        </c:if>  
    </c:if>
     </ul>
</nav>
</form> --%>
<%@include file="shop_myPage_bottom.jsp" %>