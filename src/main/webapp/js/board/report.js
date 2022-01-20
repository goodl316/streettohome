$('input[name=radio]').on('click', () => {
	switch($('input[name="radio"]:checked').val()) {
		case '1':
		$('.report-etc-text').val("부적절한 홍보 게시글");
		$('.report-etc-text').attr('readOnly','true');
		break;
		case '2':
		$('.report-etc-text').val("음란성 또는 청소년에게 부적합한 내용");
		$('.report-etc-text').attr('readOnly','true');
		break;
		case '3':
		$('.report-etc-text').val("명예훼손/사생활 침해 및 저작권침해등");
		$('.report-etc-text').attr('readOnly','true');
		break;
		case '4':
		$('.report-etc-text').val("허위 게시글");
		$('.report-etc-text').attr('readOnly','true');
		break;
		case '5':
		$('.report-etc-text').removeAttr('readOnly');
		$('.report-etc-text').val("");
		break;
	}
});

function closePopup() {
	window.close();
}

function getParameter(param) {
	return new URLSearchParams(location.search).get(param);
}

const b_no = getParameter('b_no');
const m_no = getParameter('m_no');

$('.report-button').on('click', ()=> {
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
		alert('신고이유를 선택해주세요.')
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