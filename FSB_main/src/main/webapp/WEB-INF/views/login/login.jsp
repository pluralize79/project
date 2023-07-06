<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 로그인jsp.인덱스~ -->

<!-- 부트스트랩 -->
<script src="resources/js/jquery-3.7.0.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/bootstrap.bundle.min.js"></script>

<script src="resources/js/login.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/login.css">

<script type="text/javascript">
   function search(mode){
      window.open("find.do?mode="+mode, "", "width=500, height=600, left=800, top=250")
      
   }
   function loginCheck(){
      if (f.id.value==""){
         alert("아이디를 입력해 주세요.")
         f.id.focus()
         return
      }
      if (f.passwd.value==""){
         alert("비밀번호를 입력해 주세요.")
         f.pass.focus()
         return
      }
      document.f.submit()
   }
</script>

<div class="wrapper">
  <div class="container">
    <div class="row sign-up-container">
      <form>
        <h1>Create Account</h1>
        <div class="social-links">
          <div>
            <!-- 로그인 연동 -->
            <a href="#"><i class="fa fa-flickr" aria-hidden="true"></i></a> 
          </div>
          <div>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
          </div>
          <div>
            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
          </div>
        </div>
        <span>or use your email for registration</span>
        <input type="text" placeholder="Name">
        <input  type="email" placeholder="Email">
        <input type="password" placeholder="Password">
        <button class="form_btn">Sign Up</button>
      </form>
    </div>
    
    <!-- 로그인 버튼 클릭시! -->
    <div class="sign-in-container">
      <form name="f" action="login_ok.do" method="post">
        <h1>Sign In</h1>
        <div class="social-links">
           <!-- 카카오 연동 로그인 -->
          <div>
       		 <a href="${kakao_url}"><i aria-hidden="true"><img src="resources/img/kakao.png" width="40" height="40"></i></a>
          </div>
          <!-- 네이버 연동 로그인 -->
          <div>
            <a href="${naver_url }"><i aria-hidden="true"><img src="resources/img/naver.png" width="40" height="40"></i></a>
          </div>
          <div>
            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
          </div>
        </div>    
        <span>or use your account</span>
        
        <c:set var="value" value="${cookie.saveId.value}"/>
      <c:if test="${empty value}">
            <input type="email" name="id" placeholder="Email">
      </c:if>
      <c:if test="${not empty value}">
            <input type="email" name="id" tabindex="1" value="${value}">
      </c:if>   
      
        <input type="password" name="passwd" placeholder="Password">
        
        <button class="form_btn">Sign In</button></a> 

		<!-- 아이디 기억하기 -->
        <div class="row" style="width:90%;">
        <div class="col">
        
        <c:if test="${empty value}"> 
               <input type="checkbox"  name="saveId" style="border-radius:0; width: 15px;">
        </c:if>
        <c:if test="${not empty value}">
               <input type="checkbox"  name="saveId" checked>
        </c:if>
        <font face="굴림" size="2">remember</font>
        </div>           
        <div class="col" style="padding-right:0; padding-left:0;">
           <a href="javascript:search('id')" style="text-decoration:none; visited; "><font face="굴림" size="2" color="gray">find id</font></a> | <a href="javascript:search('pw')" style="text-decoration:none"><font face="굴림" color="gray" size="2">find pw</font></a>
        
        </div>  
        <br>
  		</div>
  		
      </form>
    </div>
    
    <div class="overlay-container">
      <div class="overlay-left">
        <h1>Welcome Back</h1>
        <p>To keep connected with us please login with your personal info</p>
        <button id="signIn" class="overlay_btn">Sign In</button>
      </div>
      <div class="overlay-right">
        <h1>Hello, Friend</h1>
        <p>Enter your personal details and start journey with us</p>
        <button id="signUp" class="overlay_btn">Sign Up</button>
      </div>
    </div>
  </div>
</div>
