<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<!-- shop_myPage_top.jsp -->
<html>
   <!-- 사이드 바 css, js -->
   <link href="resources/css/sidebars.css" rel="stylesheet">
   <script src="resources/js/sidebars.js"></script>
<style>
li a {display:flex} /* 여기 까지 하면 세로로 가운데 정렬이 됩니다만, 텍스트가 왼쪽에 정렬됨. align-items:center 무의미  */
li p {width:100%; text-align:center} /* 텍스트가 가운데 정렬이 되도록 함 */
</style>
<head>
	<title>쇼핑몰 마이페이지</title>
   <script src="resources/js/jquery-3.7.0.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="resources/css/bootstrap.min.css" rel="stylesheet">
   <link href="resources/css/utilities.min.css" rel="stylesheet">
   <script src="resources/js/bootstrap.bundle.min.js"></script>
</head>
<body>
   <ul class="nav justify-content-end">	
        <li class="nav-item"><a class="nav-link" href="shop_main.do">쇼핑몰 메인</a></li>   		
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">회원가입</a> </li>
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="login.do">로그인</a></li>
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">장바구니</a></li>
        <li class="nav-item"><a class="nav-link" href="user_main.do">메인페이지로 가기</a></li>
   </ul>
<br><br>
<ul class="nav nav-pills nav-fill">  
  <li>
  	&nbsp;&nbsp;
  	<img src="resources/img/star.png" class="img-thumbnail" alt="프로필사진" width="70" height="70">
  </li>
  <li>
  	<br>
    	&nbsp;&nbsp;${login_mem.mem_nickname }님
    <br>
  		&nbsp;&nbsp;(${login_mem.mem_id })
  </li>
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="#"><img src="resources/img/shop_delivery.png" alt="배송" width="70" height="70"><font size="2" color="	#4169e1"><br>주문배송</font></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="shop_myPage_review.do"><img src="resources/img/shop_review.png" alt="리뷰" width="70" height="70"><font size="2" color="#4169e1"><br>리뷰</font></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="shop_myPage_coupon.do"><img src="resources/img/shop_coupon.png" alt="쿠폰" width="70" height="70"><font size="2" color="#4169e1"><br>쿠폰</font></a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="shop_myPage_point.do"><img src="resources/img/shop_point.png" alt="포인트" width="70" height="70"><font size="2" color="#4169e1"><br>포인트</font></a>
  </li>
</ul>

<!-- 벡터 아이콘 정의 -->
<table width="100%">
	<tr>
		<td width="10%">
 	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  		<symbol id="people-circle" viewBox="0 0 16 16">
    		<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
    		<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
  		</symbol>
  		<symbol id="grid" viewBox="0 0 16 16">
    		<path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"></path>
  		</symbol>
  		<symbol id="toggles2" viewBox="0 0 16 16">
    		<path d="M9.465 10H12a2 2 0 1 1 0 4H9.465c.34-.588.535-1.271.535-2 0-.729-.195-1.412-.535-2z"></path>
    		<path d="M6 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm0 1a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm.535-10a3.975 3.975 0 0 1-.409-1H4a1 1 0 0 1 0-2h2.126c.091-.355.23-.69.41-1H4a2 2 0 1 0 0 4h2.535z"></path>
    		<path d="M14 4a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
  		</symbol>
  		<symbol id="collection" viewBox="0 0 16 16">
    		<path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"></path>
  		</symbol>
  		<symbol id="tools" viewBox="0 0 16 16">
   			<path d="M1 0L0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z"></path>
		</symbol>
	</svg>
	
<main class="d-flex flex-nowrap">
          <div class="vertical-right-line flex-shrink-0 p-3 bg-white" style="width: 280px; height: 800px;">
               <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#toggles2"></use></svg>
               <span class="fs-5 fw-semibold">마이페이지</span>
            <ul class="list-unstyled ps-0">
            
            <!-- 구분선 -->
           <li class="border-top my-3"></li>
           
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
					쇼핑리스트
                </button>
              <div class="collapse show" id="home-collapse">
                   <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                   		<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">찜한 상품</a></li>
                  		<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">장바구니</a></li>
                  		<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">주문 목록</a></li>
                  		<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">취소·반품·환불·교환</a></li>
                  </ul>
              </div>
           </li>
           
           <!-- 구분선 -->
           <li class="border-top my-3"></li>
          
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse1" aria-expanded="true">
					내 활동
                </button>
              <div class="collapse show" id="dashboard-collapse1">
                   <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                      <li><a href="shop_myPage_review.do" class="link-dark d-inline-flex text-decoration-none rounded">구매 후기</a></li>
                      <li><a href="shop_myPage_prodQnA.do" class="link-dark d-inline-flex text-decoration-none rounded">상품 문의</a></li>
                  </ul>
              </div>
           </li>
           
           <!-- 구분선 -->
           <li class="border-top my-3"></li>
          
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse2" aria-expanded="true">
					내 혜택
                </button>
              <div class="collapse show" id="dashboard-collapse2">
                   <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                      <li><a href="shop_myPage_coupon.do" class="link-dark d-inline-flex text-decoration-none rounded">내 쿠폰</a></li>
                      <!-- <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">배송비 쿠폰</a></li> -->
                      <li><a href="shop_myPage_point.do" class="link-dark d-inline-flex text-decoration-none rounded">포인트 내역</a></li>
                  </ul>
              </div>
           </li>
           
           <!-- 구분선 -->
           <li class="border-top my-3"></li>
          
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse3" aria-expanded="true">
					회원 정보
                </button>
              <div class="collapse show" id="dashboard-collapse3">
                   <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                      <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">회원 정보 수정</a></li>
                      <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">배송지 관리</a></li>
                      <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">회원 탈퇴</a></li>
                  </ul>
              </div>
           </li>
           </ul>
         </div>
      </main>
      </td>  
