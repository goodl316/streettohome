<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<link href="/css/member/myboard.css" rel="stylesheet">
<div id="grid">
<div id="areaA">
<%@ include file="/WEB-INF/jsp/member/mypage.jsp"%>
</div>
<h2>나의 게시글 목록</h2>
<table class="my-board">
	<tr class="list-header">
		<th>번호</th>
		<th>제목</th>
		<th>승인 Y/N</th>
		<th>분양방식</th>
		<th>등록날짜</th>
		<th>게시글삭제</th>
	</tr>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.b_no }</td>
			<td onclick="location.href='/board/view?b_no=${list.b_no}'">${list.b_title}</td>
			<td><c:choose>
					<c:when test="${list.b_auth ==0 }">
						N
						</c:when>
					<c:when test="${list.b_auth == 1 }">
						Y
						</c:when>
				</c:choose></td>
			<td>${list.b_tt }</td>
			<td><c:set var="TextValue" value="${list.b_dt}" />${fn:substring(TextValue,0,10) }</td>
			<td>
				<button onclick="delBoard(${list.b_no})">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>
<div class=pagination>
	<ui:pagination paginationInfo="${paginationInfo}" type="image"
		jsFunction="linkPage" />
</div>
</div>
<script defer type="text/javascript" src="/js/member/myboard.js"></script>