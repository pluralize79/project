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

<script>
	function autofind(){
		let text = document.getElementById('input_findFriend').value;
		if(text === null || text === ''){
			$("#auto_profs").children().remove();
		}else{
			$.ajax({
				//async: false, //서버로부터 답을 받기 전까지 일시정지
			    url:'friendFindAuto.do', //request 보낼 서버의 경로
			    type:'post', // 메소드(get, post, put 등)
			    data:{'text': text}, //보낼 데이터 (json 형식)
			    success: function(data) {	
			    	$("#auto_profs").html(data);
			    },
			    error: function(err) {
			    	alert("ajax 처리 중 에러 발생");
			    }
			});
		}	
	}
	function follow(mem_num,mode,prof_open,where){
		let text = document.getElementById('input_findFriend').value;
		alert(prof_open+'상태의 '+mem_num+'을'+mode+'합니다 '+where+'에서 요청됨.');
		event.stopPropagation();
		$.ajax({
		    url:'follow.do', //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post, put 등)
		    data:{'mem_num': ${member.mem_num}, 'friend_num': mem_num, 'text': text, 'mode': mode, 'where': where}, //보낼 데이터 (json 형식)
		    success: function(data) {
		    	if(where === 'autoBox'){
					if(text === null || text === ''){
						$("#auto_profs").children().remove();
					}else{
				    	$("#auto_profs").html(data);
					}
		    	}else{
					$("#auto_profs").children().remove();
					if(where === 'gotBox'){
						$("#gotBox").children().remove();
						$("#gotBox").html(data);
					}else{
						$("#sentBox").children().remove();
						$("#sentBox").html(data);
					}
		    	}
		    },
		    error: function(err) {
		    	alert("ajax 처리 중 에러 발생");
		    }
		});
	}
	function goToFeed(mem_num){
		alert(mem_num+"의 피드로 이동합니다");
		//해당 회원 개인 피드로 이동
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

		<!-- 상단 배젤 -->
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;">
			<div class="d-flex align-items-center flex-shrink-0 p-3 border-bottom">
				<span class="fs-5 fw-semibold">친구 요청</span>
			</div>
			<!-- 본문 -->
			<div class="list-group list-group-flush border-bottom scrollarea">
				<!-- 친구 찾기 -->
				<div class="list-group-item py-3 lh-sm mt-2" style="padding-left: 30;">
					<span class="fs-6 fw-semibold">&nbsp;친구 찾기</span>
					<div class="dropdown-menu d-block position-static pt-0 mx-0 rounded-3 shadow overflow-hidden w-280px mt-3" style="width: 90%; padding-bottom: 0;">
					    <form class="p-2 mb-0 bg-light">
							<div class="input-group">
								<input id="input_findFriend" type="search" class="form-control" autocomplete="false" placeholder="Type to filter..." aria-describedby="searchBtn" oninput="javascript:autofind()">
						    	<button class="btn btn-outline-secondary" type="button" id="searchBtn">
						    		<svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#search"></use></svg>
						    	</button>
					    	</div>
					    </form>
						<ul id="auto_profs" class="list-unstyled mb-0">
					    	<!-- 항목 하나 -->
						</ul>
	  				</div>
				</div>
				<!-- 받은 요청 -->
				<div class="list-group-item py-3 lh-sm mt-2" style="padding-left: 30;">
					<span class="fs-6 fw-semibold">&nbsp;받은 요청</span>
					<div id="gotBox" class="dropdown-menu d-block position-static pt-0 mx-0 rounded-3 shadow overflow-hidden w-280px mt-3" style="width: 90%;">
						<!-- 받은요청목록 -->
					    <c:if test="${fn:length(listGotRequest) > 0}">
						    <ul id="gotBox" class="list-unstyled mb-0 mt-3">
						    	<c:forEach var="prof" items="${listGotRequest}" varStatus="status">
						    		<li>
										<a class="dropdown-item d-flex align-items-center gap-2 py-2 to-feed-div" onclick="javascript: goToFeed(${prof.mem_num})">
											<div class="container mb-3" align="left">
												<div class="row align-items-center">
													<div class="col-1" align="left" style="padding: 0; vertical-align: middle;">
														<img src="resources/img/default_profile.png" width="30" height="30">&nbsp;
													</div>
													<div class="col-8 container" style="padding-left: 20px;">
														<div class="row">
															<div class="col">
																<strong>${prof.mem_nickname}</strong>
																<c:if test="${prof.prof_open == 'secret'}">
																	<svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" fill="#A6A6A6" class="bi bi-lock-fill" viewBox="0 0 16 16" preserveAspectRatio="none">
									  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
																	</svg>
																</c:if>
																<small class="text-muted" style="margin-left: 0.5rem;">${prof.mem_id}</small>
															</div>
														</div>
														<div class="row col mt-2">
															<span style="text-overflow:ellipsis;overflow:hidden;width:100%">
																<small>${prof.prof_msg}</small>
																<c:if test="${prof.prof_msg == null}">&nbsp;</c:if>
															</span>
														</div>
													</div>
													<div class="col-3" align="right" style="padding: 0;">
						        						<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript: follow(${prof.mem_num},'confirm','${prof.prof_open}','gotBox')">승인</button>&nbsp;
						        						<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript: follow(${prof.mem_num},'reject','${prof.prof_open}','gotBox')">거절</button>
						     						</div>
												</div>
											</div>
										</a>
									</li>
						    	</c:forEach>
							</ul>
						</c:if>
						<c:if test="${fn:length(listGotRequest) == 0}">
							<div class="container text-muted" align="center" style="padding: 7%;">
								<small>받은 요청이 없습니다.</small>
							</div>
						</c:if>
	  				</div>
				</div>
				<!-- 보낸 요청 -->
				<div class="list-group-item py-3 lh-sm mt-2" style="padding-left: 30;">
					<span class="fs-6 fw-semibold">&nbsp;보낸 요청</span>
					<div id="sentBox" class="dropdown-menu d-block position-static pt-0 mx-0 rounded-3 shadow overflow-hidden w-280px mt-3" style="width: 90%;">
						<!-- 보낸요청목록 -->
					    <c:if test="${fn:length(listSentRequest) > 0}">
					    <ul id="sentBox" class="list-unstyled mb-0 mt-3">
					    	<c:forEach var="prof" items="${listSentRequest}" varStatus="status">
					    		<li>
									<a class="dropdown-item d-flex align-items-center gap-2 py-2 to-feed-div" onclick="javascript: goToFeed(${prof.mem_num})">
										<div class="container mb-3" align="left">
											<div class="row align-items-center">
												<div class="col-1" align="left" style="padding: 0; vertical-align: middle;">
													<img src="resources/img/default_profile.png" width="30" height="30">&nbsp;
												</div>
												<div class="col-9 container" style="padding-left: 20px;">
													<div class="row">
														<div class="col">
															<strong>${prof.mem_nickname}</strong>
															<c:if test="${prof.prof_open == 'secret'}">
																<svg xmlns="http://www.w3.org/2000/svg" width="15" height="12" fill="#A6A6A6" class="bi bi-lock-fill" viewBox="0 0 16 16" preserveAspectRatio="none">
								  									<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
																</svg>
															</c:if>
															<small class="text-muted" style="margin-left: 0.5rem;">${prof.mem_id}</small>
														</div>
													</div>
													<div class="row col mt-2">
														<span style="text-overflow:ellipsis;overflow:hidden;width:100%">
															<small>${prof.prof_msg}</small>
															<c:if test="${prof.prof_msg == null}">&nbsp;</c:if>
														</span>
													</div>
												</div>
												<div class="col-2" align="right" style="padding: 0;">
					         							<button type="button" class="btn btn-outline-primary btn-sm" onclick="javascript: follow(${prof.mem_num},'unrequest','${prof.prof_open}','sentBox')">취소</button>
					      							</div>
											</div>
										</div>
									</a>
								</li>
					    	</c:forEach>
						</ul>
						</c:if>
						<c:if test="${fn:length(listSentRequest) == 0}">
							<div class="container text-muted" align="center" style="padding: 7%;">
								<small>받은 요청이 없습니다.</small>
							</div>
						</c:if>
	  				</div>
				</div>
			</div>
		</div>
		
		<div id="feedView" class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;"></div>
		
	</main>

</body>
<%@include file="../user/user_bottom.jsp" %>