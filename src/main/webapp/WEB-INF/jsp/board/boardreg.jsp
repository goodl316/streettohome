<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	제목 :
	<input type="text" class="input_title" placeholder="제목을 입력해 주세요" >
	<br> 내용 :
	<textarea class="input_ctnt" placeholder="내용을 입력해 주세요"></textarea>
	<br> 이름 :
	<input type="text" id="an_name" placeholder="이름을 입력해 주세요">
	<br> 품종 : 
	<select name="an_type1" id="an_type1"></select>
	<select name="an_type2" id="an_type2"></select><br>
	<div class="price_contain"></div>
	<br>
	<input id="input_img" name="input_img" type="file" multiple accept="image/*"
		onchange="previewImage(this,'View_area');" onclick="deleteImg();" >
	<br>
	<span id='View_area' style='position:relative; color: black; border: 0px solid black;'> </span>

	<input type="button" onclick="product_img_upload(0)" value="확인작업">
	<select name="sido1" id="sido1"></select>
	<select name="gugun1" id="gugun1"></select><br>
	
	<div id="image_container"></div><br>
	
	<input type="text" class="input_age" placeholder="반려동물 나이를 입력해 주세요">
	<form name="trade type">
		<fieldset>
			<legend>분양방식</legend>
			무료 <input type="radio" name="tradetype" value="무료" checked /> 유료 <input
				type="radio" name="tradetype" value="유료" /> 경매 <input type="radio"
				name="tradetype" value="경매" />
		</fieldset>
	</form>
	<form name="gender">
		<fieldset>
			<legend>성별</legend>
			수컷 <input type="radio" id="gender" name="gender" value="수컷" checked />
			암컷 <input type="radio" id="gender" name="gender" value="암컷" />
		</fieldset>
	</form>
	<form name="ns">
		<fieldset>
			<legend>중성화 여부</legend>
			예 <input type="radio" id="b_ns" name="b_ns" value="0" checked />
			아니오 <input type="radio" id="b_ns" name="b_ns" value="1" />
			모름 <input type="radio" id="b_ns" name="b_ns" value="2" />
		</fieldset>
	</form>

	
	<input type="button" value="확인" onclick="clk()">
	<input type="button" value="글등록" onclick="boardReg()">

</body>
</html>
<script defer type="text/javascript" src='/js/board/boardreg.js?ver=2'>
	
</script>