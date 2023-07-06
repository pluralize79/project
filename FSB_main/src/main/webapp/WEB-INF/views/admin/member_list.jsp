<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_list.jsp // 일반 회원 목록-->

<%@include file="admin_top.jsp" %>

<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(mem_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f.mem_num.value = mem_num
			document.f.submit()
		}
	}
</script>

<%@include file="member_sidebar.jsp" %>

		<!-- 내용 // 일반 회원 목록-->
		<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">일반 회원 목록</p>
			    	</div>
			    	<p>
		    		<div class="col">
						<form name="f2" action="admin_member_list.do" method="post">
							<input type="hidden" name="mode" value="find">
							<select name="search">
								<option value="mem_id">아이디</option>
								<option value="mem_name">이름</option>
								<option value="mem_nickname">닉네임</option>
							</select>
							<input type="text" name="searchString">
							<button class="btn btn-secondary btn-sm" type="submit">찾기</button>
						</form>
												<div align="right"><a href="admin_member_list.do">전체 목록 보기</a></div>
					</div>
					<div class="col" style="overflow: scroll; height: 800px;">
						<table class="table table-hover table-bordered table align-middle" width="80%" height="100">
							<thead class="table-light">
							<tr align="center">
								<th width="10%" height="40">#</th>
								<th width="15%">아이디</th>
								<th width="15%">이름</th>
								<th width="15%">닉네임</th>
								<th width="15%">가입일</th>
								<th width="15%">상세보기</th>
								<th width="15%">삭제</th>
							</tr>
							</thead>
							<tbody>
							<c:if test="${empty listMember}">
								<tr>
									<td colspan="7">등록된 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty listMember}">
							<c:forEach items="${listMember}" var="dto">
								<tr align="center">
									<td>${dto.mem_num}</td>
									<td>${dto.mem_id}</td>
									<td>${dto.mem_name}</td>
									<td>${dto.mem_nickname}</td>
									<td>${dto.mem_regdate}</td>
									<td><a href="admin_member_view.do?mem_num=${dto.mem_num}">상세보기</a></td>
									<td><a href="javascript:checkDel('${dto.mem_num}')">삭제</a></td>
								</tr>
							</c:forEach>
							</c:if>
							</tbody>
						</table>
						<form name="f" action="admin_member_delete.do" method="post">
							<input type="hidden" name="mem_num"/>
						</form>
					</div>
				</div>
			</div>
	</main>
</div>


<%@include file="admin_bottom.jsp" %>
