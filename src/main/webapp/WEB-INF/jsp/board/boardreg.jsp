<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/board/boardReg.css" rel="stylesheet">
</head>
<body>
	<input type="hidden" value="${loginMember.m_no}" class="member_no">
	<h1 class="reg_title">게시글 작성</h1>
	<div style="display: flex">
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
		<input type="text" id="an_name" placeholder="이름을 입력해 주세요">
	</div>
	<div class="up-type">
		<div class="type_title">품종</div>
		<div class="type2">
		<select name="an_type1" id="an_type1"></select> <select
			name="an_type2" id="an_type2"></select>
		</div>
	</div>
	
	<br>
	<div class="up-sido">
		<div class="loc_title">지역</div>
		<div class="sido2">
		<select name="sido1" id="sido1"></select>
		<select name="gugun1" id="gugun1"></select>
		</div>
	</div>
	<div class="up-age">
		<div class="age_title">나이 </div>
		<input type="text" class="input_age" placeholder="반려동물 나이를 입력해 주세요">
	</div>
	</div>
	<div class="down">	
	<div class="dwon_tt">
	<div class="tt_title">분양방식 </div>
		무료 <input type="radio" name="tradetype" value="무료" checked />
		유료 <input type="radio" name="tradetype" value="유료" />
		경매 <input type="radio"name="tradetype" value="경매" />
	</div>
	
	<div class="down_gen">
		<div class="gender_title">성별</div>
		수컷 <input type="radio" id="gender" name="gender" value="수컷" checked />
		암컷 <input type="radio" id="gender" name="gender" value="암컷" />
	</div>
	
	<div class="down_ns">
		<div class="ns_title">중성화 여부</div>
		예 <input type="radio" id="b_ns" name="b_ns" value="0" checked /> 아니오
		<input type="radio" id="b_ns" name="b_ns" value="1" /> 모름 <input
			type="radio" id="b_ns" name="b_ns" value="2" />
	</div>
	<div class="enddt_contain" style="display: none"></div>
	<div class="price_contain" style="display: none"></div>
	
	</div>
	</div>
	
	<div>
	<div></div> 
	
	<input type="text" class="input_title" placeholder="제목을 입력해 주세요">
	<div></div>
	<textarea class="input_ctnt" placeholder="내용을 입력해 주세요"></textarea>
	</div>
	<div class="reg_con">
	<input  class="regBtn"type="button" value="글등록" onclick="boardReg()">
	</div>
	
</body>
</html>
<script defer type="text/javascript" src='/js/board/boardreg.js'>
	
</script>