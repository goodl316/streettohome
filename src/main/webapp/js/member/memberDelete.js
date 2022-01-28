var deleteBtn = document.querySelector('#deleteBtn')
var deleteForm = document.querySelector('#deleteForm')

var m_email = deleteForm.m_email
var m_pw = deleteForm.m_pw

deleteBtn.onclick = function() {
	
	var param = {
		m_email : $("#m_email").val(),
		m_pw : $("#m_pw").val()
	}
	if ($("#m_pw").val() == "") {
		alert("비밀번호를 입력해주세요.")
		return;
	} else
	memberDelete(param)
}

function memberDelete(param) {
	
	$.ajax({
		method: 'POST',
		url: '/member/memberDelete',
		data: JSON.stringify(param),
		dataType: "json",
		contentType: "application/json",
		success: function(data) {
			if (data==0) {
				console.log(data)
				alert('비밀번호가 일치하지 않습니다.')
				return;
			} else {
				alert('회원 탈퇴가 완료되었습니다.')
                location.href = '/member/login'
			}
		}
	})
}

