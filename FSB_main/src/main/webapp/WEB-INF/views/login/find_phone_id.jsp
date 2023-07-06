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
	
	function numCheck(numStr){
	      if (f2.numberok.value!=numStr) {
	         alert("인증실패 \n인증 번호를 다시 입력해주세요.")
	         return false
	      }else {
	    	  alert("인증성공.")
	    	  return true
		}
	      document.f2.submit()
	   }
</script>


<br>
<div width="80%" height="80%">

<h2 align="center">아이디 찾기</h2>

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
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        휴대폰 인증
        
      </button>
  

    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
       
       <!-- 인증 칸 안의 폼 -->
       <!-- 이름 -->
       <div class="mb-3">
       
          <c:if test="${mode!='id'}">	
			 <label for="exampleFormControlInput1" class="form-label"></label>
 				 <input type="text" class="form-control" id="id" name="id" value="${id}" placeholder="아이디">
	</c:if>
	

  <label for="exampleFormControlInput1" class="form-label"></label>
   
  <input type="email" class="form-control" id="name" placeholder="이름" value="${name}">
</div>

<!-- 휴대폰 번호 -->
<form name="f" action="sendSMS.do" method="post" onsubmit="return check()">    
<div class="input-group mb-3">
  <label for="exampleFormControlTextarea1" class="form-label"></label>

  <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${phoneNumber}" title="전화번호 입력" placeholder="휴대폰번호" aria-label="Recipient's username" aria-describedby="button-addon2" >
  <button class="btn btn-light" type="submit" id="phoneChk" value="입력" disabled>인증 요청</button>
</div>
 	</form>
 	
<!-- 인증번호 입력칸 생성 --> 	
 	
 	<form name="f2" action="sendSMS_ok.do" method="post" onsubmit="return numCheck('${numStr}')">
 	  <input type="hidden" name="phoneNumber" value="${phoneNumber}"/>
 	  <input type="hidden" name="name" value="${name}"/>
 	  
 	<div class="input-group mb-3">
 	<label for="exampleFormControlTextarea1" class="form-label"></label>
 		<input type="hidden" name="numStr" value="${numStr}"/>
            <input  class="form-control" id="phone2" type="text" name="numberok" title="인증번호 입력" value="${numberok}" placeholder="인증번호 입력해주세요" aria-label="Recipient's username2" aria-describedby="button-addon2">
            <button type="submit" class="btn btn-light"  value="인증확인" id="phoneChk2" disabled>인증 확인</button> 
            </form>
            </div>
     </div>       
 	
      <!-- 폼 끝 -->
       
 
        	
      
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
       
      </div>
    </div>
  </div>
    
    

<div align="center">
<br>

<c:if test="${mode!='id'}">	
<form name="f4" action="find_pw.do" method="post">
 	  <input type="hidden" name="phoneNumber" value="${phoneNumber}"/>
 	  <input type="hidden" name="name" value="${name}"/>
 	   <input type="hidden" name="id" value="${id}"/>
<button type="submit" name="비밀번호 찾기" class="btn btn-primary">비밀번호 찾기</button>
	
</form>
</c:if>

<c:if test="${mode=='id'}">	
<form name="f3" action="find_phone_ok.do" method="post">
 	  <input type="hidden" name="phoneNumber" value="${phoneNumber}"/>
 	  <input type="hidden" name="name" value="${name}"/>
 	  
<button type="submit" name="아이디 찾기" class="btn btn-primary">아이디 찾기</button>
</form>
</c:if>

</div>
  </div>
</div>
</body>
</html>