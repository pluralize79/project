<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- board_notice_insert.jsp // 게시판 공지글 등록폼 -->
<%@include file="admin_top.jsp" %>

	<!-- 커뮤니티 관리 사이드바 -->
	<%@include file="board_sidebar.jsp" %>

	<!-- 내용  // 게시판 공지글 등록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">게시판 공지글 등록</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;" align="center">
					<form name="f" action="admin_board_notice_insert.do" method="post">
					<table border="0" width="80%" height="80%">
						<tr align="center">
							<th width="30%">구분</th>
							<td width="70%">
								<select name="n_mode" class="form-select">
										<option value="free">자유게시판</option>
										<option value="anony">익명게시판</option>
										<option value="secondhand">중고게시판</option>
										<option value="all">전체게시판</option>
								</select>
							</td>
						</tr>
						<tr align="center">
							<th>제목</th>
							<td><input type="text" name="n_title" class="form-control"></td>
						</tr>
						<tr align="center">
							<th>내용</th>
							<td>
								<textarea name="n_content" class="form-control" rows="10" cols="50"></textarea>
							</td>
						</tr>
						<tr align="center">
							<td colspan="2">
								<button type="submit" class="btn btn-secondary btn-sm">등록</button>
								<button type="reset" class="btn btn-secondary btn-sm">다시 입력</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_board_notice_list.do?mode=all&sort=all'">취소</button>
							</td>
						</tr>
					</table>
					</form>
		    		</div>
		    	</div>
		    </div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>