<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- br_report_list.jsp // 댓글 신고 내역 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- css, js 연결 -->
	<script src="resources/js/jquery-3.7.0.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<div align="left" style="overflow: scroll; height: 800px;">
	<h6>1 : 욕설 및 부적절한 언어</h6>
	<h6>2 : 광고 및 스팸성</h6>
	<h6>3 : 개인정보노출</h6>
	<h6>4 : 음란성/선정성</h6>
	<h6>5 : 도배성</h6>
		<table class="table" width="80%" height="80%">
				<tr align="center">
					<th height="30">구분</th>
					<th>target 번호</th>
					<th>신고자 닉네임</th>
					<th>신고일</th>
					<th>처리여부</th>
					<th>신고 사유</th>
					<th>상세 내용</th>
				</tr>
				<c:if test="${empty listReport}">
					<tr align="center">
						<td colspan="7">신고내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty listReport}">
					<c:forEach items="${listReport}" var="dto">
						<tr align="center">
							<td>${dto.report_mode}</td>
							<td>${dto.report_target}</td>
							<td>${dto.mem_nickname}</td>
							<td>${dto.report_regdate}</td>
							<td>${dto.report_check}</td>
							<td>${dto.report_content}</td>
							<td>${dto.report_detail}</td>
						</tr>
					</c:forEach>
				</c:if>
		</table>
	</div>