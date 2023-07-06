<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notice_view.jsp // 관리자 작성글 상세보기 -->

<%@include file="admin_top.jsp" %>

	<!-- 페이지관리 사이드바 -->
	<%@include file="page_sidebar.jsp" %>
	
	<!-- 내용  // 관리자 작성글 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1">
			    	<div class="col">
			    	<p class="fs-5">관리자 작성글 상세보기</p>
					</div>
				</div>
				<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table align-middle" align="center" width="400" height="100">
						<tr align="center">
							<th height="50">구분</th>
							<td>
								<c:if test="${getNotice.n_mode eq 'notice'}">
									공지사항
								</c:if>
								<c:if test="${getNotice.n_mode eq 'qna'}">
									자주 묻는 질문
								</c:if>
							</td>
						</tr>
						<tr align="center">
							<th height="50">작성일</th>
							<td>${getNotice.n_regdate}</td>
						</tr>
						<tr align="center">
							<th height="50">제목</th>
							<td>${getNotice.n_title}</td>
						</tr>
						<tr align="center">
							<th>내용</th>
							<td><textarea name="n_content" class="form-control" rows="5" cols="50" readOnly>${getNotice.n_content}</textarea></td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_notice_list.do?mode=all&sort=all'">돌아가기</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>