<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myPage_point.jsp -->
<%@include file="myPage_top.jsp" %>
<td align="center">
	<div class="card mb-2" align="center" style="max-width: 1080px;">
  <div class="row g-0">
    <div class="col-md-6">
    	<div class="card-body">
      		<h5 class="card-title">회원 정보</h5>
      		<p class="card-text"><b>${login_mem.getMem_nickname() }</b> 님
      	</div>
    </div>
    <div class="col-md-6">
    	<div class="card-body">
      		<h5 class="card-title">전체 보유 포인트</h5>
      		<p class="card-text">${pointTotal }point
      	</div>
    </div>
  </div>
</div>
<br><br>
	<table class="table" width="100%">
  		<thead class="table-light">
    		<tr align="center">
    			<th width="20%">발생 날짜</th>
    			<th width="30%">포인트 사용 내역</th>
    			<th width="20%">사용 포인트</th>
    			<th width="30%">잔여 포인트</th>
    		</tr>
  		</thead>
  		<tbody>
    		<c:forEach var="list" items="${MemPointList }">
    			<tr align="center">
    				<td>${list.point_regdate }</td>
    				<td>${list.point_content }</td>
    				<td>${list.point_type } ${list.point_amount }</td>
    				<td>${list.point_total }</td>
    			</tr>
    		</c:forEach>
  		</tbody>
	</table>
</td>
</tr>
</table>
<%@include file="myPage_bottom.jsp" %>
