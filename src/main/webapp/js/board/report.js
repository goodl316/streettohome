$('input[name=radio]').on('click', () => {
	console.log($('input[name=radio]:checked').parent().text());
	if(!$('input[name=radio]:checked').parent().text().indexOf('기타')) {
		$('.report-etc-text').val("");
		$('.report-etc-text').removeAttr('readOnly');
	} else {
		$('.report-etc-text').val($('input[name=radio]:checked').parent().text());
		$('.report-etc-text').attr('readOnly','true');
	}
});

if($('input[name=radio]:checked')) {
	
}

function closePopup() {
	window.close();
}

function getParameter(param) {
	return new URLSearchParams(location.search).get(param);
}

const b_no = getParameter('b_no');
const m_no = getParameter('m_no');

$('.report-button.submit').on('click', ()=> {
	const param = {
		b_no: b_no,
		m_no: m_no,
		rp_ctnt: $('#rp_ctnt').val()
	}
	
	const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    }
	
	if(param.rp_ctnt == '') {
		alert('신고이유를 선택해주세요.');
		return;
	} else {
		fetch('/report', init)
			.then((res) => {
				if (!res.ok) {
					alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
					window.close();
				}
				return res.json();
			})
			.then((data) => {
				if(data.result == 1) {
					alert('신고되었습니다.');
					window.close();
				}
			});
	}
})