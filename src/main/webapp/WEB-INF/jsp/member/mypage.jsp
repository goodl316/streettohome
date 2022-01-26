<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/tastyServer/assets/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/member/mypage.css">

<div class="container">
	<div class="sidebar">
		<ul class="list">
			<h5 style="text-align: center">
				<strong>${sessionScope.loginMember.m_name} 님</strong>
			</h5>
			<li><a href="../member/updateMember">회원정보수정</a></li>
			<li><a href="#">입양신청목록</a></li>
			<li><a href="#">내게시글목록</a></li>
			<li><a href="#">찜하기목록</a></li>
			<li><a href="#">결제내역</a></li>
			<li><a href="../member/memberDelete">회원탈퇴</a></li>
		</ul>
	</div>
</div>
