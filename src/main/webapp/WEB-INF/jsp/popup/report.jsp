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
				<div class="report-checkbox">
					
				</div>
				<div class="report-textbox">
					<input type="text" name="rp_ctnt" placeholder="기타 : ">
				</div>
			</form>
		</div>
		<div class="report-footer"></div>
	</div>
</body>
</html>