<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
</head>
<body>
	<div class="pay-container">
		<div class="pay-header">
			<div class="pay-title"></div>
		</div>
		<div class="pay-body">
			<div class="pay-subcontainer">
				<div class="pay-balance" id="member-pk" data-member-pk="${sessionScope.loginMember.m_no }">
					<div class="pay-balance-title">스홈페이잔액<button class="pay-charge-button">충전</button></div>
					<div class="pay-balance-ctnt"></div>
				</div>
				<div class="pay-price">
					<div class="pay-startprice-title">분양 시작가</div>
					<div class="pay-startprice-ctnt"></div>
					<div class="pay-curprice-title">현재 분양가</div>
					<div class="pay-curprice-ctnt"></div>
				</div>
				<hr>
				<div>
					<div class="pay-bid-title">입찰하기</div>
					<div class="pay-checkbox">
						<label><input type="checkbox" name="pay-checkbox">개인정보 판매자 제공 동의</label>
						<label><input type="checkbox" name="pay-checkbox">위 구매조건을 확인, 결제진행에 동의합니다.</label>
					</div>
					<div class="pay-bid-ctnt">
						<input type="text" class="pay-bid-text">
					</div>
					<input type="hidden" class="pay-enddt">
					<div class="pay-timer"></div>
					<input type="button" class="pay-button payment" value="입찰">
				</div>
			</div>
			
		</div>
		<div class="pay-footer">
			<div class="pay-button">
				
				<input type="button" class="pay-button cancle" value="취소" onclick="window.close();">
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="/js/pay/auction.js"></script>
</html>