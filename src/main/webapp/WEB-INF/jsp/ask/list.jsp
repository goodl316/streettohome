<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/ask/list.css">
</head>
<body>
	<div class="ask-container">
		<div style="margin-bottom: 20px;">
			<button class="ask-button" onclick="location.href='/ask/regAsk'">문의하기</button>
		</div>
		<div>
			<ul>
				<li class="ask-header">
					<div>번호</div>
					<div>작성자</div>
					<div>제목</div>
					<div>작성일</div>
				</li>
				<c:forEach  var="item" items="${data}">
				<c:choose>
					<c:when test="${item.ak_dept eq 1}">
						<li class="ask-item answer">
					</c:when>
					<c:otherwise>
						<li class="ask-item">
					</c:otherwise>
				</c:choose>
						<div>${item.ak_no }</div>
						<div>${item.ak_name }</div>
						<div class="item-title" onclick="location.href='/ask/password?ak_idx=${item.ak_idx}'">${item.ak_title }</div>
						<div><c:set var="TextValue" value="${item.ak_dt}"/>${fn:substring(TextValue,0,16) }</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="ask-footer">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
		</div>
	</div>
</body>
<script type="text/javascript" src="/js/ask/list.js"></script>
</html>