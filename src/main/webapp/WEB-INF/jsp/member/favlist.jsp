<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/member/favlist.css">
<%@ include file="/WEB-INF/jsp/member/mypage.jsp" %>
	<div class="fav-container">
		<div class="fav-header"><h1>찜목록</h1></div>
		<div class="fav-body">
			<ul class="fav-list">
				<li class="fav-list-header">
					<div class="fav-list-no">번호</div>
					<div class="fav-list-writer">작성자</div>
					<div class="fav-list-title">제목</div>
					<div class="fav-list-price">가격</div>
					<div class="fav-list-date">날짜</div>
					<div class="fav-list-delete"></div>
				</li>
				<c:forEach var="item" items="${requestScope.data }" varStatus="status">
				<li class="fav-list-item">
					<div class="fav-item-no">${item.b_no }</div>
					<div class="fav-item-writer">${item.b_writer }</div>
					<div class="fav-item-title" onclick="location.href = '/board/view?b_no=${item.b_no}'">[${item.an_type2}] ${item.b_title }</div>
					<div class="fav-item-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.b_price }" />원</div>
					<div class="fav-item-date"><c:set var="TextValue" value="${item.b_dt }"/>${fn:substring(TextValue,0,10) }</div>
					<div class="fav-item-delete"><button class="fav-button-delete" onclick="delFav(${item.b_no})">삭제</button></div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<div class="fav-footer"></div>
	</div>
<script defer type="text/javascript" src="/js/member/favlist.js"></script>
