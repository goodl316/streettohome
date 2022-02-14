<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<form action="/ask/view" method="post">
		<input type="hidden" name="ak_no" value="${param.ak_no }">
		<input type="password" name="ak_pw" placeholder="비밀번호를 입력해 주세요.">
		<input type="button" value="취소" onclick="window.history.back();">
	</form>
</div>