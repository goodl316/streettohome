function regAsk(m_no){
	var title = document.querySelector('.title').value
	var ctnt = document.querySelector('.ctnt').value
	
	if(m_no == 0 || m_no == null){
		alert('로그인후 이용해주세요.')
		return;
	}
	
	var params = {
		ak_title : title,
		ak_ctnt : ctnt,
		m_no : m_no
	}
	
	regAskAjax(params)
}

function regAskAjax(params){
	
	fetch("/ask/insAsk",{
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(params)
	}).then(function(res){
		return res.json()
	}).then(function(data){
			console.log(data)
			if(data == 1){
				console.log("true")
			}else{
				console.log(data)
			}
		
	})
}