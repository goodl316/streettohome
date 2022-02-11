function get_query() {
    var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0, result = {}; i < qs.length; i++) {
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    }
    return result;
}

function sendMessage() {
	
	const param = {
		allChk: allChk(),
		ms_title: $('#title').val(),
		nickname: $('#receiver').val(),
		ms_ctnt: $('#ctnt').val(),
		ms_sender: $('#m_no').val()
	}
	
	const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };

	fetch('/admin/MessageAdmin', init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
			if(data==0) {
				alert('다시 시도해주세요.');
				return;
			}
			$('#title').val('');
			$('#receiver').val('');
			$('#ctnt').val('');
        });
}

$('#submit').on('click', ()=> {
	if(!$('#allChk').is(':checked') && $('#receiver').val() == null) {
		alert('받는사람 입력 또는 전체 쪽지 보내기를 체크해주세요.');
		return;
	} else if($('#title').val() == null || $('#ctnt').val() == null) {
		alert('제목 또는 내용을 입력해주세요.');
		return;
	}
	
	sendMessage();
})

function allChk() {
	if($('#allChk').is(':checked')) {
		return 1;
	} else {
		return 0;
	}
}

const nickData = new Array();

function getAllNickname() {
	fetch('/admin/message/nickname')
        .then((res) => {
            return res.json();
        })
        .then((data) => {
			for (let i=0; i<data.nickname.length; i++) {
				nickData.push(data.nickname[i]);
			}
        });
}

getAllNickname();

$('#receiver').keyup(()=> {
	$('.nickname-list').text('');
	autoComplete($('#receiver').val());
});

let isComplete = false;
function autoComplete(str) {
	
	if(str == null) {
		for(let i=0; i<10; i++) {
			$('.nickname-list').append($('<div>').text(arg).addClass('nickname-item'));
		}
	} else {
		nickData.forEach((arg) => {
			if(arg.indexOf(str) > -1) {
				$('.nickname-list').append($('<div>').text(arg).addClass('nickname-item'));
			}
		});
	}
	$('.nickname-list').children().each(function() {
		$(this).click(function() {
			$('#receiver').val($(this).text());
			$('.nickname-list').children().remove();
			isComplete = true;
		});
	});
}