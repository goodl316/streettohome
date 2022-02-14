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
	<div class="ask-container">
		<div>
			<button onclick="location.href='/ask/regAsk'">문의하기</button>
		</div>
		<div>
			<ul>
				<li>
					<div>번호</div>
					<div>제목</div>
					<div>작성자</div>
					<div>작성일</div>
				</li>
				<c:forEach  var="item" items="${data}">
					<li>
						<div>${item.ak_no }</div>
						<div>${item.ak_title }</div>
						<div>${item.ak_name }</div>
						<div>${item.ak_dt }</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>