var authstate = document.querySelector('.authstate')


function delMember(m_no){
	var authstate = document.querySelector('.authstate')
	
	if(authstate.value != 999){
		alert('실행권한이 없습니다.')
		return;
	}
	
	var param = {
		state : 1,
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

function openPopup(url, _width, _height, title) {
    const _left = Math.ceil(( window.screen.width - _width )/2);
    const _top = Math.ceil(( window.screen.height - _height )/2); 
	const popOption = 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top;

	window.open(url, title, popOption);
}

function openWriteMessage(ms_receiver) {
	const url = "/member/message/write?ms_receiver=" + ms_receiver;
	const title = '메시지보내기';
	openPopup(url, 510, 460, title);
}

function searchMem(m_state,page){
	var m_name = $('.search-text').val();
	
	location.href = "/admin/MemberAdmin?m_state="+m_state+"&page="+page+"&m_name="+m_name
}

function searchMem2(m_authstate,page){
	var m_name = $('.search-text').val();
	
	location.href = "/admin/MemberAdmin?m_authstate="+m_authstate+"&page="+page+"&m_name="+m_name
}


function liftban(m_no){
	
	var param = {
		m_no : m_no,
		state : 2
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
