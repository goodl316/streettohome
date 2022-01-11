var input_title = document.querySelector(".input_title")
var input_ctnt = document.querySelector('.input_ctnt')
var input_price = document.querySelector('.input_price')
var input_age = document.querySelector('.input_age')
var getloc = document.querySelector('#loc')
/*var tradetype = document.getElementByName('tradetype')*/
var btype = document.getElementsByName('btype')
var inputImgElem = document.querySelector('#inputImg')



function clk() {
	var title = document.querySelector(".input_title").value
	var ctnt = document.querySelector('.input_ctnt').value
	var price = document.querySelector('.input_price').value
	var age = document.querySelector('.input_age').value
	var btype = document.getElementsByName('btype')
	var b_tt = document.getElementsByName('tradetype')
	var getloc = document.querySelector('#loc').value
	var gender = document.getElementsByName('gender')
	var btype_value = 0;
	var gender_value = "";
	var b_tt_value = "";
	console.log(gender.length)
	for (i = 0; i < btype.length; i++) {
		if (btype[i].checked == true) {
			btype_value = btype[i].value
			console.log(btype_value)
		}
	}
	for (i = 0; i < gender.length; i++) {
		if (gender[i].checked == true) {
			gender_value = gender[i].value
			console.log(gender_value)
		}
	}
	for (i = 0; i < b_tt.length; i++) {
		if (b_tt[i].checked == true) {
			b_tt_value = b_tt[i].value
			console.log(b_tt_value)
		}
	}

	params = {
		b_title: title,
		b_ctnt: ctnt,
		b_price: price,
		b_age: age,
		b_btype: btype_value,
		b_gender: gender_value,
		b_loc: getloc,
		b_tt: b_tt_value

	}

	console.log(params)

}


function product_img_upload(b_no) {
	var formData = new FormData()

	for (var i = 0; i < input_img.files.length; i++) {
		console.log(input_img.files[i])
		formData.append('imgs', input_img.files[i])
		for (var key of formData.keys()) {
			console.log(key);
		}
		for (var value of formData.values()) {
			console.log(value);
		}
	}
	formData.append('b_no', b_no) // 추가
	$.ajax({
		method: "POST",
		url: '/updpatImg',
		data: formData,
		processData: false,
		contentType: false,
		cache: false,
		success: function() {
			console.log("success")
		}
	})
}



function boardReg() {
	var title = document.querySelector(".input_title").value
	var ctnt = document.querySelector('.input_ctnt').value
	var price = document.querySelector('.input_price').value
	var age = document.querySelector('.input_age').value
	var btype = document.getElementsByName('btype')
	var b_tt = document.getElementsByName('tradetype')
	var getloc = document.querySelector('#loc').value
	var gender = document.getElementsByName('gender')
	var btype_value = 0;
	var gender_value = "";
	var b_tt_value = "";
	console.log(gender.length)
	for (i = 0; i < btype.length; i++) {
		if (btype[i].checked == true) {
			btype_value = btype[i].value
			console.log(btype_value)
		}
	}
	for (i = 0; i < gender.length; i++) {
		if (gender[i].checked == true) {
			gender_value = gender[i].value
			console.log(gender_value)
		}
	}
	for (i = 0; i < b_tt.length; i++) {
		if (b_tt[i].checked == true) {
			b_tt_value = b_tt[i].value
			console.log(b_tt_value)
		}
	}

	params = {
		b_title: title,
		b_ctnt: ctnt,
		b_price: price,
		b_age: age,
		b_type: btype_value,
		b_gender: gender_value,
		b_loc: getloc,
		b_tt: b_tt_value

	}

	regAjax(params)

}

function Ajax(params) {
	$.ajax({
		type: "POST",
		data: JSON.stringify(params),
		url: "/board/test/",
		contentType: "application/json",
		success: function(data) {
			console.log(data)
		},
		error: alert("fail")
	}

	)
}



function regAjax(params) {
	$.ajax({
		method: 'POST',
		url: '/board/insboard',
		data: JSON.stringify(params),
		dataType: "json",
		contentType: "application/json",
		success: function(data) {
			console.log(data)
			console.log(data.b_no)
			product_img_upload(data.b_no)
		}
	})

}

function setThumbnail(event) {
	for (var image of event.target.files) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img);
		}; 
		console.log(image); 
		reader.readAsDataURL(image);
	}
}


$('input[type=radio][name=tradetype]]').onclick(function(){
	console.log($(this).val)
})






















//----------------------------------------------지역 나누기 아직 미구현 ---------------------------------------------------------------------
function changes1Step(fr) {
	if (fr == "서울") {
		num = new Array("선택해주세요", "강남구", "강동구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구",
			"서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구")
		vnum = new Array("선택해주세요", "강남구", "강동구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구",
			"서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구")
	} else if (fr == "경기도") {
		num = new Array("--2단계--", "무기", "방어구", "장신구", "잡화", "합성석");
		vnum = new Array("--2단계--", "무기", "방어구", "장신구", "잡화", "합성석");
	}

	for (i = 0; i < form.Step2.length; i++) {
		form.Step2.options[i] = null;
	}

	for (i = 0; i < form.Step3.length; i++) {
		form.Step3.options[i] = null;
	}
	form.Step3.options[0] = new Option("--3단계--", "--3단계--");
	for (i = 0; i < num.length; i++) {
		form.Step2.options[i] = new Option(num[i], vnum[i]);
	}
}
aa = new Array("cdcd", "cdcd", "cdcd", "cdcdc", "cdcdcd");

function changes2Step(fr) {
	//용병 선택
	if (fr == "소드맨") {
		num = new Array("--3단계--", "버서커", "팔라딘");
		vnum = new Array("--3단계--", "버서커", "팔라딘");
	} else if (fr == "아처") {
		num = new Array("--3단계--", "헌터", "레인저");
		vnum = new Array("--3단계--", "헌터", "레인저");
	} else if (fr == "매지션") {
		num = new Array("--3단계--", "소서러", "위자드");
		vnum = new Array("--3단계--", "소서러", "위자드");
	}
	//아이템 선택
	else if (fr == "무기") {
		num = new Array("--3단계--", "검", "활", "지팡이");
		vnum = new Array("--3단계--", "검", "활", "지팡이");
	} else if (fr == "방어구") {
		num = new Array("--3단계--", "갑옷", "투구", "장갑", "신발");
		vnum = new Array("--3단계--", "갑옷", "투구", "장갑", "신발");
	} else if (fr == "장신구") {
		num = new Array("--3단계--", "반지", "목걸이");
		vnum = new Array("--3단계--", "반지", "목걸이");
	} else if (fr == "잡화") {
		num = new Array("--3단계--", "");
		vnum = new Array("--3단계--", "");
	} else if (fr == "합정석") {
		num = new Array("--3단계--", "");
		vnum = new Array("--3단계--", "");
	} else {
		num = new Array("--3단계--");
		vnum = new Array("--3단계--");
	}

	for (i = 0; i < form.Step3.length; i++) {
		form.Step3.options[i] = null;
	}
	for (i = 0; i < num.length; i++) {
		form.Step3.options[i] = new Option(num[i], vnum[i]);
	}
}
