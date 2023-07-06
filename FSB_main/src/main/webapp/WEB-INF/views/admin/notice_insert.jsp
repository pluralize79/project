<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notice_insert.jsp // 관리자 작성글 등록 -->


<%@include file="admin_top.jsp" %>

	<!-- 페이지관리 사이드바 -->
	<%@include file="page_sidebar.jsp" %>
	
	<!-- 내용  // 관리자 작성글 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    	<p class="fs-5">관리자 작성글 등록</p>
					</div>
				</div>
					<div class="col" style="overflow: scroll; height: 800px;">
						<form name="f" action="admin_notice_insert.do" method="post">
							<table border="0" align="center" width="80%" height="100">
								<tr align="center">
									<th>구분</th>
									<td>
										<select name="n_mode" class="form-select">
											<option value="notice">공지사항</option>
											<option value="qna">자주 묻는 질문</option>
										</select>
									</td>
								</tr>
								<tr align="center">
									<th>제목</th>
									<td><input type="text" name="n_title" class="form-control"></td>
								</tr>
								<tr align="center">
									<th>내용</th>
									<td><textarea name="n_content" class="form-control" rows="5" cols="50"></textarea></td>
								</tr>
								<tr align="center">
									<td colspan="2">
										<button type="submit" class="btn btn-secondary btn-sm">등록</button>
										<button type="reset" class="btn btn-secondary btn-sm">다시 입력</button>
										<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_notice_list.do?mode=all&sort=all'">취소</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>