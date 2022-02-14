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
		<div class="ask-body">
			<div>${data.ak_title }</div>
			<div>${data.ak_name }</div>
			<div>${data.ak_ctnt }</div>
			<div>${data.ak_dt }</div>
		</div>
		<div class="ans-body">
			<div>${data.ak_title }</div>
			<div>${data.ak_name }</div>
			<div>${data.ak_ctnt }</div>
			<div>${data.ak_dt }</div>
		</div>
		<div class="ask-footer">
			<button onclick="location.href='/ask/list'">목록</button>	
		</div>
	</div>
</body>
</html>