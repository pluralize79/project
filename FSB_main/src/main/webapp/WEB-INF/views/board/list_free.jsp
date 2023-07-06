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
	<title>커뮤니티</title>
</head>	
<body>
<div align="center">
	<b>자 유 게 시 판</b>
	<br>
	<br>
	<table class="w-50 p-3 mx-auto p-2">
		<tr>
		<td align = center><div class="input-group mb-3 w-50 p-3">
		 <form class="d-flex" role="search" action="board_free_find.do" method="post">
 			<select class="form-select" aria-label="Default select example"name="select">
  			<option value="title" selected>제목</option>
  			<option value="writer" >작성자</option>
 			 <option value="content">내용</option>
			</select>
  <input type="text" class="form-control "type="search" name="searchString" placeholder="검색어 입력" aria-label="searchString" aria-describedby="button-addon2">
  <button class="btn btn-outline-secondary" type="submit" name="search" id="button-addon2">Search</button>
		</form>
	</div>
	<!-- 로그인 했을때만 글쓰기 버튼 노출 -->
			<c:if test="${not empty sessionScope.mbId}">
			<td align="right"><a href="write_board.do?mode=${params.mode}"><button type="button" class="btn btn-outline-primary">글쓰기</button></a></td>
			</c:if>
		</tr>
	</table>
	<table class="table table-hover w-50 p-3 mx-auto p-2">
		<thead class="table-primary">
		<tr>
			<th>#</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
		</thead>
		<!--공지사항테이블 -->
		<tr>
		<c:if test="${not empty nlistBoard}">
		<c:forEach var="ndto" items="${nlistBoard}">
			<tr>
			<td><strong>공지</strong></td>
			<td width="40%"><a href="board_noti_content.do?n_num=${ndto.n_num}&mode=" class="link-danger text-decoration-none link-opacity-50-hover"><strong>📢${ndto.n_title}</strong></a></td>
			<td>관리자</td>
			<td>${ndto.n_regdate}</td>
			<td>-</td>
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
			<td colspan="6" > <font color = "gray">관리자에 의해 규제된 글입니다.</font></td>
		</tr>
	</c:if>
		<c:if test="${dto.board_report < 5}">
		<tr>
			<td>${dto.board_num}</td>
			<td>
				<c:if test="${dto.board_re_level >0}">
						<img src="resources/img/re.png" width="${dto.board_re_level *10}">
				</c:if>
				<!-- 상세보기 넘어갈 때  회원만 보게 하기 -->
				<c:if test="${empty sessionScope.mbId}">
				<a href="javascript:checkLogin()" class="link-primary text-decoration-none link-opacity-50-hover">${dto.board_title}</a> 
				</c:if>
				
				<c:if test="${not empty sessionScope.mbId}">
				<a href="content_board.do?board_num=${dto.board_num}&pageNum=0&mode=" class="link-primary text-decoration-none link-opacity-50-hover">${dto.board_title}</a> 
				</c:if>
				
				<c:if test="${dto.board_replycount ne 0}">
				 [${dto.board_replycount}]💬
				 </c:if>	
				<c:if test="${not empty dto.board_img1||not empty dto.board_img2||not empty dto.board_img3||not empty dto.board_img4}"><img src="resources/img/imgicon.jpg" width=20 height=20 ><img></c:if>
			</td>
			<td>${dto.mem_nickname}</td>
			<td>${dto.board_regdate}</td>
			<td>${dto.board_readcount}</td>
			<td>${dto.board_ip}</td>
		</tr>
		</c:if>
	</c:forEach>			
		</table>
			</div>
	
	<!-- 게시글 페이지 수-->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
   <c:if test="${count>0}">
   		<c:if test="${startPage > pageBlock}">
   			 <li class="page-item">
     		 <a class="page-link" href="board_free.do?mode=&pageNum=${startPage-pageBlock}" aria-label="Previous">
       		 <span aria-hidden="true">&laquo;</span>
      		</a>
   			</li>
   		</c:if>
   		
   		<c:forEach var="i" begin="${startPage}" end="${endPage}">
   			 <li class="page-item">
   			  <a class="page-link" href="board_free.do?mode=&pageNum=${i}">${i}</a></li>
    	</c:forEach>
    
   <c:if test="${endPage < pageCount}">
   			 <li class="page-item">
      			<a class="page-link" href="board_free.do?mode=&pageNum=${startPage+pageBlock}" aria-label="Next">
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