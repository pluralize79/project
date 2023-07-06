<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- board_sh_view.jsp // 중고게시판 상세보기 -->
<%@include file="admin_top.jsp" %>

	<!-- 커뮤니티 관리 사이드바 -->
	<%@include file="board_sidebar.jsp" %>
	
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<script type="text/javascript">
		function checkReport(view, board_num) {
			window.open("admin_board_report_list.do?view="+view+"&board_num="+board_num,"",  "width=700, height=470, left=680, top=270")
		}
		function checkReport_br(view, br_num){
			window.open("admin_br_report_list.do?view="+view+"&br_num="+br_num,"",  "width=700, height=470, left=680, top=270")
		}
		function ReportDel(board_num){
			var isDel = window.confirm("신고 취소 처리 하겠습니까?")
			if (isDel){
				document.f.board_num.value = board_num
				document.f.submit()
			}
		}
		function ReportBrDel(br_num){
			var isDel = window.confirm("신고 취소 처리 하겠습니까?")
			if (isDel){
				document.f2.br_num.value = br_num
				document.f2.submit()
			}
		}
		function checkDel(board_num, board_img1, board_img2, board_img3, board_img4){
			var isDel = window.confirm("정말로 삭제하겠습니까?")
			if (isDel){
				document.f3.board_num.value = board_num
				document.f3.board_img1.value = board_img1
				document.f3.board_img2.value = board_img2
				document.f3.board_img3.value = board_img3
				document.f3.board_img4.value = board_img4
				document.f3.submit()
			}
		}
		function checkDelBr(br_num){
			var isDel = window.confirm("정말로 삭제하겠습니까?")
			if (isDel){
				document.f4.br_num.value = br_num
				document.f4.submit()
			}
		}
</script>

	<!-- 내용  // 게시판 상세보기 -->
			<div class="container text-center">
			<p>
			<p>
			<div class="row row-cols-2" style="width: 1400px;">
				<div class="col" style="overflow: scroll; width: 700px; height: 800px;">
						<!-- 게싯글 제목 -->
						<h3>제목 : ${getBoard.board_title}</h3>

						<!-- 조회수 -->
						<div align="center">
							<h6>작성자 : ${getBoard.mem_nickname}</h6>
							<h6>조회수 : ${getBoard.board_readcount}</h6>
							<h6>신고수 : ${getBoard.board_report}&nbsp;&nbsp;
								<a href="javascript:checkReport('${view}','${getBoard.board_num}')">신고내역 보기</a>
							<c:if test="${getBoard.board_report ne 0}">
								&nbsp;&nbsp;<a href="javascript:ReportDel('${getBoard.board_num}')">신고 취소하기</a>
							</c:if>&nbsp;&nbsp;<a href="javascript:checkDel('${getBoard.board_num}','${getBoard.board_img1}','${getBoard.board_img2}','${getBoard.board_img3}','${getBoard.board_img4}')">삭제</a></h6>
						</div>

		<!-- 이미지 슬라이드 -->
		<c:if
			test="${not empty getBoard.board_img1 ||not empty getBoard.board_img2||not empty getBoard.board_img3||not empty getBoard.board_img4}">
			<div id="carouselExampleIndicators" class="carousel slide p-3">
				<div class="carousel-indicators">
					<c:if test="${not empty getBoard.board_img1}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
					</c:if>
					<c:if test="${not empty getBoard.board_img2}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
					</c:if>
					<c:if test="${not empty getBoard.board_img3}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</c:if>
					<c:if test="${not empty getBoard.board_img4}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="3" aria-label="Slide 4"></button>
					</c:if>
				</div>
				<!-- 이미지 여러개 -->
				<div class="carousel-inner">
					<c:if test="${not empty getBoard.board_img1}">
						<div class="carousel-item active">
							<img src="resources/img/${getBoard.board_img1}"
								class="d-block w-100 h-50">
						</div>
					</c:if>

					<c:if test="${not empty getBoard.board_img2}">
						<div class="carousel-item">
							<img src="resources/img/${getBoard.board_img2}"
								class="d-block w-100 h-50">
						</div>
					</c:if>

					<c:if test="${not empty getBoard.board_img3}">
						<div class="carousel-item">
							<img src="resources/img/${getBoard.board_img3}"
								class="d-block w-100 h-50">
						</div>
					</c:if>

					<c:if test="${not empty getBoard.board_img4}">
						<div class="carousel-item">
							<img src="resources/img/${getBoard.board_img4}"
								class="d-block w-100 h-50" >
						</div>
					</c:if>
				</div>

				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			</c:if>
		
					<!-- 내용 -->
					<div align="left" class="mb-3 p-3 mx-auto p-2">
							<h6><strong>거래 종류 : </strong>${getBoard.board_condition}&nbsp;&nbsp;<strong>주소 :</strong> ${getBoard.board_location}</h6>
							<h6><strong>거래 방법 : </strong>${getBoard.board_package }&nbsp;&nbsp;<strong>가격 : </strong><img src="resources/img/won.png" width ="20">${getBoard.board_price}</h6>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							name="board_content" rows="12" readonly>${getBoard.board_content}</textarea>
					</div>
		    	</div>
		    	<!-- 댓글 목록 -->
		    	<div class="col" style="overflow: scroll; width:700px; height: 800px;" align="center">
				<p>
				<p class="fs-5">댓글 목록</p>
				<div align="right">💬 댓글 : ${count}건</div>
				<br>
				<div align="right"><a href="admin_board_view.do?view=${view}&board_num=${getBoard.board_num}&sort=all">전체 목록 보기</a>&nbsp;&nbsp;
				<a href="admin_board_view.do?view=${view}&board_num=${getBoard.board_num}&sort=report">신고 댓글만 보기</a></div>
					<table class="table" width="100%">
  						<thead>
    						<tr align="center">
    							<th width="10%" scope="col">#</th>
    							<th width="25%" scope="col">작성자</th>
    							<th width="15%" scope="col">작성일</th>
    							<th width="10%" scope="col">내용</th>
    							<th width="10%" scope="col">신고</th>
    							<th width="20%" scope="col">신고취소</th>
    							<th width="10%" scope="col">삭제</th>
    						</tr>
    					</thead>
						<tbody>
						<c:if test="${empty getBoardReply}">
							<tr align="center">
								<th colspan="7">등록된 댓글이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${not empty getBoardReply}">
							<c:forEach items="${getBoardReply}" var="dto">
								<tr align="center">
									<td>${dto.br_num}</td>
									<td>${dto.mem_nickname}</td>
									<td>${dto.br_regdate}</td>
									<td>
									<a data-bs-toggle="collapse" href="#collapseExample${dto.br_num}" role="button" aria-expanded="false" aria-controls="collapseExample${dto.br_num}">
										내용
  									</a>
									</td>
									<c:if test="${dto.br_report eq 0}">
										<td>-</td>
									</c:if>
									<c:if test="${dto.br_report ne 0}">
										<td>⭕</td>
									</c:if>
									<td>
									<c:if test="${dto.br_report ne 0}">
										<a href="javascript:ReportBrDel('${dto.br_num}')">신고취소</a>
									</c:if>
									<c:if test="${dto.br_report eq 0}">
									-
									</c:if>
									</td>
									<td><a href="javascript:checkDelBr('${dto.br_num}')">삭제</a></td>
								</tr>
								<tr>
									<td colspan="7">
									<div class="collapse" id="collapseExample${dto.br_num}">
	  									<div class="card card-body">
	  									<div align="right">
	  										신고 횟수 :
	  										<c:if test="${dto.br_report eq 0}"> - </c:if>
	  										<c:if test="${dto.br_report ne 0}">${dto.br_report}</c:if>
	  									&nbsp;&nbsp;<a href="javascript:checkReport_br('${view}','${dto.br_num}')">신고내역 보기</a>
	  									</div>
	  										<br>${dto.br_content}
										</div>
									</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
					</table>
					<form name="f" action="admin_board_report_del.do" method="post">
						<input type="hidden" name="board_num"/>
						<input type="hidden" name="view" value="${view}"/>
					</form>
					<form name="f2" action="admin_br_report_del.do" method="post">
						<input type="hidden" name="br_num"/>
						<input type="hidden" name="view" value="${view}"/>
						<input type="hidden" name="board_num" value="${getBoard.board_num}"/>
					</form>
					<form name="f3" action="admin_board_delete.do" method="post">
						<input type="hidden" name="board_num">
						<input type="hidden" name="view" value="${view}">
						<input type="hidden" name="board_img1">
						<input type="hidden" name="board_img2">
						<input type="hidden" name="board_img3">
						<input type="hidden" name="board_img4">
					</form>
					<form name="f4" action="admin_br_delete.do" method="post">
						<input type="hidden" name="br_num"/>
						<input type="hidden" name="view" value="${view}"/>
						<input type="hidden" name="board_num" value="${getBoard.board_num}"/>
					</form>
				 </div>

		    </div>
		    	<div align="center">
					<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_board_list.do?view=${view}'">목록으로 돌아가기</button>
				</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>