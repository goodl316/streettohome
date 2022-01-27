<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/board/boardView.css">
<title>Street To Home - ${requestScope.data.b_title }</title>
</head>
<body>
	<div class="view-container">
	<input id="view-member-pk" type="hidden" data-member-pk="${sessionScope.loginMember.m_no }">
	<!-- 메인 컨테이너 -->
		<div class="view-main-container">
			<div class="view-thumbnail">
				<img src="">
				<div class="view-auth">
					<c:choose>
						<c:when test="${requestScope.data.b_auth eq 0 }">관리자에게 인증받지 않은 게시글 입니다.</c:when>
						<c:otherwise>관리자에게 인증받은 게시글 입니다.</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="view-top-container">
				<div class="view-subtitle-container">
					<div class="view-type">[${requestScope.data.an_type2 }]</div>
					<div class="view-hit">조회수 : ${requestScope.data.b_hit }</div>
				</div>
				<div class="view-title-container">${requestScope.data.b_title }</div>
				<div class="view-subtitle-container">
					<div class="view-date">작성일 : ${requestScope.data.b_dt }</div>
					<div class="view-info">
						<div class="view-state state">
							<c:set var="b_state" value="${requestScope.data.b_state }"/>
							<c:choose>
								<c:when test="${b_state eq '1' }">분양대기</c:when>
								<c:when test="${b_state eq '2' }">분양중</c:when>
								<c:when test="${b_state eq '3' }">분양완료</c:when>
							</c:choose>
						</div>
						<div class="view-state trade">
							<c:set var="b_tt" value="${requestScope.data.b_tt }"/>
							<c:choose>
								<c:when test="${b_tt eq '무료' }">무료</c:when>
								<c:when test="${b_tt eq '유료' }">유료</c:when>
								<c:when test="${b_tt eq '경매' }">경매</c:when>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="view-subtitle-container">
					<div class="view-nowprice">분양가</div>
				</div>
				<div class="view-price-container">
					<div class="view-price">
						<c:choose>
							<c:when test="${requestScope.data.b_tt eq '무료' }">무료</c:when>
							<c:when test="${requestScope.data.b_tt eq '유료' }">${requestScope.data.b_price }원</c:when>
							<c:when test="${requestScope.data.b_tt eq '경매' }">${requestScope.data.ac_price }원</c:when>
						</c:choose>
					</div>
					<c:if test="${requestScope.data.b_tt eq '경매' }">
						<div class="view-auction">
							<div class="view-startprice">경매시작가 ${requestScope.data.ac_startprice }원</div>
							<c:if test="${requestScope.data.b_enddt ne null}">
								<div id="enddate" class="view-enddate" data-enddt="${requestScope.data.b_enddt }"></div>
							</c:if>
						</div>
					</c:if>
				</div>
				<div class="view-info-container">
					<div class=view-info-title>작성자</div>
					<div class=view-info-content>${requestScope.data.b_writer }</div>
					<div class=view-info-title>지역</div>
					<div class=view-info-content>${requestScope.data.b_loc_sido } ${requestScope.data.b_loc_gugun }</div>
					<div class=view-info-title>나이</div>
					<div class=view-info-content>${requestScope.data.an_age }</div>
					<div class=view-info-title>중성화여부</div>
					<div class=view-info-content>
					<c:choose>
						<c:when test="${requestScope.data.an_ns } eq 1">O</c:when>
						<c:when test="${requestScope.data.an_ns } eq 0">X</c:when>
						<c:otherwise>모름</c:otherwise>
					</c:choose>
					</div>
					<div class=view-info-title>견종/묘종</div>
					<div class=view-info-content>${requestScope.data.an_type2 }</div>
					<div class=view-info-title>성별</div>
					<div class=view-info-content>${requestScope.data.an_gender }</div>
				</div>
				<div class="view-button-container">
					<div class="view-info-button favorite">찜하기<i class="fas fa-heart"></i></div>
					<input type="button" class="view-info-button message" value="쪽지" onclick="openWriteMessage(${requestScope.data.m_no})">
					<c:choose>
						<c:when test="${requestScope.data.b_state eq '3' }">
							<input type="button" class="view-info-button none" value="분양완료">
						</c:when>
						<c:when test="${requestScope.data.b_tt eq '경매' }">
							<input type="button" class="view-info-button auction" value="분양신청">
						</c:when>
						<c:when test="${requestScope.data.b_tt eq '유료' }">
							<input type="button" class="view-info-button buy" value="분양신청">
						</c:when>
					</c:choose>
				</div> 
			</div>
		</div>
		
		<!-- 상세설명 -->
		<div class="view-detail-container">
			<div class="view-img-container"></div>
			<div class="view-detail-content">${requestScope.data.b_ctnt }</div>
			<div class="view-detail-report">
			<button class="view-detail-button report"><img src="/images/egovframework/icon/siren.png"></img>신고하기</button>
			<c:if test="${requestScope.data.m_no eq sessionScope.loginMember.m_no }">
				<button class="view-detail-button modify" onclick="location.href='/board/boardmod?b_no=${requestScope.data.b_no }'">수정하기</button>
			</c:if>
			</div>
		</div>
		
		<!-- 댓글화면 -->
		<div class="view-reply-container">
			<div class="view-reply-text-container">
				 <div>댓글쓰기</div>
				 <div id="view-reply-write" class="view-reply-write">
				 	<form onsubmit="return false;" class="reply-form">
					 	<textarea id="reply-txtarea" class="view-reply-textarea" maxlength="600" placeholder="댓글을 입력하세요(최대 600자)"></textarea>
				 		<div class="reply-button-container"><input id="reply-submit" type="button" class="view-reply-button" value="작성"></div>
				 	</form>
				 					 	
				 </div>
			</div>
			<div class="view-reply-list-container">
				<ul class="view-reply-list"></ul>
			</div>
		</div>
		<div class="view-detail-footer"><span class="view-button-return" onclick="returnPage()">목록보기</span></div>
	
	</div>
</body>
<script defer type="text/javascript" src="/js/member/message.js"></script>
<script defer type="text/javascript" src="/js/board/view.js"></script>
<script defer type="text/javascript" src="/js/board/reply.js"></script>
<script defer type="text/javascript" src="/js/board/timer.js"></script>

</html>