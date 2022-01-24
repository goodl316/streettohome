
var fileArr;
var fileInfoArr = [];
var fullName = [];
var viewcontainer = document.querySelector('.viewcontainer')
var View_area1 = $('#View_are1')
var formData1 = new FormData();
var View_area2 = $('#View_are2')
var formData2 = new FormData();
var View_area3 = $('#View_area3')
var formData3 = new FormData();
var View_area4 = $('#View_area4')
var formData4 = new FormData();
var View_area5 = $('#View_area5')
var formData5 = new FormData();
var formData = new FormData();


	
	

	
	





function getImgList(b_no){
	fetch(`/board/boardmodImg?b_no=${b_no}`)
	.then(function(res){
		return res.json()
	}).then((list)=>{
		console.log(list)
		View_area1.innerHTML = ""
		proc(b_no,list)
	})
	
}

function proc(b_no,list){
	if(list.length ==0){
		return
	}
	
	var div = document.createElement('div')
	for( var i=0; i<list.length; i++){
		var recode = createRecode(b_no,list[i],i)
		div.append(recode)
	}
	View_Area.append(div)
	
	
}

function createRecode(b_no,item){
	console.log("re:",b_no)
	console.log("itme",item)
	const search = item.indexOf('.')
	const name = item.substr(0,search)
	console.log(name)
	
	var span = document.createElement('span')
	span.id='img_id_'+name
	span.innerHTML=
	`
	
	<img src="/img/board/an_${b_no}/${item}" onclick="fileRemove2('${name}','${item}')">
	
	`
	fileInfoArr.push(item)
	console.log(span)
	console.log(fileInfoArr)
	fullName.push(item)
	
	return span
	
}






function deleteImg(num){
	switch(num){
		case 1 :
		$('#input_img1').val("");
		break;
		case 2 :
		$('#input_img2').val("");
		break;
		case 3 :
		$('#input_img3').val("");
		break;
		case 4 :
		$('#input_img4').val("");
		break;
		case 5 :
		$('#input_img5').val("");
		break;
		
	}
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
		console.log(View_area1)
		
	switch(View_area){
		case 'View_area1':
		var preview = document.querySelector('#View_area1')
		var input_img = document.querySelector('#input_img1')
			break;
		case 'View_area2':
			var preview = document.querySelector('#View_area2')
		var input_img = document.querySelector('#input_img2')
		break;
		case 'View_area3':
			var preview = document.querySelector('#View_area3')
		var input_img = document.querySelector('#input_img3')
		break;
		case 'View_area4':
			var preview = document.querySelector('#View_area4')
		var input_img = document.querySelector('#input_img4')
		break;
		case 'View_area5':
			var preview = document.querySelector('#View_area5')
		var input_img = document.querySelector('#input_img5')
		break;
	}
	console.log(preview)
//	var preview = document.getElementById(View_area1); //div id
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
	
	
	for (var i = 1; i < 6; i++) {
		if(input_img.files.length>0){
		if(input_img == document.querySelector('#input_img'+i)){
			let from = 'fromData'+i
			from.append('imgs', input_img.files[i])	
		}
		
		//console.log(input_img.files[i].name)
		}
	}
	console.log(formData1.getAll('imgs'))

}
