<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- game_list.jsp -->
<%@include file="../user/user_top.jsp" %>
<html>
<head>
	<title>보드게임 목록</title>
</head>
<body>
<div align="center">
	<div align="center" class="text-bg-dark p-3">보드게임 찾기</div>
	<br>
	<br>
	<div class="d-flex justify-content-center">
	<nav class="navbar bg-body-tertiary">
  		<div class="container-fluid">
    <form class="d-flex" role="search" action="game_find.do" method="post">
      		<input class="form-control me-2" type="search" name="searchString" placeholder="검색어 입력" aria-label="searchString">
      		<button class="btn btn-outline-success" name="search" type="submit">Search</button>
    </form>
  		</div>
	</nav>
	</div>
	<p>
		<button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample" aria-expanded="false" aria-controls="collapseWidthExample">
    		상세보기
  		</button>
	</p>
	<div style="min-height: 300px;">
  		<div class="collapse collapse-horizontal" id="collapseWidthExample">
    <div class="card card-body" style="width: 1000px;">
    <form name="f" action="game_checkFind.do" method="post">
	<table width="100%">
		<tr height="50" align="center">
			<th bgcolor="#CCCCCC">테마별</th>
				<c:forEach var="tdto" items="${listTheme}">
					<td><input type="checkbox" name="theme" value="${tdto.theme_num }"> ${tdto.theme_name }</td>
				</c:forEach>
		</tr>
		<tr height="50" align="center">
			<th bgcolor="#CCCCCC">인원별</th>
			<td><input type="checkbox" name="game_player" value="1"> 1인</td>
			<td><input type="checkbox" name="game_player" value="2"> 2~4인</td>
			<td><input type="checkbox" name="game_player" value="3"> 5~6인</td>
			<td><input type="checkbox" name="game_player" value="4"> 7인 이상</td>
		</tr>
		<tr height="50" align="center">
			<th bgcolor="#CCCCCC">난이도별</th>
			<td>
				<input type="checkbox" name="game_level" value="1">
  				<c:forEach begin="1" end="1">
    				<img src="resources/img/fire.png" width="15" height="15">
    			</c:forEach>			
    		</td>
			<td>
				<input type="checkbox" name="game_level" value="2">
    			<c:forEach begin="1" end="2">
					<img src="resources/img/fire.png" width="15" height="15">
				</c:forEach>
			</td>
			<td>
				<input type="checkbox" name="game_level" value="3">
    			<c:forEach begin="1" end="3">
					<img src="resources/img/fire.png" width="15" height="15">
				</c:forEach>
			</td>
			<td>
				<input type="checkbox" name="game_level" value="4">
    			<c:forEach begin="1" end="4">
					<img src="resources/img/fire.png" width="15" height="15">
				</c:forEach>
			</td>
			<td>
				<input type="checkbox" name="game_level" value="5">
    			<c:forEach begin="1" end="5">
					<img src="resources/img/fire.png" width="15" height="15">
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="8" align="center">
				<button type="submit" class="btn btn-dark">검색하기</button>
			</td>
		</tr>
	</table>
	</form>
  	</div>
	</div>
<br>
	<div class="text-bg-dark p-3"></div>
	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item">
    		<a class="nav-link" aria-current="page" href="game_sort.do?sort=game_name">이름 순</a>
  		</li>
  		<li class="nav-item">
    		<a class="nav-link" href="game_sort.do?sort=game_player">인원 순</a>
  		</li>
  		<li class="nav-item">
    		<a class="nav-link" href="game_sort.do?sort=game_starrating">별점 순</a>
  		</li>
  		<li class="nav-item">
 		<!-- game_likeCount 데이터가 없어서 누르면 오류남, 나중에 데이터 들어가면 확인하기  -->
    		<a class="nav-link" href="game_sort.do?sort=game_likeCount">좋아요 순</a>
  		</li>
	</ul>
<br>

<c:if test="${empty listGame}">
	등록된 게임이 없습니다.
</c:if>

<c:if test="${not empty listGame}">
<div class="row row-cols-3">			
<c:forEach var="dto" items="${listGame}">
<%--  	<c:if test="${listTheme eq ${tdto.theme_num }"> --%>
<div class="col">
	<div class="card mb-3" style="max-width: 500px;">
  		<div class="row g-0">
    		<div class="col-md-4">
      			<a href="game_view.do?game_num=${dto.game_num }&sort=all"><img src="resources/img/${dto.game_img}" class="img-fluid rounded-start" alt="보드게임"></a>
    		</div>
    	<div class="col-md-8">
     		 <div class="card-body">
        <h4 class="card-title">${dto.game_name}</h4>
        <p class="card-text"></p>
        <p class="card-text"><small class="text-body-secondary">사진을 누르면 상세보기로 이동합니다.</small></p>
      		</div>
    	</div>
  		</div>
	</div>
	</div>
<%-- 	</c:if>
 --%></c:forEach>
</div>
</c:if>
</div>
</div>
</body>
</html>
<%@include file="../user/user_bottom.jsp" %>
