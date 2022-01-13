<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../assets/jquery-3.6.0.min.js"></script>
<title>로그인</title>
</head>
<body>

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
							name="m_email" id="m_email" value="" class="placeholder"
							autocomplete='new-password' placeholder="이메일을 입력해주세요."></li>

						<li><label for="m_pw">비밀번호</label> <input type="password"
							name="m_pw" id="m_pw" class="placeholder"
							autocomplete='new-password' placeholder="비밀번호를 입력해주세요.">
						</li>
						<c:if test = "${result == 0 }">
                			<div class = "login_warn">이메일 또는 비밀번호를 잘못 입력하셨습니다.</div>
            			</c:if>
					</ul>

					<ul class="option">
						<li><input type="checkbox" id="save" name="save"> <label
							for="save">이메일 저장</label></li>
					</ul>

					<button class="login1 btn-1-black" id="loginBtn" type="submit"
						onclick="login()">로그인</button>

					<ul class="link-box">
						<li><a href="#">이메일찾기</a></li>
						<li><a href="#">비밀번호찾기</a></li>
					</ul>
				</fieldset>
			</form>
		</div>
	</section>
</body>
<script>
	function login() {
		if ($("#m_email").val() == "")
			alert("이메일을 입력해주세요.");
		else if ($("#m_pw").val() == "")
			alert("비밀번호를 입력해주세요.");
		else
			$('#loginForm').submit();
	}
</script>
</html>