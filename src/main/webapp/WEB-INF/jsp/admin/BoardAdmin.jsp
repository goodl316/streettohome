 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/board.css">
</head>
<body>
<input type="hidden" value="${loginMember.m_authstate}" class="authstate">
<c:if test="${loginMember.m_authstate == 999 }">
<c:choose>
		<c:when test="${param.an_type1 eq '강아지' }">
			<h1>강아지 게시판 관리</h1>
			<table class="admin-board dog">
				<tr class="list-header">
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
						<td onclick="location.href='/board/view?b_no=${list.b_no}'">${list.b_title}</td>
						<td>${list.m_no }</td>
						<td>${list.b_auth}</td>
						<td>${list.b_tt }</td>
						<td><c:set var="TextValue" value="${list.b_dt}"/>${fn:substring(TextValue,0,10) }</td>
						<td>
							<button onclick="delBoard(${list.b_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:when test="${param.an_type1 eq '고양이' }">
		<h1>고양이 게시판 관리</h1>
			<table class="admin-board cat">
				<tr class="list-header">
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
						<td onclick="location.href='/board/view?b_no=${list.b_no}'">${list.b_title}</td>
						<td>${list.m_no}</td>
						<td>${list.b_auth }</td>
						<td>${list.b_tt }</td>
						<td>
						<c:set var="TextValue" value="${list.b_dt}"/>${fn:substring(TextValue,0,10) }</td>
						<td>
							<button onclick="delBoard(${list.m_no})">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
</c:choose>
<div class=pagination>
	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
</div>
</c:if>

<c:if test="${loginMember.m_authstate != 999 }">
<h1>접속권한이 없습니다.</h1>
</c:if>
</body>


</html>
<script type="text/javascript" src="/js/admin/boardAdmin.js" ></script>