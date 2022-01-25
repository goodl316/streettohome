var fileArr;
var fileInfoArr = [];
var fullName = [];
var formData = new FormData();

function fileRemove2(name,item,ba_no){
	
	var imgId = "#img_id_"+name
	$(imgId).remove()
	
	var params = {
		ba_no : ba_no,
		chkImg: item
		
	}
	console.log(params)
	
	fetch(`/admin/delimg`,{
		method:'post',
		headers : {
			"Content-Type" : "application/json"
		},
		body:JSON.stringify(params)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		if(data == 1){
			console.log("sucess")
		}
	})
	
}

function fileRemove(fileNm) {
	console.log("fileNm: "+fileNm)
	
	
	fileInfoArr.splice(fileNm, 1);
	

	var imgId = "#img_id_"+fileNm;
	var test = document.querySelector(''+imgId)
	console.log(test)
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
	
	
		
	for (var i = 0; i < input_img.files.length; i++) {
		if(input_img.files.length>0){
			
		formData.append('imgs', input_img.files[i])
		//console.log(input_img.files[i].name)
		}
	}
	

}


function updimg() {
	console.log(formData.getAll('imgs'))
	
	$.ajax({
		method: "POST",
		url: "/admin/insbanner",
		data: formData,
		processData: false,
		contentType: false,
		cache: false,
		success: function(){
			console.log("success")
		}
	}
	)
}

if(View_area){
	console.log("asdasd")
	getImgList()
}

function getImgList(){
	fetch(`/bannerModImg`)
	.then(function(res){
		return res.json()
	}).then((list)=>{
		console.log(list)
		View_area.innerHTML = ""
		proc(list)
	})
	
}


function proc(list){
	if(list.length ==0){
		return
	}
	
	for( var i=0; i<list.length; i++){
		var recode = createRecode(list[i],i)
		if(recode != null){
				View_area.append(recode)	
		}
			
		
	}
	
	
}
function createRecode(item,i){

	
	if(item.ba_img1 !=null && item.ba_img1 != ""){
		const search = item.ba_img1.indexOf('.')
	const name1 = item.ba_img1.substr(0,search)
	var span = document.createElement('span')
	span.id='img_id_'+name1
	span.innerHTML=
	`
	
	<img src="/img/banner/banner/${item.ba_img1}" onclick="fileRemove2('${name1}','${item.ba_img1}','${item.ba_no}')" width="450px" height="450px">
	
	`
	fileInfoArr.push(item.ba_img1)
	fullName.push(item.ba_img1)
	}
	if(span == "undefined"){
		span.innerHTML = ``
	}
	
	return span
	
}


