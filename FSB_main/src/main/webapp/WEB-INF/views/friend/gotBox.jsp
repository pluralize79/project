<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> v
<!DOCTYPE html>

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
