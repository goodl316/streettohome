<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/temp/layout.css">
<head>
<title>Street To Home</title>
</head>
<body>
	<div class="page-header">
		<tiles:insertAttribute name="header" />
	</div>
	<section>
		<div class="page-body">
			<tiles:insertAttribute name="body" />		
		</div>
	</section>
	<div class="page-footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>

