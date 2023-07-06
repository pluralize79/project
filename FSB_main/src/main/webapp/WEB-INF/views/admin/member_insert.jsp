<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- member_list.jsp // 일반 회원 등록 -->

<%@include file="admin_top.jsp" %>
	
<%@include file="member_sidebar.jsp" %>
			
		<!-- 내용 // 일반 회원 등록 (관리자가 직접 일반 회원을 임의 가입 시켜야 하는 경우) -->
			<div class="grid gap-3 flex-shrink-0 p-3 bg-white overflow-auto" style="width: 800px; height: 800px;">
			<br>
			<div align="center">
				<p class="fs-5">일반 회원 등록</p>
			</div>
				<form name="f" action="admin_member_insert.do" method="post">
				<table border="0" width="80%" height="80%" align="center">
						<tr>
							<th width="30%" align="center">아이디</th>
							<td width="40%"><input type="text" class="form-control" name="mem_id" placeholder="영문, 숫자만 입력 가능">
							<input type="hidden" name="mem_mode" value="일반"></td>
							<td width="30%" align="left"><button type="button" class="btn btn-secondary btn-sm" onclick="window.location='#'">중복검사</button></td>
						</tr>
						<tr>
							<th align="center">비밀번호</th>
							<td><input type="password" name="mem_passwd" class="form-control"></td>
							<td><font size="2">&nbsp;&nbsp;영문+숫자+특수문자</font></td>
						</tr>
						<tr>
							<th align="center">이름</th>
							<td colspan="2"><input type="text" class="form-control" name="mem_name"></td>
						</tr>
						<tr>
							<th align="center">닉네임</th>
							<td colspan="2"><input type="text" class="form-control" name="mem_nickname"></td>
						</tr>
						<tr>
							<th align="center">HP</th>
							<td colspan="2">
								<div class="container text-center">
  									<div class="row row-cols-3">
  										<div class="col">
  											<select name="mem_hp1" class="form-select">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="017">017</option>
												<option value="019">019</option>
											</select>
  										</div>
	    								<div class="col"><input type="text" name="mem_hp2" class="form-control" size="5"></div>
	    								<div class="col"><input type="text" name="mem_hp3" class="form-control" size="5"></div>
    								</div>
    							</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
							<button type="submit" class="btn btn-secondary btn-sm">등록</button>
							<button type="reset" class="btn btn-secondary btn-sm">다시 입력</button>
							<button type="button" class="btn btn-secondary btn-sm" onclick="window.location='admin_member_list.do'">취소</button>
							</td>	
						</tr>
				</table>
				</form>
			</div>
	</main>



<%@include file="admin_bottom.jsp" %>
