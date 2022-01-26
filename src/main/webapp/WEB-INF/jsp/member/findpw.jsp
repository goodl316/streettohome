<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/css/member/findpw.css">
<script>
	$(function() {
		$("#findBtn").click(function() {
			$.ajax({
				url : "/member/findpw",
				type : "POST",
				data : {
					m_name : $("#m_name").val(),
					m_email : $("#m_email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>

	<div class="findpwpage">
		<h2 class="find-text">비밀번호 찾기</h2>

		<div class="findpw">
			<div class="find-input">
			<p><input class="w3-input" type="text" id="m_name" name="m_name" placeholder="이름" required></p>
			<p><input class="w3-input" type="text" id="m_email" name="m_email" placeholder="이메일" required></p>
			</div>
		</div>
		<div class="finddiv">
			<button type="button" id="findBtn" class="pwBtn">비밀번호찾기</button>
			<button type="button" onclick="history.go(-1);" class="gologin">로그인으로</button>
		</div>
	</div>
	