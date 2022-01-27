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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
<link rel="stylesheet" href="/css/header/header.css"/>

<title>Document</title>
</head>
<body>
    <div>
        <header>
        <input type="hidden" value="${sessionScope.loginMember.m_authstate}" id="loginData">
            <h1 class= "logo"><a href= "/">Street to home</a></h1>
            <div class="header-contain">
                <c:choose>
                    <c:when test="${empty sessionScope.loginMember}">
                    <div class="nav-member">
                            <a class="login-btn" onclick="login()" href="../member/login">로그인</a>
                        	<a class="join_btn" href="/member/join">회원가입</a>
                    </div>
                    </c:when>
                    <c:otherwise>
				    	<input id="header-session-id" type="hidden" value="${sessionScope.loginMember.m_no }">
				    	<div class="header-user">
                            <a class="">${sessionScope.loginMember.m_name} 님,반갑습니다.</a> ||
                        	<div class="nav-link message">메시지 : <i class="item-message-icon"></i></div>||
                           	 <a class="dropdown-item" href="../member/logout">로그아웃</a>  ||
                            <a class="dropdown-item" href="../member/mypage">마이페이지</a>
                        
                        </div>
                           
                    </c:otherwise>
                </c:choose>
            </div>
            <nav>
                <ul class="navList">
                    <li><a href="javascript:;">스트릿투홈 소개</a></li>
                    <li><a href="/board/boardList?an_type1=강아지">강아지를 집으로</a></li>
                    <li><a href="/board/boardList?an_type1=고양이">고양이를 집으로</a></li>
                    <li><a href="javascript:;">후원</a></li>
                    <li><a href="javascript:;">입양후기</a></li>
                    <li><a href="javascript:;">문의하기</a></li>
                </ul>
            </nav>
        </header>
        <div class="container"></div>
        <footer></footer>
    </div>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="/js/header/header.js"></script>