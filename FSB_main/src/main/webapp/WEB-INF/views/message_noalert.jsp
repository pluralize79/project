<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- message.jsp -->
<%
		String msg = (String)request.getAttribute("msg");
		String url = (String)request.getAttribute("url"); 
%>
<script type="text/javascript">

	location.href="<%=url%>"
</script>
