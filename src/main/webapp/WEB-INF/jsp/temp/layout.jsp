<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/temp/layout.css">
<head>

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

