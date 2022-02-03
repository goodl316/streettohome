<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/jsp/member/mypage.jsp" %>
<link rel="stylesheet" href="/css/member/message.css">
<div>
	<div class="message-container">
		<div class="message-header">
			<div class="message-buttons">
				<input type="button" class="message-button delete" value="삭제" onclick="chkMessage('DELETE')">
				<input type="button" class="message-button read" value="읽음" onclick="chkMessage('PATCH')">
			</div>
		</div>
		<div class="message-body">
			<ul class="message-list">
				<li class="message-content-header">
					<div class="message-checkbox">
						<input type="checkbox" class="message-allchk">
					</div>
					<div class="message-name">보낸사람</div>
					<div class="message-content">제목</div>
					<div class="message-date">날짜</div>
				</li>
				<c:forEach var="item" items="${requestScope.data }" varStatus="status">
					<li class="message-content-item <c:if test="${item.ms_read eq 1 }">read</c:if>">
						<div class="message-checkbox">
							<input type="checkbox" class="message-chk" value="${item.ms_no }">
						</div>
						<div class="message-name">
							<c:choose>
								<c:when test="${empty param.ms_sender}">${item.sender }</c:when>
								<c:otherwise>${item.receiver }</c:otherwise>
							</c:choose>
						</div>
						<div class="message-title" onclick="openMessageView(${item.ms_no}, '${item.ms_title }' )">${item.ms_title }</div>
						<div class="message-date"><c:set var="TextValue" value="${item.ms_dt }"/>${fn:substring(TextValue,0,10) }</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="message-footer">
			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
		</div>
	</div>
</div>
<script defer type="text/javascript" src="/js/member/message.js"></script>
