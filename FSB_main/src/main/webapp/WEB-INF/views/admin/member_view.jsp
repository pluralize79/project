<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_view.jsp // 일반 회원 상세보기 -->

<%@include file="admin_top.jsp" %>

<!-- 수정 새 창 -->
<script type="text/javascript">
	function updateForm(mem_num){
		window.open("admin_member_update.do?mem_num="+mem_num, "", "width=640, height=400")
	}
</script>
	
<%@include file="member_sidebar.jsp" %>

		<!-- 내용 // 일반 회원 상세보기 -->
			<div class="container text-center">
			<p>
			<p>
				<div class="row row-cols-1" style="width: 800px;">
			    	<div class="col">
			    		<p class="fs-5">회원 상세 보기</p>
			    	</div>
			    	<p>
			    	<div class="col">
						<table class="table align-middle" width="80%" height="80%">
								<tr align="center">
									<th width="15%">번호</th><td width="35%">${getMember.mem_num}</td>
									<th width="15%">회원구분</th><td width="35%">${getMember.mem_mode}</td>
								</tr>
								<tr align="center">
									<th>아이디</th><td>${getMember.mem_id}</td>
									<th>이름</th><td>${getMember.mem_name}</td>	
								</tr>
								<tr align="center">
									<th>닉네임</th><td>${getMember.mem_nickname}</td>
									<th>프로필</th><td>
									<c:if test="${not empty getMember.mem_img}"><img src="resources/img/${getMember.mem_img}" width="150" height="150"></c:if>
									<c:if test="${empty getMember.mem_img}"><img src="resources/img/basic_profile.jpg" width="150" height="150"></c:if></td>
								</tr>
								<tr align="center">
									<th>HP</th><td colspan="3">${getMember.mem_hp1} - ${getMember.mem_hp2} - ${getMember.mem_hp3}</td>
								</tr>
								<tr align="center">
									<th>신고횟수</th><td>${getMember.mem_report}</td>	
									<th>추천인</th><td>${getMember.mem_recommend}</td>
								</tr>
								<tr align="center">
									<th>상태메세지</th>
									<td colspan="3">${getMember.mem_msg}</td>	
								</tr>
								<tr align="right">
									<td colspan="4">
									<a href="javascript:updateForm('${getMember.mem_num}')"><button type="button" class="btn btn-secondary btn-sm">수정하기</button></a>
									<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_member_list.do'">돌아가기</button>
									</td>	
								</tr>
						</table>
					</div>
				</div>
			</div>
	</main>
</div>


<%@include file="admin_bottom.jsp" %>