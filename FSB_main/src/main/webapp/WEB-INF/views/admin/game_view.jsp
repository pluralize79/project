<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- game_view.jsp // 보드게임 상세보기 -->

<%@include file="admin_top.jsp" %>

<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(game_num, review_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f.game_num.value = game_num
			document.f.review_num.value = review_num
			document.f.submit()
		}
	}
	function checkUpdate(review_num){
		var isUpdate = window.confirm("신고 취소 처리 하겠습니까?")
		if (isUpdate){
			document.f2.review_num.value = review_num
			document.f2.submit()
		}
	}
</script>

	<!-- 보드게임 사이드바 -->
	<%@include file="game_sidebar.jsp" %>

		<!-- 내용  // 보드게임 상세보기-->
		<div class="container text-center overflow-auto">
		
		    <div class="row row-cols-2">
		    <div class="col vertical-right-line flex-shrink-0 p-3 bg-white" style="width: 500px; height: 800px;">
		    <p class="fs-5">보드게임 상세보기</p>
					<table border="0" width="80%" height="80%" align="center">
						<tr>
							<th width="30%" align="center">게임 이름</th>
							<td width="70%">${getGame.game_name}</td>
						</tr>
						<tr>
							<th align="center">게임 이미지</th>
							<td><img src="resources/img/${getGame.game_img}" width="150" height="150"></td>
						</tr>
						<tr>
							<th align="center">플레이 인원수</th>
							<td>
							<c:if test="${getGame.game_player == 1}">1인</c:if>
							<c:if test="${getGame.game_player == 2}">2~4인</c:if>
							<c:if test="${getGame.game_player == 3}">5~6인</c:if>
							<c:if test="${getGame.game_player == 4}">7인이상</c:if>
							</td>
						</tr>
						<tr>
							<th align="center">플레이 시간</th>
							<td>${getGame.game_playTime} 분</td>
						</tr>
						<tr>
					 		<th align="center">플레이 난이도</th>
					 		<td>
					 			<c:forEach begin="1" end="${getGame.game_level}"><img src="resources/img/fire.png" width="25" height="25"></c:forEach>
							</td>
						</tr>
					 	<tr>
							<th align="center">게임 설명</th>
							<td><textarea name="game_content" class="form-control" rows="5" cols="50" readOnly>${getGame.game_content}</textarea></td>
						</tr>
						<tr>
							<th colspan="2">주요 테마</th>
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
							<td colspan="2" align="center">
							<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_game_list.do'">목록으로 돌아가기</button>
							</td>	
						</tr>
					</table>
				</div>
				
				<!-- 한줄평 -->
				<div class="col" style="overflow-x:hidden; width:700px; height: 800px;" align="center">
				<p>
				<p class="fs-5">보드게임 한줄평</p>
				<div align="right">💬 리뷰 : ${reviewCount}건&nbsp;&nbsp;<img src="resources/img/star2.png" width="25" height="25">별점 : 
				<c:if test="${empty starrating}"> - </c:if><c:if test="${not empty starrating}">${starrating}</c:if></div>
				<br>
				<div align="right"><a href="admin_game_view.do?mode=all&game_num=${getGame.game_num}">전체 목록 보기</a>&nbsp;&nbsp;<a href="admin_game_view.do?mode=report&game_num=${getGame.game_num}">신고 한줄평만 보기</a></div>
					<table class="table" width="100%">
  						<thead>
    						<tr align="center">
    							<th width="10%" scope="col">번호</th>
    							<th width="25%" scope="col">작성자</th>
    							<th width="15%" scope="col">작성일</th>
    							<th width="10%" scope="col">내용</th>
    							<th width="10%" scope="col">신고</th>
    							<th width="20%" scope="col">신고취소</th>
    							<th width="10%" scope="col">삭제</th>
    						</tr>
    					</thead>
						<tbody>
						<c:if test="${empty getGameReviewList}">
							<tr align="center">
								<th colspan="7">등록된 한줄평이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${not empty getGameReviewList}">
							<c:forEach items="${getGameReviewList}" var="dto">
								<tr align="center">
									<td>${dto.review_num}</td>
									<td>${dto.mem_nickname}</td>
									<td>${dto.review_regdate}</td>
									<td>
									<a data-bs-toggle="collapse" href="#collapseExample${dto.review_num}" role="button" aria-expanded="false" aria-controls="collapseExample${dto.review_num}">
										내용
  									</a>
									</td>
									<c:if test="${dto.review_report eq 0}">
										<td>-</td>
									</c:if>
									<c:if test="${dto.review_report ne 0}">
										<td>⭕</td>
									</c:if>
									<td>
									<c:if test="${dto.review_report ne 0}">
										<a href="javascript:checkUpdate('${dto.review_num}')">신고취소</a>
									</c:if>
									<c:if test="${dto.review_report eq 0}">
									-
									</c:if>
									</td>
									<td><a href="javascript:checkDel('${getGame.game_num}','${dto.review_num}')">삭제</a></td>
								</tr>
								<tr>
									<td colspan="7">
									<div class="collapse" id="collapseExample${dto.review_num}">
	  									<div class="card card-body">
	  									<div align="left">
	  										별점 :
	  										<c:forEach var="i" begin="1" end="5">
		  										<c:if test="${(dto.review_starrating - i) >= 0}">
		  											<img src="resources/img/star2.png" width="25" height="25">
		  										</c:if>
		  										<c:if test="${(dto.review_starrating - i) <0}">
		  											<img src="resources/img/star1.png" width="25" height="25">
		  										</c:if>
	  										</c:forEach>
	  										&nbsp;신고 사유 :
	  										<c:if test="${dto.review_report eq 0}"> - </c:if>
	  										<c:if test="${dto.review_report ne 0}">${dto.review_report}</c:if>
	  										</div>
	  										<br>${dto.review_content}
										</div>
									</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
					<form name="f" action="admin_game_review_delete.do" method="post">
						<input type="hidden" name="game_num"/>
						<input type="hidden" name="review_num"/>
					</form>
					<form name="f2" action="admin_game_review_update.do" method="post">
						<input type="hidden" name="review_num"/>
						<input type="hidden" name="game_num" value="${getGame.game_num}"/>
					</form>
				 </div>
			</div>
		</div>
	</main>

<%@include file="admin_bottom.jsp" %>