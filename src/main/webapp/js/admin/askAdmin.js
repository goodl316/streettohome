
function delAsk(ak_no){
	var params = {
		ak_no : ak_no
	}
	
	fetch("/admin/delAsk",{
		method: 'post',
		headers: {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(params)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload();
	})
	
}