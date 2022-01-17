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
	<div>
		<div class="type_title">강아지를 안다</div>
		<div>
			검색 지역<select name="sido1" id="sido1"></select> <select name="gugun1"
				id="gugun1"></select> 품종<select name="an_type1" id="an_type1"></select>
			<select name="an_type2" id="an_type2"></select> 유료/뮤료<select
				name="b_tt" id="b_tt">
				<option value="">선택</option>
				<option value="무료">무료</option>
				<option value="유료">유료</option>
				<option value="경매">경매</option>
			</select> 성별<select name="an_gender" id="an_gender">
				<option value="">선택</option>
				<option value="수컷">수컷</option>
				<option value="암컷">암컷</option>
			</select> 가격<select name="b_price" id="b_price">
				<option value="">선택</option>
				<option value=50000>0~50000</option>
				<option value=200000>50000~200000</option>
				<option value=500000>200000~500000</option>
				<option value=500000>500000~</option>
			</select> 검색할 키워드<input type="text" class="searchText" value="">
			<button onclick="clkvalue(); moveList()">검색</button>
			<br>


		</div>

		<div class="list_contain">
			<div class="list_group">
				<c:forEach var="list" items="${list}">
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
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="selectPage">
		<c:if test="${paging.startPage != 1 }">
			<a
				onclick="movePage(${paging.startPage},${paging.cntPerPage},'${param.an_type1}')">${p }</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p}</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a
						onclick="movePage1(${p},${paging.cntPerPage},'${param.an_type1}')">${p}</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				onclick="movePage2(${paging.endPage},${paging.cntPerPage},'${param.an_type1}')">&gt;</a>
		</c:if>

	</div>

	<ul id="pagingul">
	</ul>

	<button onclick="paging(20,1,5)">페이징 확인</button>



</body>
</html>
<script defer type="text/javascript" src='/js/board/boardList.js?ver=2'>
	
</script>
