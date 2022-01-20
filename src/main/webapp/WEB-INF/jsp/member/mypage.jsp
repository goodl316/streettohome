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
<title>마이페이지</title>
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
						<h5 style="text-align: center">
							<strong>${sessionScope.loginMember.m_name} 님</strong>
						</h5>
						<li><a href="../member/updateMember">회원정보수정</a></li>
						<li><a href="#">입양신청목록</a></li>
						<li><a href="#">내게시글목록</a></li>
						<li><a href="#">찜하기목록</a></li>
						<li><a href="#">결제내역</a></li>
					</ul>

					<br>
				</div>
			</div>

			<h1 align="center" style="color: #839903;">회원 정보 수정</h1>
			<br>

			<section class="mainpage">

				<form action="/member/mypage" method="post"
					onsubmit="return chckPw();">


					<fieldset>
						<ul class="form-box">
							<li>
								<p class="tit" id="InputEmail">이메일</p>
								<p class="form">${sessionScope.loginMember.m_email}</p>
							</li>

							<li>
								<p class="tit">변경할 비밀번호</p>
								<p class="form">
									<input type="password" id="InputPassword" name="m_pw"
										required="required" placeholder="비밀번호를 입력해주세요.">
								</p>
							</li>

							<li>
								<p class="tit">비밀번호 확인</p>
								<p class="form">
									<input type="password" id="InputPasswordChck" name="m_pw2"
										placeholder="비밀번호 확인값을 입력해주세요."> <label id="pwdResult"></label>
								</p>
							</li>
							<div id="checkPwMsg"></div>

							<li>
								<p class="tit">이름</p>
								<p class="form">${sessionScope.loginMember.m_name}</p>
							</li>

							<li>
								<p class="tit">닉네임</p>
								<p class="form">${sessionScope.loginMember.m_nickname}</p>
							</li>

							<li>
								<p class="tit">연락처</p>
								<p class="form-1">
									<input type="text" maxlength="3" id="tel1" name="m_phone"
										size="11" placeholder="${sessionScope.loginMember.m_phone}">
								</p>
							</li>

							<li>
								<p class="tit">우편번호</p>
								<p class="form">
									<input type="text" id="zipCode" name="zipCode"
										placeholder="우편번호를 입력해주세요.">
								<div id="ckZip" onclick="addrSearch();">우편번호 검색</div>
							</li>

							<li>
								<p class="tit">주소</p>
								<p class="form">
									<input type="text" id="m_address1" name="m_address1"
										placeholder="${sessionScope.loginMember.m_address}">
								</p>
							</li>
							<br>
							<div class="btns" align="center">
								<div id="updateBtn" onclick="updateMember();">수정하기</div>
								<br>
							</div>

						</ul>
					</fieldset>