<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- game_report_list.jsp // 보드게임 한줄평 신고내역 -->

<%@include file="admin_top.jsp" %>

<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(review_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f2.review_num.value = review_num
			document.f2.submit()
		}
	}
	function checkUpdate(review_num){
		var isUpdate = window.confirm("신고 취소 처리 하겠습니까?")
		if (isUpdate){
			document.f3.review_num.value = review_num
			document.f3.submit()
		}
	}
</script>

	<!-- 보드게임 사이드바 -->
	<%@include file="game_sidebar.jsp" %>

		<!-- 내용  // 보드게임 한줄평 신고내역 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 1000px;" align="center">
			    	<div class="col">
			    		<p class="fs-5">보드게임 한줄평 신고 내역</p>
			    	</div>
			    	<p>
		    		<div class="col">
		    			<form name="f" action="admin_game_reportList.do" method="post">
							<input type="hidden" name="mode" value="find">
							<input type="hidden" name="sort" value="all">
							<select name="search">
								<option value="mem_nickname">작성자</option>
							</select>
							<input type="text" name="searchString">
							<button class="btn btn-secondary btn-sm" type="submit">찾기</button>
						</form>
						<div align="right">
							<button class="btn btn-secondary btn-sm" type="button" onclick="window.location='admin_game_reportList.do?mode=all&sort=all'">
							전체 목록 보기</button>&nbsp;&nbsp;
							<div class="btn-group">
								 <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
								  정렬
								 </button>
								 <ul class="dropdown-menu">
									 <li><a class="dropdown-item" href="admin_game_reportList.do?mode=all&sort=game_num_asc">보드게임 번호 순(1->10)</a></li>
									 <li><a class="dropdown-item" href="admin_game_reportList.do?mode=all&sort=game_num_desc">보드게임 번호 순(10->1)</a></li>
									 <li><hr class="dropdown-divider"></li>
									 <li><a class="dropdown-item" href="admin_game_reportList.do?mode=all&sort=regdate_desc">작성일(최근 순)</a></li>
									 <li><a class="dropdown-item" href="admin_game_reportList.do?mode=all&sort=regdate_asc">작성일(오래된 순)</a></li>
								 </ul>
							</div>
						</div>
					</div>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center" height="50">
						<th width="5%">#</th>
						<th width="10%">보드게임 번호</th>
						<th width="10%">작성자</th>
						<th width="25%">한줄평</th>
						<th width="10%">작성일</th>
						<th width="20%">신고내용</th>
						<th width="10%">신고취소</th>
						<th width="10%">삭제</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty listReview}">
						<tr>
							<td colspan="8">등록된 한줄평이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty listReview}">
					<c:forEach items="${listReview}" var="dto">
						<tr align="center">
							<td>${dto.review_num}</td>
							<td><a href="admin_game_view.do?mode=all&game_num=${dto.game_num}">${dto.game_num}</a></td>
							<td>${dto.mem_nickname}</td>
							<td>${dto.review_content}</td>
							<td>${dto.review_regdate}</td>
							<td>
								<c:if test="${dto.review_report eq 1}">
									욕설 및 부적절한 언어
								</c:if>
								<c:if test="${dto.review_report eq 2}">
									광고 및 스팸성
								</c:if>
								<c:if test="${dto.review_report eq 3}">
									개인정보노출
								</c:if>
								<c:if test="${dto.review_report eq 4}">
									음란성/선정성
								</c:if>
								<c:if test="${dto.review_report eq 5}">
									도배성
								</c:if>
							</td>
							<td><a href="javascript:checkUpdate('${dto.review_num}')">신고취소</a></td>
							<td><a href="javascript:checkDel('${dto.review_num}')">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<form name="f2" action="admin_game_review_delete.do" method="post">
					<input type="hidden" name="review_num"/>
					<input type="hidden" name="game_num" value="0"/>
				</form>
				<form name="f3" action="admin_game_review_update.do" method="post">
					<input type="hidden" name="review_num"/>
					<input type="hidden" name="game_num" value="0"/>
				</form>
		    		</div>
		    	</div>
		    </div>
		</main>
	</div>


<%@include file="admin_bottom.jsp" %>