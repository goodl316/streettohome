<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/ask/view.css">
</head>
<body>
	<div>
		<div class="ask-body">
			<div class="board-header">
				<div>${data[0].ak_name }</div>
				<div class="item-title">${data[0].ak_title }</div>
				<div><c:set var="TextValue" value="${data[0].ak_dt}"/>${fn:substring(TextValue,0,16) }</div>
			</div>
			<div class="ask-content">
				<div>${data[0].ak_ctnt }</div>
			</div>
			<div class="item-footer"><button onclick="location.href='/ask/mod?ak_idx=${data[0].ak_idx}'">수정하기</button></div>
		</div>
		<div class="ans-body">
			<c:if test="${data[1] == null }">
				<div>답변이 없습니다.</div>	
			</c:if> 
			<div class="board-header">
				<div>${data[1].ak_name }</div>
				<div class="item-title">${data[1].ak_title }</div>
				<div><c:set var="TextValue" value="${data[1].ak_dt}"/>${fn:substring(TextValue,0,16) }</div>
			</div>
			<div class="ask-content"> 
				<div>${data[1].ak_ctnt }</div>
			</div>
		</div>
		<div class="ask-footer">
			<button onclick="location.href='/ask/list?page=1'">목록</button>	
		</div>
	</div>
</body>
</html>