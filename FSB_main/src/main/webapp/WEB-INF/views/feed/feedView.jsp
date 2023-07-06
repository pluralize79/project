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
	        		<div class="container d-flex w-100 align-items-center justify-content-between">
	      				<div class="col mb-3" align="left" style="padding: 15px 0px 0px 22px;">
	      					<img src="resources/img/default_profile.png" width="25" height="25">&nbsp
	        				<strong>${id}</strong>
	        			</div>
	        			<div class="col container" align="right">
	        				<div class="row mb-2"><small class="text-muted">| 신고</small></div>
	        				<div class="row mb-2">
	        					<div class="col" align="right">
	        						<svg fill="#A6A6A6" width="16" height="20"><use xlink:href="#location"></use></svg>
	        						<small class="text-muted">서울시 노원구 ㅁㅁ카페</small>
	        					</div>
	        				</div>
	        			</div>
	      			</div>
	        		<div class="container">
		      			<div class="row">
	     					<div class="container small">
	     						<div class="row mb-1" style="padding: 10px 20px 20px 20px; font-size: 16; line-height: 150%; word-break: break-all;">
	     							어른들은 나에게 속이 보였다 안 보였다 하는 보아뱀의 그림따위는 집어 치우고, 차라리 지리나 산수, 역사, 문법에 재미를 붙여 보라고 충고했다.
	     						</div>
	     						<div class="row mb-1"><img src="resources/img/main1.jpg"></div>
	     						<div class="row">
	     							<div class="col mt-3 small" style="padding:0">
	     								<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#text-quote"></use></svg>
	     								11
	     								<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#heart-empty"></use></svg>
	     								14
	     								<svg class="bi pe-none me-2" fill="#A6A6A6" width="20" height="20"><use xlink:href="#message"></use></svg>
	     								쪽지 보내기
	     							</div>
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
		    