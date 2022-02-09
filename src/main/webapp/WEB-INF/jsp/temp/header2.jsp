<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/header.css?ver=1">
</head>
<body>
	<c:if test="${loginMember.m_authstate == 999 }">
		<header>
		<div class="admin-header-logo">
			<img src="/images/egovframework/icon/logo.png" onclick="location.href='/'">
		</div>
			<input type="hidden" value="${sessionScope.loginMember.m_no }" id="m_no">
			<div class="nav">
			<div class="user">
			<h3>사용자 관리</h3>
			<div class="user_admin">
			<ul class="u_ul">
				<li><a href="/admin/MemberAdmin?m_state=1&page=1">개인이용자</a></li>
				<li><a href="/admin/MemberAdmin?m_state=2&page=1">단체이용자</a></li>
				<li><a href="/admin/MemberAdmin?m_authstate=3&page=1">이용정지 사용자</a></li>
			</ul>
			</div>
			</div>
			<div class="board">
			<h3>게시글 관리</h3>
			<div>
			<ul class="b_ul">
				<li><a href="/admin/BoardAdmin?an_type1=강아지&page=1">강아지 게시글</a></li>
				<li><a href="/admin/BoardAdmin?an_type1=고양이&page=1">고양이 게시글</a></li>
				<li><a href="/admin/ReportAdmin?page=1">신고받은 게시글</a>
				<li><a href="/admin/delBoardAdmin?page=1">삭제된 게시글</a></li>
			</ul>
			</div>
			</div>
			<h3>
				<a href="/admin/AskAdmin?page=1">문의글 관리</a>
			</h3>

			<h3><a href="/admin/MessageAdmin">쪽지 보내기</a></h3>
			</div>
		</header>
	</c:if>
</body>
</html>