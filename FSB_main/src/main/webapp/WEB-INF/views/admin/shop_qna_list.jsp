<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- shop_qna_list.jsp // 쇼핑몰 문의내역 -->

<%@include file="admin_top.jsp" %>

   <!-- 쇼핑몰관리 사이드바 -->
   <%@include file="shop_sidebar.jsp" %>
   
<!-- 삭제 script -->
   <script type="text/javascript">
   function viewProd(prod_num){
      window.open("admin_prod_view.do?prod_num="+prod_num, "", "width=1500, height=800")
   }
</script>

   <script type="text/javascript">
   function viewQna(sq_num){
      $.ajax({
          url:'admin_shop_qna_view.do', //request 보낼 서버의 경로
          type:'get', // 메소드(get, post, put 등)
          data:{'sq_num': sq_num}, //보낼 데이터 (json 형식)
          success: function(data) {
             //var test = document.getElementById("feedView"); //javascript문법
             //var test = $("#feedView") //jquery문법
             
             // 추가할 태그
             var content = data
   
             //Id가 feedView인 항목 하단에 content 를 삽입한다.
             $("#ShopQnaView").html(content) ;
   
          },
          error: function(err) {
             alert("ajax 처리 중 에러 발생");
              //서버로부터 응답이 정상적으로 처리되지 못했을 때 실행
          }
      });
   }
</script>


   <!-- 내용  // 상품 목록 -->
         <div class="container text-center">
         <p>
         <p>
         <div class="row row-cols-2" style="height: 800px; width: 1400px;">
                <div class="col" style="overflow: scroll; width: 800px; height: 800px;">
                   <p class="fs-5">쇼핑몰 문의 목록</p>
                  <div align="right">
                     <button class="btn btn-secondary btn-sm" type="button" onclick="window.location='admin_shop_qna_list.do?mode=all'">
                     전체 목록 보기</button>&nbsp;&nbsp;
                     <button class="btn btn-secondary btn-sm" type="button" onclick="window.location='admin_shop_qna_list.do?mode=check'">
                     미처리 문의 내역만 보기
                     </button>
                  </div>
               <table class="table table-hover table-bordered table align-middle" width="60%" height="80%">
                  <thead class="table-light">
                     <tr align="center">
                        <th width="5%" height="50">#</th>
                        <th width="15%">상품 번호</th>
                        <th width="25%">작성자 닉네임</th>
                        <th width="15%">구분</th>
                        <th width="10%">보기</th>
                        <th width="10%">비밀글</th>
                        <th width="10%">작성일</th>
                        <th width="10%">처리여부</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:if test="${empty listShopQna}">
                        <tr>
                           <td colspan="8">등록된 문의가 없습니다.</td>
                        </tr>
                     </c:if>
                     <c:if test="${not empty listShopQna}">
                     <c:forEach items="${listShopQna}" var="dto">
                        <tr align="center">
                           <td  height="170">${dto.sq_num}</td>
                           <td><a href="javascript:viewProd('${dto.prod_num}')">${dto.prod_num}</a></td>
                           <td>${dto.mem_nickname}</td>
                           <td>
                              <c:if test="${dto.sq_type eq '상품 문의'}">상품 문의</c:if>
                              <c:if test="${dto.sq_type eq '배송 문의'}">배송 문의</c:if>
                              <c:if test="${dto.sq_type eq '취소/반품/교환 문의'}">취소/반품/<br>교환 문의</c:if>
                              <c:if test="${dto.sq_type eq '기타 문의'}">기타 문의</c:if>
                           </td>
                           <td><a href="javascript:viewQna('${dto.sq_num}')">보기</a></td>
                           <td>
                              <c:if test="${dto.sq_secret eq 1}">⭕</c:if>
                              <c:if test="${dto.sq_secret eq 0}">❌</c:if>
                           </td>
                           <td>${dto.sq_regdate}</td>
                           <td>
                              <c:if test="${dto.sq_check eq 0}">❌</c:if>
                              <c:if test="${dto.sq_check eq 1}">⭕</c:if>
                           </td>
                        </tr>
                     </c:forEach>
                     </c:if>
                  </tbody>
               </table>
                </div>
                <div id="ShopQnaView" class="col" style="overflow: scroll; width: 600px; height: 800px;" align="center"></div>
             </div>
      </main>
   </div>

<%@include file="admin_bottom.jsp" %>
                  