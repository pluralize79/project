<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- img_view.jsp // 이미지 상세보기 새 창-->

<!-- css 파일 연결하기 -->
	<script src="resources/js/jquery-3.7.0.js">
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>


<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="resources/img/${img1}" class="d-block w-100 h-100">
		</div>
		<c:if test="${not empty img2}">
			<div class="carousel-item">
				<img src="resources/img/${img2}" class="d-block w-100 h-100">
    		</div>
		</c:if>
    	<c:if test="${not empty img3}">
			<div class="carousel-item">
				<img src="resources/img/${img3}" class="d-block w-100 h-100">
    		</div>
		</c:if>
		<c:if test="${not empty img4}">
			<div class="carousel-item">
				<img src="resources/img/${img4}" class="d-block w-100 h-100">
    		</div>
		</c:if>
  </div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>
