var loginBtn = document.querySelector('#loginBtn')
var loginForm = document.querySelector('#loginForm')

var m_email = loginForm.m_email
var m_pw = loginForm.m_pw

loginBtn.onclick = function() {
	login()
}

function login() {

	var param = {
		m_email: m_email.value,
		m_pw: m_pw.value
	}
	if ($("#m_email").val() == ""){
		alert ("이메일을 입력해주세요.");
	} else if ($("#m_pw").val() == ""){
		alert ("비밀번호를 입력해주세요.");
	} else
		$('#loginForm').submit();
	}
	
	
	$(document).ready(function() {
		var m_email = getCookie("m_email");//저장된 쿠기값 가져오기
		$("input[name='m_email']").val(m_email);

		if ($("input[name='m_email']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
			// 아이디 저장하기 체크되어있을 시,
			$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}

		$("#idSaveCheck").change(function() { // 체크박스에 변화가 발생시
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기 체크했을 때,
				var m_email = $("input[name='m_email']").val();
				setCookie("m_email", m_email, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("m_email");
			}
		});

		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$("input[name='m_email']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($("#idSaveCheck").is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var m_email = $("input[name='m_email']").val();
				setCookie("m_email", m_email, 7); // 7일 동안 쿠키 보관
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}