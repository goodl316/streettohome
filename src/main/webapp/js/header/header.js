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
	} else{
		
		var sido1 = document.querySelector('#sido1').value
		var gugun1 = document.querySelector('#gugun1').value
		var an_type2 = document.querySelector('#an_type2').value
		var b_tt = document.querySelector('#b_tt').value
		var an_gender = document.querySelector('#an_gender').value
		var b_price = document.querySelector('#b_price').value

		if (sido1 == "시/도 선택") {
			alert("시/도를 선택해주세요")
			return;
		}

		if (gugun1 == "구/군 선택") {
			alert("구/군을 선택해주세요")
			return;
		}
		if (b_type == "품종 선택") {
			alert("품종을 선택해주세요")
			return;
		}

		if (b_tt == "") {
			alert("무료/유료를 선택해주세요")
			return;
		}

		if (b_tt == "무료") {
			b_price = 0;
		}

		if (an_gender == "") {
			alert("성별을 선택해주세요")
			return;
		}

		if (b_price == "" && b_tt != "무료") {
			console.log(b_price)
			alert("가격을 선택해 주세요")
			return;
		}
		
		var params = {
			sido1 :sido1,
			gugun1 : gugun1,
			an_type2 : an_type2,
			b_tt : b_tt,
			an_gender : an_gender,
			b_price : b_price
		}
		
		alert(sido1+gugun1+an_type2+b_tt+an_gender+ b_price)

		location.href = "/board/boardList?b_loc_sido=" + sido1 + "&b_loc_gugun=" + gugun1 + "&an_type2=" + an_type2 +
			"&b_tt=" + b_tt + "&an_gender=" + an_gender + "&b_price=" + b_price

		
		
		
		
	}
}



function movePage(startPage, cntPerPage, an_type1) {

	if (an_type1 != null) {
		location.href = "/board/boardList?nowPage=" + (startPage - 1) + "&cntPerPage=" + cntPerPage + '&an_type1=' + an_type1
	} else {

		var sido1 = document.querySelector('#sido1').value
		var gugun1 = document.querySelector('#gugun1').value
		var an_type2 = document.querySelector('#an_type2').value
		var b_tt = document.querySelector('#b_tt').value
		var an_gender = document.querySelector('#an_gender').value
		var b_price = document.querySelector('#b_price').value

		if (sido1 == "시/도 선택") {
			alert("시/도를 선택해주세요")
			return;
		}

		if (gugun1 == "구/군 선택") {
			alert("구/군을 선택해주세요")
			return;
		}
		if (b_type == "품종 선택") {
			alert("품종을 선택해주세요")
			return;
		}

		if (b_tt == "") {
			alert("무료/유료를 선택해주세요")
			return;
		}

		if (b_tt == "무료") {
			b_price = 0;
		}

		if (an_gender == "") {
			alert("성별을 선택해주세요")
			return;
		}

		if (b_price == "" && b_tt != "무료") {
			console.log(b_price)
			alert("가격을 선택해 주세요")
			return;
		}


		location.href = "/board/dogList?b_loc_sido=" + sido1 + "&b_loc_gugun=" + gugun1 + "&an_type2=" + an_type2 +
			"&b_tt=" + b_tt + "&an_gender=" + an_gender + "&b_price=" + b_price


	}


}

function movePage1(nowPage, cntPerPage, an_type1) {
	location.href = "/board/boardList?nowPage=" + nowPage + "&cntPerPage=" + cntPerPage + '&an_type1=' + an_type1
}
function movePage2(endPage, cntPerPage, an_type1) {
	locaiont.href = "/board/boardList?=" + (endPage + 1) + "&cntPerPage=" + cntPerPage + '&an_type1=' + an_type1
}

function moveAdmin(m_state){
	location.href="/admin/MemberAdmin?m_state="+m_state
}

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
	location.href = '/member/message?page=1&ms_receiver=' + $("#header-session-id").val();
})