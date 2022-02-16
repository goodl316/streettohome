<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/board/boardList.css">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${param.an_type1}" class="get_an_type1">
	<div class="container">
		<div class="type_title">
		<c:if test="${param.an_type1 eq null }">${param.type3 }를 집으로</c:if>
		<c:if test="${param.an_type1 != null }">${param.an_type1 }를 집으로</c:if>
		</div>
		<div class="select-list">
			<div class="div1st">
				<div class="loc">검색 지역</div>
				<div class="sidogun">
					<select name="sido1" id="sido1"></select> 
					<select name="gugun1"id="gugun1"></select>
				</div>
			</div>
			<div class="div2st">
				<div class="type">품종  </div>
				<div class="typ">
					<select name="an_type2" id="an_type2"></select>
				</div>
			</div>
			<div class="div3st">
				<div class="tt">분양방식</div>
				<select name="b_tt" id="b_tt">
					<option value="">선택</option>
					<option value="무료">무료</option>
					<option value="유료">유료</option>
					<option value="경매">경매</option>
				</select>
			</div>
			<div class="div4st">
				<div class="gen">성별  </div>
				<select name="an_gender" id="an_gender">
					<option value="">선택</option>
					<option value="수컷">수컷</option>
					<option value="암컷">암컷</option>
				</select>
			</div>
			<div class="div5st">
				<div class="pri">가격  </div>
				<select name="b_price" id="b_price">
					<option value="0">선택</option>
					<option value="1">0~50000</option>
					<option value="2">50000~200000</option>
					<option value="3">200000~500000</option>
					<option value="4">500000~</option>
				</select>
			</div>
			<button class="schBtn" onclick="clkvalue(); moveList()">검색</button>
		</div>
		<div class="chkLine"></div>
		<div style="position :relative">
		<button class="regBtn" onclick="regBoard()">글등록</button>
		</div>
		<div class="list_contain">
			<div class="list_group">
				<c:forEach var="list" items="${list}">
					<a href="/board/view?b_no=${list.b_no}">
						<div class="list_item">
							<div class="item_img">
								<img src="/img/board/an_${list.an_no}/${list.an_img}" onerror="this.src='/images/noimage.png'">
							</div>
							<div class="item_txt">
								<p>
									<span>[${list.an_type2}]</span> ${list.b_title}
								</p>
								<p><c:set var="TextValue" value="${list.b_dt}"/>${fn:substring(TextValue,0,10) }</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<c:set var="TextValue" value=""/>${fn:substring(TextValue,0,10) }
	<div class=pagination>
	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
	</div>




</body>
</html>
<script defer type="text/javascript" src='/js/board/boardList.js'>
	
</script>
