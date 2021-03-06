<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/member/mypage.css">
<c:if test="${sessionScope.loginMember != null }">
<div class="container">
	<div class="sidebar">
	<h2 class="my">${sessionScope.loginMember.m_name} 님</h2>
		<ul class="list">
			<li><a href="/member/updateMember">회원정보수정</a></li>
			<li><a href="/member/myboard?m_no=${sessionScope.loginMember.m_no}&page=1">내게시글목록</a></li>
			<li><a href="/member/favlist?page=1">찜하기목록</a></li>
			<li><a href="/member/sthpay/0?page=1">결제내역</a></li>
			<li><a href="/member/message?page=1&ms_receiver=${sessionScope.loginMember.m_no }">쪽지</a></li>
			<li><a href="/member/memberDelete">회원탈퇴</a></li>
		</ul>
	</div>
</div>
</c:if>