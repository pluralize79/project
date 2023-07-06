<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-grid.min.css" rel="stylesheet">
<link href="resources/css/bootstrap-grid.rtl.min.css" rel="stylesheet">
<link href="resources/css/sidebars.css" rel="stylesheet">
<script src="resources/js/jquery-3.7.0.js"></script>
<script src="resources/js/bootstrap.bundle.min.js"></script>
<script src="resources/js/sidebars.js"></script>

<style>
	.vertical-right-line {
		border-right-style: solid;
	 	border-right-width: 2px;
	  	border-right-color: #dee2e6;
	}
</style>

<body>

	<!-- 전체 -->
  	<main class="d-flex flex-nowrap">
  	
		<!-- 쪽지함 -->
		<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 600px;">
			<div class="d-flex align-items-center flex-shrink-0 p-3 border-bottom container">
				<div class="col" align="center"><span class="link-dark text-decoration-none fs-5 fw-semibold">임시 글 목록</span></div>
			</div>
			<div class="list-group list-group-flush border-bottom scrollarea">
				<c:forEach var="i" begin="0" end="15" step="1">
					<!-- 임시글 한 개 -->
					<div class="list-group-item list-group-item-action py-3 lh-sm" onclick="window.close()">
	        			<div class="d-flex w-100 align-items-center justify-content-between mb-1">
	          				<small class="text-muted">2023.06.01 23:07</small>
	        			</div>
	       	 			<div class="col-12 mb-1 small">집에 가고 싶다 해야할 건 너무 많고 할 수 있는 건 없고 구글링은 이제 그만하고 싶고 어쩌구저쩌구</div>
	      			</div>
	      		</c:forEach>
			</div>
		
		</div>

	</main>

</body>