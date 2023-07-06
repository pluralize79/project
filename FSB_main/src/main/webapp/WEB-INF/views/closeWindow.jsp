<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- closeWindow.jsp -->

<%
	String msg = (String)request.getAttribute("msg");
%>

<script type="text/javascript">
	alert("<%=msg%>")
	opener.location.reload()
	self.close()
</script>