<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<link rel="stylesheet" href="/css/member/findemail.css">

<script>
	   $(function() {

		$("#findBtn").click(function() {

			$.ajax({

				url : "/member/findemail",

				type : "POST",

				data : {

					m_name : $("#m_name").val(),

					m_phone : $("#m_phone").val()

				},

				success : function(result) {

					alert(result);

				},

			})

		});

	})
</script>


	   
	<div class="findemailpage">
		<h2 class="find-text">이메일 찾기</h2>
   
		<div class="findemail">
				<div class="find-input">
					<p><input class="w3-input" type="text" id="m_name" name="m_name"
						required placeholder="이름"></p>
					<p><input class="w3-input" type="text" id="m_phone" name="m_phone"
						required placeholder="전화번호"></p>
				</div>
		</div>
		<div class="finddiv">
				<button type="button" id=findBtn class="emailBtn">이메일찾기</button>
				<button type="button" id=gologinBtn onclick="history.go(-1);" class="gologin">로그인으로</button>
		</div>
	</div>


