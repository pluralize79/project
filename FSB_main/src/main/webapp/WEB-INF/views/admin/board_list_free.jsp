<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- board_list_free.jsp // 자유게시판 목록 -->

<%@include file="admin_top.jsp" %>

	<!-- 커뮤니티 관리 사이드바 -->
	<%@include file="board_sidebar.jsp" %>
	
<!-- 삭제 script -->
<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(board_num, board_img1, board_img2, board_img3, board_img4){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f2.board_num.value = board_num
			document.f2.board_img1.value = board_img1
			document.f2.board_img2.value = board_img2
			document.f2.board_img3.value = board_img3
			document.f2.board_img4.value = board_img4
			document.f2.submit()
		}
	}
</script>


	<!-- 내용  // 자유 게시판 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="overflow: scroll; height: 800px;">
			    	<div class="col">
			    		<p class="fs-5">자유 게시판 목록</p>
			    	</div>
			    	<p>
					<table class="table table-hover">
						<thead class="table-info">
							<tr>
								<th>#</th>
								<th width="30%">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회</th>
								<th>IP</th>
								<th>신고 횟수</th>
								<th>삭제</th>
							</tr>
						</thead>
						<c:if test="${empty listBoard}">
							<tr>
								<td colspan="8">등록된 게시글이 없습니다. </td>
							</tr>
						</c:if>
						<c:set var="rowNum" value="${rowNum}"/>
							<c:forEach var="dto" items="${listBoard}">
								<tr>
									<td>${dto.board_num}</td>
									<td>
										<c:if test="${dto.board_re_level >0}">
												<img src="resources/img/re.png" width="${dto.board_re_level *10}">
										</c:if>
										<a href="admin_board_view.do?view=free&board_num=${dto.board_num}&sort=all">${dto.board_title}</a> 
										<c:if test="${dto.board_replycount ne 0}">
										 [${dto.board_replycount}]💬
										</c:if>
										<c:if test="${not empty dto.board_img1||not empty dto.board_img2||not empty dto.board_img3||not empty dto.board_img4}"><img src="resources/img/imgicon.jpg" width=20 height=20 ><img></c:if>
									</td>
									<td>${dto.mem_nickname}</td>
									<td>${dto.board_regdate}</td>
									<td>${dto.board_readcount}</td>
									<td>${dto.board_ip}</td>
									<td>${dto.board_report}</td>
									<td><a href="javascript:checkDel('${dto.board_num}','${dto.board_img1}','${dto.board_img2}','${dto.board_img3}','${dto.board_img4}')">삭제</a></td>
								</tr>	
							</c:forEach>			
					</table>
					<form name="f2" action="admin_board_delete.do" method="post">
						<input type="hidden" name="board_num">
						<input type="hidden" name="view" value="free">
						<input type="hidden" name="board_img1">
						<input type="hidden" name="board_img2">
						<input type="hidden" name="board_img3">
						<input type="hidden" name="board_img4">
					</form>
	
	<!-- 게시글 페이지 수-->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<c:if test="${count>0}">
					   		<c:if test="${startPage > pageBlock}">
					   			 <li class="page-item">
					     		 	<a class="page-link" href="admin_board_list.do?view=free&pageNum=${startPage-pageBlock}" aria-label="Previous">
					       		 		<span aria-hidden="true">&laquo;</span>
					      			</a>
					   			</li>
					   		</c:if>
					   		
					   		<c:forEach var="i" begin="${startPage}" end="${endPage}">
					   			 <li class="page-item"><a class="page-link" href="admin_board_list.do?view=free&pageNum=${i}">${i}</a></li>
					    	</c:forEach>
						   	<c:if test="${endPage < pageCount}">
					   			<li class="page-item">
					      			<a class="page-link" href="admin_board_list.do?view=free&pageNum=${startPage+pageBlock}" aria-label="Next">
					        			<span aria-hidden="true">&raquo;</span>
					     			</a>
					    		</li>
					  		</c:if>  
						</c:if>
					  	</ul>
					</nav>
		    	</div>
		    </div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>