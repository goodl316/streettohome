<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
	제목 * <input type="text" class="title" placeholder="제목을 입력해 주세요">
	</div>
	<div>
	내용 * <textarea class="ctnt" placeholder="내용을 입력해 주세요"></textarea>
	</div>
	<div>
	<button class="regbtn" onclick="regAsk(${loginMember.m_no})">등록</button>
	</div>
</div>
</body>
</html>
<script type="text/javascript" src="/js/ask/regAsk.js"></script>