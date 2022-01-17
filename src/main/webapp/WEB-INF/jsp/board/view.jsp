<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script> 
<title>Street To Home - ${requestScope.data.b_title }</title>
</head>
<body>
	<div class="view-container">
	<input id="view-member-pk" type="hidden" data-member-pk="${sessionScope.loginMember.m_no }">
	<!-- 메인 컨테이너 -->
		<div class="view-main-container">
			<div class="view-thumbnail">
				<img alt="none" src="">
				<div class="view-auth">
					<c:choose>
						<c:when test="${requestScope.data.b_auth eq 0 }">관리자에게 인증받지 않은 게시글 입니다.</c:when>
						<c:otherwise>관리자에게 인증받은 게시글 입니다.</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="view-top-container">
				<div class="view-subtitle-container">
					<div class="view-type">${requestScope.data.an_type2 }</div>
					<div class="view-hit">${requestScope.data.b_hit }</div>
				</div>
				<div class="view-title-container">${requestScope.data.b_title }</div>
				<div class="view-subtitle-container">
					<div class="view-date">${requestScope.data.b_dt }</div>
					<div class="view-info">
						<div class="view-state state">
							<c:set var="b_state" value="${requestScope.data.b_state }"/>
							<c:choose>
								<c:when test="${b_state eq 0 }">분양대기</c:when>
								<c:when test="${b_state eq 1 }">분양중</c:when>
								<c:when test="${b_state eq 2 }">분양완료</c:when>
							</c:choose>
						</div>
						<div class="view-state trade">
							<c:set var="b_tt" value="${requestScope.data.b_tt }"/>
							<c:choose>
								<c:when test="${b_tt eq 0 }">무료</c:when>
								<c:when test="${b_tt eq 1 }">유료</c:when>
								<c:when test="${b_tt eq 2 }">경매</c:when>
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
					<div class="view-auction">
						<div class="view-startprice">경매시작가 ${requestScope.data.ac_startprice }원</div>
						<div id="enddate" class="view-enddate" data-enddt="${requestScope.data.b_enddt }"></div>
					</div>
				</div>
				<div class="view-info-container">
					<div class=view-info-title>작성자</div>
					<div class=view-info-content>${requestScope.data.b_writer }</div>
					<div class=view-info-title>지역</div>
					<div class=view-info-content>${requestScope.data.b_loc_sido } ${requestScope.data.b_loc_gugun }</div>
					<div class=view-info-title>나이</div>
					<div class=view-info-content>${requestScope.data.b_age }</div>
					<div class=view-info-title>중성화여부</div>
					<div class=view-info-content>${requestScope.data.b_ns }</div>
					<div class=view-info-title>견종/묘종</div>
					<div class=view-info-content>${requestScope.data.an_type2 }</div>
					<div class=view-info-title>성별</div>
					<div class=view-info-content>${requestScope.data.b_gender }</div>
				</div>
				<div class="view-button-container">
					<input type="button" class="view-info-button favorite" value="찜하기">
					<input type="button" class="view-info-button contact" value="연락하기">
					<input type="button" class="view-info-button buy" value="분양신청">
				</div> 
				
			</div>
		</div>
		
		<!-- 상세설명 -->
		<button>상세설명</button>  <!-- onclick view-detail-container display none 풀기 -->
		<div class="view-detail-container">
			<div class="view-detail-content"></div>
			<div class="view-detail-report">신고하기</div>
		</div>
		
		<!-- 댓글화면 -->
		<div class="view-reply-container">
			<div class="view-reply-text-container">
				 <div>댓글쓰기</div>
				 <div id="view-reply-write">
				 	<form onsubmit="return false;">
					 	<textarea id="reply-txtarea" class="view-reply-textarea" maxlength="600" placeholder="댓글을 입력하세요(최대 600자)"></textarea>
				 		<input type="button" class="view-reply-button" value="작성">
				 	</form>
				 					 	
				 </div>
			</div>
			<div class="view-reply-list-container">
				<!-- <div class="view-reply-list-header">
					<div class="view-reply-writer"># 님</div>
					<div class="view-reply-date">yyyy.mm.dd hh:mm</div>
				</div>			
				<div class="view-reply-list-body">content</div>			
				<div class="view-reply-list-footer">
					<div class="view-reply-rereply">답글달기</div>
					<div class="view-reply-report">신고하기</div>
				</div> -->
				<ul class="view-reply-list"></ul>
			</div>
		</div>
		<div class="view-detail-footer"><a href="">목록보기</a></div>
	
	</div>
</body>

<script defer type="text/javascript" src="/js/board/view.js"></script>
<script defer type="text/javascript" src="/js/board/reply.js"></script>
<script defer type="text/javascript" src="/js/board/fav.js"></script>
</html>