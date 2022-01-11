<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Street To Home - ${requestScope.data.b_title }</title>
</head>
<body>
	<div class="view-container">
	
	<!-- 메인 컨테이너 -->
		<div class="view-main-container">
			<div class="view-thumbnail"></div>
			<div class="view-top-container">
				<div class="view-subtitle-container">
					<div class="view-type">${requestScope.data.b_type }</div>
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
					<div class="view-nowprice">"" }</div>
				</div>
				<div class="view-price-container">
					<div class="view-price">0원</div>
					<div class="view-auction">
						<div class="view-startprice">경매시작가 0원</div>
						<div class="view-enddate">#일 #시간 #분 #초 (마감일 : yy-mm-dd hh:mm)</div>
					</div>
				</div>
				<div class="view-info-container">
					<div class=view-info-title>작성자</div>
					<div class=view-info-content></div>
					<div class=view-info-title>연락처</div>
					<div class=view-info-content></div>
					<div class=view-info-title>지역</div>
					<div class=view-info-content></div>
					<div class=view-info-title>나이</div>
					<div class=view-info-content></div>
					<div class=view-info-title>중성화여부</div>
					<div class=view-info-content></div>
					<div class=view-info-title>견종/묘종</div>
					<div class=view-info-content></div>
					<div class=view-info-title>성별</div>
					<div class=view-info-content></div>
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
			<div class="view-reply-write">
				 <div>댓글쓰기</div>
				 <div class="view-reply"></div>
			</div>
			<div class="view-reply-list">
				<div class="view-reply-list-header">
					<div class="view-reply-writer"># 님</div>
					<div class="view-reply-date">yyyy.mm.dd hh:mm</div>
				</div>			
				<div class="view-reply-list-body">content</div>			
				<div class="view-reply-list-footer">
					<div class="view-reply-rereply"></div>
					<div class="view-reply-report"></div>
				</div>
			</div>
		</div>
		<div class="view-detail-footer"><a href="">목록보기</a></div>
	
	</div>
</body>
</html>