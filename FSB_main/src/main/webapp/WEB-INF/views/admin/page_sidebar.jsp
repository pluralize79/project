<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- page_sidebar.jsp // 페이지관리 사이드바 -->


<!-- 벡터 아이콘 정의 -->
 	<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  		<symbol id="people-circle" viewBox="0 0 16 16">
    		<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
    		<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
  		</symbol>
  		<symbol id="grid" viewBox="0 0 16 16">
    		<path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"></path>
  		</symbol>
  		<symbol id="toggles2" viewBox="0 0 16 16">
    		<path d="M9.465 10H12a2 2 0 1 1 0 4H9.465c.34-.588.535-1.271.535-2 0-.729-.195-1.412-.535-2z"></path>
    		<path d="M6 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm0 1a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm.535-10a3.975 3.975 0 0 1-.409-1H4a1 1 0 0 1 0-2h2.126c.091-.355.23-.69.41-1H4a2 2 0 1 0 0 4h2.535z"></path>
    		<path d="M14 4a4 4 0 1 1-8 0 4 4 0 0 1 8 0z"></path>
  		</symbol>
  		<symbol id="collection" viewBox="0 0 16 16">
    		<path d="M2.5 3.5a.5.5 0 0 1 0-1h11a.5.5 0 0 1 0 1h-11zm2-2a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zm1.5.5A.5.5 0 0 1 1 13V6a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13z"></path>
  		</symbol>
  		<symbol id="tools" viewBox="0 0 16 16">
   			<path d="M1 0L0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.356 3.356a1 1 0 0 0 1.414 0l1.586-1.586a1 1 0 0 0 0-1.414l-3.356-3.356a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0zm9.646 10.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708zM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11z"></path>
		</symbol>
	</svg>
	
<!-- 페이지관리 아이콘 -->
    	<main class="d-flex flex-nowrap">
	    	<div class="vertical-right-line flex-shrink-0 p-3 bg-white" style="width: 280px; height: 800px;">
	      		<svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#tools"></use></svg>
	      		<span class="fs-5 fw-semibold">페이지 관리</span>
	   		<ul class="list-unstyled ps-0">
	   		<!-- 구분선 -->
	        <li class="border-top my-3"></li>
	        <!-- 관리자 작성 글 -->
	   		<li class="mb-1">
		   		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
		         			관리자 작성글
		       	</button>
		        <div class="collapse show" id="home-collapse">
		          	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
		            	<li><a href="admin_notice_insert.do" class="link-dark d-inline-flex text-decoration-none rounded">관리자 작성글 등록</a></li>
						<li><a href="admin_notice_list.do?mode=all&sort=all" class="link-dark d-inline-flex text-decoration-none rounded">관리자 작성글 목록</a></li>
		         	</ul>
		        </div>
	        </li>
	        <!-- 구분선 -->
	        <li class="border-top my-3"></li>
	        <!-- 신고 내역 -->
	   		<li class="mb-1">
		   		<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="true">
		         			신고 관리
		       	</button>
		        <div class="collapse show" id="dashboard-collapse">
		          	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
		          		<li><a class="link-dark d-inline-flex text-decoration-none rounded" href="admin_report.list.do">전체 신고 내역</a></li>
		         	</ul>
		        </div>
	        </li>
	        </ul>
			</div>