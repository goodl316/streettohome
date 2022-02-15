<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/popup/askView.css">
</head>
<body>
	<div>
		<div>
			<div class="board-header">
				<div>${data.ak_title }</div>
				<div>${data.ak_name }</div>
				<div><c:set var="TextValue" value="${data.ak_dt}"/>${fn:substring(TextValue,0,16) }</div>
			</div>
			<div class="ask-content">${data.ak_ctnt }</div>
		</div>
		<div>
		<c:choose>
			<c:when test="${data.ak_dept eq 0 }">
				<div>답변하기</div>
				<form action="/admin/ans" method="post">
					<input type="hidden" name="ak_title" value="답변 : ${data.ak_title }"> 
					<input type="hidden" name="ak_idx" value="${data.ak_idx }"> 
					<div><textarea class="ask-textarea" name="ak_ctnt" placeholder="내용을 입력해주세요."></textarea></div>
					<div style="text-align: right;">
						<button>작성</button>
					</div>
				</form>
			</c:when>
			<c:otherwise>
				<button onclick="location.href='/admin/ask/mod?ak_no=${data.ak_no}'">수정</button>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</body>
</html>