<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./jquery.cookie.js"></script>
<title>로그인</title>

</head>
<body>

	<%@ include file="../temp/header.jsp"%>

	<div id="loginPage">
	
		<form id="loginForm" action="/member/login" method="post" autocomplete="off">
		
			<div>이메일 : <input class="m_email" type="text" id="m_email" name="m_email"></div>
			<div>비밀번호 : <input class="m_pw" type="password"  id="m_pw" name="m_pw"></div>
			<div class="login_warn">${requestScope.Msg}</div>
			<div><input type="checkbox" id="idSaveCheck">이메일 저장</div>
			<div><input class="loginBtn" type="button" id="loginBtn" value="로그인" onclick="login();"></div>
			<div class="logindiv">
			<a class="logindiv_a" href="../member/findemail">이메일찾기</a>
			<a class="logindiv_a" href="../member/findpw">비밀번호찾기</a>
			<a class="logindiv_a" href="../member/join">회원가입</a>
			</div>
		
		</form>
		
	</div>

</body>

<script defer type="text/javascript" src="/js/member/login.js"></script>

</html>