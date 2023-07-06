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
<h2 align="center">비밀번호 재설정</h2>
<br>
<br>

<h5 align="center">새로운 비밀번호를 입력해주세요.</h5>
<h6 align="center">아이디: ${id} </h6>
<br>
<br>
<form name="f3" action="pw_re_ok.do" method="post" onsubmit="return check()">
 <input type="hidden" name="id" value="${id}"/>
<input type ="password" align="center" id="passwd" name="passwd" placeholder="새 비밀번호"/>
<br>
<input type ="password" align="center" id="passwd2" name="passwd2" placeholder="새 비밀번호 확인"/>

<script type="text/javascript">

	function check(){
	      if (f3.passwd.value!=f3.passwd2.value) {

	         alert("비밀번호가 일치하지 않습니다.")
	         return false
	      }else {
	    	  if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(f3.passwd.value)){            
	              alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	              $('#passwd').val('').focus();
	              return false
	          }              
	          	            
	    	  alert("비밀번호 설정 완료.")
	    	  document.f3.submit()
		}
	}

</script>

<br>

 	 
<button type="submit" name="비밀번호 재설정하기" class="btn btn-primary">비밀번호 재 설정하기</button>
</form>
</div>
</body>
</html>