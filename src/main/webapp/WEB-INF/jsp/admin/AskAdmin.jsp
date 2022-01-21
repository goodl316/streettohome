<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>문의 글</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성날짜</th>
			<th>작성자</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr>
				<a href="/ask/detailAsk?ak_no=${list.ak_no}">
				<td>${list.ak_no }</td>
				<td>${list.ak_title}</td>
				<td>${list.ak_ctnt}</td>
				<td>${list.ak_dt}</td>
				<td>${list.m_name }</td>
				</a>
				<td>
					<button onclick="delAsk(${list.ak_no})">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
<script type="text/javascript" src="/js/admin/askAdmin.js"></script>