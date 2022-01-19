function delBoard(b_no){
	
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