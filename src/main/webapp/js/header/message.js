let socket = null;
let sock = new SockJS("/echo");
socket = sock;
$(document).ready(function(){
    if($("#header-session-id").val() != '') {
            connectWS();	
}
});

function connectWS() {
	sock.onopen = ()=> {
		console.log('connection opened');
	};
	sock.onmessage = (e)=> {
		let splitdata = e.data.split(":");
		if(splitdata[0].indexOf("ms") > -1) {
			console.log(splitdata[1] + '개의 쪽지');
			$('.nav-link.message').append(splitdata[1]+"");
		} else {
			console.log(e.data);
		}
		sock.onclose = ()=> {
		}
		sock.onerror = function (err) { 
			alert(err, ' : 관리자에게 문의하세요.');
		}
	}
}

$('.nav-item.message').on('click', ()=> {
	location.href = '';
})