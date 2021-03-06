<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/popup/messageView.css">
<title>Insert title here</title>
</head>
<body>
	<div class="message-view-container">
		<div class="message-view-header">
			<div>제목</div><div class="message-view-text title">${requestScope.data.ms_title }</div>
			<div>보낸사람</div><div class="message-view-text sender">${requestScope.data.ms_sender }</div>
			<div>보낸날짜</div><div class="message-view-text date">
			<c:set var="TextValue" value="${requestScope.data.ms_dt }"/>${fn:substring(TextValue,0,19) }
			</div>
		</div>
		<div class="message-view-body">
			<div class="message-view-text content">${requestScope.data.ms_ctnt }</div>
		</div>
		<div class="message-view-footer">
			<div class="message-view-button answer" onclick="openWriteMessage(${requestScope.data.ms_sender})">답장</div>
			<div class="message-view-button delete" onclick="deleteMessage('DELETE', ${requestScope.data.ms_no})">삭제</div>
		</div>
	</div>
</body>
<script defer type="text/javascript" src="/js/member/message.js"></script>
</html>