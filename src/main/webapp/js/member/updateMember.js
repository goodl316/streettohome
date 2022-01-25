var updateBtn = document.querySelector('#updateBtn')
var m_pw_Elem = document.querySelector('#m_pw')
var m_pw_chk_Elem = document.querySelector('#m_pw_chk')
var m_nickname_Elem = document.querySelector('#m_nickname')
var m_phone_Elem = document.querySelector('#m_phone')

var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
var phonePattern = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;

function chk_pattern_pw() {
	if (!pwPattern.test(m_pw_Elem.value)) {
		m_pw_msg.innerHTML = "영문, 특수문자, 숫자 포함 8-16자리"
		m_pw_msg.style.color = "red"
	} else {
		m_pw_msg.innerHTML = "사용가능한 비밀번호입니다."
		m_pw_msg.style.color ="green"
	}
	chk_pw() // 한번 더 호출.
}

function chk_pw() {
	if (m_pw_Elem.value !== m_pw_chk_Elem.value) {
		m_pw_chk_msg.innerHTML = "비밀번호가 다릅니다."
		m_pw_chk_msg.style.color = "red"
	}  else {
		m_pw_chk_msg.innerHTML = "비밀번호가 일치합니다."
		m_pw_chk_msg.style.color = "green"
	}
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
						$("#m_nickname").val();
						alert("사용가능한 닉네임입니다.");
						console.log("사용가능함");
					} else {
						alert("닉네임을 입력해주세요.");
					}
				}
			})
		}
		
function ph_pattern_pw() {
	if (!phonePattern.test(m_phone_Elem.value)) {
		m_phone_msg.innerHTML = "-를 제외한 숫자만 입력해주세요."
		m_phone_msg.style.color = "red"
	} else {
		return
	}
}

function updateMember1() {
const sNick = $('#m_nickname').data('nickname');
var params = {
					m_email : $("#m_email").val(),
                    m_pw : $("#m_pw").val(),
					m_nickname : $("#m_nickname").val(),
                    m_phone : $("#m_phone").val(),
                    m_zipcode : $("#m_zipcode").val(),
                    m_address : $("#m_address").val()
            }
			console.log(sNick);
			if ($("#m_nickname").val() == sNick){
				$("#nameChk").val() == 'Y'
				} else if ($("#nameChk").val() == 'N') {
				alert ("닉네임 중복 확인을 해주세요.");
				return
			}
	console.log(params)
	updateMember(params)
	
			}
			
function updateMember(params) {
	 $.ajax({
                method: 'POST',
                url: '/member/updateMember',
                data: JSON.stringify(params),
                dataType: "json",
                contentType: "application/json",
                success: function(data) {
		console.log(data)
					if(data.result == 1) {
						alert('수정된 정보로 로그인 해주세요.')
	                	location.href = '/member/logout'
					}
                }
            })

        }

// 참조 API : http://postcode.map.daum.net/guide
		function addrSearch() {
			new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                
                $("[name=m_zipcode]").val(data.zonecode);
                $("[name=m_address]").val(fullRoadAddr);
                
                document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('m_address').value = fullRoadAddr;
               
            }
         }).open();
     }