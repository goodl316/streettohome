var authstate = document.querySelector('.authstate')


function delBoard(b_no){
	var authstate = document.querySelector('.authstate')
	if(authstate.value != 999) {
		
		alert('실행권한이 없습니다.')
		
		return
	}
	
	var param = {
		b_no : b_no
	}
	
	fetch(`/admin/delBoard`,{
		method:'post',
		headers :{
			'Content-Type':'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload();
	})
}

function searchMem(an_type1,page){
	var m_name = $('.search-text').val();
	
	location.href = "/admin/BoardAdmin?an_type1="+an_type1+"&page="+page+"&m_name="+m_name
}

function searchMem2(page){
	var m_name = $('.search-text').val();
	location.href = "/admin/delBoardAdmin?page="+page+"&m_name="+m_name
}


function okBtn(b_no){
	
	var param = {
		b_no : b_no,
		state : 1
	}
	
	fetch('/admin/boardOk',{
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload();
	})
}

function nonOk(b_no){
	
	var param = {
		b_no : b_no,
		state : 2
	}
	
	fetch('/admin/boardOk',{
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload()
	})
}
