<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- writeForm.jsp -->
<%@include file="../user/user_top.jsp"%>
<html>
<head>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
<symbol id="img-select" viewBox="0 0 24 24">
<path d="M3 5.5C3 4.119 4.119 3 5.5 3h13C19.881 3 21 4.119 21 5.5v13c0 1.381-1.119 2.5-2.5 2.5h-13C4.119 21 3 19.881 3 18.5v-13zM5.5 5c-.276 0-.5.224-.5.5v9.086l3-3 3 3 5-5 3 3V5.5c0-.276-.224-.5-.5-.5h-13zM19 15.414l-3-3-5 5-3-3-3 3V18.5c0 .276.224.5.5.5h13c.276 0 .5-.224.5-.5v-3.086zM9.75 7C8.784 7 8 7.784 8 8.75s.784 1.75 1.75 1.75 1.75-.784 1.75-1.75S10.716 7 9.75 7z"></path>
</symbol>
</svg>
<title>중고게시판</title>
<script type="text/javascript">
	function check() {
		if (f.board_title.value == "") {
			alert("제목을 입력해주세요!")
			f.board_title.focus()
			return false
		}
		if (f.board_content.value == "") {
			alert("내용을 입력해주세요")
			f.board_content.focus()
			return false
		}
		return true
	}
	//중고금액 컴마단위
	 function inputNumberFormat(obj) {
	     obj.value = comma(uncomma(obj.value));
	 }

	 function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	 }

	 function uncomma(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	 }
</script>
</head>
<body>
	<div align="center">
		<form name="f" action="update_board_sh.do" method="post"
			onsubmit="return check()" enctype="multipart/form-data">
			<input type="hidden" name="board_num" value="${getBoard.board_num}" />
			<input type="hidden" name="board_re_group"value="${getBoard.board_re_group}" /> 
				<input type="hidden" name="board_re_step" value="${getBoard.board_re_step}" /> 
				<input type="hidden" name="board_re_level" value="${getBoard.board_re_level}" />
			<input type="hidden" name="pageNum" value="${pageNum}">
			<table class="table table-borderless">
				<tr>
					<td>
						<div class="mb-3 w-50 p-3 mx-auto p-2">
							<!--  테이블 센터랑 사이즈 조절하기  -->
							<!-- 수정시 제목, 내용 끌고오기 -->
							<label for="exampleFormControlInput1" class="form-label">제목</label>
							<input type="text" class="form-control"
								id="exampleFormControlInput1" value="${getBoard.board_title}"
								name="board_title">
						</div>
					</td>
				</tr>
						<tr>
					<td>
							<div class="mb-3 w-50 p-3 mx-auto p-2">
							<table class="table table-borderless">
							<tr>
							<td>
						<div class="input-group mb-3">
						<label class="input-group-text" for="inputGroupSelect01">거래 종류</label>
								<select class="form-select" id="inputGroupSelect01" name ="board_condition" >
									<c:if test="${getBoard.board_condition eq '팝니다'}">
									<option value="0" selected>팝니다</option>
									</c:if>
									<c:if test="${getBoard.board_condition ne '팝니다'}">
			        				<option value="0">팝니다</option>
			        				</c:if>
			        					<c:if test="${getBoard.board_condition eq '삽니다'}">
									<option value="1" selected>삽니다</option>
									</c:if>
									<c:if test="${getBoard.board_condition ne '삽니다'}">
			        				<option value="1">삽니다</option>
			        				</c:if>
			        					<c:if test="${getBoard.board_condition eq '교환'}">
									<option value="2" selected>교환</option>
									</c:if>
									<c:if test="${getBoard.board_condition ne '교환'}">
			        				<option value="2">교환</option>
			        				</c:if>
			        					<c:if test="${getBoard.board_condition eq '거래완료(내정)'}">
									<option value="3" selected>거래완료(내정)</option>
									</c:if>
									<c:if test="${getBoard.board_condition ne '거래완료(내정)'}">
			        				<option value="3">거래완료(내정)</option>
			        				</c:if>
								</select>
							</div>
							</td>
							</tr>
								<tr>
								<td>
								<!-- 고쳐야 할 부분ㄴ -->
							<div class="input-group mb-3">
								<label class="input-group-text" for="inputGroupSelect01">지역</label>
								<select class="form-select" id="inputGroupSelect01" name = "board_location">
									<c:if test="${getBoard.board_location eq '서울'}">
										<option value="0" selected>서울</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '서울'}">
										<option value="0">서울</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '경기'}">
										<option value="1" selected>경기</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '경기'}">
										<option value="1">경기</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '강원도'}">
										<option value="2" selected>강원도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '강원도'}">
										<option value="2">강원도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '충청북도'}">
										<option value="3" selected>충청북도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '충청북도'}">
										<option value="3">충청북도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '충청남도'}">
										<option value="4" selected>충청남도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '충청남도'}">
										<option value="4">충청남도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '경상북도'}">
										<option value="5" selected>경상북도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '경상북도'}">
										<option value="5">경상북도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '경상남도'}">
										<option value="6" selected>경상남도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '경상남도'}">
										<option value="6">경상남도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '전라북도'}">
										<option value="7" selected>전라북도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '전라북도'}">
										<option value="7">전라북도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '전라남도'}">
										<option value="8" selected>전라남도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '전라남도'}">
										<option value="8">전라남도</option>
									</c:if>
									<c:if test="${getBoard.board_location eq '제주도'}">
										<option value="8" selected>제주도</option>
									</c:if>
									<c:if test="${getBoard.board_location ne '제주도'}">
										<option value="8">제주도</option>
									</c:if>
								</select>
								</div>
							</td>
								</tr>
								<tr>
								<td>
								<div class="input-group mb-3">
								<label class="input-group-text" for="inputGroupSelect01">거래 방법</label>
								<select class="form-select" id="inputGroupSelect01" name="board_package">
									<c:if test="${getBoard.board_package eq '택배만'}">
									<option value="1" selected>택배만</option>
									</c:if>
									<c:if test ="${getBoard.board_package ne '택배만'}">
			        				<option value="1">택배만</option>
			        				</c:if>
			        					<c:if test="${getBoard.board_package eq '직거래만'}">
									<option value="2" selected>직거래만</option>
									</c:if>
									<c:if test ="${getBoard.board_package ne '직거래만'}">
			        				<option value="2">직거래만</option>
			        				</c:if>
			        					<c:if test="${getBoard.board_package eq '택배/직거래'}">
									<option value="3" selected>택배/직거래</option>
									</c:if>
									<c:if test ="${getBoard.board_package ne '택배/직거래'}">
			        				<option value="3">택배/직거래</option>
			        				</c:if>
								</select>
							</div>
							</td>
							</tr>
							<tr>
							<td>	
							<!-- 금액수 11자리 제한 , 천원 단위로 컴마찍기 -->
							<div class="input-group">
								<span class="input-group-text">가격</span>
								<input type="text" class="form-control" name="board_price" value="${getBoard.board_price}" maxlength='11' onkeyup="inputNumberFormat(this)" >
								<span class="input-group-text">원</span>
							</div>
							</td>
							</tr>
							<tr>
					<td>
					</table>
					</div>
						<div class="mb-3 w-50 p-3 mx-auto p-2">
							<label for="exampleFormControlTextarea1" class="form-label">내용</label>
							<p>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									name="board_content" rows="10">${getBoard.board_content}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 이미지 있으면 끌고오기  -->
						<div class="mb-3 w-50 p-3 mx-auto p-2">
							<c:if test="${not empty getBoard.board_img1}">
								<img src="resources/img/${getBoard.board_img1}"
									class="img-fluid" width="200" height="200">
							</c:if>
							<c:if test="${not empty getBoard.board_img2}">
								<img src="resources/img/${getBoard.board_img2}"
									class="img-fluid" width="200" height="200">
							</c:if>
							<c:if test="${not empty getBoard.board_img3}">
								<img src="resources/img/${getBoard.board_img3}"
									class="img-fluid" width="200" height="200">
							</c:if>
							<c:if test="${not empty getBoard.board_img4}">
								<img src="resources/img/${getBoard.board_img4}"
									class="img-fluid" width="200" height="200">
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 이미지 첨부 -->
						<div class="col mb-3 w-75 p-3 mx-auto p-2" align=center>
							<button type="button"
								class="btn btn-sm btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#image-collapse"
								aria-expanded="false">
								<svg class="bi pe-none me-2" fill="#A6A6A6" width="24"
									height="24">
                        <use xlink:href="#img-select"></use></svg>
								이미지 업로드 🔽
							</button>
						</div>
						<div class="d-grid gap-2 w-50 mx-auto p-2">
						<div class="collapse mb-3 w-75 p-3 mx-auto p-2"
							id="image-collapse">
							<label for="formFileSm" class="form-label"></label>

							<div class="row row-cols-3">
							
								<div class="col-md-auto">
									<input type="file" class="form-control mb-2 w-100 p-3"
										id="formFileSm" name="board_img1"
										style="border: none; background: transparent;">
								</div>
								<div class="col-md-auto">
									<button type="button" class="btn-close" aria-label="Close"></button>
								</div>
							<c:if test="${not empty getBoard.board_img1}">
								<div class="col-md-auto">
									<img src="resources/img/${getBoard.board_img1}" width="50"
										height="50">
								</div>
								</c:if>
								<input type="hidden" name="board_img1-2"
									value="${getBoard.board_img1}">
							</div>

							<div class="row row-cols-3">
								<div class="col-md-auto">
									<input type="file" class="form-control mb-2" id="formFileSm"
										name="board_img2"
										style="border: none; background: transparent;">
								</div>
								<div class="col-md-auto">
									<button type="button" class="btn-close" aria-label="Close"></button>
								</div>
								
								<c:if test="${not empty getBoard.board_img2}">
								<div class="col-md-auto">
									<img src="resources/img/${getBoard.board_img2}"  width="50"
										height="50">
								</div>
									</c:if>
								<input type="hidden" name="board_img2-2"
									value="${getBoard.board_img2}">

							</div>
							<div class="row row-cols-3">
								<div class="col-md-auto">
									<input type="file" class="form-control mb-2" id="formFileSm"
										name="board_img3"
										style="border: none; background: transparent;">
								</div>
								<div class="col-md-auto">
									<button type="button" class="btn-close" aria-label="Close"></button>
								</div>
							<c:if test="${not empty getBoard.board_img3}">
								<div class="col-md-auto">
									<img src="resources/img/${getBoard.board_img3}"  width="50"
										height="50">
								</div>
								</c:if>
								
								<input type="hidden" name="board_img3-2"
									value="${getBoard.board_img3}">
							</div>

							<div class="row row-cols-3">
								<div class="col-md-auto">
									<input type="file" class="form-control mb-2" id="formFileSm"
										name="board_img4"
										style="border: none; background: transparent;">
								</div>
								<div class="col-md-auto">
									<button type="button" class="btn-close" aria-label="Close"></button>
								</div>
							<c:if test="${not empty getBoard.board_img4}">
								<div class="col-md-auto">
									<img src="resources/img/${getBoard.board_img4}"  width="50"
										height="50">
								</div>
								</c:if>
								
								<input type="hidden" name="board_img4-2"
									value="${getBoard.board_img4}">
							</div>
							</div>
						</div>
					</td>
				</tr>
				<!-- 수정 버튼 -->
				<tr>
					<td>
						<div class="d-grid gap-2 w-50 mx-auto p-2">
							<button class="btn btn-primary " type="submit">글수정</button>
							<button class="btn btn-primary" type="reset">다시작성</button>
							<button class="btn btn-primary" type="button"
								onclick="window.location='board_secondhand.do'">목록보기</button>
						</div>
					</td>
				</tr>


			</table>
		</form>
	</div>
</body>
<%@include file="../user/user_bottom.jsp"%>
</html>







