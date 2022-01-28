<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./jquery.cookie.js"></script>

<link rel="stylesheet" href="/css/member/login.css">
<title>로그인</title>

<section style="display: flex; justify-content: center;">
   <div class="contents">
      <h2 class="logintext">로그인</h2>
      <form id="loginForm" action="/member/login" method="post" autocomplete="off">
         <div class="member">
			<p class="member-txt">로그인 정보</p>
			<div class="member-input">
				<p><input class="m_email" type="text" id="m_email" name="m_email" placeholder="이메일" maxlength="30"></p>
				<p><input class="m_pw" type="password" id="m_pw" name="m_pw" placeholder="비밀번호" onkeyup="enterkey();" maxlength="20"></p>
			</div>
			<div class="login_warn">${requestScope.Msg}</div>
			<p class="label"><label><input type="checkbox" id="idSaveCheck">이메일 저장</label></p>
			<div class="logindiv">
				<a class="logindiv_a" href="/member/findemail">이메일찾기</a> |
				<a class="logindiv_a" href="/member/findpw">비밀번호찾기</a>  |
				<a class="logindiv_a" href="/member/join">회원가입</a>
			</div>
			<p class="btn"><input class="loginBtn" type="button" id="loginBtn" value="로그인" onclick="login();"></p>
         </div>
      </form>
     
   </div>
  </section>

<script defer type="text/javascript" src="/js/member/login.js"></script>