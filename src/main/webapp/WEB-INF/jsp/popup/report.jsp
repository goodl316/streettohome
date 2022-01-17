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
<title>신고하기</title>
</head>
<body>
	<div class="report-container">
		<div class="report-header">
			신고하기
		</div>
		<div class="report-body">
			<form action="/report">
				<div class="report-selectbox">
					<label><input type="radio" name="r_ctnt" value="1">부적절한 홍보 게시글</label>
					<label><input type="radio" name="r_ctnt" value="2">음란성 또는 청소년에게 부적합한 내용</label>
					<label><input type="radio" name="r_ctnt" value="3">명예훼손/사생활 침해 및 저작권침해등</label>
					<label><input type="radio" name="r_ctnt" value="4">허위 게시글</label>
					<label><input type="radio" name="r_ctnt" value="5">기타</label>
					<input type="text" name="r_ctnt" placeholder="기타" >
				</div>
				<div class="report-textbox">
					<input class="report-text" type="text" name="rp_ctnt" placeholder="기타 : " maxlength="20">
				</div>
			</form>
		</div>
		<div class="report-footer"></div>
	</div>
</body>
<script defer type="text/javascript" src="/js/board/report.js"></script>
</html>