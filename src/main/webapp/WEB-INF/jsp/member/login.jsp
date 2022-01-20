<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./jquery.cookie.js"></script>
<title>로그인</title>
</head>
<body>

	<%@ include file="../temp/header.jsp"%>

	<div class="contents">
		<h2>로그인</h2>
	</div>

	<section class="signinMain">
		<div class="login">

			<form action="/member/login" method="post" id="loginForm"
				autocomplete="off">

				<fieldset>
					<ul class="inform">
						<li><label for="m_email">이메일</label> <input type="text"
							name="m_email" id="m_email" value="{$cookie." class="placeholder"
							autocomplete='new-password' placeholder="이메일을 입력해주세요."></li>

						<li><label for="m_pw">비밀번호</label> <input type="password"
							name="m_pw" id="m_pw" class="placeholder"
							autocomplete='new-password' placeholder="비밀번호를 입력해주세요.">
						</li>
						<div class="login_warn">${requestScope.Msg }</div>
					</ul>

					<input type="checkbox" id="idSaveCheck">이메일 저장

					<div class="login1" id="loginBtn" class="btn-1-black"
						onclick='login()'>로그인</div>

					<ul class="link-box">
						<li><a href="../member/findemail">이메일찾기</a></li>
						<li><a href="../member/findpw">비밀번호찾기</a></li>
					</ul>
				</fieldset>
			</form>
		</div>
	</section>
</body>
<script type="text/javascript">
	function login() {
		if ($("#m_email").val() == "")
			alert("이메일을 입력해주세요.");
		else if ($("#m_pw").val() == "")
			alert("비밀번호를 입력해주세요.");
		else
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
</script>
</html>