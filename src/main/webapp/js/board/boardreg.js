var input_title = document.querySelector(".input_title")
var input_ctnt = document.querySelector('.input_ctnt')
var input_price = document.querySelector('.input_price')
var input_age = document.querySelector('.input_age')
var getloc = document.querySelector('#loc')
var btype = document.getElementsByName('btype')
var inputImgElem = document.querySelector('#inputImg')
var formData = new FormData();
var fileArr;
var fileInfoArr = [];

function clk() {
	var title = document.querySelector(".input_title").value
	var ctnt = document.querySelector('.input_ctnt').value
	var price = document.querySelector('.input_price')
	var age = document.querySelector('.input_age').value
	var btype = document.getElementsByName('btype')
	var b_tt = document.getElementsByName('tradetype')
	var gender = document.getElementsByName('gender')
	var b_ns = document.getElementsByName('b_ns')
	var sido = document.querySelector('#sido1').value
	var gun = document.querySelector('#gugun1').value
	var btype_value = 0;
	var gender_value = "";
	var b_tt_value = "";
	var b_ns_value = 0;
	if (price) {
		price = document.querySelector('.input_price').value
	} else {
		price = 0;
	}
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
	
	for (i = 0; i < b_ns.length; i++) {
		if (b_ns[i].checked == true) {
			b_ns_value = b_ns[i].value
			console.log(b_ns_value)
		}
	}

	params = {
		b_title: title,
		b_ctnt: ctnt,
		b_price: price,
		b_age: age,
		b_btype: btype_value,
		b_gender: gender_value,
		b_loc1: sido,
		b_loc2: gun,
		b_tt: b_tt_value,
		b_ns: b_ns_value

	}

	console.log(params)

}



function product_img_upload(b_no) {
	
	console.log(formData.getAll("imgs"))
	
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
	var price = document.querySelector('.input_price')
	var age = document.querySelector('.input_age').value
	var btype = document.getElementsByName('btype')
	var b_tt = document.getElementsByName('tradetype')
	var gender = document.getElementsByName('gender')
	var b_ns = document.getElementsByName('b_ns')
	var sido = document.querySelector('#sido1').value
	var gun = document.querySelector('#gugun1').value
	var btype_value = 0;
	var gender_value = "";
	var b_tt_value = "";
	var b_ns_value = 0;
	if (price) {
		price = document.querySelector('.input_price').value
	} else {
		price = 0;
	}
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
	
	for (i = 0; i < b_ns.length; i++) {
		if (b_ns[i].checked == true) {
			b_ns_value = b_ns[i].value
			console.log(b_ns_value)
		}
	}

	params = {
		b_title: title,
		b_ctnt: ctnt,
		b_price: price,
		b_age: age,
		b_type: btype_value,
		b_gender: gender_value,
		b_loc_sido: sido,
		b_loc_gugun: gun,
		b_tt: b_tt_value,
		b_ns: b_ns_value

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








$(document).ready(function() {
	console.log("ready!");

	$('input[type=radio][name=tradetype]').click(function() {

		var price_contain = document.querySelector('.price_contain')

		val = $(this).val()
		if (val == "무료") {
			price_contain.innerHTML = ""
		} else if (val == "유료") {
			price_contain.style.display = "block"
			price_contain.innerHTML = `
		가격 : <input type="text" class="input_price" placeholder="격을 입력해 주세요"><br>
		`
		} else if (val == "경매") {
			price_contain.style.display = "block"
			price_contain.innerHTML = `
		시작 가격 : <input type="text" class="input_price" placeholder="시작 가격을 입력해 주세요"><br>
		`
		}

	})
	
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구",     "북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 

 // 시/도 선택 박스 초기화

 $("select[name^=sido]").each(function() {
  $selsido = $(this);
  $.each(eval(area0), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
  $selsido.next().append("<option value=''>구/군 선택</option>");
 });

 

 // 시/도 선택시 구/군 설정

 $("select[name^=sido]").change(function() {
  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "area0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });

	



	



});







//썸네일 클릭시 삭제.
function fileRemove(index,fileNm) {
	console.log("index: "+index);
	console.log("fileNm: "+fileNm)
	
	fileInfoArr.splice(fileNm, 1);
	

	var imgId = "#img_id_"+index;
	console.log(imgId)
	console.log(">>>>>>>>>>>>>>>>>>>>>>>")
	$(imgId).remove();
	console.log(fileInfoArr);
	formData.delete('imgs');
	
	console.log("delete after1"+formData.getAll("imgs"))
	console.log("/////////////////////////////////////")
	for (var i = 0; i < fileInfoArr.length; i++) {
		if(fileInfoArr.length>0){
		formData.append('imgs', fileInfoArr[i])
		console.log("bugggggggggggg")
		}
	}
	console.log("delete after2"+formData.getAll('imgs'))

}

function deleteImg(){
	$('#input_img').val("");
	console.log("///")
}

//썸네일 미리보기.
function previewImage(targetObj, View_area) {
	var files = targetObj.files;
	fileArr=Array.prototype.slice.call(files);


	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;



	var files = targetObj.files;
	console.log("improt"+files.length)
	for (var i = 0; i < files.length; i++) {
		var file = files[i];
		fileInfoArr.push(file);
            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
			continue;
		// var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
		// if (prevImg) {
		//     preview.removeChild(prevImg);
		// }

		var span = document.createElement('span');
		span.id = "img_id_" + i;
		span.style.width = '100px';
		span.style.height = '100px';
		preview.appendChild(span);

		var img = document.createElement("img");
		img.className = "addImg";
		img.classList.add("obj");
		img.file = file;
		img.style.width = 'inherit';
		img.style.height = 'inherit';
		img.style.cursor = 'pointer';
		const idx = i;
		const fileNm= file.name
		img.onclick = () => fileRemove(idx,fileNm);   //이미지를 클릭했을 때.
		span.appendChild(img);

		if (window.FileReader) { // FireFox, Chrome, Opera 확인.
			var reader = new FileReader();
			reader.onloadend = (function(aImg) {
				return function(e) {
					aImg.src = e.target.result;
				};
			})(img);
			reader.readAsDataURL(file);
		} else { // safari is not supported FileReader
			//alert('not supported FileReader');
			if (!document.getElementById("sfr_preview_error_"
				+ View_area)) {
				var info = document.createElement("p");
				info.id = "sfr_preview_error_" + View_area;
				info.innerHTML = "not supported FileReader";
				preview.insertBefore(info, null);
			}
		}
	}
	
	
	for (var i = 0; i < input_img.files.length; i++) {
		if(input_img.files.length>0){
			
		formData.append('imgs', input_img.files[i])
		console.log(input_img.files[i].name)
		}
	}
	console.log(formData.getAll('imgs'))

}



