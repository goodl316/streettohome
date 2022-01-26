<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<link rel="stylesheet" href="/css/member/join.css">
<title>회원가입</title>

	<div class="contents">
      <h2 class="jointext">회원가입</h2>
	<div id="joinpage">
	
		<div>
			<div><input type="radio" name="m_state" value="0" checked="checked">개인
			<input type="radio" name="m_state" value="1">단체</div>
		</div>
		
		<div>
			<div style="font-weight:bold;">이메일</div>
			<div><input class="join_id" type="text" id="m_email" name="m_email" onchange="chk_pattern_e()" placeholder="ex)id@domain.com" required>
			<button class="emailChk" type="button" id="emailChk" onclick="fn_emailChk();" value="N" disabled="true">중복확인</button>
            <div id="m_email_msg"></div>
		</div>
		
		<div>
			<div style="font-weight:bold;">비밀번호</div>
			<div><input class="join_password" type="password" id="m_pw" name="m_pw"  onchange="chk_pattern_pw()" placeholder="비밀번호를 입력해주세요." required>
			<div id="m_pw_msg"></div>
		</div>
		
		<div style="font-weight:bold;">비번확인</div>
			<div><input class="join_password_chk" type="password" id="m_pw_chk" name="m_pw2" onchange="chk_pw()" placeholder="비밀번호 확인값을 입력해주세요.">
			<div id="m_pw_chk_msg"></div>
		</div>
		
		<div style="font-weight:bold;">이름</div>
			<div><input class="join_nm" type="text" id="m_name" name="m_name" onchange="name_Pattern()" placeholder="이름을 입력해주세요." required></div>
		</div>
		
		<div style="font-weight:bold;">닉네임</div>
			<div><input class="join_nickname" type="text" id="m_nickname" name="m_nickname" onchange="nickname_Pattern()" placeholder="닉네임을 입력해주세요." required>
			<button class="nameChk" type="button" id="nameChk" onclick="fn_nameChk();" value="N">중복확인</button></div>
		</div>
		
		<div style="font-weight:bold;">휴대전화</div>
			<div><input class="join_ph" type="text" id="m_phone" onchange="ph_pattern_pw()" placeholder="연락처를 입력해주세요."></div>
		<div id="m_phone_msg"></div>
		
		<div style="font-weight:bold;">주소</div>
		<div id="daumAddrApi">
		<input type="text" id="m_zipcode" name="m_zipcode" placeholder="우편번호" readonly="readonly">
		<input type="button" id="ckZip" onclick="addrSearch();" value="우편번호"><br>
		<input type="text" id="m_address" name="m_address" placeholder="주소를 입력해주세요.">
		</div>
	</div>
	<div><input class="joinBtn" type="button" id="joinBtn" value="회원가입" onclick="join();"></div>
	</div>
	
	<script defer type="text/javascript" src="/js/member/member.js"></script>