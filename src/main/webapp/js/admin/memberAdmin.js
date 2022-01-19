function delMember(m_no){
	
	var param = {
		m_no : m_no
	}
	
	fetch(`/admin/delMember`,{
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