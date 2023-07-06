<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- theme_update.jsp // 테마 수정 폼 -->

<!-- css, js 연결 -->
	<script src="resources/js/jquery-3.7.0.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>

	<!-- 내용 // 테마 이름 수정 -->
	
	  		<p class="fs-4 text-center">테마 수정 하기</p>
	  		<form name="f" action="admin_theme_update.do" method="post">
	  			<table class="table align-middle" width="80%" height="70%">
		  		<tr>
		  			<th>번호</th>
		  			<td>
			  			<input type="hidden" name="theme_num" value="${getTheme.theme_num}">${getTheme.theme_num}
					</td>
				</tr>
				<tr>
					<th>수정 전 이름</th>
					<td>
			  			<input type="text" name="theme_name2" value="${getTheme.theme_name}" readOnly>
					</td>
				</tr>
				<tr>
					<th>수정 후 이름</th>
					<td><input type="text" name="theme_name"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<button type="submit" class="btn btn-warning">수정</button>
					</td>
				</tr>
			    </table>
		    </form>