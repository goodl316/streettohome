<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<div id="container">
		<tiles:insertAttribute name="header" />
		<section>
			<tiles:insertAttribute name="content" />		
		</section>		
	</div>
</body>
</html>

