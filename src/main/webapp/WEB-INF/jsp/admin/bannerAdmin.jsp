<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<body>
<div class="viewcontainer">
<span id='View_area1' style='position:relative; color: black; border: 0px solid black;'> </span>
1 : <input id="input_img1" name="input_img" type="file" multiple accept="image/*"
		onchange="previewImage(this,'View_area1');" onclick="deleteImg(1); fileRemove2();" >
<span id='View_area2' style='position:relative; color: black; border: 0px solid black;'> </span>
2 : <input id="input_img2" name="input_img" type="file" multiple accept="image/*"
		onchange="previewImage(this,'View_area2');" onclick="deleteImg(2); fileRemove2();" >
<span id='View_area3' style='position:relative; color: black; border: 0px solid black;'> </span>
3 : <input id="input_img3" name="input_img" type="file" multiple accept="image/*"
		onchange="previewImage(this,'View_area3');" onclick="deleteImg(3); fileRemove2();" >
<span id='View_area4' style='position:relative; color: black; border: 0px solid black;'> </span>
4 : <input id="input_img4" name="input_img" type="file" multiple accept="image/*"
		onchange="previewImage(this,'View_area4');" onclick="deleteImg(4); fileRemove2();" >
<span id='View_area5' style='position:relative; color: black; border: 0px solid black;'> </span>
5 : <input id="input_img5" name="input_img" type="file" multiple accept="image/*"
		onchange="previewImage(this,'View_area5');" onclick="deleteImg(5); fileRemove2();" >
</div>
</body>

</html>
 <script  type="text/javascript" src="/js/admin/bannerAdmin.js"></script>