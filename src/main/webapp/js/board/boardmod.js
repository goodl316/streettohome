var img_list = document.querySelector('.get_img_list')
var View_area = document.querySelector('#View_area')
var b_no = document.querySelector('.hidden_b_no').value
var formData = new FormData();
var fileArr;
var fileInfoArr = [];
var fullName = [];
function clk() {
	var title = document.querySelector(".input_title").value
	var ctnt = document.querySelector('.input_ctnt').value
	var price = document.querySelector('.input_price')
	var age = document.querySelector('.input_age').value
	var an_type1 = document.querySelector('#an_type1').value
	var an_type2 = document.querySelector('#an_type2').value
	var b_tt = document.getElementsByName('tradetype')
	var gender = document.getElementsByName('gender')
	var an_ns = document.getElementsByName('b_ns')
	var sido = document.querySelector('#sido1').value
	var gun = document.querySelector('#gugun1').value
	var an_name = document.querySelector('#an_name').value
	var gender_value = "";
	var b_tt_value = "";
	var b_ns_value = 0;
	if (price) {
		price = document.querySelector('.input_price').value
	} else {
		price = 0;
	}
	
	for (i = 0; i < gender.length; i++) {
		if (gender[i].checked == true) {
			gender_value = gender[i].value
		}
	}
	for (i = 0; i < b_tt.length; i++) {
		if (b_tt[i].checked == true) {
			b_tt_value = b_tt[i].value
		}
	}
	
	for (i = 0; i < b_ns.length; i++) {
		if (an_ns[i].checked == true) {
			b_ns_value = an_ns[i].value
		}
	}

	params = {
		b_title: title,
		b_ctnt: ctnt,
		b_price: price,
		an_age: age,
		an_gender: gender_value,
		b_loc_sido: sido,
		b_loc_gugun: gun,
		b_tt: b_tt_value,
		an_ns: b_ns_value,
		an_type1: an_type1,
		an_type2: an_type2,
		an_name: an_name

	}


}


if(View_area){
	getImgList(b_no)
}

function getImgList(b_no){
	fetch(`/board/boardmodImg?b_no=${b_no}`)
	.then(function(res){
		return res.json()
	}).then((list)=>{
		View_area.innerHTML = ""
		proc(b_no,list)
	})
	
}

function proc(b_no,list){
	if(list.length ==0){
		return
	}
	
	for( var i=0; i<list.length; i++){
		var recode = createRecode(b_no,list[i],i)
		View_area.append(recode)
	}
	
	
}

function updBoard(b_no){
	var title = document.querySelector(".input_title").value
	var ctnt = document.querySelector('.input_ctnt').value
	var price = document.querySelector('.input_price')
	var age = document.querySelector('.input_age').value
	var an_type1 = document.querySelector('#an_type1').value
	var an_type2 = document.querySelector('#an_type2').value
	var b_tt = document.getElementsByName('tradetype')
	var gender = document.getElementsByName('gender')
	var an_ns = document.getElementsByName('b_ns')
	var sido = document.querySelector('#sido1').value
	var gun = document.querySelector('#gugun1').value
	var an_name = document.querySelector('#an_name').value
	var gender_value = "";
	var b_tt_value = "";
	var b_ns_value = 0;
	if (price) {
		price = document.querySelector('.input_price').value
	} else {
		price = 0;
	}
	
	for (i = 0; i < gender.length; i++) {
		if (gender[i].checked == true) {
			gender_value = gender[i].value
		}
	}
	for (i = 0; i < b_tt.length; i++) {
		if (b_tt[i].checked == true) {
			b_tt_value = b_tt[i].value
		}
	}
	
	for (i = 0; i < b_ns.length; i++) {
		if (an_ns[i].checked == true) {
			b_ns_value = an_ns[i].value
		}
	}

	params = {
		b_title: title,
		b_ctnt: ctnt,
		b_price: price,
		an_age: age,
		an_gender: gender_value,
		b_loc_sido: sido,
		b_loc_gugun: gun,
		b_tt: b_tt_value,
		an_ns: b_ns_value,
		an_type1: an_type1,
		an_type2: an_type2,
		an_name: an_name,
		b_no:b_no

	}
		
			
	fetch(`/board/updboard`,{
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(params)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		product_img_upload(data.b_no)
	})
}





function product_img_upload(an_no) {
	
	
	formData.append('an_no', an_no) // 추가
	$.ajax({
		method: "POST",
		url: '/updpatImg',
		data: formData,
		processData: false,
		contentType: false,
		cache: false,
		success: function() {
		}
	})
}




function createRecode(b_no,item,i){
	const search = item.indexOf('.')
	const name = item.substr(0,search)
	
	var span = document.createElement('span')
	span.id='img_id_'+name
	span.innerHTML=
	`
	
	<img src="/img/board/an_${b_no}/${item}" onclick="fileRemove2('${name}','${item}')" width="200px" height="200px">
	
	`
	fileInfoArr.push(item)
	fullName.push(item)
	
	return span
	
}

function deleteImg(){
	
	$('#input_img').val("");
}

function fileRemove2(name,item){
	var b_no = document.querySelector('.hidden_b_no').value
	
	var imgId = "#img_id_"+name
	$(imgId).remove()
	
	var params = {
		b_no : b_no,
		chkImg: item
		
	}
	
	fetch(`/delete/img`,{
		method:'post',
		headers : {
			"Content-Type" : "application/json"
		},
		body:JSON.stringify(params)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		if(data == 1){
		}
	})
	
}

function fileRemove(fileNm) {
	
	
	fileInfoArr.splice(fileNm, 1);
	

	var imgId = "#img_id_"+fileNm;
	var test = document.querySelector(''+imgId)
	$(imgId).remove();
	formData.delete('imgs');
	
	for (var i = 0; i < fileInfoArr.length; i++) {
		if(fileInfoArr.length>0){
		formData.append('imgs', fileInfoArr[i])
		}
	}

}

function previewImage(targetObj, View_area) {
	var files = targetObj.files;
	fileArr=Array.prototype.slice.call(files);


	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;



	var files = targetObj.files;
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
		const fileNm= file.name
		const search = fileNm.indexOf('.')
		const orginNm = fileNm.substr(0,search)
		
		span.id = "img_id_" + orginNm;
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
		img.onclick = ()=>fileRemove(orginNm);   //이미지를 클릭했을 때.
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
	
	if(document.querySelector('#input_img') == input_img){
	}
	
		
	for (var i = 0; i < input_img.files.length; i++) {
		if(input_img.files.length>0){
			
		formData.append('imgs', input_img.files[i])
		}
	}

}

$(document).ready(function() {

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
	var area1 = []
	var area2 = []
  	var area3 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
    var area4= ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
    var area5 = ["대덕구","동구","서구","유성구","중구"];
    var area6 = ["광산구","남구","동구",     "북구","서구"];
    var area7 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
    var area8 = ["남구","동구","북구","중구","울주군"];
    var area9 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
    var area10 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
    var area11 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
    var area12 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
    var area13 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
    var area14 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
    var area15 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
    var area16 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
    var area17 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
    var area18 = ["서귀포시","제주시","남제주군","북제주군"];
	
	var an_type0 =["품종 선택","강아지","고양이"]
	var an_type1 = []
	var an_type2 = []
	var an_type3 = ["리트리버","말티즈","비숑프리제","삽살개","시바견","시츄","요크셔테리어","웰시코기","이탈리안그레이하운드","진돗개","치와와","퍼그","포메라니안","푸들","프렌치불독"];
	var an_type4 = ['러시안블루',"페르시안","벵골","브리티시쇼트헤어","시암고양이","스핑크스","래그돌","먼치킨","엑조틱쇼트헤어","노르웨이숲고양이","사바나","시베리안 고양이"]
 

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



$("select[name^=an_type1]").each(function() {
  $selsido = $(this);
  $.each(eval(an_type0), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
	$selsido.next().append("<option value=''>품종 선택</option>");
 });

$("select[name^=an_type1]").change(function() {
  var area = "an_type"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "an_type0")
   $gugun.append("<option value=''>품종 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });
	



	



});
