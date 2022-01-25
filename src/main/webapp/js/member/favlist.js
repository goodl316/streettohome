function delFav(b_no) {
    const init = {
        method: 'DELETE',
        body: JSON.stringify({b_no: b_no}),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };
	if(!confirm('삭제하시겠습니까?')){ return;}

    fetch('/board/fav', init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            if (data.result == 1) {
                alert('삭제되었습니다.');
            } else {
                alert('잠시 뒤 다시 시도해 주세요');
            }
            location.reload();
        });
}