var img_list = document.querySelector('.get_img_list')
var b_no = document.querySelector('.hidden_b_no').value

if(img_list){
	getImgList(b_no)
}

function getImgList(b_no){
	fetch(`/board/boardmodImg?b_no=${b_no}`)
	.then(function(res){
		return res.json()
	}).then((list)=>{
		img_list.innerHTML = ""
		proc(b_no,list)
	})
	
}

function proc(b_no,list){
	if(list.length ==0){
		reutn 
	}
	
	var span = document.createElement('span')
	for( var i=0; i<list.length; i++){
		var recode = createRecode(b_no,list[i])
		span.append(recode)
	}
	img_list.append(span)
	
	
}

function createRecode(b_no,item){
	
	var img = document.createElement('img')
	
	img.innerHTML=
	`
	<img src="/img/board/an_${b_no}/${item}">
	`
	return img
	
}
