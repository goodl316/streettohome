var authstate = document.querySelector('.authstate')


function delBoard(b_no){
	var authstate = document.querySelector('.authstate')
	if(authstate.value != 999) {
		
		alert('실행권환이 없습니다.')
		
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