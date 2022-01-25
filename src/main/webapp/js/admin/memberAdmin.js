var authstate = document.querySelector('.authstate')


function delMember(m_no){
	var authstate = document.querySelector('.authstate')
	
	if(authstate.value != 999){
		alert('실행권한이 없습니다.')
		return;
	}
	
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