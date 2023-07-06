<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 로그인jsp.인덱스~ -->
<script src="resources/js/login.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<!-- 카카오 로그인 연동 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 네이버 로그인 연동 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
   window.kakao.init("3e87fd9067a5eb1f2bc6c6fa6f612670"); // 내 어플리케이션 api키
   
   function kakaoLogin(){
      window.Kakao.Auth.login({
         scope:'profile,account_email,birthday',
         success: function(authObj){
            //console.log(authObj);
            window.Kakao.API.request({
               url: '/v2/user/me',
               success : res => {
                  const email = res.kakao_account.email;
                  const name = res.properties.nickname;
                  //const birth = res.kakao_account.birthday;
                  
                  console.log(email);
                  console.log(name);
                  //console.log(birth);
                  
                  $('#kakaoemail').val(email);
                  $('#kakaoname').val(name);
                  //$('#kakaobirth').val(birth);
                  document.f.submit();
               }
            })
         }
      })
   }
</script>
<script type="text/javascript">
   function search(mode){
      window.open("login_search.do?mode="+mode, "", "width=640, height=400")
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
    <div class="sign-up-container">
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
        <input type="email" placeholder="Email">
        <input type="password" placeholder="Password">
        <button class="form_btn">Sign Up</button>
      </form>
    </div>
    
    <!-- 로그인 버튼 클릭시! -->
    <div class="sign-in-container">
      <form name="f" action="login_ok.do" method="post">
        <h1>Sign In</h1>
        <div class="social-links">
           <!-- 카카오 네이버 연동 로그인 -->
          <div>
             <!-- 카카오 -->
             <input type="hidden" name="kakaoemail" id="kakaoemail" />
             <input type="hidden" name="kakaoname" id="kakaoname" />
             <input type="hidden" name="kakaobirth" id="kakaobirth" />
             
            <a href="javascript:kakaoLogin();"><i aria-hidden="true"><img src="resources/img/kakao.png" width="40" height="40"></i></a>
          </div>          

		<c:choose>
		<c:when test="${sessionId != null}">
			<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
			<h3>'${sessionId}' 님 환영합니다! </h3>
            	<h3><a href="logout">로그아웃</a></h3>
		</c:when>
		<c:otherwise>
          <!-- 네이버 연동 -->
          <div id="naver_id_login" style="text-align:center">
          	<a href="${url}"><i aria-hidden="true"><img src="resources/img/naver.png" width="40" height="40"></i></a>
          </div>
  		</c:otherwise>
	</c:choose>
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
        
        <!-- 아이디 비밀번호 찾기 -->
        <div class="social-links">
          <div>
          
          <c:if test="${empty value}"> <!-- 아이디 기억하기 -->
               <input type="checkbox" name="saveId">
        </c:if>
        <c:if test="${not empty value}">
               <input type="checkbox" name="saveId" checked>
        </c:if>            
               <font face="굴림" size="2">remember id</font>
               
            </nobr>
            <a href="javascript:search('id')"><i class="form_btn2">find id</i></a>
          </div>
          <div>
            <a href="javascript:search('pw')"><i class="form_btn2">find pw</i></a>
          </div>
         </div>
          
      </form>
    </div>
    
   <!-- 카카오 이메일을 넘기기 위한 숨겨진 form -->
    <form action="./kakaologin.do" method="post" name="lfrm" hidden>
    <input type="text" name="kakaoemail" id="kakaoemail" value="" />
    </form>
    
	<form action="loginOk.do" method="post" name="f2"  style="width:470px;">
		<input type="hidden" name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}"> <br>
		<input type="hidden" id="passwd" name="passwd" class="w3-input w3-border" placeholder="비밀번호" >	<br>
	</form>
             
   
    
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
