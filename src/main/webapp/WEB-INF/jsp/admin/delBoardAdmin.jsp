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
<c:if test="${loginMember.m_authstate == 999 }">
			
			<h1>삭제된 게시판 관리</h1>
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
		
</c:if>

</body>
</html>