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
                        <li><a href="../member/memberDelete">회원탈퇴</a></li>
                    </ul>

                    <br>
                </div>
            </div>

	<div id="joinpage">

		<form action="/member/updateMember" method="post" id="updateForm"
			enctype="multipart/form-data">
	
	<h1>회원 정보 수정</h1>

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
			<button class="nameChk" type="button" id="nameChk" onclick="fn_nameChk();" value="N">중복확인</button></div>
			</div>	
			
			<div style="font-weight:bold;">휴대전화</div>
			<div><input class="join_ph" type="text" id="m_phone" onchange="ph_pattern_pw()" 
			placeholder="연락처를 입력해주세요." value="${sessionScope.loginMember.m_phone}"></div>
			<div id="m_phone_msg"></div>
			
			<div style="font-weight:bold;">주소</div>
			<div id="daumAddrApi">
			<input type="text" id="m_zipcode" name="m_zipcode" placeholder="우편번호" value="${sessionScope.loginMember.m_zipcode}" readonly="readonly">
			<input type="button" id="ckZip" onclick="addrSearch();" value="우편번호 찾기"><br>
			<input type="text" id="m_address" name="m_address" placeholder="주소를 입력해주세요." value="${sessionScope.loginMember.m_address}">
			</div>	

			<div><input class="updateBtn" type="button" id="updateBtn" value="수정하기" onclick="updateMember1();"></div>
			<div><input class="updateBtn" type="button" id="updateBtn" value="확인" onclick="updateMember1();"></div>
	</form>
	</div>
	
	<script defer type="text/javascript" src="/js/member/updateMember.js"></script>
	<!-- <script>
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
		
		$("input[name=m_phone]").blur(function(){
			  var phone = $(this).val();
			  if( phone == '' || phone == 'undefined') return;
			  if(! phone_check(phone) ) {
			  	$(".result-phone").text('올바른 연락처 형식으로 입력해주세요.');
			    $(this).focus();
			    return false;
			  }else {
				$(".result-phone").text('');
			  }
			});
					
		
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
						$("#m_nickname").val();
						alert("사용가능한 닉네임입니다.");
						console.log("사용가능함");
					} else {
						alert("닉네임을 입력해주세요.");
					}
				}
			})
		} -->
	<!-- <script>

		function updateMember() {
			$('#updateForm').submit();
		}
	</script> -->
</body>