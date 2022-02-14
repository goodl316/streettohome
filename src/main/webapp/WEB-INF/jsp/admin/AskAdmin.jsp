<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin/ask.css">
<title>Insert title here</title>
</head>
<body>
	<h1>문의 글</h1>
	<table class="admin-ask">
		<tr class="list-header">
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성날짜</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr class="ask-item${list.ak_no }">
				<td>${list.ak_no }</td>
				<td>${list.ak_name }</td>
				<td onclick="getAsk(${list.ak_no}, '${list.ak_title }')">${list.ak_title}</td>
				<td><c:set var="TextValue" value="${list.ak_dt}"/>${fn:substring(TextValue,0,10) }</td>
				<td>
					<button onclick="delAsk(${list.ak_no})">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
<script type="text/javascript" src="/js/admin/askAdmin.js"></script>