<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- game_tag.jsp -->
<%@include file="../user/user_top.jsp" %>
<html>
<head>
	<title>보드게임 태그</title>
</head>
<body>
<div align="center">
<div class="text-bg-dark p-3">게임태그</div>
	<br>
	<!-- 버튼 색 통일 할 지 고민 -->
	<a href="game_tag.do"><button type="button" class="btn btn-danger">추리</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-warning">전략</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-success">카드</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-info">공포/스릴러</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-primary">판타지</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-light">역사</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-dark">공상과학</button></a>
	<a href="game_tag.do"><button type="button" class="btn btn-secondary">스포츠</button></a>
	<br>
	<br>
<div class="text-bg-dark p-3"></div>
	<br>
	<br>
<div class="container text-center">
  <div class="row row-cols-3">
    <div class="col">
	    <div class="card" style="width: 20rem;">
	 		<img src="resources/img/game1.png" class="card-img-top" alt="...">
	  		<div class="card-body">
	    <h5 class="card-title" align="left">#카드</h5>
	    <p class="card-text">할리갈리 재밌음</p>
	    <p class="card-text"><small class="text-body-secondary">댓글 수, 좋아요 수</small></p>
	    <a href="#" class="btn btn-primary">피드로 이동</a>
			</div>
		</div>
	</div>
    <div class="col">
	    <div class="card" style="width: 20rem;">
	 		<img src="resources/img/game1.png" class="card-img-top" alt="...">
	  		<div class="card-body">
	    <h5 class="card-title" align="left">#카드</h5>
	    <p class="card-text">할리갈리 재밌음</p>
	    <p class="card-text"><small class="text-body-secondary">댓글 수, 좋아요 수</small></p>
	    <a href="#" class="btn btn-primary">피드로 이동</a>
			</div>
		</div>
	</div>
    <div class="col">
	    <div class="card" style="width: 20rem;">
	 		<img src="resources/img/game1.png" class="card-img-top" alt="...">
	  		<div class="card-body">
	    <h5 class="card-title" align="left">#카드</h5>
	    <p class="card-text">할리갈리 재밌음</p>
	    <p class="card-text"><small class="text-body-secondary">댓글 수, 좋아요 수</small></p>
	    <a href="#" class="btn btn-primary">피드로 이동</a>
			</div>
		</div>
	</div>
    <div class="col">
	    <div class="card" style="width: 20rem;">
	 		<img src="resources/img/game1.png" class="card-img-top" alt="...">
	  		<div class="card-body">
	    <h5 class="card-title" align="left">#카드</h5>
	    <p class="card-text">할리갈리 재밌음</p>
	    <p class="card-text"><small class="text-body-secondary">댓글 수, 좋아요 수</small></p>
	    <a href="#" class="btn btn-primary">피드로 이동</a>
			</div>
		</div>
	</div>
  </div>
</div>
<!-- 	<table width="100%">
		<tr align="center">
			<td width="33%">
				<img src="resources/img/game1.png" width="400" height="400" >
			</td>
			<td width="33%">
				<img src="resources/img/game2.png" width="400" height="400">
			</td>
			<td width="33%">
				<img src="resources/img/game3.png" width="400" height="400">
			</td>
		</tr>
		<tr>
			<td>
				<a href="#">#태그</a>
			</td>
			<td>
				<a href="#">#태그</a>
			</td>
			<td>
				<a href="#">#태그</a>
			</td>			
		</tr>
		<tr align="center">
			<td>회원들이 쓴 글</td>
			<td>회원들이 쓴 글</td>
			<td>회원들이 쓴 글</td>
		</tr>
		<tr align="right">
			<td>댓글 수, 좋아요 수</td>
			<td>댓글 수, 좋아요 수</td>
			<td>댓글 수, 좋아요 수</td>
		</tr> -->
<%-- 	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
	</c:if>	
	<c:forEach var="dto" items="${listBoard}">
	<tr>
			<td>${dto.num}</td>
			<td>
				<a href="content_board.do?num=${dto.num}">${dto.subject}</a>
				<c:if test="${dto.readcount > 10}">
					<img src="img/hot.gif">
				</c:if>
			</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.readcount}</td>
			<td>${dto.ip}</td>
		</tr>	
	</c:forEach>
	</table> --%>
</div>
</body>
</html>
<%@include file="../user/user_bottom.jsp" %>
    