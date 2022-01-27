<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>회원 정보 수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/member/updateMember.css">

<div id="grid">
<div id="areaA">
<%@ include file="../member/mypage.jsp" %>
</div>

	<div class="contents">
		<h2 class="update-txt">회원 정보 수정</h2>
	<div id="updatePage">
	<form action="/member/updateMember" method="post" id="updateForm" enctype="multipart/form-data">
			<div>
			<div style="font-weight:bold;">이메일</div>
			<div><input class="email" id="m_email" readOnly="readOnly" value="${sessionScope.loginMember.m_email}"></div>
			</div>
			
			<div>
			<div style="font-weight:bold;">변경할 비밀번호</div>
			<div><input class="join_password" type="password" id="m_pw" name="m_pw"  onchange="chk_pattern_pw()" placeholder="비밀번호를 입력해주세요." required>
			<div id="m_pw_msg"></div>
			</div>
					

			<div style="font-weight:bold;">비밀번호 확인</div>
			<div><input class="join_password_chk" type="password" id="m_pw_chk" name="m_pw2" onchange="chk_pw()" placeholder="비밀번호 확인값을 입력해주세요.">
			<div id="m_pw_chk_msg"></div>
			</div>
			
			<div>
			<div style="font-weight:bold;">이름</div>
			<div>${sessionScope.loginMember.m_name}</div>
			</div>

			<div style="font-weight:bold;">닉네임</div>
			<div><input class="join_nickname" type="text" id="m_nickname" name="m_nickname" 
			placeholder="닉네임을 입력해주세요." required value="${sessionScope.loginMember.m_nickname}" data-nickname="${sessionScope.loginMember.m_nickname }">
			<button class="nameChk modyBtn" type="button" id="nameChk" onclick="fn_nameChk();" value="N">중복확인</button></div>
			</div>	
			
			<div style="font-weight:bold;">휴대전화</div>
			<div><input class="join_ph" type="text" id="m_phone" onchange="ph_pattern_pw()" 
			placeholder="연락처를 입력해주세요." value="${sessionScope.loginMember.m_phone}"></div>
			<div id="m_phone_msg"></div>
			
			<div style="font-weight:bold;">주소</div>
			<div id="daumAddrApi">
			<div>
			<input type="text" id="m_zipcode" name="m_zipcode" placeholder="우편번호" value="${sessionScope.loginMember.m_zipcode}" readonly="readonly">
			<button class="modyBtn" type="button" id="ckZip" onclick="addrSearch();">우편번호찾기</button></div>
			<div>
			<input type="text" id="m_address" name="m_address" placeholder="주소를 입력해주세요." value="${sessionScope.loginMember.m_address}"></div>
			</div>	
	</form>
	</div>
	<div class="update1">
	<input class="updateBtn modyBtn" type="button" id="updateBtn" value="수정하기" onclick="updateMember1();"> 
	</div>
	</div>
	</div>

	<script defer type="text/javascript" src="/js/member/updateMember.js"></script>
