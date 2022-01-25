<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="fav-container">
		<div class="fav-header"><h1>찜목록</h1></div>
		<div class="fav-body">
			<ul class="fav-list">
				<li class="fav-list-header">
					<div class="fav-list-no">번호</div>
					<div class="fav-list-title">제목</div>
					<div class="fav-list-writer">작성자</div>
					<div class="fav-list-price">가격</div>
					<div class="fav-list-date">날짜</div>
					<div class="fav-list-delete"></div>
				</li>
				<c:forEach var="item" items="${requestScope.data }" varStatus="status">
				<li class="fav-list-item">
					<div class="fav-item-no">${item.b_no }</div>
					<div class="fav-item-title" onclick="location.href = '/board/view?b_no=${item.b_no}'">${item.b_title }</div>
					<div class="fav-item-writer">${item.b_writer }</div>
					<div class="fav-item-price">${item.b_price }</div>
					<div class="fav-item-date">${item.b_dt }</div>
					<div class="fav-item-delete"><button class="fav-button-delete" onclick="delFav(${item.b_no})">삭제</button></div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="fav-footer"></div>
	</div>
</body>
<script defer type="text/javascript" src="/js/member/favlist.js"></script>
</html>