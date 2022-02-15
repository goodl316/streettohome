<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/ask/regask.css">
<div>
	<form class="ask-form" action="/ask/insAsk" method="post">
		<div>
			<input type="text" name="ak_title" placeholder="제목을 입력해 주세요" maxlength="20">
		</div>
		<div>
			<input type="text" name="ak_name" placeholder="이름을 입력해 주세요" maxlength="10">
		</div>
		<div>
			<input type="password" name="ak_pw" maxlength="10" autocomplete="off" placeholder="비밀번호를 입력해 주세요.">
		</div>
		<div>
			<textarea class="ask-textarea" name="ak_ctnt" placeholder="내용을 입력해 주세요"></textarea>
		</div>
		<div>
			<button class="regbtn">등록</button>
		</div>
	</form>
</div>
<script type="text/javascript" src="/js/ask/regAsk.js"></script>
</html>