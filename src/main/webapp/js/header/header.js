var loginData = document.querySelector('#loginData').value


function regBoard() {
	location.href = `/board/boardreg`
}

function get_query() {
    var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0, result = {}; i < qs.length; i++) {
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    }
    return result;
}


function linkPage(pageNo){
	
	if (get_query().an_type1 != null) {
		var url = `?an_type1=` + get_query().an_type1
		location.href = `/board/boardList` + url +"&page="+pageNo
	} else {
		
		var type3 = get_query().an_type1;
		if(type3 == undefined){
			type3=get_query().type3
		}
		var sido1 = get_query().b_loc_sido
		var gugun1 = get_query().b_loc_gugun
		var an_type2 = get_query().an_type2
		var b_tt = get_query().b_tt
		var an_gender = get_query().an_gender
		var b_price = get_query().b_price

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
		if(sido1 =="시/도 선택"){
			sido1 = ""
		}

		var params = {
			type3: type3,
			sido1: sido1,
			gugun1: gugun1,
			an_type2: an_type2,
			b_tt: b_tt,
			an_gender: an_gender,
			b_price: b_price
		}


		location.href = "/board/boardList?b_loc_sido=" + sido1 + "&b_loc_gugun=" + gugun1 + "&an_type2=" + an_type2 +
			"&b_tt=" + b_tt + "&an_gender=" + an_gender + "&b_price=" + b_price + "&page=" + pageNo + "&type3=" + type3

	}
	
}

function moveList(an_type1) {
	if (an_type1 != null) {
		var url = `?an_type1=` + an_type1
		location.href = `/board/boardList` + url +"&page="+1
	} else {
		
		var type3 = get_query().an_type1;
		if(type3 == undefined){
			type3=get_query().type3
		}
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
		
		if(sido1 =="시/도 선택"){
			sido1 = ""
		}



		location.href = "/board/boardList?b_loc_sido=" + sido1 + "&b_loc_gugun=" + gugun1 + "&an_type2=" + an_type2 +
			"&b_tt=" + b_tt + "&an_gender=" + an_gender + "&b_price=" + b_price + "&page=" + 1 + "&type3=" + type3

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
    connectWS(sock);
});

function connectWS(sock) {
	sock.onopen = () => {
	};
	sock.onmessage = (e) => {
		let splitdata = e.data.split(":");
		if (splitdata[0].indexOf("ms") > -1) {
			$('.item-message-icon').text(splitdata[1]);
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