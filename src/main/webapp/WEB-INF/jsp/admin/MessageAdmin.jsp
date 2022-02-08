<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin/message.css">
<title>Insert title here</title>
</head>
<body>
	<div class="admin-message-container">
		<div class="message-header">
			<h1>쪽지 보내기</h1>
		</div>
		<div class="message-body">
			<div class="message-write">
				<div class="message-chk">
					<label><input type="checkbox" id="allChk">전체쪽지 보내기</label>
				</div>
				<div class="message-receiver">
					<input type="text" placeholder="받는사람" id="receiver" name="nickname">
				</div>
				<div>
					<input type="text" placeholder="제목" id="title" name="ms_title">
				</div>
				<div>
					<textarea id="ctnt" name="ms_ctnt" placeholder="500자까지 입력가능합니다." maxlength="500"></textarea>
				</div>
				<div class="message-button">
					<input type="button" value="보내기" id="submit">
				</div>
			</div>
			
			<div class="nickname-container">
				<div class="nickname-header">닉네임 목록</div>
				<div class="nickname-list"></div>
			</div>
		</div>
	</div>
</body>
<script defer src="/js/admin/message.js"></script>
</html>
