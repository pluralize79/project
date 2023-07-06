<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="resources/js/jquery-3.7.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/bootstrap.bundle.min.js"></script>

 <link rel="stylesheet" type="text/css" href="resources/css/button.css">

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>


<div width="80%" height="80%" align="center">
<br>
<br>
<h2 align="center">아이디 찾기 결과</h2>
<br>
<br>
<br>
<br>
<h1 align="center">회원님의 휴대전화로</h1>
<h1 align="center">가입된 아이디가 있습니다.</h1>
<br>
<br>


<input class="form-control" type="text" aria-label="Disabled input example" disabled readonly align="center" value="            ${id}           ${joindate}가입">
<br>
<br>

<h5 align="center">비밀번호가 기억 나지 않으세요? <a href="find.do"><font color="blue">비밀번호 찾기</font></a></h5>
<br>

<div align="center">
<br>

<button type="button" name="아이디 찾기" class="btn btn-primary" onclick="location.href='close.do'">확인</button>

</div>
</body>
</html>