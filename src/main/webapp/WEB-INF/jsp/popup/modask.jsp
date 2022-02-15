<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/ask/mod.css">
</head>
<body>
	<div>
		<form class="mod-form" action="/admin/ask/mod" method="post">
			<input type="hidden" name="ak_no" value="${data.ak_no }">
			<input class="mod-title" type="text" placeholder="제목을 입력하세요" value="${data.ak_title }" readOnly>
			<textarea class="mod-ctnt" name="ak_ctnt" placeholder="내용을 입력하세요">${data.ak_ctnt }</textarea>
			<button>작성</button>
		</form>
	</div>
</body>
</html>