<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- theme_insert.jsp // 테마 등록 -->

<%@include file="admin_top.jsp" %>

	<!-- 보드게임 사이드바 -->
	<%@include file="game_sidebar.jsp" %>

		<!-- 내용  // 테마 등록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1">
			    	<div class="col">
			    		<p class="fs-5">테마 등록</p>
			    	</div>
			    	<p>
					<div class="col" style="height: 200px;">
						<form name="f" action="admin_theme_insert.do" method="post">
							<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
								<tr align="center">
									<th width="50%" height="100">테마 이름</th>
									<td width="50%"><input type="text" name="theme_name"></td>
								</tr>
								<tr align="center">
									<td colspan="2" height="100">
										<button type="submit" class="btn btn-secondary btn-sm">등록</button>
										<button type="reset" class="btn btn-secondary btn-sm">다시 입력</button>
										<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_theme_list.do?theme_num=0'">취소</button>
									</td>
								</tr>
							</table>
						</form>
		    		</div>
		    	</div>
		    </div>
		    <div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1">
			    	<div class="col">
			    		<p class="fs-5">현재 테마 목록</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
						<thead class="table-light">
							<tr align="center">
								<th width="30%" height="50">번호</th>
								<th width="70%">테마 이름</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty listTheme}">
								<tr>
									<td colspan="2">등록된 테마가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty listTheme}">
							<c:forEach items="${listTheme}" var="dto">
								<tr align="center">
									<td>${dto.theme_num}</td>
									<td>${dto.theme_name}</td>
								</tr>
							</c:forEach>
							</c:if>
						</tbody>
					</table>
		    		</div>
		    	</div>
		    </div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>