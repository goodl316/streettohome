var list_group = document.querySelector('.list_group');
const type1 = $('.get_an_type1').val();
console.log(type1)

function clkvalue(){
	var sido1 = document.querySelector('#sido1').value
	var gugun1 = document.querySelector('#gugun1').value
	var an_type2 = document.querySelector('#an_type2').value
	var b_tt = document.querySelector('#b_tt').value
	var an_gender = document.querySelector('#an_gender').value
	var b_price = document.querySelector('#b_price').value
	
	if(b_tt == "무료"){
		b_price = 0;
	}
	if(an_type2 == '품종선택'){
		an_type2 = ""
		console.log(an_type2)
	}
	console.log(sido1,gugun1,an_type2,b_tt,an_gender,b_price)
	
	
}

//==========================select box arr==============================================================================

var an_type0 =["품종 선택","강아지","고양이"]
	var an_type1 = ["품종선택","리트리버","말티즈","비숑프리제","삽살개","시바견","시츄","요크셔테리어","웰시코기","이탈리안그레이하운드","진돗개","치와와","퍼그","포메라니안","푸들","프렌치불독"];
	var an_type2 = ["품종선택",'러시안블루','먼치킨','뱅갈','스핑크스','샴','페르시안','터키시앙고라','코리안쇼트헤어','랙돌','아메리칸쇼트헤어','스코티시폴드','노르웨이숲고양이','아비시니안','브리티쇼트헤어	']
 

var sido0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
  var sido1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var sido2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var sido3 = ["대덕구","동구","서구","유성구","중구"];
   var sido4 = ["광산구","남구","동구","북구","서구"];
   var sido5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var sido6 = ["남구","동구","북구","중구","울주군"];
   var sido7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var sido8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var sido9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var sido10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var sido11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var sido12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var sido13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var sido14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var sido15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var sido16 = ["서귀포시","제주시","남제주군","북제주군"];

$("select[name^=sido]").each(function() {
  $selsido = $(this);
  $.each(eval(sido0), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
  $selsido.next().append("<option value=''>구/군 선택</option>");
 });

$("select[name^=sido]").change(function() {
  var area = "sido"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "sido0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });

if(type1 =='강아지'){
$("select[name^=an_type2]").each(function() {
  $selsido = $(this);
  $.each(eval(an_type1), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
	$selsido.next().append("<option value=''>품종 선택</option>");
 });
console.log(type1)
}else{
	console.log(type1)
	$("select[name^=an_type2]").each(function() {
  $selsido = $(this);
  $.each(eval(an_type2), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
	$selsido.next().append("<option value=''>품종 선택</option>");
 });
}

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


//=============================페이징 ===========================







  