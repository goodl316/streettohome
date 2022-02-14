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
	<div>
		<div class="ask-body">
			<c:if test="${data == null }">
			<script>location.href = '/ask/list'</script>
			</c:if>
			<div>${data[0].ak_title }</div>
			<div>${data[0].ak_name }</div>
			<div>${data[0].ak_ctnt }</div>
			<div>${data[0].ak_dt }</div>
		</div>
		<div class="ans-body">
			<c:if test="${data[1] == null }">
				<div>답변이 없습니다.</div>	
			</c:if>
			<div>${data[1].ak_title }</div>
			<div>${data[1].ak_name }</div>
			<div>${data[1].ak_ctnt }</div>
			<div>${data[1].ak_dt }</div>
		</div>
		<div class="ask-footer">
			<button onclick="location.href='/ask/list'">목록</button>	
		</div>
	</div>
</body>
</html>