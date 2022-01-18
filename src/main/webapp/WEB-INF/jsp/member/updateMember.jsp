<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>회원 정보 수정</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<script src="/tastyServer/assets/js/jquery-3.6.0.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
</head>
<body>

	<%@ include file="../temp/header.jsp"%>

	<br>
	 <div class="container-fluid">
        <div class="row">
            <div class="col-md-2 col-sm-4 sidebar1">
                <br>
                <div class="left-navigation" style="height: 700px;">
                    <ul class="list">
                        <h5 style="text-align: center"><strong>${sessionScope.loginMember.m_name} 님</strong></h5>
                        <li><a href="../member/updateMember">회원정보수정</a></li> 
                        <li><a href="#">입양신청목록</a></li>
                        <li><a href="#">내게시글목록</a></li>
                        <li><a href="#">찜하기목록</a></li>
                        <li><a href="#">결제내역</a></li>
                    </ul>

                    <br>
                </div>
            </div>

	<section class="mainpage">

		<form action="/member/updateMember" method="post" id="updateForm"
			enctype="multipart/form-data">
	
	<h1>회원 정보 수정</h1>

			<fieldset>
				<ul class="form-box">
					<li>
						<p>이메일</p> <input name="m_email"
						value="${sessionScope.loginMember.m_email}" readonly="readonly">
					</li>

					<li>
						<p>비밀번호</p> <input type="password" id="InputPassword" name="m_pw"
						required="required" placeholder="비밀번호를 입력해주세요.">
					</li>

					<li>
						<p class="tit">비밀번호 확인</p>
						<p class="form">
							<input type="password" id="InputPasswordChck" name="m_pw2"
								placeholder="비밀번호 확인값을 입력해주세요."> <label id="pwdResult"></label>
						</p>
						<div id="checkPwMsg"></div>
					</li>

					<li>
						<p class="tit">이름</p>
						<p>${sessionScope.loginMember.m_name}</p>
					</li>

					<li>
						<p class="tit">닉네임</p> <input name="m_nickname"
						value="${sessionScope.loginMember.m_nickname}">
					</li>

					<li>
						<p class="tit">연락처</p> <input type="text"
						value="${sessionScope.loginMember.m_phone}" id="tel1"
						name="m_phone" size="11">
					</li>

					<li>
						<p class="tit">우편번호</p>
						<p class="form">
							<input type="text" id="zipCode" name="m_zipcode"
								value="${sessionScope.loginMember.m_zipcode}">
						<div id="ckZip" onclick="addrSearch();">우편번호 검색</div>

					</li>

					<li>
						<p class="tit">주소</p>
						<p class="form">
							<input type="text" id="m_address1" name="m_address"
								value="${sessionScope.loginMember.m_address}">
						</p>
					</li>

				</ul>
			</fieldset>

			<br>
			<div class="btns" align="center">
				<div id="updateBtn" onclick="updateMember();">수정하기</div>
				<br>
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

					$('#address1').val(fullAddr);
					// 커서를 상세주소 필드로 이동한다.
					$('#address2').focus();
				}
			}).open();
		};

		const pwElem = document.getElementById('inputPassword');
		const pwChckElem = document.getElementById('inputPasswordChck');
		const chckPwMsgElem = document.getElementById('checkPwMsg');
		pwChckElem.addEventListener('focusout', chckPw);
		pwElem.addEventListener('focusout', chckPw);

		function chckPw() {
			if (pwElem.value != pwChckElem.value) {
				if (pwChckElem.value == '') {
					chckPwMsgElem.innerText = '비밀번호를 확인 다시 해주세요!';
					chckPwMsgElem.style.color = 'red';
					return false;
				} else {
					chckPwMsgElem.innerText = '비밀번호가 일치 하지 않습니다.';
					chckPwMsgElem.style.color = 'red';
					return false;
				}
			} else {
				chckPwMsgElem.innerText = '비밀번호가 일치 합니다.';
				chckPwMsgElem.style.color = 'green';
				return true;
			}

		}
		function chckPw2() {
			if (pwElem.value != pwChckElem.value) {
				if (pwChckElem.value == '') {
					chckPwMsgElem.innerText = '비밀번호를 확인 다시 해주세요!';
					chckPwMsgElem.style.color = 'red';
					return false;
				} else {
					chckPwMsgElem.innerText = '비밀번호가 일치 하지 않습니다.';
					chckPwMsgElem.style.color = 'red';
					return false;
				}
			} else {
				chckPwMsgElem.innerText = '비밀번호가 일치 합니다.';
				chckPwMsgElem.style.color = 'green';
				return true;
			}
		}
		function updateMember() {
			$('#updateForm').submit();
		}
	</script>
</body>