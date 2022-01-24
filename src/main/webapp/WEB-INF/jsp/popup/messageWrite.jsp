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
<title>Insert title here</title>
</head>
<body>
	<div class="message-write-container">
		<div class="message-write-header">
			<div>제목</div><div class="message-write-title"><input type="text" class="message-title-ctnt"></div>
			<div class="message-write-receiver">
					<div>받는사람</div>
					<input type="hidden" class="message-receiver-value" value="${param.ms_receiver }">
				<input type="text" class="message-receiver-name" value="${requestScope.nickname }" readOnly>
			</div>
		</div>
		<div class="message-write-body">
			<div class="message-write-content">
				<div>내용</div><textarea maxlength="1000" class="message-write-ctnt"></textarea>
			</div>
		</div>
		<div class="message-write-footer">
			<div class="message-write-button send"><input type="button" value="전송"></div>
			<div class="message-write-button cancle"><input type="button" value="취소" onclick="window.close()"></div>
		</div>
	</div>
</body>
<script defer type="text/javascript" src="/js/member/message.js"></script>
</html>
