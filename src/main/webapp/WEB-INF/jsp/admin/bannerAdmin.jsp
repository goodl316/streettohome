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
<link rel="stylesheet" href="/css/admin/banner.css">
</head>
<body>
	<div>
		<h1>배너 관리</h1>
	</div>
	<div class="viewcontainer">
		<div >
			<div style="width: 200px; height: 200px;">
				<label for="input_img"> <img class="img_upload"
					src="/images/up_load_img.png" style="width: 100%; height: 100%;">
				</label>
				<input id="input_img" name="input_img" type="file" multiple
					accept="image/*" onchange="previewImage(this,'View_area');"
					onclick="deleteImg(); fileRemove2();">
			</div>
			<div style="display: flex;">
			<span id='View_area'
				style='position: relative; color: black; border: 0px solid black;'>
			</span>
			</div>
			<button class="img_btn"onclick="updimg()">등록</button>
		</div>
	</div>
</body>

</html>
<script type="text/javascript" src="/js/admin/bannerAdmin.js"></script>