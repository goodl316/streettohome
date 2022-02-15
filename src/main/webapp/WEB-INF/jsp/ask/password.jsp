<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/ask/password.css">
<div class="pw-body">
	<form class="pw-form" action="/ask/view" method="post">
		<input type="hidden" name="ak_idx" value="${param.ak_idx }">
		<input class="pw-text" type="password" name="ak_pw" placeholder="비밀번호를 입력해 주세요.">
		<button class="pw-button">완료</button>
		<input class="pw-button" type="button" value="취소" onclick="window.history.back();">
	</form>
</div>