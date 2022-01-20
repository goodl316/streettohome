<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>hello World!</h1>


<button onclick="moveList('강아지')">강아지를 집으로</button>
<button onclick="moveList('고양이')">고양이를 집으로</button>
<c:if test="${loginMember != null }">
<button onclick="regBoard()">글등록</button>
<c:if test="${loginMember.m_authstate == 999 }">
<button onclick="moveAdmin(1)">관리자페이지</button>
</c:if>
</c:if>
</body>
</html>
