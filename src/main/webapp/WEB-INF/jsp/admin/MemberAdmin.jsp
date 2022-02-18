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
<link rel="stylesheet" href="/css/admin/member.css">
</head>
<body>
<input type="hidden" value="${loginMember.m_authstate }" class="authstate">
<c:if test="${loginMember.m_authstate == 999 }">
	<c:choose>
		<c:when test="${param.m_state == 1 }">
			<h1>개인사용자 관리</h1>
			<div class="search-user">
			<input class="search-text"type="text" placeholder="사용자 이름을 입력해 주세요.">
			<button class="search-btn" onclick="searchMem(${param.m_state},${param.page})">검색</button>
			</div>
			<table class="common-member">
				<tr class="list-header">
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
						<td class="open-message" onclick="openWriteMessage(${list.m_no})">${list.m_email}</td>
						<td>0</td>
						<td>0</td>
						<td><c:set var="TextValue" value="${list.m_dt}"/>${fn:substring(TextValue,0,10) }</td>
						<td>
							<button onclick="delMember(${list.m_no})">정지</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:when test="${param.m_state == 2 }">
		<h1>단체이용자 관리</h1>
		<div class="search-user">
			<input class="search-text"type="text" placeholder="사용자 이름을 입력해 주세요.">
			<button class="search-btn" onclick="searchMem(${param.m_state},${param.page})">검색</button>
			</div>
			<table class="group-member">
				<tr class="list-header">
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
						<td class="open-message" onclick="openWriteMessage(${list.m_no})">${list.m_email}</td>
						<td>0</td>
						<td>0</td>
						<td><c:set var="TextValue" value="${list.m_dt}"/>${fn:substring(TextValue,0,10) }</td>
						<td>
							<button onclick="delMember(${list.m_no})">정지</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		
		</c:when>
		<c:when test="${param.m_authstate == 3 }">
		<h1>이용정지 사용자 관리</h1>
		<div class="search-user">
			<input class="search-text"type="text" placeholder="사용자 이름을 입력해 주세요.">
			<button class="search-btn" onclick="searchMem2(${param.m_authstate},${param.page})">검색</button>
			</div>
			<table class="banned-member">
				<tr class="list-header">
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
						<td><c:set var="TextValue" value="${list.m_dt}"/>${fn:substring(TextValue,0,10) }</td>
						<td>
							<button onclick="liftban(${list.m_no})">해제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
	</c:choose>
	<div class="pagination">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
	</div>
	</c:if>
	<c:if test="${loginMember.m_authstate != 999 }">
		<h1>접속 권한이 없습니다.</h1>
	</c:if>

</body>
</html>
<script type="text/javascript" src="/js/admin/memberAdmin.js"></script>