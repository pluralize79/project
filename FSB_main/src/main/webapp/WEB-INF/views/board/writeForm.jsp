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
<title>게시글 작성</title>
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
 
</script>

</head>
<body>
	<div align="center">
		<form name="f" action="write_board.do?mode=${mode}" method="post"
			 onsubmit="return check()" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${param.board_num}"/>
		<input type="hidden" name="board_re_group" value="${param.board_re_group}"/>
		<input type="hidden" name="board_re_step" value="${param.board_re_step}"/>
		<input type="hidden" name="board_re_level" value="${param.board_re_level}"/>
	
		
		
			<table class="table table-borderless">
				<tr>
					<td>
						<div class="mb-3 w-50 p-3 mx-auto p-2">
							<!--  테이블 센터랑 사이즈 조절하기  -->
							<label for="exampleFormControlInput1" class="form-label">제목</label>
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="제목을 입력하세요."
								name="board_title">
						</div>
					</td>
				</tr>
				<!-- 내용 입력 폼 -->
				<tr>
					<td>
						<div class="mb-3 w-50 p-3 mx-auto p-2">
							<label for="exampleFormControlTextarea1" class="form-label">내용</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"	name="board_content" placeholder="내용을 입력하세요." rows="10" ></textarea>
						</div>
					</td>
				</tr>
             <tr>
             <td>
             <!-- 이미지 업로드 (접이식) -->
			<div class="col mb-3 w-50 p-3 mx-auto p-2" align="left">
               <button type="button" class="btn btn-sm btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#image-collapse" aria-expanded="false">
                        <svg class="bi pe-none me-2" fill="#A6A6A6" width="24" height="24">
                        <use xlink:href="#img-select"></use></svg>
                       		 이미지 업로드 🔽</button>
                </div>
                    <div class="collapse mb-3 w-50 p-3 mx-auto p-2" id="image-collapse">
                    <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" name="board_img1"style="border: none; background: transparent;"></div>
                     <div class="col-md-auto"><button type="button" class="btn-close" aria-label="Close"></button></div>
                    </div>
                    
                    <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" name="board_img2" style="border: none; background: transparent;"></div>
                     <div class="col-md-auto"><button type="button" class="btn-close" aria-label="Close"></button></div>
                     </div>
                    
                    <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" name="board_img3" style="border: none; background: transparent;"></div>
                     <div class="col-md-auto"><button type="button" class="btn-close" aria-label="Close"></button></div>
                    </div>
                    
                    <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" name="board_img4" style="border: none; background: transparent;"></div>
                     <div class="col-md-auto"><button type="button" class="btn-close" aria-label="Close"></button></div>
               		</div>
               </div>
               </td>
               </tr>
				<tr>
					<td>
					<!-- 게시글 등록 버튼  -->
						<div class="d-grid gap-2 w-50 mx-auto p-2">
							<button class="btn btn-primary d-grid gap-2 w-100 mx-auto p-2" type="submit">글쓰기</button>
							<button class="btn btn-primary" type="reset">다시작성</button>
							<button class="btn btn-primary" type="button"
								onclick="window.location='board_free.do'">목록보기</button>
						</div>
				</td>
				</tr>
	  	</table>
		</form>
	</div>
</body>
<%@include file="../user/user_bottom.jsp"%>
</html>







