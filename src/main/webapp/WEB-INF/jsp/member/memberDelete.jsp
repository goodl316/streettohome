<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" href="/css/member/memberDelete.css">
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/member/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#m_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#m_pw").focus();
					return false;
				}	
			});
			
				
			
		})
	</script>
			<div class="contents">
				<h2 class="deletetxt">회원탈퇴</h2>
			<form action="/member/memberDelete" method="post">
				<div class="delete">
					<input class="memberdel" type="text" id="m_email" name="m_email" value="${sessionScope.loginMember.m_email}" readonly="readonly"/>
					<input class="memberdel" type="password" id="m_pw" name="m_pw" placeholder="비밀번호"/>
				</div>
				<div class="delete_warn">${requestScope.Msg}</div>
				<div class="deletemem">
					<button class="deltemember" type="submit" id="submit">회원탈퇴</button>
					<button class="cancel" type="button">취소</button>
				</div>
			</form>
			<div>
				<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
			</div>
			</div>	
	</body>
