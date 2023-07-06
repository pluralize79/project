<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- game_update.jsp // 보드게임 수정 폼 -->

<%@include file="admin_top.jsp" %>

	<!-- 보드게임 사이드바 -->
	<%@include file="game_sidebar.jsp" %>

		<!-- 내용 // 보드게임 수정 -->
		<div class="container text-center overflow-auto">
		<p>
		<p>
	 		<div class="row row-cols-1">
		    	<div class="col">보드게임 수정</div>
		    	<p>
		    	<div class="col">
					<form name="f" action="admin_game_update.do" method="post" enctype="multipart/form-data">
					<table border="0" width="80%" height="80%" align="center">
						<tr>
							<th width="30%" align="center">게임 이름</th>
							<td width="70%"><input type="text" class="form-control" name="game_name" size="150" value="${getGame.game_name}">
							<input type="hidden" name="game_num" value="${getGame.game_num}"></td>
						</tr>
						<tr>
							<th align="center">플레이 인원수</th>
							<td>
								<select name="game_player" class="form-select">
									<c:if test="${getGame.game_player == 1}"><option value="1" selected>1인</option></c:if>
									<c:if test="${getGame.game_player != 1}"><option value="1">1인</option></c:if>
									<c:if test="${getGame.game_player == 2}"><option value="2" selected>2~4인</option></c:if>
									<c:if test="${getGame.game_player != 2}"><option value="2">2~4인</option></c:if>
									<c:if test="${getGame.game_player == 3}"><option value="3" selected>5~6인</option></c:if>
									<c:if test="${getGame.game_player != 3}"><option value="3">5~6인</option></c:if>
									<c:if test="${getGame.game_player == 4}"><option value="4" selected>7인이상</option></c:if>
									<c:if test="${getGame.game_player != 4}"><option value="4">7인이상</option></c:if>
								</select>
							</td>
						</tr>
						<tr>
							<th align="center">플레이 시간</th>
							<td><input type="text" class="form-control" name="game_playTime" value="${getGame.game_playTime}"></td>
						</tr>
						<tr>
					 		<th align="center">플레이 난이도</th>
							<td>
								<select name="game_level" class="form-select">
									<c:if test="${getGame.game_level == 1}"><option value="1" selected>★</option></c:if>
									<c:if test="${getGame.game_level != 1}"><option value="1">★</option></c:if>
									<c:if test="${getGame.game_level == 2}"><option value="2" selected>★★</option></c:if>
									<c:if test="${getGame.game_level != 2}"><option value="2">★★</option></c:if>
									<c:if test="${getGame.game_level == 3}"><option value="3" selected>★★★</option></c:if>
									<c:if test="${getGame.game_level != 3}"><option value="3">★★★</option></c:if>
									<c:if test="${getGame.game_level == 4}"><option value="4" selected>★★★★</option></c:if>
									<c:if test="${getGame.game_level != 4}"><option value="4">★★★★</option></c:if>
									<c:if test="${getGame.game_level == 5}"><option value="5" selected>★★★★★</option></c:if>
									<c:if test="${getGame.game_level != 5}"><option value="5">★★★★★</option></c:if>
								</select>
							</td>
						</tr>
					 	<tr>
							<th align="center">게임 설명</th>
							<td><textarea name="game_content" class="form-control" rows="5" cols="50">${getGame.game_content}</textarea></td>
						</tr>
						<tr>
							<th align="center" rowspan="2">게임 이미지</th>
							<td><img src="resources/img/${getGame.game_img}" width="150" height="150"></td>
						</tr>
						<tr>
							<td><input type="file" class="form-control" name="game_img">
							<input type="hidden" name="game_img2" value="${getGame.game_img}"></td>
						</tr>
						<tr>
							<th colspan="2">기존 테마</th>
						</tr>
						<tr>
							<td colspan="2">
								<c:forEach items="${getGameTagList}" var="tdto">
									<c:forEach items="${listTheme}" var="dto">
										<c:if test="${tdto.theme_num == dto.theme_num}">
											<button type="button" class="btn btn-primary btn-sm">${dto.theme_name}</button>
										</c:if>
									</c:forEach>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th colspan="2">수정 테마</th>
						</tr>
						<tr>
							<td colspan="2">
								<c:set var="count" value="0"/>
								<c:forEach items="${listTheme}" var="dto">
									<input type="checkbox" class="form-check-label" name="tag${dto.theme_num}" id="flexCheckDefault">
									<label class="form-check-label" for="flexCheckDefault">${dto.theme_name}</label>
									<c:set var="count" value="${count +1}"/>
									<c:if test="${count%4 == 0}">
											</td>
										</tr>
										<tr>
											<td colspan="2">
									</c:if>
								</c:forEach>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							<button type="submit" class="btn btn-secondary btn-sm">수정</button>
							<button type="reset" class="btn btn-secondary btn-sm">다시 입력</button>
							<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_game_list.do'">취소</button>
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