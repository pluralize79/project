<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="resources/css/bootstrap-grid.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-grid.rtl.min.css" rel="stylesheet">
<link href="resources/css/sidebars.css" rel="stylesheet">
<script src="resources/js/sidebars.js"></script>

<style>
	.vertical-right-line {
		border-right-style: solid;
	 	border-right-width: 2px;
	  	border-right-color: #dee2e6;
	}
</style>
	
<%@include file="../user/user_top.jsp" %>

<body>
	
	<!-- 벡터 아이콘 정의 -->
 	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  		<symbol id="home" viewBox="0 0 16 16">
   			 <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"></path>
  		</symbol>
  		<symbol id="table" viewBox="0 0 16 16">
   	 		<path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"></path>
  		</symbol>
  		<symbol id="people-circle" viewBox="0 0 16 16">
    		<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
    		<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
  		</symbol>
  		<symbol id="grid" viewBox="0 0 16 16">
    		<path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"></path>
  		</symbol>
  		<symbol id="collection" viewBox="0 0 16 16">
    		<path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"></path>
  		</symbol>
  		<symbol id="calendar3" viewBox="0 0 16 16">
    		<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"></path>
    		<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"></path>
  		</symbol>
  		<symbol id="chat-quote-fill" viewBox="0 0 16 16">
    		<path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM7.194 6.766a1.688 1.688 0 0 0-.227-.272 1.467 1.467 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 5.734 6C4.776 6 4 6.746 4 7.667c0 .92.776 1.666 1.734 1.666.343 0 .662-.095.931-.26-.137.389-.39.804-.81 1.22a.405.405 0 0 0 .011.59c.173.16.447.155.614-.01 1.334-1.329 1.37-2.758.941-3.706a2.461 2.461 0 0 0-.227-.4zM11 9.073c-.136.389-.39.804-.81 1.22a.405.405 0 0 0 .012.59c.172.16.446.155.613-.01 1.334-1.329 1.37-2.758.942-3.706a2.466 2.466 0 0 0-.228-.4 1.686 1.686 0 0 0-.227-.273 1.466 1.466 0 0 0-.469-.324l-.008-.004A1.785 1.785 0 0 0 10.07 6c-.957 0-1.734.746-1.734 1.667 0 .92.777 1.666 1.734 1.666.343 0 .662-.095.931-.26z"></path>
  		</symbol>
  		<symbol id="gear-fill" viewBox="0 0 16 16">
    		<path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"></path>
  		</symbol>
  		<symbol id="toggles2" viewBox="0 0 16 16">
    		<path d="M9.465 10H12a2 2 0 1 1 0 4H9.465c.34-.588.535-1.271.535-2 0-.729-.195-1.412-.535-2z"></path>
    		<path d="M6 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm0 1a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm.535-10a3.975 3.975 0 0 1-.409-1H4a1 1 0 0 1 0-2h2.126c.091-.355.23-.69.41-1H4a2 2 0 1 0 0 4h2.535z"></path>
    		<path d="M14 4a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
  		</symbol>
  		<symbol id="tools" viewBox="0 0 16 16">
    		<path d="M1 0L0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z"></path>
  		</symbol>
  		<symbol id="chevron-right" viewBox="0 0 16 16">
    		<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
  		</symbol>
  		<symbol id="geo-fill" viewBox="0 0 16 16">
    		<path fill-rule="evenodd" d="M4 4a4 4 0 1 1 4.5 3.969V13.5a.5.5 0 0 1-1 0V7.97A4 4 0 0 1 4 3.999zm2.493 8.574a.5.5 0 0 1-.411.575c-.712.118-1.28.295-1.655.493a1.319 1.319 0 0 0-.37.265.301.301 0 0 0-.057.09V14l.002.008a.147.147 0 0 0 .016.033.617.617 0 0 0 .145.15c.165.13.435.27.813.395.751.25 1.82.414 3.024.414s2.273-.163 3.024-.414c.378-.126.648-.265.813-.395a.619.619 0 0 0 .146-.15.148.148 0 0 0 .015-.033L12 14v-.004a.301.301 0 0 0-.057-.09 1.318 1.318 0 0 0-.37-.264c-.376-.198-.943-.375-1.655-.493a.5.5 0 1 1 .164-.986c.77.127 1.452.328 1.957.594C12.5 13 13 13.4 13 14c0 .426-.26.752-.544.977-.29.228-.68.413-1.116.558-.878.293-2.059.465-3.34.465-1.281 0-2.462-.172-3.34-.465-.436-.145-.826-.33-1.116-.558C3.26 14.752 3 14.426 3 14c0-.599.5-1 .961-1.243.505-.266 1.187-.467 1.957-.594a.5.5 0 0 1 .575.411z"></path>
  		</symbol>
  		<symbol id="text-quote" viewBox="0 0 24 24">
  			<path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366c4.49 0 8.129 3.64 8.129 8.13 0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067c-4.49.1-8.183-3.51-8.183-8.01zm8.005-6c-3.317 0-6.005 2.69-6.005 6 0 3.37 2.77 6.08 6.138 6.01l.351-.01h1.761v2.3l5.087-2.81c1.951-1.08 3.163-3.13 3.163-5.36 0-3.39-2.744-6.13-6.129-6.13H9.756z"></path>
  		</symbol>
  		<symbol id="heart-empty" viewBox="0 0 24 24">
  			<path d="M16.697 5.5c-1.222-.06-2.679.51-3.89 2.16l-.805 1.09-.806-1.09C9.984 6.01 8.526 5.44 7.304 5.5c-1.243.07-2.349.78-2.91 1.91-.552 1.12-.633 2.78.479 4.82 1.074 1.97 3.257 4.27 7.129 6.61 3.87-2.34 6.052-4.64 7.126-6.61 1.111-2.04 1.03-3.7.477-4.82-.561-1.13-1.666-1.84-2.908-1.91zm4.187 7.69c-1.351 2.48-4.001 5.12-8.379 7.67l-.503.3-.504-.3c-4.379-2.55-7.029-5.19-8.382-7.67-1.36-2.5-1.41-4.86-.514-6.67.887-1.79 2.647-2.91 4.601-3.01 1.651-.09 3.368.56 4.798 2.01 1.429-1.45 3.146-2.1 4.796-2.01 1.954.1 3.714 1.22 4.601 3.01.896 1.81.846 4.17-.514 6.67z"></path>
		</symbol>
		<symbol id="location" viewBox="0 0 16 24">
			<path d="M10 0c4.4 0 7.95 3.5 7.95 7.79a7.6 7.6 0 01-1.23 4.15l-6.33 8.02a.5.5 0 01-.78 0l-6.38-8.1A7.6 7.6 0 012.05 7.8 7.89 7.89 0 0110 0zm0 1.54A6.38 6.38 0 003.55 7.8c0 1.18.34 2.33.96 3.28l5.5 6.92 5.44-6.86a6.08 6.08 0 001-3.34A6.37 6.37 0 0010 1.54zM6.75 6.92h6.5a.5.5 0 01.5.5v.54a.5.5 0 01-.5.5h-6.5a.5.5 0 01-.5-.5v-.54a.5.5 0 01.5-.5z"></path>
		</symbol>
	</svg>

	<!-- 전체 -->
  	<main class="d-flex flex-nowrap">
  	
  		<!-- 사이드 바 -->
  		<div class="vertical-right-line flex-shrink-0 p-3 bg-white" style="width: 280px;">
    		<a href="feed.do" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      			<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#people-circle"></use></svg>
      			<span class="fs-5 fw-semibold">${member.mem_nickname} 님</span>
   			</a>
   			
   			<!-- 프로필 -->
   			<div class="container">
   				<!-- 프사 -->
   				<div class="row mb-3">
	   				<div class="col" align="center"><img src="resources/img/${profile.prof_img}" class="img-thumbnail"></div>
	   			</div>
	   			<!-- 버튼 -->
	   			<div class="row mb-3">
	   				<div class="col" align="center">
	   					<button type="button" class="btn btn-outline-primary btn-sm">프로필 수정</button>&nbsp&nbsp
	   					<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='feed.do'">메인홈</button>
	   				</div>
	   			</div>
	   			<!-- 상태 메시지 -->
	   			<div class="row mb-3">
	   				<div class="col" align="center">
	   				<span class="small">${profile.prof_msg}</span></div>
	   			</div>
	   			<!-- 팔로잉 팔로워 -->
	   			<div class="row mb-3">
	   				<div class="col" align="center">
	   					<span class="small fw-semibold">팔로잉</span>&nbsp;&nbsp;
	   					<span class="small">${profile.prof_following}</span>
	   				</div>
	   				<div class="col" align="center">
	   					<span class="small fw-semibold">팔로우</span>&nbsp;&nbsp;
	   					<span class="small">${profile.prof_follower}</span>
	   				</div>
	   			</div>
   			</div>
   			
   			<div class="border-top"></div>
   		
	   		<!-- 메뉴 항목 -->	
	    	<ul class="list-unstyled ps-0 mt-3">
	      		<li class="mb-1">
	        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#friend-collapse" aria-expanded="true">
	         			친구 관리
	       			</button>
	        		<div class="collapse show" id="friend-collapse">
	          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            			<li><a href="friendRequest.do" class="link-dark d-inline-flex text-decoration-none rounded">친구 요청</a></li>
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">차단 목록</a></li>
	         			</ul>
	        		</div>
	      		</li>
	      		<li class="mb-1">
	        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
	         			계정 관리
	        		</button>
	        		<div class="collapse" id="account-collapse">
	          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">내 정보</a></li>
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">비밀번호 변경</a></li>
	          			</ul>
	        		</div>
	      		</li>
	      		<li class="mb-1">
	        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#storage-collapse" aria-expanded="false">
	          			보관함
	        		</button>
	        		<div class="collapse" id="storage-collapse">
	          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">쿠폰함</a></li>
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">뱃지 목록</a></li>
	           	 			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">보드게임 지도</a></li>
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">찜한 보드게임</a></li>
	          			</ul>
	        		</div>
	    		</li>
    		
	    		<!--구분선 -->
	       		<li class="border-top my-3"></li>
	       		
	      		<li class="mb-1">
	        		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#inquiry-collapse" aria-expanded="false">
	          			문의 사항
	        		</button>
	        		<div class="collapse" id="inquiry-collapse">
	          			<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">공지사항</a></li>
	            			<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">1:1 문의</a></li>
	           			 	<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">회원 탈퇴</a></li>
	          			</ul>
	        		</div>
	      		</li>
	      		
	    	</ul>
	  	</div>

		<!-- 쪽지함 -->
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;">
			<div class="d-flex align-items-center flex-shrink-0 p-3 border-bottom container">
				<div class="col" align="left"><span class="link-dark text-decoration-none fs-5 fw-semibold">쪽지함</span></div>
				<div class="col" align="right"><button type="button" class="btn btn-outline-primary btn-sm">새 쪽지</button></div>
			</div>
			<div class="list-group list-group-flush border-bottom scrollarea">
				<c:forEach var="i" begin="0" end="20" step="1">
					<!-- DM방 한 개 -->
					<a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
	        			<div class="d-flex w-100 align-items-center justify-content-between">
	          				<strong class="mb-1">AAA, BBB, CCC</strong>
	          				<small class="text-muted">2023.06.01 23:07</small>
	        			</div>
	       	 			<div class="col-10 mb-1 small">어쩌구 저쩌구 이러쿵 저러쿵</div>
	      			</a>
	      		</c:forEach>
			</div>
		
		</div>

	</main>

</body>
<%@include file="../user/user_bottom.jsp" %>