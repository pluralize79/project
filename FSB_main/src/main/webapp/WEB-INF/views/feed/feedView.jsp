<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

	<!-- 피드 상세보기 -->
		<!-- <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;"> -->
			<div class="d-flex align-items-center flex-shrink-0 p-3 border-bottom container">
				<div class="col-auto" align="left">
					<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#grid"></use></svg>
				</div>
				<div class="col" align="left"><span class="link-dark text-decoration-none fs-5 fw-semibold">피드 상세보기</span></div>
			</div>
			<div class="list-group list-group-flush border-bottom scrollarea">
				<!-- 피드 본문 -->
				<div class="list-group-item py-3 lh-sm">
					<div class="d-flex w-100 align-items-center justify-content-between">
		        		<div class="container" style="padding: 1.5rem;">
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
		          				<div class="small tl-content-box-outer mb-3">
       								<div class="tl-content-box-inner">
       									${feed.feed_content}
       								</div>
       							</div>
		          			</div>
	       					<div class="row">
	       						<!-- 이미지 1장 -->
	       						<c:if test="${not empty feed.feed_img1 and empty feed.feed_img2}">
	       							<div class="col-4 container no-pm" style="width: 100%; height: 20rem;">
										<img class="tl-img" src="resources/img/${feed.feed_img1}">
	       							</div>
	       						</c:if>
	       						<!-- 이미지 2장 -->
	       						<c:if test="${not empty feed.feed_img1 and not empty feed.feed_img2 and empty feed.feed_img3}">
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
		      	</div>
		      	<!-- 댓글 -->
	     		<c:forEach var="i" begin="0" end="20" step="1">
					<!-- 댓글 하나 -->
					<div class="list-group-item py-3 lh-sm">
	        			<div class="d-flex w-100 align-items-center justify-content-between">
	          				<strong class="mb-1">${id}</strong>
	          				<small class="text-muted">| 신고</small>
	        			</div>
	       	 			<div class="col-10 mb-1 small">어쩌구 저쩌구 이러쿵 저러쿵</div>
	      			</div>
				</c:forEach>
			</div>
		
		<!-- </div> -->
		    