<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- search.jsp -->

<html>
<head>
	<title>회원찾기</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
	<script type="text/javascript">
		function check(){
			if (f.name.value==""){
				alert("이름을 입력해 주세요.")
				f.name.focus()
				return false
			}
			if (f.ssn1.value==""){
				alert("주민번호 앞자리를 입력해 주세요.")
				f.ssn1.focus()
				return false
			}
			if (f.ssn2.value==""){
				alert("주민번호 뒷자리를 입력해 주세요.")
				f.ssn2.focus()
				return false
			}
			if (f.id.value=="" && f.mode.value=="pw"){
				alert("아이디를 입력해 주세요.")
				f.id.focus()
				return false
			}
			return true
		}
	</script>
</head>

<body>
	<div align="center">
		<hr color="green" width="300">
	<c:if test="${mode=='id'}">	
	
		<h2>아 이 디 찾 기</h2>
	</c:if>
	<c:if test="${mode!='id'}">	
		<h2>비 밀 번 호 찾 기</h2>
	</c:if>	
		<hr color="green" width="300">
		<form name="f" action="check.log" method="post" onsubmit="return check()">
			<input type="hidden" name="mode" value="${mode}"/>
			<table width="500" class="outline">
				<tr>
					<th>회원명</th>
					<td><input type="text" name="name" class="box"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="ssn1" class="box" maxlength="6"> - 
					<input type="password" name="ssn2" class="box" maxlength="7"></td>
				</tr>
	<c:if test="${mode!='id'}">	
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" class="box"></td>
				</tr>
	</c:if>			
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="조회">
						<input type="reset" value="다시입력">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>