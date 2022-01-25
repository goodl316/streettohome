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
<input type="hidden" value="${loginMember.m_authstate}" class="authstate">
<c:if test="${loginMember.m_authstate == 999 }">
<c:choose>
		<c:when test="${param.an_type1 == null }">
			<h1>신고받은 게시판 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>신고자</th>
					<th>신고사유</th>
					<th>작성자</th>
					<th>게시글삭제</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.rp_no }</td>
						<td>${list.b_title}</td>
						<td>${list.wr_no }</td>
						<td>${list.rp_ctnt}</td>
						<td>${list.name}</td>
						<td>
							<button onclick="delBoard(${list.b_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:when test="${param.an_type1 eq '강아지' }">
			<h1>신고받은 게시판 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>신고자</th>
					<th>신고사유</th>
					<th>작성자</th>
					<th>게시글삭제</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.rp_no }</td>
						<td>${list.b_title}</td>
						<td>${list.wr_no }</td>
						<td>${list.rp_ctnt}</td>
						<td>${list.name}</td>
						<td>
							<button onclick="delBoard(${list.b_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:when test="${param.an_type1 eq '고양이' }">
		<h1>신고받은 게시판 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>신고자</th>
					<th>신고사유</th>
					<th>작성자</th>
					<th>게시글삭제</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.rp_no }</td>
						<td>${list.b_title}</td>
						<td>${list.wr_no }</td>
						<td>${list.rp_ctnt}</td>
						<td>${list.name}</td>
						<td>
							<button onclick="delBoard(${list.b_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		
		</c:when>
</c:choose>
</c:if>

<c:if test="${loginMember.m_authstate != 999 }">
<h1>접속권한이 없습니다.</h1>
</c:if>
</body>


</html>
<script type="text/javascript" src="/js/admin/boardAdmin.js" ></script>