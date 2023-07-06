<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../user/user_top.jsp"%>
<!-- content.jsp -->
<html>
<script type="text/javascript">
function back(mode){
		if(mode==''){
			window.location="board_free.do?mode="
		}else if(mode=='anony'){
			window.location="board_anony.do?mode=anony"
		}else{
			window.location="board_secondhand.do?mode=all"
		}
					}
</script>
<head>
<title>공지사항</title>
</head>
<body>
<div align="center">
		<!-- 게싯글 제목 -->
		<h1 class="display-5">${getNotice.n_title}</h1>
		<input type="button" value="글목록" class="btn btn-outline-secondary" onclick="javascript:back('${mode}')">
		</div>
		<!-- 내용 -->
		<div class="mb-3 w-50 p-3 mx-auto p-2">
			<textarea class="form-control" id="exampleFormControlTextarea1"
				name="board_content" rows="20" readonly>${getNotice.n_content}</textarea>
		</div>
</body>
</html>