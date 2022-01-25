<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="pay-container">
		 <div class="pay-header"><h1>스홈페이</h1></div>
		 <div class="pay-body">
		 	<div class="pay-money-container">
		 		<div class="pay-money-title">잔액</div>
		 		<div class="pay-money-balance" data-member-pk="${sessionScope.loginMember.m_no }"></div>
		 		<div class="pay-money-charge"><button class="pay-button-charge">충전하기</button></div>
		 	</div>
		 	
		 	<div class="pay-history-container">
		 		<div class="pay-history-header">
			 		<button class="pay-history-button buy" onclick="movePage(0)">구매내역</button>
			 		<button class="pay-history-button sell" onclick="movePage(1)">판매내역</button>
		 		</div>
		 		<div class="pay-history">
		 			<ul class="pay-history-list">
		 				<li class="pay-history-list-header">
		 					<div class="pay-history-no">번호</div>
		 					<div class="pay-history-title">제목</div>
		 					<div class="pay-history-nickname">판매자</div>
		 					<div class="pay-history-price">가격</div>
		 					<div class="pay-history-date">날짜</div>
		 				</li>
		 				<c:forEach var="item" items="${requestScope.history }" varStatus="status">
		 					<li class="pay-history-item">
			 					<div class="pay-history-no">${item.b_no }</div>
			 					<div class="pay-history-title">${item.b_title }</div>
			 					<div class="pay-history-nickname">${item.nickname }</div>
			 					<div class="pay-history-price">${item.th_price }</div>
			 					<div class="pay-history-date">${item.th_dt }</div>
		 					</li>
		 				</c:forEach>
		 			</ul>
		 		</div>
		 	</div>
		 </div>
		 <div class="pay-footer">
		 	<ui:pagination paginationInfo="${requestScope.paginationInfo }" type="image" jsFunction="linkPage"/>
		 </div>
	</div>
</body>
<script type="text/javascript" src="/js/member/sthpay.js"></script>
</html>