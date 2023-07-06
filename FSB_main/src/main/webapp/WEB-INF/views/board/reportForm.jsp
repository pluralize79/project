<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- report.jsp -->
<html>
<head>
	<title>신고사유</title>
<!-- css 파일 연결하기 -->
	<script src="resources/js/jquery-3.7.0.js">
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<!-- 	<script src="resources/js/bootstrap.min.js"></script> -->
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	
<script type="text/javascript">
	function isReport(mode) {
 		var isReport = window.confirm("정말로 신고하시겠습니까?")
		if (isReport) {
			document.f3.mode.value= mode
			document.f3.submit()
		}
	}
	
	function reportClose() {
		self.close()
	}
</script>
</head>
<body>
<form name="f3" action="report_board.do" method="post">
	<input type="hidden" name="mode" value="${mode}">
	<input type="hidden" name="board_num" value="${param.board_num}">
	<input type="hidden" name="br_num" value="${param.br_num}">
<div align="center">
	<div class="text-bg-warning p-3">신고여부 선택하기</div>
	<div class="form-check">
  		<input class="form-check-input" type="radio" name="board_report" value="1" id="flexCheckDefault1">
  		<label class="form-check-label" for="flexCheckDefault1">
   			욕설 및 부적절한 언어
  		</label>
	</div>
	<hr>
	<div class="form-check">
  		<input class="form-check-input" type="radio" name="board_report" value="2" id="flexRadioDefault2">
  		<label class="form-check-label" for="flexRadioDefault2">
   			광고 및 스팸성
  		</label>
	</div>
	<hr>
	<div class="form-check">
  		<input class="form-check-input" type="radio" name="board_report" value="3" id="flexRadioDefault3">
  		<label class="form-check-label" for="flexRadioDefault3">
   			개인정보노출
  		</label>
	</div>
	<hr>
	<div class="form-check">
 		<input class="form-check-input" type="radio" name="board_report" value="4" id="flexRadioDefault4">
  		<label class="form-check-label" for="flexRadioDefault4">
   			음란성/선정성
  		</label>
	</div>
	<hr>
	<div class="form-check">
  		<input class="form-check-input" type="radio" name="board_report" value="5" id="flexRadioDefault5">
  		<label class="form-check-label" for="flexRadioDefault5">
   			도배성
  		</label>
	</div>
	<hr>
	<!-- 신고 한줄 상세사유  50자 제한 -->
	<input class="form-control" type="text" name="report_detail" placeholder="상세 사유를 입력해 주세요💥" maxlength = '50'>
	<br>
	<a href="javascript:isReport('${mode}')"><button type="button" class="btn btn-danger">신고하기</button></a>
	<a href="javascript:reportClose()"><button type="button" class="btn btn-light">취소하기</button></a>
</div>
</form>
</body>
</html>