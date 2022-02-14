
function delAsk(ak_no) {
	
	if(!confirm('삭제하시겠습니까?')) {
		return;
	}

	fetch("/admin/delAsk/" + ak_no, {
		method: 'DELETE',
		headers: {
			'Content-Type': 'application/json'
		}
	}).then(function(res) {
		return res.json()
	}).then(function(data) {
		if(data.data == 1) {
			alert('삭제되었습니다.');
		} else {
			alert('삭제 실패. 잠시 후 시도해주세요.')
		}
		location.reload();
	})
}

function getAsk(ak_no, ak_title) {
	const url = "/admin/detailAsk?ak_no=" + ak_no;
	const title = ak_title;
	openPopup(url, 800, 600, title);
}

// 팝업창
function openPopup(url, _width, _height, title) {
    const _left = Math.ceil(( window.screen.width - _width )/2);
    const _top = Math.ceil(( window.screen.height - _height )/2); 
	const popOption = 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top;

	window.open(url, title, popOption);
}