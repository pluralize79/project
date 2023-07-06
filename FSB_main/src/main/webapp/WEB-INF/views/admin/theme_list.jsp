<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- theme_list.jsp // 테마 목록 -->

<%@include file="admin_top.jsp" %>

<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(theme_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f.theme_num.value = theme_num
			document.f.submit()
		}
	}
	function updateForm(theme_num){
		window.open("admin_theme_update.do?theme_num="+theme_num, "", "width=640, height=400")
	}
</script>

	<!-- 보드게임 사이드바 -->
	<%@include file="game_sidebar.jsp" %>

		<!-- 내용  // 테마 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">테마 목록</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center">
						<th width="10%" height="50">#</th>
						<th width="35%">테마 이름</th>
						<th width="35%">등록된 게임 보기</th>
						<th width="10%">수정</th>
						<th width="10%">삭제</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty listTheme}">
						<tr>
							<td colspan="5">등록된 테마가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty listTheme}">
					<c:forEach items="${listTheme}" var="dto">
						<tr align="center">
							<td>${dto.theme_num}</td>
							<td>${dto.theme_name}</td>
							<td><a href="admin_theme_list.do?theme_num=${dto.theme_num}">등록된 게임 보기</a></td>
							<td><a href="javascript:updateForm('${dto.theme_num}')">수정</a></td>
							<td><a href="javascript:checkDel('${dto.theme_num}')">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<form name="f" action="admin_theme_delete.do" method="post">
					<input type="hidden" name="theme_num"/>
				</form>
		    		</div>
		    	</div>
		    </div>
		    <!-- 등록된 보드게임 -->
		    <div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1">
			    	<div class="col">
			    		<p class="fs-5">테마가 등록된 보드게임</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center">
						<th width="20%" height="50">#</th>
						<th width="25%">보드게임 이름</th>
						<th width="30%">보드게임 이미지</th>
						<th width="25%">상세보기</th>
					</tr>
					</thead>
					<tbody>
					 <c:if test="${empty listThemeGame}">
					 <tr align="center">
					 	<td colspan="4">해당 테마가 등록된 보드게임이 없습니다.</td>
					 </tr>
					 </c:if>
					 <c:if test="${not empty listThemeGame}">
						<c:forEach items="${listThemeGame}" var="gdto">
							<tr align="center">
								<td>${gdto.game_num}</td>
								<td>${gdto.game_name}</td>
								<td><img src="resources/img/${gdto.game_img}" width="150" height="150"></td>
								<td><a href="admin_game_view.do?mode=all&game_num=${gdto.game_num}">상세보기</a>
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