<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- board_notice_view.jsp // 게시판 공지글 상세보기 -->
<%@include file="admin_top.jsp" %>

	<!-- 커뮤니티 관리 사이드바 -->
	<%@include file="board_sidebar.jsp" %>



	<!-- 내용  // 게시판 공지글 상세보기 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">게시판 공지글 상세보기</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;" align="center">
					<table border="0" width="80%" height="80%">
						<tr align="center">
							<th>#</th>
							<td>${getNotice.n_num}</td>
							<th>구분</th>
							<td>
								<c:if test="${getNotice.n_mode eq 'free'}">자유게시판</c:if>
								<c:if test="${getNotice.n_mode eq 'anony'}">익명게시판</c:if>
								<c:if test="${getNotice.n_mode eq 'secondhand'}">중고게시판</c:if>
								<c:if test="${getNotice.n_mode eq 'all'}">전체게시판</c:if>
							</td>
						</tr>
						<tr align="center">
							<th width="20%">제목</th>
							<td width="25%">${getNotice.n_title}</td>
							<th width="15%">작성일</th>
							<td width="30%">${getNotice.n_regdate}</td>
						</tr>
						<tr align="center">
							<th>내용</th>
							<td colspan="3">
								<textarea name="n_content" class="form-control" rows="10" cols="50" readOnly>${getNotice.n_content}</textarea>
							</td>
						</tr>
						<tr align="center">
							<td colspan="4">
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_board_notice_update.do?n_num=${getNotice.n_num}'">수정</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_board_notice_list.do?mode=all&sort=all'">목록으로 돌아가기</button>
							</td>
						</tr>
					</table>
		    		</div>
		    	</div>
		    </div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>