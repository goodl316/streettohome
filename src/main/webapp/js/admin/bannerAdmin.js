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
	
	
		
	for (var i = 0; i < input_img.files.length; i++) {
		if(input_img.files.length>0){
			
		formData.append('imgs', input_img.files[i])
		}
	}
	

}


function updimg() {
	
	$.ajax({
		method: "POST",
		url: "/admin/insbanner",
		data: formData,
		processData: false,
		contentType: false,
		cache: false,
		success: function(){
		}
	}
	)
}

if(View_area){
	getImgList()
}

function getImgList(){
	fetch(`/bannerModImg`)
	.then(function(res){
		return res.json()
	}).then((list)=>{
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

	
	if(item.ba_img !=null && item.ba_img != ""){
		const search = item.ba_img.indexOf('.')
	const name1 = item.ba_img.substr(0,search)
	var span = document.createElement('span')
	span.id='img_id_'+name1
	span.innerHTML=
	`
	
	<img src="/img/banner/banner/${item.ba_img}" onclick="fileRemove2('${name1}','${item.ba_img}','${item.ba_no}')" width="450px" height="450px">
	
	`
	fileInfoArr.push(item.ba_img)
	fullName.push(item.ba_img)
	}
	if(span == "undefined"){
		span.innerHTML = ``
	}
	
	return span
	
}


