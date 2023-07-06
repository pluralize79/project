<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@include file="../user/user_top.jsp" %>
<!-- list.jsp -->
<html>  
<head>
<script type="text/javascript">
 	
 	function checkLogin(){
	alert("회원 전용 입니다 로그인 해줘❤")
 }
</script>
	<title>익명게시판</title>
</head>	
<body>
<div align="center">
	<b>익 명 게 시 판</b>
	<table class="w-50 p-3 mx-auto p-2">
		<tr>
		<td align = center><div class="input-group mb-3 w-50 p-3">
   <form name="f2" class="d-flex" role="search" action="board_anony_find.do" method="post">
	   <input type="hidden" name="mode" value="anony">
	   <select name="select" class="form-select" aria-label="Default select example">
	  		<option value="title"  selected >제목</option>
	  		<option value="content">내용</option>	
	  </select>
	  		<input type="text" class="form-control "type="search" name="searchString" placeholder="검색어 입력" aria-label="searchString">
	  		<button class="btn btn-outline-secondary" type="submit" name="search">Search</button>
	</form>
	</div>	
	<!-- 로그인 했을때만 글쓰기 버튼 노출 -->
		<c:if test="${not empty sessionScope.mbId}">
			<td align="right"><a href="write_board.do?mode=anony"><button type="button" class="btn btn-outline-success">글쓰기</button></a></td>
		</c:if>
		</tr>
	</table>
	<table class="table table-hover w-50 p-3 mx-auto p-2">
		<thead class="table-success">
		<tr>
			<th>#</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
		</thead>
		<!--공지사항테이블 -->
		<tr>
		<c:if test="${not empty nlistBoard}">
		<c:forEach var="ndto" items="${nlistBoard}">
			<tr>
			<td><strong>공지</strong></td>
			<td width="40%"><a href="board_noti_content.do?n_num=${ndto.n_num}&mode=anony" class="link-danger text-decoration-none link-opacity-50-hover"><strong>📢${ndto.n_title}</strong></a></td>
			<td>관리자</td>
			<td>${ndto.n_regdate}</td>
			<td>-</td>
			</tr>
		</c:forEach>
		</c:if>
		</tr>
<!-- 회원 게시글 리스트  -->
	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="6">등록된 게시글이 없습니다. </td>
		</tr>
	</c:if>
	<c:set var="rowNum" value="${rowNum}"/>
	<c:forEach var="dto" items="${listBoard}">
	<!-- 신고 5회 이상 먹으면 게시글 규제 -->
	<c:if test="${dto.board_report > 4}">
		<tr>
			<td>${dto.board_num}</td>
			<td colspan="5" ><font color = "gray">관리자에 의해 규제된 글입니다.</font></td>
		</tr>
	</c:if>
		<c:if test="${dto.board_report < 5}">
		<tr>
			<td>${dto.board_num}</td>
			<td>
				<c:if test="${dto.board_re_level>0}">
						<img src="resources/img/re.png" width="${dto.board_re_level *10}">
				</c:if>
					<c:if test="${empty sessionScope.mbId}">
						<a href="javascript:checkLogin()" class="link-success text-decoration-none link-opacity-50-hover">${dto.board_title}</a> 
				</c:if>
				<c:if test="${not empty sessionScope.mbId}">
				<a href="content_board.do?board_num=${dto.board_num}&pageNum=0&mode=anony" class="link-success text-decoration-none link-opacity-50-hover">${dto.board_title}</a>
				</c:if>
					<c:if test="${dto.board_replycount ne 0}">
					 [${dto.board_replycount}]💬
					</c:if>
				<c:if test="${not empty dto.board_img1||not empty dto.board_img2||not empty dto.board_img3||not empty dto.board_img4}"><img src="resources/img/imgicon.jpg" width=20 height=20 ><img></c:if>
			</td>
			<td>익명</td>
			<td>${dto.board_regdate}</td>
			<td>${dto.board_readcount}</td>
		
		</tr>	
		</c:if>
	</c:forEach>			
		</table>
			</div>
<!-- 쪽수 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
   <c:if test="${count>0}">
   		<c:if test="${startPage > pageBlock}">
   			 <li class="page-item">
     		 <a class="page-link" href="board_anony.do?mode=anony&pageNum=${startPage-pageBlock}" aria-label="Previous">
       		 <span aria-hidden="true">&laquo;</span>
      		</a>
   			</li>
   		</c:if>
   		
   		<c:forEach var="i" begin="${startPage}" end="${endPage}">
   			 <li class="page-item">
   			  <a class="page-link" href="board_anony.do?mode=anony&pageNum=${i}">${i}</a></li>
    	</c:forEach>
    
   <c:if test="${endPage < pageCount}">
   			 <li class="page-item">
      			<a class="page-link" href="board_anony.do?mode=anony&pageNum=${startPage+pageBlock}" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
     			</a>
    		</li>
  		</c:if>  
	 </c:if>
  	</ul>
	</nav>
	</body>
<%@include file="../user/user_bottom.jsp" %>
</html>