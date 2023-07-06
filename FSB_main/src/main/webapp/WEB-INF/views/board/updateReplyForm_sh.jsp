<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<!-- 댓글 수정 폼 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/jquery-3.7.0.js"></script>
	
	<form id="f2" action="#" name="f2">
				<input type="hidden" name="board_num" value="${dto.board_num}"/>
				<input type="hidden" name="br_num" value="${dto.br_num}"/>
				<input type="hidden" name="pageNum" value="${params.pageNum}">
		<div class = "row">
		<div class = "col">
		<Strong>${dto.mem_nickname}</Strong>
		</div>
		<input hidden="hidden"><!-- 엔터키 서브밋 방지 -->
		<div class = "col-5">
		<input type="text" class="form-control form-control-sm" placeholder="수정할 내용을 입력하세요." name="br_content" value="${dto.br_content}">
		</div>
		<div class = "col" align ="center">
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="today"/>
		<c:out value="${today}"/>
		</div>
		<div class = "col-2">
			<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
 			<a href="javascript:updateReplyOk()"><button type="button" class="btn btn-outline-primary">수정</button></a>
 			<a href="javascript:cancel('${dto.board_num}')"> <button type="button" class="btn btn-outline-primary">취소</button></a>
			</div>
		</div>
		</div>
		</form>
