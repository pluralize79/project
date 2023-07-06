<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="myPage_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- myPage_prodQnA.jsp -->
<script type="text/javascript">
	function checkDel(sq_num, mem_num) {
		var isDel = window.confirm("정말로 삭제하시겠습니까?")
		if (isDel) {
			document.f2.sq_num.value = sq_num
			document.f2.mem_num.value = mem_num
			document.f2.submit()
		}
	}
</script>
<td>
   <div class="row justify-content-center">
         <div class="col-9 bg-white">
            <h6 class="py-3 pb-2 border-bottom"><b>문의내역</b> (${count })</h6>
            <table class="table">
            <c:if test="${empty myPageQnA }">
            	작성한 상품 문의 내역이 없습니다.
            </c:if>
               <c:forEach var="dto" items="${myPageQnA }">
               <div class="accordion" id="accordionExample">
  				<div class="accordion-item">
    			<h2 class="accordion-header">
      			<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${dto.sq_num }" aria-expanded="true" aria-controls="collapse${dto.sq_num }">
        			<c:if test="${dto.sq_secret eq 1 }">
        				🔒&nbsp;
        			</c:if>
        				${dto.sq_title }
        			<c:if test="${dto.sq_check eq 1 }">
        				<b>&nbsp;[답변 완료]</b>
        			</c:if>
        			 &nbsp;${dto.sq_regdate }
      			</button>
    			</h2>
    			<div id="collapse${dto.sq_num }" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      			<div class="accordion-body">
      				<div align="right">
      					<a href="shop_myPage_ProdQnA_update.do?sq_num=${dto.sq_num }"><input type="button" value="수정"></a>
      					<a href="javascript:checkDel('${dto.sq_num}','${getMemNum }')"><input type="button" value="삭제"></a>
      				</div>
        		<strong>문의 내역 : </strong><br>
        		<c:if test="${dto.sq_img1 ne null }">
					<img src="resources/img/${dto.sq_img1 }" width="100" height="100">
				</c:if>
				<c:if test="${dto.sq_img2 ne null }">
					<img src="resources/img/${dto.sq_img2 }" width="100" height="100">
				</c:if>
				<c:if test="${dto.sq_img3 ne null }">
					<img src="resources/img/${dto.sq_img3 }" width="100" height="100">
				</c:if>
				<c:if test="${dto.sq_img4 ne null }">
					<img src="resources/img/${dto.sq_img4 }" width="100" height="100">
				</c:if>
				<br><br><br>
				${dto.sq_content }
				<br>
				<br>
				<br>
        		<code>관리자 답변 : </code> 넣어주기
      			</div>
    			</div>
  				</div>
  				</div>
             </c:forEach>
            </table>
         </div>
      </div>
     </td>
   </tr>
</table>
<div align="center">
<form name="f" action="shop_myPage_prodQnA.do" method="post">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
   <c:if test="${count > 0}">
	         <c:if test="${startPage > pageBlock}">
	             <li class="page-item">
	            <a class="page-link" href="shop_myPage_prodQnA.do?mem_num=${getMemNum }&pageNum=${startPage - pageBlock}" aria-label="Previous">
	              <span aria-hidden="true">&laquo;</span>
	            </a>
	            </li>
	         </c:if>
	         
	         <c:forEach var="i" begin="${startPage}" end="${endPage}">
	             <li class="page-item">
	              <a class="page-link" href="shop_myPage_prodQnA.do?mem_num=${getMemNum }&pageNum=${i}">${i}</a></li>
	       </c:forEach>
	    
	   <c:if test="${endPage < pageCount}">
	             <li class="page-item">
	               <a class="page-link" href="shop_myPage_prodQnA.do?mem_num=${getMemNum }&pageNum=${startPage + pageBlock}" aria-label="Next">
	                 <span aria-hidden="true">&raquo;</span>
	              </a>
	          </li>
	        </c:if>  
    </c:if>
     </ul>
</nav>
</form>
</div>
<form name="f2" action="shop_myPage_qna_delete.do" method="post">
	<input type="hidden" name="sq_num">
	<input type="hidden" name="mem_num">
	<input type="hidden" name="sq_img1" value="${dto.sq_img1 }">
	<input type="hidden" name="sq_img2" value="${dto.sq_img2 }">
	<input type="hidden" name="sq_img3" value="${dto.sq_img3 }">
	<input type="hidden" name="sq_img4" value="${dto.sq_img4 }">
</form>
<%@include file="myPage_bottom.jsp" %>