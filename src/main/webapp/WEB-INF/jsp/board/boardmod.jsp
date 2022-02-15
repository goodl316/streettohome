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
	<link href="/css/board/boardMod.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="${param.b_no }" class="hidden_b_no">
<input type="hidden" value="${loginMember.m_no}" class="member_no">
	<h1 class="reg_title">게시글 작성</h1>
	<di
	v style="display: flex">
		<div style="width: 200px; height: 200px;">
		<label for="input_img">
		<img class="img_upload" src="/images/up_load_img.png" style="width: 100%; height: 100%;">
		</label>
		 <input id="input_img" name="input_img" type="file" multiple
			accept="image/*" onchange="previewImage(this,'View_area');"
			onclick="deleteImg();">
		</div>
		<span id='View_area'>
		</span>
	</div>
	<div class="select">
	<div class="up">
	<div class="up-name">
		<div class="nm_title">이름</div>
		<input type="text" id="an_name" placeholder="이름을 입력해 주세요" value="${data.an_name }">
	</div>
	<div class="up-type">
		<div class="type_title">품종</div>
		<div class="type2">
		<select name="an_type1" id="an_type1">
		<option class="op1" value="${data.an_type1 }">${data.an_type1}</option>
		<option  value="">-----</option>
		</select> 
		<select name="an_type2" id="an_type2">
		<option class="op2"value="${data.an_type2}">${data.an_type2}</option>
		<option  value="">-----</option>
		</select>
		</div>
	</div>
	<br>
	<div class="up-sido">
		<div class="loc_title">지역</div>
		<div class="sido2">
		<select name="sido1" id="sido1">
		<option>${data.b_loc_sido}</option>
		<option>-----</option>
		</select>
		<select name="gugun1" id="gugun1">
		<option>${data.b_loc_gugun }</option>
		<option>-----</option>
		</select>
		</div>
	</div>
	<div class="up-age">
		<div class="age_title">나이 </div>
		<input type="text" class="input_age" placeholder="반려동물 나이를 입력해 주세요" value="${data.an_age }">
	</div>
	</div>
	<div class="down">	
	<div class="dwon_tt">
	<div class="tt_title">분양방식 </div>
		<c:choose>
				<c:when test="${data.b_tt eq '무료'}">
					무료 <input type="radio"  value="무료" checked onclick="return(false)"/>
					유료 <input type="radio"  value="유료" onclick="return(false)"/> 
					경매 <input type="radio"  value="경매" onclick="return(false)"/>
				</c:when>
				<c:when test="${data.b_tt eq '유료'}">
					무료 <input type="radio" value="무료"  onclick="return(false)"/> 
					유료 <input type="radio"  value="유료" checked onclick="return(false)"/> 
					경매 <input type="radio"  value="경매" onclick="return(false)"/>
				</c:when>
				<c:when test="${data.b_tt eq '경매'}">
					무료 <input type="radio"  value="무료" onclick="return(false)"/> 
					유료 <input type="radio"  value="유료" onclick="return(false)"/>
					경매 <input type="radio"  value="경매" checked onclick="return(false)"/>
				</c:when>
			</c:choose>
	</div>
	
	<div class="down_gen">
		<div class="gender_title">성별</div>
		<c:choose>
				<c:when test="${data.an_gender eq '수컷'}">
				수컷 <input type="radio" id="gender" name="gender" value="수컷" checked />
				암컷 <input type="radio" id="gender" name="gender" value="암컷" />
				</c:when>
				<c:when test="${data.an_gender eq '암컷'}">
				수컷 <input type="radio" id="gender" name="gender" value="수컷" />
				암컷 <input type="radio" id="gender" name="gender" value="암컷" checked />
				</c:when>
			</c:choose>
	</div>
	
	<div class="down_ns">
		<div class="ns_title">중성화 여부</div>
		<c:choose>
				<c:when test="${data.an_ns eq 0 }">
					예 <input type="radio" id="b_ns" name="b_ns" value="0" checked />
					아니오 <input type="radio" id="b_ns" name="b_ns" value="1">
					모름 <input type="radio" id="b_ns" name="b_ns" value="2" />
				</c:when>
				<c:when test="${data.an_ns eq 1 }">
					예 <input type="radio" id="b_ns" name="b_ns" value="0"  />
					아니오 <input type="radio" id="b_ns" name="b_ns" value="1" />
					모름 <input type="radio" id="b_ns" name="b_ns" value="2" />
				</c:when>
				<c:when test="${data.an_ns eq 2 }">
					예 <input type="radio" id="b_ns" name="b_ns" value="0" />
					아니오 <input type="radio" id="b_ns" name="b_ns" value="1"/>
					모름 <input type="radio" id="b_ns" name="b_ns" value="2"/>
				</c:when>
		</c:choose>
	</div>
	<c:choose>
			<c:when test="${data.b_tt eq '무료' }">
				<div class="enddt_contain" style="display: none"></div>
				<div class="price_contain" style="display: none"></div>
			</c:when>
			<c:when test="${data.b_tt eq '유료' }">
				<div class="enddt_contain" style="display: none"></div>
				<div class="price_contain" style="display: block">
				<div class="price_text">가격</div> 
				<input type="text" class="input_price" value="${data.b_price}" placeholder="가격을 입력해 주세요">
				</div>
			</c:when>
	</c:choose>
	
	
	</div>
	</div>
	
	<div>
	<div></div> 
	
	<input type="text" class="input_title" placeholder="제목을 입력해 주세요" value="${data.b_title}">
	<div></div>
	<textarea class="input_ctnt" placeholder="내용을 입력해 주세요" value="${data.b_ctnt }"></textarea>
	</div>
	<div class="reg_con">
		<input class="modBtn" type="button" value="글수정" onclick="updBoard(${param.b_no})">
	</div>

</body>
</html>

<script type="text/javascript" src="/js/board/boardmod.js"></script>