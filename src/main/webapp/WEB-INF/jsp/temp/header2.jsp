<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/header.css">
</head>
<body>
<c:if test="${loginMember.m_authstate == 999 }">
<header>
<h3>사용자 관리</h3>
<ul>
<li><a href="/admin/MemberAdmin?m_state=1">개인사용자</a></li>
<li><a href="/admin/MemberAdmin?m_state=2">단체사용자</a></li>
<li><a href="/admin/MemberAdmin?m_state=3">이용정지 사용자</a></li>
</ul>
<h3>게시글 관리</h3>
<ul>
<li><a href="/admin/BoardAdmin?an_type1=강아지">강아지 게시글</a></li>
<li><a href="/admin/BoardAdmin?an_type1=고양이">고양이 게시글</a></li>
<li><a href="/admin/ReportAdmin">신고받은 게시글</a>
<li>삭제된 게시글</li>
</ul>

<h3>댓글 관리</h3>

<h3>쪽지 보내기</h3>
</header>
</c:if>

<c:if test="${loginMember.m_authstate != 999 }">

</c:if>

</body>
</html>