<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<form action="/ask/insAsk" method="post">
		<div>
		제목 * <input type="text" name="ak_title" placeholder="제목을 입력해 주세요">
		</div>
		<div>
		이름 <input type="text" name="ak_name" placeholder="이름을 입력해 주세요">
		</div>
		<div>
		비밀번호 * <input type="password" name="ak_pw" autocomplete="off" placeholder="비밀번호를 입력해 주세요.">
		</div>
		<div>
		내용 * <textarea name="ak_ctnt" placeholder="내용을 입력해 주세요"></textarea>
		</div>
		<div>
			<button class="regbtn">등록</button>
		</div>
	</form>
</div>
<script type="text/javascript" src="/js/ask/regAsk.js"></script>
</html>