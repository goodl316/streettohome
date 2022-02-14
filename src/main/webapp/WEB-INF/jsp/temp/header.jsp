<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css"
	integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug=="
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/header/header.css" />

<title>Document</title>
</head>

<header>
	<input type="hidden" value="${sessionScope.loginMember.m_authstate}" id="loginData">
	<input id="header-session-id" type="hidden" value="${sessionScope.loginMember.m_no }">
	<h1 class="logo">
		<a href="/" class="logo-img-box">
			<img class="logo-img" src="/images/egovframework/icon/logo.png">
		</a>
	</h1>
	<div class="header-contain">
		<c:choose>
			<c:when test="${empty sessionScope.loginMember}">
				<div class="nav-member">
					<a class="login-btn" onclick="login()" href="/member/login">로그인</a>
					<a class="join-btn" href="/member/join">회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="header-user">
					<div>
						<a class="header-welcome">${sessionScope.loginMember.m_name}님 반갑습니다.</a>
					</div>
					<div class="nav-link message">
						<span>쪽지</span>
						<span class="item-message-icon">0</span>
					</div>						
					<div>
						<a class="dropdown-item" href="/member/logout">로그아웃</a>
					</div>
					<div>
						<a class="dropdown-item" href="/member/mypage">마이페이지</a>
					</div>
					<c:if test="${sessionScope.loginMember.m_authstate == 999 }">
					<div>
						<a class="dropdown-item" href="/admin/MemberAdmin?m_state=1&page=1">관리자페이지</a>
					</div>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
	<nav class="nav-header">
		<ul class="navList">
			<li onclick="location.href='/member/intro'">스트릿투홈 소개</li>
			<li onclick="location.href='/board/boardList?an_type1=강아지&page=1'">강아지를	집으로</li>
			<li onclick="location.href='/board/boardList?an_type1=고양이&page=1'">고양이를	집으로</li>
			<li onclick="location.href='/member/spon'">후원</li>
			<li onclick="location.href='/'">입양후기</li>
			<li onclick="location.href='/ask/regAsk'">문의하기</li>
		</ul>
	</nav>
</header>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="/js/header/header.js"></script>