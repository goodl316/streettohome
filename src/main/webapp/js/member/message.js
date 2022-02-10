function get_query() {
    var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0, result = {}; i < qs.length; i++) {
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    }
    return result;
}

let receiver = get_query().ms_receiver;
let sender = get_query().ms_sender;

// 페이징 링크
function linkPage(pageNo) {
	if(sender == undefined) {
		location.href = "/member/message?page=" + pageNo + '&ms_receiver=' + receiver;
	} else {
		location.href = "/member/message?page=" + pageNo + '&ms_sender=' + sender;
	}
}

function openMessageView(ms_no, ms_title) {
	const url = "/member/message/view?ms_no=" + ms_no;
	const title = ms_title;
	openPopup(url, 510, 460, title);
}

// 팝업창
function openPopup(url, _width, _height, title) {
    const _left = Math.ceil(( window.screen.width - _width )/2);
    const _top = Math.ceil(( window.screen.height - _height )/2); 
	const popOption = 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top;

	window.open(url, title, popOption);
}

// 체크박스 제어
$('.message-allchk').on('click', ()=> {
	let chkElem = $('.message-chk');
	if($('.message-allchk').is(':checked')) {
		chkElem.prop('checked', true);
	} else {
		chkElem.prop('checked', false);
	}
});

function chkMessage(str) {
	const chkValList = new Array();
	
	$('.message-chk').each(function(){
		if($(this).is(':checked') == true) {
			chkValList.push($(this).val());
		}
	});
	message(str, chkValList);
	location.reload();
}

function deleteMessage(str, ms_no) {
	const chkValList = new Array();
	chkValList[0] = ms_no;
	message(str, chkValList);
	
	setTimeout(()=>{
		opener.location.reload();
		window.close();
	}, 200)
}

function message(str, chkValList) {
	let method = '';
	let confirmMsg = '';
	const delMsg = '정말로 삭제 하시겠습니까?';
	const readMsg = '읽음처리로 변경하시겠습니까?';
	if(str == 'DELETE') {
		method = 'DELETE';
		confirmMsg = delMsg;
	} else {
		method = 'PATCH';
		confirmMsg = readMsg;
	}
	
	if(confirm(confirmMsg)) {
		if(chkValList.length == 0) {
			alert('선택된 항목이 없습니다.');
			return;
		}
		fetch('/member/message', {
			method: method,
			body: JSON.stringify({checkVal: chkValList}),
			headers: {
                'accept': 'application/json',
                'content-type': 'application/json;charset=UTF-8'
            }
		})
		.then((res) => {
			return res.json();
		})
		.then((data) => {
			
		})
	}
}

function openWriteMessage(ms_receiver) {
	const url = "/member/message/write?ms_receiver=" + ms_receiver;
	const title = '메시지보내기';
	openPopup(url, 510, 460, title);
}

$('.message-write-button.send').on('click', ()=>{
	sendMessage();
})

function sendMessage() {
	const param = {
		ms_title: $('.message-title-ctnt').val(),
		ms_receiver: get_query().ms_receiver,
		ms_ctnt: $('.message-write-ctnt').val()
	}
	
	const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };

    fetch('/member/message', init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
			if(data==0) {
				alert('다시 시도해주세요.');
				return;
			}
			opener.location.reload();
			window.close();
        });
}