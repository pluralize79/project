<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_update.jsp // 일반 회원 수정 폼 -->

<!-- css, js 연결 -->
	<script src="resources/js/jquery-3.7.0.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>

<!-- 체크박스 체크여부 검사 -->
<script type="text/javascript">
	function checkUpdate(){
		var ck1 = document.getElementById('flexCheckDefault1');
	    var ck2 = document.getElementById('flexCheckDefault2');
	    var ck3 = document.getElementById('flexCheckDefault3');
	    var ck4 = document.getElementById('flexCheckDefault4');
	    var ck5 = document.getElementById('flexCheckDefault5');
	    if(ck1.checked == false && ck2.checked == false && ck3.checked == false && ck4.checked == false && ck5.checked == false) {
	            alert("체크박스를 하나 이상 선택해주세요!")
	            return false;
	        }
	   }
</script>

	<!-- 내용 // 일반 회원 수정 처리 -->
	
	  		<p class="fs-4 text-center">수정 항목 체크</p>
	  		<form name="f" action="admin_member_update.do" method="post" onsubmit="return checkUpdate()">
	  			<table class="table align-middle" width="80%" height="70%">
		  		<tr>
		  			<td>
			  			<input type="hidden" name="mem_num" value="${mem_num}">
			  			<input type="checkbox" class="form-check-label" name="mem_passwd" id="flexCheckDefault1">
						<label class="form-check-label" for="flexCheckDefault1">비밀번호 수정 (123456789 로 수정됩니다.)</label>
					</td>
				</tr>
				<tr>
					<td>
			  			<input type="checkbox" class="form-check-label" name="mem_nickname" id="flexCheckDefault2">
						<label class="form-check-label" for="flexCheckDefault2">닉네임 수정 ('0' 으로 수정됩니다.)</label>
					</td>
				</tr>
				<tr>
					<td>
			  			<input type="checkbox" class="form-check-label" name="mem_img" id="flexCheckDefault3">
						<label class="form-check-label" for="flexCheckDefault3">프로필 수정 (기본프로필로 수정됩니다.)</label>
					</td>
				</tr>
				<tr>
					<td>
			  			<input type="checkbox" class="form-check-label" name="mem_report" id="flexCheckDefault4">
						<label class="form-check-label" for="flexCheckDefault4">신고횟수 초기화 (0 으로 수정됩니다.)</label>
					</td>
				</tr>
				<tr>
					<td>
			  			<input type="checkbox" class="form-check-label" name="mem_msg" id="flexCheckDefault5">
						<label class="form-check-label" for="flexCheckDefault5">상태메세지 수정 (공백으로 수정됩니다.)</label>
					</td>
				</tr>
				<tr align="center">
					<td>
						<button type="submit" class="btn btn-warning">수정</button>
					</td>
				</tr>
			    </table>
		    </form>
