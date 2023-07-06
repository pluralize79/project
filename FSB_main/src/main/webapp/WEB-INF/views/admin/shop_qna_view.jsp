<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- shop_qna_view.jsp // 문의내역 상세보기 -->

 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- css, js 연결 -->
	<script src="resources/js/jquery-3.7.0.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	
	<!-- 사이드 바 css, js -->
	<link href="resources/css/sidebars.css" rel="stylesheet">
	<script src="resources/js/sidebars.js"></script>
		
<!-- <script type="text/javascript">
	function insertReply(){
		var form = $('#f')[0];
		var formData = new FormData(form);
		$.ajax({
			type : 'post',
			url : 'admin_shop_qna_reply.do',
			data : formData,
			dataType:'json',
		    processData:false,
		    contentType:false,
		    cache:false,
		    
			success: function(data) {
		    	alert("성공");
	
		    },
		    error: function(err) {
		    	location.reload();
		    	/* alert("ajax 처리 중 에러 발생");
		        //서버로부터 응답이 정상적으로 처리되지 못했을 때 실행 */
		    }
		});
	}
</script> -->

<!-- 삭제 script -->
<script type="text/javascript">
	function checkDel(){
		var isDel = window.confirm("정말로 삭제하겠습니까?")
		if (isDel){
			document.f2.submit()
		}
	}
	function updateReply(){
		document.getElementById('sq_reply').readOnly = false;
		
		var target = document.getElementById('btn1');
		var target2 = document.getElementById('btn2');
		
		target.disabled = true;
		target2.disabled = false;
	}
</script>

		
		<h5>문의내역 상세보기</h5>
		<div align="left">
			<h6><strong>문의 번호 : </strong>${getShopQna.sq_num}</h6>
			<h6><strong>상품 번호 : </strong>${getShopQna.prod_num}</h6>
			<h6><strong>작성자 : </strong>${getShopQna.mem_nickname}</h6>
			<h6><strong>작성일 : </strong>${getShopQna.sq_regdate}</h6>
			<h6><strong>구분 : </strong>
				<c:if test="${getShopQna.sq_type eq 'prod_QnA'}">상품 문의</c:if>
				<c:if test="${getShopQna.sq_type eq 'deli_QnA'}">배송 문의</c:if>
				<c:if test="${getShopQna.sq_type eq 'return_QnA'}">취소/반품/<br>교환 문의</c:if>
				<c:if test="${getShopQna.sq_type eq 'etc_QnA'}">기타 문의</c:if>
			</h6>
		<!-- 이미지 슬라이드 -->
		<c:if
			test="${not empty getShopQna.sq_img1 ||not empty getShopQna.sq_img2||not empty getShopQna.sq_img3||not empty getShopQna.sq_img4}">
			<div id="carouselExampleIndicators" class="carousel slide p-3">
				<div class="carousel-indicators">
					<c:if test="${not empty getShopQna.sq_img1}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
					</c:if>
					<c:if test="${not empty getShopQna.sq_img2}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
					</c:if>
					<c:if test="${not empty getShopQna.sq_img3}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</c:if>
					<c:if test="${not empty getShopQna.sq_img4}">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="3" aria-label="Slide 4"></button>
					</c:if>
				</div>
				<!-- 이미지 여러개 -->
				<div class="carousel-inner">
					<c:if test="${not empty getShopQna.sq_img1}">
						<div class="carousel-item active">
							<img src="resources/img/${getShopQna.sq_img1}"
								class="d-block w-100 h-50">
						</div>
					</c:if>

					<c:if test="${not empty getShopQna.sq_img2}">
						<div class="carousel-item">
							<img src="resources/img/${getShopQna.sq_img2}"
								class="d-block w-100 h-50">
						</div>
					</c:if>

					<c:if test="${not empty getShopQna.sq_img3}">
						<div class="carousel-item">
							<img src="resources/img/${getShopQna.sq_img3}"
								class="d-block w-100 h-50">
						</div>
					</c:if>

					<c:if test="${not empty getShopQna.sq_img4}">
						<div class="carousel-item">
							<img src="resources/img/${getShopQna.sq_img4}"
								class="d-block w-100 h-50" >
						</div>
					</c:if>
				</div>

				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			</c:if>
			<!-- 내용 -->
				<h6><strong>제목 : </strong>${getShopQna.sq_title}</h6>
				<div class="accordion" id="accordionExample">
  					<div class="accordion-item">
	    				<h2 class="accordion-header">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${getShopQna.sq_num}" aria-expanded="true" aria-controls="collapse${getShopQna.sq_num }">
	  						<strong>문의 내용 :&nbsp;</strong>${getShopQna.sq_content}</button>
	  					</h2>
  				<div id="collapse${getShopQna.sq_num }" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
      				<div class="accordion-body">
						<form name="f" action="admin_shop_qna_reply.do" method="post">
							
								<strong>문의 답변 :</strong>
								<c:if test="${empty getShopQna.sq_reply}">
									<textarea name="sq_reply" class="form-control" rows="5" cols="15"></textarea>
									<input type="hidden" name="sq_num" value="${getShopQna.sq_num}">
									<input type="hidden" name="reply_mode" value="insert">
									<button type="submit" class="btn btn-secondary btn-sm">답변 등록</button>
								</c:if>
								<c:if test="${not empty getShopQna.sq_reply}">
									<textarea id="sq_reply" name="sq_reply" class="form-control" rows="5" cols="15" readOnly>${getShopQna.sq_reply}</textarea>
									<input type="hidden" name="sq_num" value="${getShopQna.sq_num}">
									<input type="hidden" name="reply_mode" value="update">
									<a href="javascript:updateReply()"><button type="button" class="btn btn-secondary btn-sm" id="btn1">답변 수정</button></a>
									<button type="submit" class="btn btn-secondary btn-sm" id="btn2" disabled>수정된 답변 적용</button>
									<a href="javascript:checkDel()"><button type="button" class="btn btn-secondary btn-sm">답변 삭제</button></a>
								</c:if>
						</form>
						<form name="f2" action="admin_shop_qna_reply_del.do" method="post">
							<input type="hidden" name="sq_num" value="${getShopQna.sq_num}">
						</form>
					</div>
				</div>
				</div>
				</div>
			</div>

