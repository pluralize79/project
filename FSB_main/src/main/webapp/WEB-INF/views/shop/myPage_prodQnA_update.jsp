<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myPage_prodQnA_update.jsp -->
<%@include file="myPage_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
		function check(){
			if (f.id.value==""){
				alert("아이디를 입력해 주세요!!")
				f.id.focus()
			return
			}	
			if (!f.passwd.value){
				alert("비밀번호를 입력해 주세요!!")
				f.passwd.focus()
			return
			}
			document.f.submit()
		}	
	</script>
<body onload="f.id.focus()">
<td>
	<form name="f" method="POST" action="shop_myPage_ProdQnA_update.do">
		<table width="70%" align="center">
			<tr>
				<th>문의하기</th>
			</tr>
			<tr>
				<td>
					<select name ="sq_type" class="form-select" aria-label="Default select example">
					 <!--  <option selected>문의 종류를 선택해주세요.</option> -->
						<c:if test="${getQnA.sq_type eq 'prod_QnA' }">
					 		 <option value="prod_QnA" selected>상품 문의</option>
					 		 <option value="deli_QnA">배송 문의</option>
					 		 <option value="return_QnA">취소/반품 문의</option>
					 		 <option value="etc_QnA">기타 문의</option>
					  	</c:if>
					  	<c:if test="${getQnA.sq_type eq 'deli_QnA' }">
					  		<option value="prod_QnA">상품 문의</option>
					  		<option value="deli_QnA" selected>배송 문의</option>
					 		<option value="return_QnA">취소/반품/교환 문의</option>
					 		<option value="etc_QnA">기타 문의</option>
					  	</c:if>
					  	<c:if test="${getQnA.sq_type eq 'return_QnA' }">
					  		<option value="prod_QnA">상품 문의</option>
					  		<option value="deli_QnA">배송 문의</option>
					  		<option value="return_QnA" selected>취소/반품/교환 문의</option>
					  		<option value="etc_QnA">기타 문의</option>
					  	</c:if>
					  	<c:if test="${getQnA.sq_type eq 'etc_QnA' }">
					  		<option value="prod_QnA">상품 문의</option>
					  		<option value="deli_QnA">배송 문의</option>
					  		<option value="return_QnA">취소/반품/교환 문의</option>
					  		<option value="etc_QnA" selected>기타 문의</option>
					  	</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group mb-3">
					  <span class="input-group-text" id="inputGroup-sizing-default">문의 제목</span>
					  <input type="text" name="sq_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${getQnA.sq_title }">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="input-group mb-3">
					  <input type="file" name="" class="form-control" id="insertQnAFile">
					  <label class="input-group-text" for="inputGroupFile02">선택</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">문의 내용</label>
					  <textarea name="sq_content" class="form-control" id="exampleFormControlTextarea1" rows="3">${getQnA.sq_content }</textarea>
					<!-- 기존 사진 표현 어떻게 할지 고민하기 -->
					</div>
				</td>
			</tr>
			<tr>
			<td>
				<div class="row g-3 align-items-center">
				  <div class="col-auto">
				    <label for="inputPassword6" class="col-form-label">비밀번호</label>
				  </div>
				  <div class="col-auto">
				  							<!-- 값이 있을 때 비밀글유무 1이 됨 -->
				    <input type="password" name="sq_secret" id="inputPassword6" class="form-control" aria-labelledby="passwordHelpInline">
				  </div>
				  <div class="col-auto">
				    <span id="passwordHelpInline" class="form-text">
				      	비밀글일 때 입력해주세요.
				    </span>
				  </div>
				</div>
			</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="문의하기">
					<input type="button" value="취소" onclick="window.location='shop_myPage_prodQnA.do'">
				</td>
			</tr>
		</table>
	</form>
</td>
</tr>
</table>
</body>
<%@include file="myPage_bottom.jsp" %>