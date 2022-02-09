<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/admin/statistics.css">
<script src='http://code.jquery.com/jquery-latest.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
	<div class="statistics-container">
		<div class="statistics-board">
			<canvas id="chart-board"></canvas>
		</div>
		<div class="statistics-reply">
			<canvas id="chart-reply"></canvas>
		</div>
		<div class="statistics-tranhis">
			<canvas id="chart-tranhis"></canvas>
		</div>
		<div class="statistics-sales">
			<canvas id="chart-sales"></canvas>
		</div>
	</div>
</body>
<script defer src="/js/admin/statistics.js"></script>
</html>