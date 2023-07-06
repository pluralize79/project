<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- admin_top.jsp -->
<html>
<head>
	<!-- title -->
	<title>보드게임 커뮤니티 프로젝트(관리자)</title>
	<!-- css, js 연결 -->
	<script src="resources/js/jquery-3.7.0.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/bootstrap.bundle.min.js"></script>
	
	<!-- 사이드 바 css, js -->
	<link href="resources/css/sidebars.css" rel="stylesheet">
	<script src="resources/js/sidebars.js"></script>
	
	<style>
		.vertical-right-line {
			border-right-style: solid;
		 	border-right-width: 2px;
		  	border-right-color: #dee2e6;
		}
	</style>
	
</head>
<body>
<!-- tab -->
<p>
	<ul class="nav nav-tabs justify-content-center">
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">회원</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="admin_member_insert.do">일반 회원 등록</a></li>
				<li><a class="dropdown-item" href="admin_member_list.do">일반 회원 목록</a></li>
				<li><a class="dropdown-item" href="#">일반 회원 신고 내역</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="#">비즈니스 회원 신청내역</a></li>
				<li><a class="dropdown-item" href="#">비즈니스 회원 등록</a></li>
				<li><a class="dropdown-item" href="#">비즈니스 회원 목록</a></li>
				<li><a class="dropdown-item" href="#">비즈니스 회원 신고 내역</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">보드게임</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="admin_game_insert.do">보드게임 등록</a></li>
				<li><a class="dropdown-item" href="admin_game_list.do">보드게임 목록</a></li>
				<li><a class="dropdown-item" href="admin_game_reportList.do?mode=all&sort=all">보드게임 한줄평 신고 내역</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="admin_theme_insert.do">보드게임 테마 등록</a></li>
				<li><a class="dropdown-item" href="admin_theme_list.do?theme_num=0">보드게임 테마 목록</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">커뮤니티 관리</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="admin_board_list.do?view=secondhand">중고게시판 목록</a></li>
				<li><a class="dropdown-item" href="admin_board_list.do?view=free">자유게시판 목록</a></li>
				<li><a class="dropdown-item" href="admin_board_list.do?view=anony">익명게시판 목록</a></li>
				<li><a class="dropdown-item" href="#">전체 게시판 신고 내역</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="admin_board_notice_insert.do">게시판 공지글 등록</a></li>
				<li><a class="dropdown-item" href="admin_board_notice_list.do?mode=all&sort=all">게시판 공지글 목록</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">쇼핑몰 관리</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="admin_prod_insert.do">상품 등록</a></li>
				<li><a class="dropdown-item" href="admin_prod_list.do?mode=all&sort=all">상품 목록</a></li>
				<li><a class="dropdown-item" href="#">전체 상품 리뷰 목록</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="admin_shop_qna_list.do?mode=all">문의 내역</a></li>
				<li><a class="dropdown-item" href="#">주문 내역</a></li>
				<li><a class="dropdown-item" href="#">환불 내역</a></li>
				<li><a class="dropdown-item" href="#">매출 관리</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="admin_scoupon_insert.do">쿠폰 등록</a></li>
				<li><a class="dropdown-item" href="admin_scoupon_list.do?sc_num=0">쿠폰 목록</a></li>
			</ul>
		</li>
		<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">페이지 관리</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="admin_notice_insert.do">관리자 작성글 등록</a></li>
				<li><a class="dropdown-item" href="admin_notice_list.do?mode=all&sort=all">관리자 작성글 목록</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="admin_report.list.do">전체 신고 내역</a></li>
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="admin_main.do">메인 홈</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="user_main.do">사용자 페이지</a>
		</li>
	</ul>
	<!-- 내용 -->
