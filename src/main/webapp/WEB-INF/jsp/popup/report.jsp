<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/popup/report.css">
<title>신고하기</title>
</head>
<body>
	<div class="report-container">
		<div class="report-header">
			<div class="report-title">신고하기</div>
			<p>신고하신 게시물은 관리자 검토 후 게재 중단될 수 있습니다.</p>
			<p>허위신고일 경우 불이익을 받으실 수 있으니 유의해주세요</p>
		</div>
		<div class="report-body">
			<div><p>신고이유</p></div>
			<form id="report-form" onsubmit="return false">
				<div class="report-selectbox">
				<!--TODO: 27일부터 할거  -->
					<label><input type="radio" name="radio">광고, 홍보성</label>
					<label><input type="radio" name="radio">불법정보, 불법행위조장</label>
					<label><input type="radio" name="radio">음란성, 성인물</label>
					<label><input type="radio" name="radio">욕설, 폭력</label>
					<label><input type="radio" name="radio">개인정보노출, 사생활 침해</label>
					<label><input type="radio" name="radio">같은 내용의 반복게시(도배)</label>
					<label><input type="radio" name="radio">허위 매물</label>
					<label><input type="radio" name="radio" class="report-etc-radio">기타
					<input class="report-etc-text" type="text" id="rp_ctnt" placeholder="기타"  readOnly></label>
				</div>
				<div class="report-footer">
					<input type="button" class="report-button submit" value="신고하기">
					<input type="button" class="report-button cancle" value="취소" onclick="closePopup();">
				</div>
			</form>
		</div>
	</div>
</body>
<script defer type="text/javascript" src="/js/board/report.js"></script>
</html>