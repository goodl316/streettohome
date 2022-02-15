<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/member/memberDelete.css">
<c:if test="${sessionScope.loginMember != null }">
<div id="grid">
	<div id="areaA">
		<%@ include file="../member/mypage.jsp"%>
	</div>
	
		<div class="contents">
			<h2 class="deletetxt">회원탈퇴</h2>
			<form id="deleteForm" action="/member/memberDelete" method="post">
				<div class="delete">
					<p><input class="memberdel" type="text" id="m_email" name="m_email"
						value="${sessionScope.loginMember.m_email}" readonly="readonly"/><p>
					<p><input class="memberdel" type="password" id="m_pw" name="m_pw"
						placeholder="비밀번호" maxlength="30" /></p>
				</div>
				<div class="delete_warn">${requestScope.Msg}</div>
				<div class="deletemem">
					<button class="deleteBtn" type="button" id="deleteBtn" onclick="memberDelete();">회원탈퇴</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
		</div>
</div>
</c:if>
<script defer type="text/javascript" src="/js/member/memberDelete.js"></script>