var loginData = document.querySelector('#loginData').value
console.log(loginData)


function regBoard() {
	console.log(loginData)


	location.href = `/board/boardreg`
}

function moveList(an_type1) {
	if (an_type1 != null) {
		var url = `?an_type1=` + an_type1
		location.href = `/board/boardList` + url
	} else {

		var sido1 = document.querySelector('#sido1').value
		var gugun1 = document.querySelector('#gugun1').value
		var an_type2 = document.querySelector('#an_type2').value
		var b_tt = document.querySelector('#b_tt').value
		var an_gender = document.querySelector('#an_gender').value
		var b_price = document.querySelector('#b_price').value

		if (b_price == "") {
			b_price = 0;
		}
		if (an_type2 == '품종선택') {
			an_type2 = ""
			console.log("aaaa")
		}

		if (b_tt == "무료") {
			b_price = 0;
		}




		var params = {
			sido1: sido1,
			gugun1: gugun1,
			an_type2: an_type2,
			b_tt: b_tt,
			an_gender: an_gender,
			b_price: b_price
		}

		alert(sido1 + gugun1 + an_type2 + b_tt + an_gender + b_price)

		location.href = "/board/boardList?b_loc_sido=" + sido1 + "&b_loc_gugun=" + gugun1 + "&an_type2=" + an_type2 +
			"&b_tt=" + b_tt + "&an_gender=" + an_gender + "&b_price=" + b_price + "&page=" + 1





	}
}


function moveAdmin(m_state) {
	location.href = "/admin/MemberAdmin?m_state=" + m_state + "&page=1"
}

$(document).ready(function() {
	if ($("#header-session-id").val() == '') {
		return;
	}
	let sock = new SockJS("/echo");
	console.log('sdfas');
	connectWS(sock);
});

function connectWS(sock) {
	sock.onopen = () => {
	};
	sock.onmessage = (e) => {
		let splitdata = e.data.split(":");
		if (splitdata[0].indexOf("ms") > -1) {
			$('.item-message-icon').append(splitdata[1]);
		} else {
		}
		sock.onclose = () => {
		}
		sock.onerror = function(err) {
			alert(err, ' : 관리자에게 문의하세요.');
		}
	}
}

$('.nav-link.message').on('click', () => {
	location.href = '/member/message?page=1&ms_receiver=' + $("#header-session-id").val();
})