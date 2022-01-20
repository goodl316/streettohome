<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<link rel="stylesheet" href="css/header.css"/>
<title>Document</title>
</head>
<body>
    <div>
        <header>
        <input type="hidden" value="${sessionScope.loginMember.m_authstate}" id="loginData">
            <h1>Street to home</h1>
            <div class="login clearfix">
                <c:choose>
                    <c:when test="${empty sessionScope.loginMember}">
                        <p class="nav-item">
                            <a class="nav-link" onclick="login()" href="../member/login">로그인</a>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button"
                                data-bs-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">${sessionScope.loginMember.m_name} 님,
                                반갑습니다.</a>
                        </p>
                        <p class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="../member/logout">로그아웃</a> <a
                                class="dropdown-item" href="../member/mypage">마이페이지</a>
                        </p>
                    </c:otherwise>
                </c:choose>
            </div>
            <nav>
                <ul class="navList clearfix">
                    <li><a href="javascript:;">스트릿투홈 소개</a></li>
                    <li><a href="javascript:;">강아지를 집으로</a></li>
                    <li><a href="javascript:;">고양이를 집으로</a></li>
                    <li><a href="javascript:;">후원</a></li>
                    <li><a href="javascript:;">입양후기</a></li>
                </ul>
            </nav>
        </header>
        <div class="container"></div>
        <footer></footer>
    </div>
</body>
</html>
<script type="text/javascript" src="/js/header/header.js"></script>