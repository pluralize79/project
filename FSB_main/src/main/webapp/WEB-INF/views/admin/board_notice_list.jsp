<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- board_notice_list.jsp // 게시판 공지글 목록 -->
<%@include file="admin_top.jsp" %>

	<!-- 커뮤니티 관리 사이드바 -->
	<%@include file="board_sidebar.jsp" %>
	
<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(n_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f.n_num.value = n_num
			document.f.submit()
		}
	}
</script>


	<!-- 내용  // 게시판 공지글 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 1000px;">
			    	<div class="col">
			    		<p class="fs-5">게시판 공지글 목록</p>
			    	</div>
			    	<div class="col">
		    			<form name="f2" action="admin_board_notice_list.do" method="post">
							<input type="hidden" name="mode" value="find">
							<select name="search">
								<option value="n_title">제목</option>
								<option value="n_content">내용</option>
							</select>
							<input type="text" name="searchString">
							<button class="btn btn-secondary btn-sm" type="submit">찾기</button>
						</form>
						<div align="right">
							<button class="btn btn-secondary btn-sm" type="button" onclick="window.location='admin_board_notice_list.do?mode=all&sort=all'">
							전체 목록 보기</button>&nbsp;&nbsp;
							<div class="btn-group">
								 <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								  정렬
								 </button>
								 <ul class="dropdown-menu">
									 <li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=board">전체게시판</a></li>
									 <li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=free">자유게시판</a></li>
									 <li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=sh">중고게시판</a></li>
									 <li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=anony">익명게시판</a></li>
									 <li><hr class="dropdown-divider"></li>
									 <li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=reg_asc">등록일 순 (오래된 순)</a></li>
									 <li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=reg_desc">등록일 순 (최근 순)</a></li>
								 </ul>
							</div>
						</div>
					</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center">
						<th width="5%" height="50">#</th>
						<th width="25%">구분</th>
						<th width="20%">제목</th>
						<th width="20%">등록일</th>
						<th width="10%">삭제</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty listBNotice}">
						<tr>
							<td colspan="5">등록된 게시판 공지글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty listBNotice}">
					<c:forEach items="${listBNotice}" var="dto">
						<tr align="center">
							<td>${dto.n_num}</td>
							<td>
								<c:if test="${dto.n_mode eq 'free'}">자유게시판</c:if>
								<c:if test="${dto.n_mode eq 'anony'}">익명게시판</c:if>
								<c:if test="${dto.n_mode eq 'secondhand'}">중고게시판</c:if>
								<c:if test="${dto.n_mode eq 'all'}">전체게시판</c:if>
							</td>
							<td><a href="admin_board_notice_view.do?n_num=${dto.n_num}">${dto.n_title}</a></td>
							<td>${dto.n_regdate}</td>
							<td><a href="javascript:checkDel('${dto.n_num}')">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<form name="f" action="admin_board_notice_delete.do" method="post">
					<input type="hidden" name="n_num"/>
				</form>
		    		</div>
		    	</div>
		    </div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>