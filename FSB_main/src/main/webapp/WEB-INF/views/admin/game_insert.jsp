<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- game_insert.jsp // 보드게임 등록-->

<%@include file="admin_top.jsp" %>

	<!-- 보드게임 사이드바 -->
	<%@include file="game_sidebar.jsp" %>

		<!-- 내용 // 보드게임 등록 -->
		<div class="container text-center">
		<p>
		<p>
	 		<div class="row row-cols-1">
		    	<div class="col">보드게임 등록</div>
		    	<p>
		    	<div class="col">
					<form name="f" action="admin_game_insert.do" method="post" enctype="multipart/form-data">
					<table border="0" width="60%" height="80%" align="center">
						<tr>
							<th width="30%" align="center">게임 이름</th>
							<td width="70%"><input type="text" class="form-control" name="game_name" size="150"></td>
						</tr>
						<tr>
							<th align="center">플레이 인원수</th>
							<td>
								<select name="game_player" class="form-select">
									<option value="1">1인</option>
									<option value="2">2~4인</option>
									<option value="3">5~6인</option>
									<option value="4">7인이상</option>
								</select>
							</td>
						</tr>
						<tr>
							<th align="center">플레이 시간</th>
							<td><input type="text" class="form-control" name="game_playTime" placeholder="숫자만 입력 (단위 : min)"></td>
						</tr>
						<tr>
					 		<th align="center">플레이 난이도</th>
							<td>
								<select name="game_level" class="form-select">
									<option value="1">★</option>
									<option value="2">★★</option>
									<option value="3">★★★</option>
									<option value="4">★★★★</option>
									<option value="5">★★★★★</option>
								</select>
							</td>
						</tr>
					 	<tr>
							<th align="center">게임 설명</th>
							<td><textarea name="game_content" class="form-control" rows="5" cols="50"></textarea></td>
						</tr>
						<tr>
							<th align="center">게임 이미지</th>
							<td><input type="file" class="form-control" name="game_img"></td>
						</tr>
						<tr>
							<th colspan="2">주요 테마</th>
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
							<button type="submit" class="btn btn-secondary btn-sm">등록</button>
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