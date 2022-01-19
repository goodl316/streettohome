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
<c:choose>
		<c:when test="${param.an_type1 eq '강아지' }">
			<h1>개인사용자 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>승인 Y/N</th>
					<th>무료/유료</th>
					<th>등록날짜</th>
					<th>게시글삭제</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.b_no }</td>
						<td>${list.b_title}</td>
						<td>${list.m_no }</td>
						<td>${list.b_auth}</td>
						<td>${list.b_tt }</td>
						<td>${list.b_dt }</td>
						<td>
							<button onclick="delBoard(${list.b_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:when test="${param.an_type1 eq '고양이' }">
		<h1>단체이용자 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>승인 Y/N</th>
					<th>무료/유료</th>
					<th>등록날짜</th>
					<th>게시글삭제</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.b_no }</td>
						<td>${list.b_title}</td>
						<td>${list.m_no}</td>
						<td>${list.b_auth }</td>
						<td>${list.b_tt }</td>
						<td>${list.b_dt}</td>
						<td>
							<button onclick="delBoard(${list.m_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		
		</c:when>
</c:choose>

</body>
</html>
<script type="text/javascript" src="/js/admin/boardAdmin.js" ></script>