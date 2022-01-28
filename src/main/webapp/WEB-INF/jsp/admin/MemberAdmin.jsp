<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/member.css">
</head>
<body>
<input type="hidden" value="${loginMember.m_authstate }" class="authstate">
<c:if test="${loginMember.m_authstate == 999 }">
	<c:choose>
		<c:when test="${param.m_state == 1 }">
			<h1>개인사용자 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>게시글수</th>
					<th>경고누적</th>
					<th>가입날짜</th>
					<th>이용정지</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.m_no }</td>
						<td>${list.m_name}</td>
						<td>${list.m_email}</td>
						<td>0</td>
						<td>0</td>
						<td>${list.m_dt}</td>
						<td>
							<button onclick="delMember(${list.m_no})">정지</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:when test="${param.m_state == 2 }">
		<h1>단체이용자 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>게시글수</th>
					<th>경고누적</th>
					<th>가입날짜</th>
					<th>이용정지</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.m_no }</td>
						<td>${list.m_name}</td>
						<td>${list.m_email}</td>
						<td>0</td>
						<td>0</td>
						<td>${list.m_dt}</td>
						<td>
							<button onclick="delMember(${list.m_no})">정지</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		
		</c:when>
		<c:when test="${param.m_state == 3 }">
		<h1>이용정지 사용자 관리</h1>
			<table>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>게시글수</th>
					<th>경고누적</th>
					<th>가입날짜</th>
					<th>이용정지</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.m_no }</td>
						<td>${list.m_name}</td>
						<td>${list.m_email}</td>
						<td>0</td>
						<td>0</td>
						<td>${list.m_dt}</td>
						<td>
							<button onclick="delMember(${list.m_no})">정지</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		
		</c:when>
	</c:choose>
	</c:if>
	<c:if test="${loginMember.m_authstate != 999 }">
	<h1>접속 권한이 없습니다.</h1>
	</c:if>
	
</body>
</html>
<script type="text/javascript" src="/js/admin/memberAdmin.js"></script>