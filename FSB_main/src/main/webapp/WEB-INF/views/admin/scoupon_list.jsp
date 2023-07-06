<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- scoupon_list.jsp // 쇼핑몰 쿠폰 목록 -->

<%@include file="admin_top.jsp" %>

	<!-- 쇼핑몰관리 사이드바 -->
	<%@include file="shop_sidebar.jsp" %>
	
<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(sc_num){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f.sc_num.value = sc_num
			document.f.submit()
		}
	}
</script>


	<!-- 내용  // 쿠폰 목록 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">쿠폰 목록</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center">
						<th width="5%" height="50">#</th>
						<th width="25%">쿠폰 이름</th>
						<th width="20%">쿠폰 타입</th>
						<th width="20%">할인<br>(% 또는 금액)</th>
						<th width="10%">등록일</th>
						<th width="10%">만료일</th>
						<th width="10%">삭제</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty listScoupon}">
						<tr>
							<td colspan="7">등록된 쿠폰이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty listScoupon}">
					<c:forEach items="${listScoupon}" var="dto">
						<tr align="center">
							<td  height="170">${dto.sc_num}</td>
							<td><a href="admin_scoupon_list.do?sc_num=${dto.sc_num}">${dto.sc_name}</a></td>
							<td>
								<c:if test="${dto.sc_type eq '%'}">비율</c:if>
								<c:if test="${dto.sc_type eq '-'}">차감</c:if>
								<c:if test="${dto.sc_type eq 'delchar'}">배송비 무료</c:if>
							</td>
							<td>${dto.sc_discount}
								<c:if test="${dto.sc_type eq '%'}">%</c:if>
								<c:if test="${dto.sc_type eq '-'}">원</c:if>
								<c:if test="${dto.sc_type eq 'delchar'}">원</c:if>
							</td>
							<td>${dto.sc_regdate}</td>
							<td>
								<c:if test="${empty dto.sc_duedate}">-</c:if>
								<c:if test="${not empty dto.sc_duedate}">${dto.sc_duedate}</c:if>
							</td>
							<td><a href="javascript:checkDel('${dto.sc_num}')">삭제</a></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
				<form name="f" action="admin_scoupon_delete.do" method="post">
					<input type="hidden" name="sc_num"/>
				</form>
		    		</div>
		    	</div>
		    </div>
		     <div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1">
			    	<div class="col">
			    		<p class="fs-5">쿠폰을 소유한 회원</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
					<thead class="table-light">
					<tr align="center">
						<th width="20%" height="50">회원 번호</th>
						<th width="25%">회원 닉네임</th>
						<th width="30%">등록일</th>
						<th width="25%">만료일</th>
					</tr>
					</thead>
					<tbody>
					 <c:if test="${empty listUsc}">
					 <tr align="center">
					 	<td colspan="4">해당 쿠폰을 소유한 회원이 없습니다.</td>
					 </tr>
					 </c:if>
					 <c:if test="${not empty listUsc}">
						<c:forEach items="${listUsc}" var="dto">
							<tr align="center">
								<td>${dto.mem_num}</td>
								<td>${dto.mem_nickname}</td>
								<td>${dto.usc_regdate}</td>
								<td>${dto.usc_duedate}</td>
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