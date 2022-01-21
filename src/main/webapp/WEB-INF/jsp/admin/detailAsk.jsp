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
	작성자 아이디 : <div>${data.m_email }</div>
	작성자 이름 : <div>${data.m_name }</div>
	문의글 번호 : <div>${data.ak_no }</div>
	제목 : <div>${data.ak_title }</div>
	내용 : <div>${data.ak_ctnt }</div>
	등록 날짜 : <div>${data.ak_dt }</div>
	</div>
</body>
</html>