<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<ul>
				<li>${data.ak_title }</li>
				<li>${data.ak_name }</li>
				<li>${data.ak_ctnt }</li>
				<li>${data.ak_dt }</li>
			</ul>
		</div>
		<div>
		<c:choose>
			<c:when test="${data.ak_dept eq 0 }">
				<form action="/admin/ans" method="post">
					<input type="hidden" name="ak_title" value="답변 : ${data.ak_title }"> 
					<input type="hidden" name="ak_idx" value="${data.ak_idx }"> 
					<div><textarea name="ak_ctnt" placeholder="내용을 입력해주세요."></textarea></div>
					<button>작성</button>
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