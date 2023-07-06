<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myPage_main.jsp -->
<%@include file="myPage_top.jsp" %>
   <!-- 사이드 바 css, js -->
   <link href="resources/css/sidebars.css" rel="stylesheet">
   <script src="resources/js/sidebars.js"></script>
   <style>
   		caption{
   			caption-side : top
   		}
   </style>
   		<td width="90%">
    		<table width="100%" class="table table-striped">
    			<caption><font size="5" color="#000000"><b>전체 주문 목록</b></font></caption>
        		<tr align="center" valign="top">
        			<th width="14%"><font size="4">주문 일자</font></th>
        			<th width="15%"><font size="4">주문 번호</font></th>
        			<th width="15%"><font size="4">주문 상품</font></th>
        			<th width="14%"><font size="4">주문 금액</font></th>
        			<th width="14%"><font size="4">총 주문 금액</font></th>
        			<th width="14%"><font size="4">결제 방식</font></th>
        			<th width="14%"><font size="4">주문 처리 상태</font></th>
        		</tr>
        		<tr align="center" valign="top">
        			<td>2023-06-20</td>
        			<td><a href="#">2023-06-20-123456789</a></td>
        			<td><a href="#">집에가고싶어요</a></td>
        			<td>100</td>
        			<td>100,000</td>
        			<td>카드</td>
        			<td>결제완료</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%@include file="myPage_bottom.jsp" %>