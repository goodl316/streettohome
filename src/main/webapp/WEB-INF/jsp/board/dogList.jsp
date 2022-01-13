<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	
	지역<select name="sido1" id="sido1"></select>
	<select name="gugun1" id="gugun1"></select>
	품종<select name="b_type" id="b_type"></select>
	유료/뮤료<select name="b_tt" id="b_tt">
	<option value="">선택</option>
	<option value="무료">무료</option>
	<option value="유료">유료</option>
	<option value="경매">경매</option>
	</select>
	성별<select name="b_gender" id="b_gender">
	<option value="">선택</option>
	<option value="수컷">수컷</option>
	<option value="암컷">암컷</option>
	</select>
	가격<select name="b_price" id="b_price">
	<option value="">선택</option>
	<option value= 50000>0~50000</option>
	<option value=200000>50000~200000</option>
	<option value=500000>200000~500000</option>
	<option value=500000>500000~</option>
	</select>
	
	검색할 키워드<input type="text" class="searchText" value="">
	<button onclick="clkvalue(); getList()">검색</button>
	<br>

	<%-- <input type="hidden" class="getbtype" value="${param.b_type}"> --%>

	<h2>안녕하세요</h2>

	<%-- <c:forEach var="list" items="${list}">
		<div>${list.b_title }</div>
		<br>
		<img src="/img/board/b_${list.b_no}/${list.b_img}">
		<div>${list.b_dt}</div>
		<div>${list.b_state }</div>
		<br>
	</c:forEach> --%>
</body>
</html>
<script defer type="text/javascript" src='/js/board/boardList.js?ver=2'>
	
</script>
