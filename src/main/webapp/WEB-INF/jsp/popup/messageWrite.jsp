<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/popup/messageWrite.css">
<title>Insert title here</title>
</head>
<body>
	<div class="message-write-container">
		<div class="message-write-header">
			<div>제목</div>
			<div class="message-write-title">
				<input type="text" class="message-title-ctnt">
			</div>
			<div>받는사람</div>
			<div class="message-write-receiver">
				<input type="hidden" class="message-receiver-value" value="${param.ms_receiver }">
				<input type="text" class="message-receiver-name" value="${requestScope.nickname }" readOnly>
			</div>
		</div>
		<div class="message-write-body">
			<textarea maxlength="1000" class="message-write-ctnt"></textarea>
		</div>
		<div class="message-write-footer">
			<div class="message-write-button"><input type="button" value="전송" onclick="sendMessage()"></div>
			<div class="message-write-button"><input type="button" value="취소" onclick="window.close()"></div>
		</div>
	</div>
</body>
<script defer type="text/javascript" src="/js/member/message.js"></script>
</html>
