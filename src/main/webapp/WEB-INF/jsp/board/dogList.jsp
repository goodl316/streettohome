<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list" items="${list}">
	<div>${list.b_no}</div>
	<div>${list.b_title }</div>
	<div>${list.b_ctnt }</div><br>
	</c:forEach>
</body>
</html>