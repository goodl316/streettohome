<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/main/main.css">
<script src="/js/main/main.js"></script>
<title>StreetToHome</title>
</head>
<body>
	<div class="mainContainer">
		
		<div class="slideshow-container">
			<c:forEach var="ba" items="${banner}" end="0">
				<c:if test="${ba.ba_img !='' and ba.ba_img != null}">
			 		<div class="mySlideDiv fade active">
       			 		<img class="mainbanner" src="/img/banner/banner/${ba.ba_img}">
     				</div>
		   		</c:if>
			</c:forEach>
			<c:forEach var="ba" items="${banner}" begin="1">
				<c:if test="${ba.ba_img !='' and ba.ba_img != null}">
					<div class="mySlideDiv fade">
         				<img class="mainbanner" src="/img/banner/banner/${ba.ba_img}">
     				</div>
     			</c:if>
			</c:forEach>
			<a class="prev" onclick="prevSlide()">&#10094;</a>
			<a class="next" onclick="nextSlide()">&#10095;</a>

		</div>


		<div class="mainList">
			<h2>강아지를 집으로</h2>
			<div class="dogList">
				<c:forEach var="dogList" items="${dogList}">
						<a href="/board/view?b_no=${dogList.b_no}">
							<div class="list_item">
								<div class="item_img">
									<img src="/img/board/an_${dogList.an_no}/${dogList.an_img}"
										onerror="this.src='/images/noimage.png'">
								</div>
								<div class="item_txt">
									<p>
										<span>[${dogList.an_type2}]</span> ${dogList.b_title}
									</p>
									<p><c:set var="TextValue" value="${dogList.b_dt}"/>${fn:substring(TextValue,0,10) }</p>
								</div>
							</div>
						</a>
				</c:forEach>
			</div>
			<h2>고양이를 집으로</h2>
			<div class="catList">
				<c:forEach var="catList" items="${catList}">
						<a href="/board/view?b_no=${catList.b_no}">
							<div class="list_item">
								<div class="item_img">
									<img src="/img/board/an_${catList.an_no}/${catList.an_img}">
								</div>
								<div class="item_txt">
									<p>
										<span>[${catList.an_type2 }] </span>${catList.b_title}
									</p>
									<p><c:set var="TextValue" value="${catList.b_dt}"/>${fn:substring(TextValue,0,10) }</p>
								</div>
							</div>
						</a>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>
