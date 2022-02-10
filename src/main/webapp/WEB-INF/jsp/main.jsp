<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/main/main.css">
<title>StreetToHome</title>
</head>
<body>
	<div class="mainContainer">
		<div class="banner">
			<ul class="slides">
			<li><img class="mainbanner"	src="/images/main.png"> </li>
				<c:forEach var="ba" items="${banner}" end="0">
					<li><img class="mainbanner"
					src="/img/banner/banner/${ba.ba_img1}"></li>
				</c:forEach>
			</ul>
			<p class="banner-controller">
				<span class="prev">&lang;</span> 
				<span class="next">&rang;</span>
			</p>
		</div>
		<div class="minaList">
			<h2>강아지를 집으로</h2>
			<div class="dogList">
				<c:forEach var="list" items="${list}" end="8">
					<c:if test="${list.an_type1 eq '강아지' }">
					<a href="/board/view?b_no=${list.b_no}">
						<div class="list_item">
							<div class="item_img">
								<img src="/img/board/an_${list.an_no}/${list.an_img}" onerror="this.src='/images/noimage.png'">
							</div>
							<div class="item_txt">
								<p>
									<span>[${list.an_type2}]</span> ${list.b_title}
								</p>
								<p>${list.b_dt}</p>
							</div>
						</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
			<h2>고양이를 집으로</h2>
			<div class="catList">
				<c:forEach var="list" items="${list}" end="8">
					<c:if test="${list.an_type1 eq '고양이' }">
					<a href="/board/view?b_no=${list.b_no}">
						<div class="list_item">
							<div class="item_img">
								<img src="/img/board/an_${list.an_no}/${list.an_img}">
							</div>
							<div class="item_txt">
								<p>
									<span>${list.an_type2 }</span>${list.b_title}
								</p>
								<p>${list.b_dt}</p>
							</div>
						</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>
