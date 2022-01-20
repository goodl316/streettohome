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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<title>회원가입</title>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>

	<div class="contents">
		<h2>회원가입</h2>
	</div>

	<section>
		<form action="/member/join" method="post" id="joinForm">
			<fieldset>
				<ul class="form-box">
					<li>
					<li><input type="radio" name="m_state" value="0">개인</li>
					<li><input type="radio" name="m_state" value="1">단체</li>
						<p class="tit">이메일</p>
						<p class="form">
							<input type="text" name="m_email" id="m_email"
								required="required" placeholder="이메일을 입력해주세요.">
						</p>
						<button class="emailChk" type="button" id="emailChk" onclick="fn_emailChk();" value="N">중복확인</button>  

					</li>

					<li>
						<p class="tit">비밀번호</p>
						<p class="form">
							<input type="password" id="m_pw" name="m_pw" required="required"
								placeholder="비밀번호를 입력해주세요.">
						</p>
					</li>

					<li>
						<p class="tit">비밀번호 확인</p>
						<p class="form">
							<input type="password" id="m_pw2" name="m_pw2"> <label
								id="pwdResult"></label>
						</p>
					</li>

					<li>
						<p class="tit">이름</p>
						<p class="form">
							<input type="text" maxlength="5" id="m_name" name="m_name"
								required="required" placeholder="이름을 입력해주세요.">
						</p>
					</li>

					<li>
						<p class="tit">닉네임</p>
						<p class="form">
							<input type="text" maxlength="5" id="m_nickname"
								name="m_nickname" required="required"
								placeholder="5자 이내로 입력해주세요.">
						</p>
						<button class="nameChk" type="button" id="nameChk" onclick="fn_nameChk();" value="N">중복확인</button>  
					</li>

					<li>
						<p class="tit">연락처</p>
						<p class="form-1">
							<input type="text" maxlength="11" id="m_phone" name="m_phone"
								size="11">
						</p>
					</li>

					<li>
						<p class="tit">우편번호</p>
						<p class="form">
							<input type="text" id="zipCode" name="zipCode"
								placeholder="우편번호를 입력해주세요.">
						</p>
						<div id="ckZip" onclick="addrSearch();">우편번호 검색</div>

					</li>

					<li>
						<p class="tit">주소</p>
						<p class="form">
							<input type="text" id="m_address" name="m_address"
								placeholder="주소를 입력해주세요.">
						</p>
					</li>

					<div class="btns" align="center">
						<div class="join" id="joinBtn" onclick="join();">가입하기</div>
					</div>
		</form>

	</section>
	<script>
		// 참조 API : http://postcode.map.daum.net/guide
		function addrSearch() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수
					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}
					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$('#zipCode').val(data.zonecode); //5자리 새우편번호 사용

					$('#m_address').val(fullAddr);
					// 커서를 상세주소 필드로 이동한다.
					$('#m_address2').focus();
				}
			}).open();
		};

		function join() {
			if ($("#m_email").val() == "")
				alert("이메일을 입력해주세요.");
			else if ($("#m_pw").val() == "")
				alert("비밀번호를 입력해주세요.");
			else if ($("#m_pw2").val() == "")
				alert("비밀번호 확인값을 입력해주세요.");
			else if ($("#m_name").val() == "")
				alert("이름을 입력해주세요.");
			else if ($("#m_nickname").val() == "")
				alert("닉네임을 입력해주세요.");
			else if ($("#m_nickname").val().length > 6) {
				alert("닉네임은 5자 이내로 설정해주세요.");
				$("#m_nickname").val("").focus();
				return false;
			} else if ($("#m_phone").val() == "")
				alert("연락처를 입력해주세요.");
			else if ($("#zipCode").val() == "")
				alert("우편번호를 입력해주세요.");
			else if ($("#m_adress").val() == "")
				alert("주소를 입력해주세요.");
			else if ($('#m_pw').val() != $('#m_pw2').val())
				alert("비밀번호 확인 값과 다릅니다.");
			else
				$("#joinForm").submit();
		}
		
		// 이메일 중복
		function fn_emailChk() {
			if ($("#m_email").val() == "") {
				alert("이메일을 입력해주세요.");
				return
			}
			$.ajax({
				url : "/member/emailChk",
				type : "post",
				dataType : "json",
				data : {
					"m_email" : $("#m_email").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 이메일입니다.");
					} else if (data == 0) {
						$("#emailChk").attr("value", "Y");
						alert("사용가능한 이메일입니다.");
					} else {
						alert("이메일을 입력해주세요.");
					}
				}
			})
		}

		// 닉네임 중복
		function fn_nameChk() {
			if ($("#m_nickname").val() == "") {
				alert("닉네임을 입력해주세요.");
				return
			}
			$.ajax({
				url : "/member/nameChk",
				type : "post",
				dataType : "json",
				data : {
					"m_nickname" : $("#m_nickname").val()
				},
				success : function(data) {
					if (data == 1) {
						alert("중복된 닉네임입니다.");
						console.log("중복");
					} else if (data == 0) {
						$("#nameChk").attr("value", "Y");
						alert("사용가능한 닉네임입니다.");
						console.log("사용가능함");
					} else {
						alert("닉네임을 입력해주세요.");
					}
				}
			})
		}
	</script>
</body>
</html>