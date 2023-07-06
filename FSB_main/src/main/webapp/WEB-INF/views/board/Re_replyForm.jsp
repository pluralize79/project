<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 댓글 수정 폼 -->
	<form id="f3" action="#" name="f3">
				<input type="hidden" name="board_num" value="${dto.board_num}"/>
				<input type="hidden" name="br_num" value="${dto.br_num}"/>
				<input type="hidden" name="pageNum" value="${params.pageNum}">
				<input type="hidden" name="br_re_group" value="${dto.br_re_group}"/>
				<input type="hidden" name="br_re_step" value="${dto.br_re_step}"/>
				<input type="hidden" name="br_re_level" value="${dto.br_re_level}"/>
		<br>
		<br>
		<div class = "row">
		<div class ="col-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
		<div class ="col-2">
		<img src="resources/img/re.png" height="10"></div>
		<input hidden="hidden"><!-- 엔터키 서브밋 방지 -->
		<div class = "col-5">
		<c:if test="${bdto.board_anony_check eq 1}">
		<input type="text" class="form-control form-control-sm" name="br_content">
		</c:if>
		<c:if test="${bdto.board_anony_check eq 0}">
		<input type="text" class="form-control form-control-sm" value="@${dto.mem_nickname } " name="br_content">
		</c:if>
		</div>
		<div class = "col-2">
			<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
 			<a href="javascript:re_replyOk()"><button type="button" class="btn btn-outline-primary">작성</button></a>
 			<a href="javascript:cancel('${dto.board_num}')"> <button type="button" class="btn btn-outline-primary">취소</button></a>
			</div>
		</div>
		</div>
		</form>
