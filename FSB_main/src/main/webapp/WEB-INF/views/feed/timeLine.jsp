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
	
	.tl-content-box-outer {
		max-height: 7rem;
		padding-left: 0.8rem; 
		text-overflow: ellipsis; 
		overflow: hidden;
	}
	
	.tl-content-box-inner {
		line-height: 142%; 
		word-break: break-all;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 5;
		overflow: hidden;
	}
	
	.no-pm{
		padding: 0px !important;
		margin: 0px !important;
	}
	
	.tl-img {
		object-fit: cover;
		width: 100%;
		height: 100%;
	}
</style>

<script>
	function viewFeed(fff){
		var feed_num = fff;
		console.log(feed_num);
		$.ajax({
		    url:'timeLine_feedView.do', //request 보낼 서버의 경로
		    type:'get', // 메소드(get, post, put 등)
		    data:{'feed_num': feed_num}, //보낼 데이터 (json 형식)
		    success: function(data) {
		    	$("#feedView").html(data) ;
		    },
		    error: function(err) {
		    	alert("ajax 처리 중 에러 발생");
		    }
		});

	}
</script>
	
<%@include file="../user/user_top.jsp" %>

<body>
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
	   					<button type="button" class="btn btn-outline-primary btn-sm">프로필 수정</button>&nbsp;&nbsp;
	   					<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='dm_main.do'">쪽지함</button>
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

		<!-- 타임라인 -->
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;">
			<div class="d-flex align-items-center flex-shrink-0 p-3 border-bottom container">
				<div class="col" align="left"><span class="link-dark text-decoration-none fs-5 fw-semibold">타임라인</span></div>
				<div class="col" align="right">
					<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='feedForm.do'">새 글 쓰기</button>
				</div>
			</div>
			<div class="list-group list-group-flush border-bottom scrollarea">
				<c:forEach var="feed" items="${listFeed}" varStatus="status">
				<!-- 피드 한 개 -->
				<a class="list-group-item list-group-item-action py-3 lh-sm" onclick="viewFeed(${feed.feed_num})">
	        		<div class="d-flex w-100 align-items-center justify-content-between">
		        		<div class="container">
		        			<div class="row">
			        			<div class="col" align="left">
			        				<img src="resources/img/${feed.prof_img}" width="25" height="25">&nbsp
			          				<strong>${feed.mem_nickname}</strong>
									<c:if test="${feed.prof_open == 'secret'}">
										<svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" fill="#A6A6A6" class="bi bi-lock-fill" viewBox="0 0 16 16" preserveAspectRatio="none">
		  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
										</svg>
									</c:if>
									<small class="text-muted" style="margin-left: 0.5rem;">${feed.mem_id}</small>
			          			</div>
			          			<div class="col-auto" align="right" style="padding-top: 0.3em;">
			          				<small class="text-muted">| 신고</small>
			          			</div>
		          			</div>
		          			<div class="row mb-2" align="right">
	          					<div class="col-12" align="right">
	          						<svg fill="#A6A6A6" width="16" height="20"><use xlink:href="#location"></use></svg>
	          						<small class="text-muted">아직 위치정보못함</small>
	          					</div>
		          			</div>
	       					<div class="row">
	       						<!-- 이미지 0장 -->
	       						<c:if test="${empty feed.feed_img1}">
	       							<div class="small tl-content-box-outer mb-3">
	       								<div class="tl-content-box-inner">
	       									${feed.feed_content}
	       								</div>
	       							</div>
	       						</c:if>
	       						<!-- 이미지 1장 -->
	       						<c:if test="${not empty feed.feed_img1 and empty feed.feed_img2}">
	       							<div class="col-8 small tl-content-box-outer" style="padding-right: 1.6rem;">
	       								${feed.feed_content}
	       							</div>
	       							<div class="col-4 container no-pm" style="height: 7rem;">
										<img class="tl-img" src="resources/img/${feed.feed_img1}">
	       							</div>
	       						</c:if>
	       						<!-- 이미지 2장 -->
	       						<c:if test="${not empty feed.feed_img1 and not empty feed.feed_img2 and empty feed.feed_img3}">
	       							<div class="col-8 small tl-content-box-outer" style="padding-right: 1.6rem;">
	       								<div class="tl-content-box-inner">
	       									${feed.feed_content} ${not empty feed.feed_img1 and not empty feed.feed_img2 and empty feed.feed_img3}
	       								</div>
	       							</div>
	       							<div class="col-4 container" style="height: 7rem;">
	       								<div class="row" style="height: 100%">
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img1}">
											</div>
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img2}">
											</div>
	       								</div>
	       							</div>
	       						</c:if>
	       						<!-- 이미지 3장 -->
	       						<c:if test="${not empty feed.feed_img1 and not empty feed.feed_img2 and not empty feed.feed_img3 and empty feed.feed_img4}">
	       							<div class="col-8 small tl-content-box-outer" style="padding-right: 1.6rem;">
	       								<div class="tl-content-box-inner">
	       									${feed.feed_content}
	       								</div>
	       							</div>
	       							<div class="col-4 container" style="height: 7rem;">
	       								<div class="row" style="height: 100%">
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img1}">
											</div>
											<div class="col-6 no-pm">
												<div class="row" style="height: 50%">
													<img class="tl-img" src="resources/img/${feed.feed_img2}">
												</div>
												<div class="row" style="height: 50%">
													<img class="tl-img" src="resources/img/${feed.feed_img3}">
												</div>
											</div>
	       								</div>
	       							</div>
	       						</c:if>
	       						<!-- 이미지 4장 -->
	 	       					<c:if test="${not empty feed.feed_img1 and not empty feed.feed_img2 and not empty feed.feed_img3 and not empty feed.feed_img4}">
	       							<div class="col-8 small tl-content-box-outer" style="padding-right: 1.6rem;">
	       								<div class="tl-content-box-inner">
	       									${feed.feed_content}
	       								</div>
	       							</div>
	       							<div class="col-4 container" style="height: 7rem;">
	       								<div class="row" style="height: 50%">
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img1}">
											</div>
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img2}">
											</div>
	       								</div>
										<div class="row" style="height: 50%">
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img3}">
											</div>
											<div class="col-6 no-pm">
												<img class="tl-img" src="resources/img/${feed.feed_img4}">
											</div>
										</div>
	       							</div>
	       						</c:if>      						
       						</div>
       						<div class="row small">
       							<div class="col" align="left" style="padding:0">
	       							<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#text-quote"></use></svg>
	       							00
	       							<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#heart-empty"></use></svg>
	       							${feed.feed_like}
	       							<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#message"></use></svg>
	       							쪽지 보내기
       							</div>
       						</div>
		        		</div>
	        		</div>
	      		</a>
	      		</c:forEach>
			</div>
		
		</div>
		
		<div id="feedView" class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;"></div>
		
	</main>

</body>
<%@include file="../user/user_bottom.jsp" %>