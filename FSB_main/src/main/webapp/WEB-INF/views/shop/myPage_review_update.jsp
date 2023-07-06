<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- myPage_review_update.jsp -->
<%@include file="myPage_top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.vertical-right-line {
		border-right-style: solid;
	 	border-right-width: 2px;
	  	border-right-color: #dee2e6;
	}
	.img-pick-box {
		border: 0 solid black;
		background-color: #ffffff;
        background-color: rgba(255,255,255,0.5);
	}
	
	#attZone{
		width: 660px;
		min-height:150px;
		padding:10px;
		border:1px #000;
	}
	#attZone:empty:before{
		content : attr(data-placeholder);
		color : #999;
		font-size:.9em;
	}
	
	.imgPreviewCrop{
		position: absolute;
    	top: 0;
    	left: 0;
    	transform: translate(50, 50);
    	width: 100%;
    	height: 100%;
    	object-fit: cover;
    	margin: auto;
	}
	
</style>

<script type="text/javascript">
	let sorted_files = []; //이미지 배열
	
	//등록
	function submitform(){
		if(sorted_files.length !== 0){//이미지가 있으면
			encodeImageFiles(afterReading);
		}else{//이미지가 없으면
			inputOpen();
			submitFormAction();
		}
		//imgs 담긴 input 생성
		function afterReading(encodedImages){
			for (let i=0; i<encodedImages.length; ++i){
				let input = document.createElement('input');
				input.type = 'hidden';
				input.name = 'imgs'+i;
				input.value = encodedImages[i];
				alert(encodedImages[i]);
				f.appendChild(input);
				document.body.appendChild(f);
				if(i===encodedImages.length-1){
					break;
				}
			}
			submitFormAction();
		}
		//submit동작
		function submitFormAction(){
			f.action = 'shop_insertReview.do';
			f.submit();
		}
	}
	//이미지 Base64로 전환
	function encodeImageFiles(callback) {
		let encodedImages = []; //base64로 변환된 이미지 배열
		
		for (let i = 0; i < sorted_files.length; i++) {
	        let reader = new FileReader();
	        //하단의 reader.readAsDataURL이 완료되면 실행됨
	        reader.onload = function () {
	            let base64Data = reader.result.split(",")[1];
	            encodedImages.push(base64Data);
	            if(sorted_files.length === encodedImages.length){
			        callback(encodedImages);//이미지 전부 변환하면 콜백으로 afterReading 실행
	            }
	        };
	        reader.readAsDataURL(sorted_files[i]);//다 읽어오면 onload실행
	    }
	}
	//이미지 유효성 검사
	function checkExtension(fileName,fileSize){
		let ext = fileName.toLowerCase().substring(fileName.lastIndexOf(".")+1, fileName.length);
        let maxSize = 20971520;  //20MB

        if(ext != 'jpg' && ext != 'jpeg' && ext != 'png'){
            alert("jpg, jpeg, png 파일만 업로드할 수 있습니다.");
            return false;
        }
        if(fileSize >= maxSize){
            alert('최대 20mb까지 업로드 가능합니다.');
            return false;
        }
        return true;
    }
	
	//이미지 업로드
	window.onload = function(){
		let btnAtt = document.getElementById('btnAtt');
		let attZone = document.getElementById('attZone');
		
		btnAtt.onchange = function(){
			//추가한 이미지 가져오기
			let files = btnAtt.files;
			//이미지 4개 제한
			if(sorted_files.length + files.length > 4){
				alert('이미지는 4개까지 업로드 가능합니다.');
				return;
			}
			
			for(file of files){
				let fileName = file.name;
				let fileSize = file.size;
				let isOk = checkExtension(fileName,fileSize);
				if(!isOk){
					return;
				}
			}
			
			//추가한 이미지 목록에 추가
			for(file of files){
				sorted_files.push(file);
			}
			
			function setPriview(){
				//기존 미리보기 지우기
				attZone.replaceChildren();
				let index = 0;
				//이미지 미리보기 추가
				for(file of sorted_files){
					const imgBox = document.createElement('div');
					const image = document.createElement('img');
					const delBtn = document.createElement('button');
					imgBox.className = 'col-auto';
					imgBox.id = 'imgBox'+index;
					imgBox.style = 'display:inline-block; position:relative; width:120px; height:120px; margin-right: 10px;';
					image.src = URL.createObjectURL(file);
					image.className = 'imgPreviewCrop';
					delBtn.className = 'btn-close';
					delBtn.type='button';
					delBtn.style='position: absolute; right: 0px; top: 0px;'
					
					delBtn.onclick= function(event){
						let indexNow = event.target.parentNode.getAttribute('id').substring(6,7);
						sorted_files.splice(indexNow, 1);
						setPriview();
					}
					
					imgBox.appendChild(image);
					imgBox.appendChild(delBtn);
					attZone.appendChild(imgBox);
					
					index += 1;
				}
			}
			setPriview();
		};
	};
	
</script>
<!-- ★★★ 센터로 보내는 div class ★★★ -->
<td>
<div class="d-flex justify-content-center">
	<div class="container px-5 py-3 border-bottom" id="featured-insertReview">
		<div class="row justify-content-center">
			<div class="col-8">
			<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="user_main.do">
			    	<font color="black"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
					  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
					</svg></font>
			    	<font color="black">Home</font>
			    </a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="shop_main.do"><font color="black">쇼핑몰</font></a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="#"><font color="black">주문목록</font></a></li>
			    <li class="breadcrumb-item active" aria-current="page"><a class="link-body-emphasis fw-semibold text-decoration-none" href="#"><font color="black">리뷰작성</font></a></li>
			  </ol>
			</nav>
			<hr>
			</div>
			<h4 class="pb-2" align="center">상품 리뷰 수정</h4>
			<div class="col-8 py-2">
				<form name="f" action="shop_myPage_review_update.do" method="post" enctype="multipart/form-data">
				<!-- <input type="hidden" name="mem_num" value="${param.mem_num}"> -->
				<table border="0" width="100%" height="80%" align="center">
					<tr height="50">
						<th width="20%" align="right">상품명</th>
						<td width="80%"><!-- 내가 주문한 상품들 중 선택 가능하도록!!! <<<해야함 -->
							<select name="prod_num" id="prod_num" class="form-select" >
								<c:forEach var="dto" items="${listProd}">
									<%-- <c:if test="${getReview.prod_num eq dto.prod_num }" > --%>
									<option value="${dto.prod_num}" <c:if test="${getReview.prod_num eq dto.prod_num }" >selected</c:if>>${dto.game_name}</option>
 									<%-- </c:if> --%>
								</c:forEach>
							</select>								
						</td>
					</tr>
					<tr height="50">
						<th width="20%">별 &nbsp;점</th>
						<td width="80%">
							<select name="sr_starrating" class="form-select">
								<c:if test="${getReivew.sr_starrating eq 1}">
									<option value="1" selected>⭐</option>
									<option value="2">⭐⭐</option>
									<option value="3">⭐⭐⭐</option>
									<option value="4">⭐⭐⭐⭐</option>
									<option value="5">⭐⭐⭐⭐⭐</option>
            					</c:if>
            					<c:if test="${getReivew.sr_starrating eq 2}">
            						<option value="1">⭐</option>
									<option value="2" selected>⭐⭐</option>
									<option value="3">⭐⭐⭐</option>
									<option value="4">⭐⭐⭐⭐</option>
									<option value="5">⭐⭐⭐⭐⭐</option>
            					</c:if>
            					<c:if test="${getReivew.sr_starrating eq 3}">
            						<option value="1">⭐</option>
									<option value="2">⭐⭐</option>
									<option value="3" selected>⭐⭐⭐</option>
									<option value="4">⭐⭐⭐⭐</option>
									<option value="5">⭐⭐⭐⭐⭐</option>
           						</c:if>
           						<c:if test="${getReivew.sr_starrating eq 4}">
           							<option value="1">⭐</option>
									<option value="2">⭐⭐</option>
									<option value="3">⭐⭐⭐</option>
									<option value="4" selected>⭐⭐⭐⭐</option>
									<option value="5">⭐⭐⭐⭐⭐</option>
           						</c:if>
           						<c:if test="${getReivew.sr_starrating eq 5}">
           							<option value="1">⭐</option>
									<option value="2">⭐⭐</option>
									<option value="3">⭐⭐⭐</option>
									<option value="4">⭐⭐⭐⭐</option>
									<option value="5" selected>⭐⭐⭐⭐⭐</option>											
           						</c:if>
							</select>								
						</td>			
					</tr>
					<tr height="60">
						<th width="20%">리뷰 제목</th>
						<td width="80%">
							<input type="text" class="form-control" name="sr_title" placeholder="제목을 작성해주세요.(최대 50자)" value="${getReivew.sr_title }">
						</td>
					</tr>
					<tr height="60">
						<th width="20%">리뷰 내용</th>
						<td width="80%">
							<textarea name="sr_content" class="form-control" id="sr_content" rows="7" placeholder="내용을 50자 이상 입력해주세요.">${getReivew.sr_content }</textarea>
						</td>
					</tr>
					<tr>
						<th width="20%" rowspan="2">사진 첨부</th><!-- Ajex 활용해서 업로드하기!!!<<<해야함 -->
						<td width="80%">
		   					<button type="button" class="btn btn-sm btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#image-collapse" aria-expanded="false">
			         			<svg class="bi pe-none me-2" fill="#A6A6A6" width="24" height="24"><use xlink:href="#img-select"></use></svg>
			         			최대 4장까지 사진 첨부
			         			<!-- 기존 사진 표현 어떻게 할지 고민하기 -->
			        		</button>	
						</td>
					</tr>
					<tr>
						<td width="80%">
						<div class="container">
							<div class="row mb-3">
							<div class="col" align="left">
			        		<div class="collapse" id="image-collapse">
				        		<div id="image_preview">
									<input type="file" id="btnAtt" multiple="multiple" class="mt-2 small" style="margin-left: 20px;" accept=".png, .jpg, .jpeg" enctype="multipart/form-data"/>
									<div id="attZone" class="row small mt-2" style="margin-left: 20px;" data-placeholder="파일을 첨부 하려면 파일 선택 버튼을 클릭하세요"></div>
								</div>
							</div>
							</div>
							</div>
						</div>		        							
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button class="btn btn-outline-dark" type="submit">리뷰수정</button>
							<button class="btn btn-outline-dark" type="button" onclick="window.location='shop_myPage_review.do'">돌아가기</button>
						</td>
					</tr>
				</table>
				<c:forEach items="${listProd}" var="dto">
					<input type="hidden" name="game_num" value="${dto.game_num}">
				</c:forEach>
				</form>
			</div>
		</div>
	</div>
</div>
</td>
</tr>
</table>
<%@include file="myPage_bottom.jsp" %>