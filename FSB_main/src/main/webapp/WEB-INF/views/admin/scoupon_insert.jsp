<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- scoupon_insert.jsp // 쇼핑몰 쿠폰 등록폼 -->

<%@include file="admin_top.jsp" %>

	<!-- 쇼핑몰관리 사이드바 -->
	<%@include file="shop_sidebar.jsp" %>


	<!-- 내용  // 쿠폰 등록 -->
			<div class="container text-center">
			<p>
			<p>
			<div class="row row-cols-1" style="width: 1200px;">
			    	<div class="col">
			    		<p class="fs-5">쿠폰 등록</p>
			    	</div>
			    	<p>
					<div class="col" style="overflow: scroll; height: 800px;">
					<form name="f" action="admin_scoupon_insert.do" method="post">
						<table border="0" width="60%" height="500">
							<tr align="center">
								<th>쿠폰 이름</th>
								<td><input type="text" class="form-control" name="sc_name"></td>
							</tr>
							<tr align="center">
								<th>쿠폰 타입</th>
								<td>
									<select name="sc_type" class="form-select">
										<option value="%">할인율</option>
										<option value="-">금액</option>
										<option value="delchar">배송비 무료</option>
									</select>
								</td>
							</tr>
							<tr align="center">
								<th>할인 금액 <br>또는 할인율</th>
								<td><input type="text" class="form-control" name="sc_discount" placeholder="숫자만 입력"></td>
							</tr>
							<tr align="center">
								<th rowspan="2">만료일</th>
								<td>
									<input type="date" name="sc_duedate" class="form-control" min ="${now}">
								</td>
							</tr>
							<tr align="left">
								<td>
									<input type="checkbox" class="form-check-label" name="sc_duedate2" id="flexCheckDefault">
									<label class="form-check-label" for="flexCheckDefault">만료일 지정하지 않음</label>
								</td>
							</tr>
							<tr align="center">
								<td colspan="2">
									<button type="submit" class="btn btn-secondary btn-sm">등록</button>
									<button type="reset" class="btn btn-secondary btn-sm">다시 입력</button>
									<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_scoupon_list.do'">취소</button>
								</td>
							</tr>
						</table>
					</form>
		    		</div>
		    	</div>
		</main>
	</div>

<%@include file="admin_bottom.jsp" %>