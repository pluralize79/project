<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- notice_list.jsp // 공지사항 목록 -->

<%@include file="admin_top.jsp" %>

<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(n_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f2.n_num.value = n_num
			document.f2.submit()
		}
	}
</script>

	<!-- 페이지관리 사이드바 -->
	<%@include file="page_sidebar.jsp" %>
	
	<!-- 내용  // 관리자 작성글 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1">
			    	<div class="col">
			    	<p class="fs-5">관리자 작성글 목록</p>
					</div>
				</div>
					<div class="col">
							<form name="f" action="admin_notice_list.do" method="post">
								<input type="hidden" name="mode" value="find">
								<select name="search">
									<option value="n_title">제목</option>
								</select>
								<input type="text" name="searchString">
								<button class="btn btn-secondary btn-sm" type="submit">찾기</button>
							</form>
								<div align="right">
									<button class="btn btn-secondary btn-sm" type="button" onclick="window.location='admin_notice_list.do?mode=all&sort=all'">
										전체 목록 보기</button>&nbsp;&nbsp;
									<div class="btn-group">
									<button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
										정렬
									</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="admin_notice_list.do?mode=all&sort=notice">공지사항 보기</a></li>
										<li><a class="dropdown-item" href="admin_notice_list.do?mode=all&sort=qna">자주묻는질문 보기</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="admin_notice_list.do?mode=all&sort=regdate_asc">작성일 순 (오래된 순)</a></li>
										<li><a class="dropdown-item" href="admin_notice_list.do?mode=all&sort=regdate_desc">작성일 순 (최근 순)</a></li>
									</ul>
									</div>
								</div>
					</div>
						<div class="col" style="overflow: scroll; height: 800px;">
							<table class="table table-hover table-bordered table align-middle" width="80%" height="100">
								<thead class="table-light">
									<tr align="center">
										<th width="10%" height="40">#</th>
										<th width="15%">구분</th>
										<th width="25%">제목</th>
										<th width="20%">작성일</th>
										<th width="15%">수정</th>
										<th width="15%">삭제</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty listNotice}">
									<tr>
										<td colspan="6">등록된 작성글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty listNotice}">
									<c:forEach items="${listNotice}" var="dto">
										<tr align="center">
											<td>${dto.n_num}</td>
											<td>
												<c:if test="${dto.n_mode eq 'notice'}">
													공지사항
												</c:if>
												<c:if test="${dto.n_mode eq 'qna'}">
													자주 묻는 질문
												</c:if>
											</td>
											<td><a href="admin_notice_view.do?n_num=${dto.n_num}">${dto.n_title}</a></td>
											<td>${dto.n_regdate}</td>
											<td><a href="admin_notice_update.do?n_num=${dto.n_num}">수정</a></td>
											<td><a href="javascript:checkDel('${dto.n_num}')">삭제</a></td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
							<form name="f2" action="admin_notice_delete.do" method="post">
								<input type="hidden" name="n_num"/>
							</form>
						</div>
					</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>
