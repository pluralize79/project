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


<script type="text/javascript">
	function check(){
		alert("인증번호발송.")
		return true
	}
	
	function emailcheck(){
		alert("입력하신 이메일로 인증번호발송")
		return true
	}
	
</script>


<br>
<div width="80%" height="80%">

<c:if test="${mode=='id'}">	
<h2 align="center">아이디 찾기</h2>
</c:if>

<c:if test="${mode!='id'}">	
		<h2 align="center">비 밀 번 호 찾 기</h2>
</c:if>	
	
 <br>	
<div align="center">
<!-- 아이디찾기/비밀번호찾기 구분 -->
<div align="center" class="btn-group" role="group" aria-label="Basic outlined example" >
 
  <button type="button" class="btn btn-outline-primary" onclick="location.href='find.do?mode=id'">아이디 찾기</button>
  <button type="button" class="btn btn-outline-primary" onclick="location.href='find.do?mode=pw'" >비밀번호 찾기</button>
 <br>
</div>
</div>

 <br>


<!-- 아이디찾기시 입력내용 -->
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        휴대폰 인증
        
      </button>
      
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
       
       <!-- 인증 칸 안의 폼 -->
       <!-- 이름 -->
       <form name="f" action="sendSMS.do" method="post" onsubmit="return check()">
       
    
	
       <div class="mb-3">
       
          <c:if test="${mode!='id'}">	
			 <label for="exampleFormControlInput1" class="form-label"></label>
 				 <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
	</c:if>
	
  
  <label for="exampleFormControlInput1" class="form-label"></label>
  <input type="text" class="form-control" id="name" name="name" placeholder="이름">
</div>

<!-- 휴대폰 번호 -->

<div class="input-group mb-3">
  <label for="exampleFormControlTextarea1" class="form-label"></label>
  <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" title="전화번호 입력(-생략)" placeholder="휴대폰번호" aria-label="Recipient's username" aria-describedby="button-addon2" >
  <button class="btn btn-light" type="submit" id="phoneChk" value="입력">인증 요청</button>
</div>
 	</form>

 	
      <!-- 폼 끝 -->
       
 
        	
      
      </div>
    </div>
  </div>
 
<div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        이메일 인증
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
  
  <!-- 이메일 입력폼 -->     
  <form name="email" action="sendEmail.do" method="post" onsubmit="return emailcheck()">      
 <div class="input-group mb-3">
  <label for="exampleFormControlTextarea1" class="form-label"></label>
  
  
   <c:if test="${mode!='id'}">
      <div class="input-group mb-3">
      <label for="exampleFormControlInput1" class="form-label"></label>
  <input type="text" class="form-control" id="name" name="name"  placeholder="이름">
  </div>
    </c:if>
    
  <input type="text" class="form-control" id="email" name="email" title="이메일" placeholder="이메일" aria-label="Recipient's username" aria-describedby="button-addon2" >
  <button class="btn btn-light" type="submit" id="emailck" value="입력">인증 요청</button>
  </div>
  </form>
</div>
	
	
      </div>
    </div>
  </div>
    
    

<div align="center">
<br>
<c:if test="${mode!='id'}">	
<button type="button" name="비밀번호 찾기" class="btn btn-secondary btn-lg" disabled>비밀번호 찾기</button>
	</c:if>
	
<c:if test="${mode=='id'}">	
<button type="button" name="아이디 찾기" class="btn btn-secondary btn-lg" disabled>아이디 찾기</button>
</c:if>

</div>

</div>
</body>
</html>