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
		<form action="/admin/ask/mod" method="post">
			<input type="text" placeholder="제목을 입력하세요" value="${data.ak_title }" readOnly>
			<input type="text" placeholder="내용을 입력하세요" value="${data.ak_ctnt }">
			<button>작성</button>
		</form>
	</div>
</body>
</html>