const m_no = $('.pay-money-balance').data('member-pk');
const url = window.location.pathname;
const idx = url.substring(url.lastIndexOf('/')+1);

if(idx == 0) {
	$('.buy').addClass('clicked');
} else {
	$('.sell').addClass('clicked');
}

// 잔액조회
function getMyInfo() {
	fetch('/pay/myinfo/' + m_no)
		.then((res) => {
			return res.json();
		})
		.then((data) => {
			$('.pay-money-balance').text(formatNumber(data.myInfo));
		});
}

getMyInfo();

$('.pay-button-charge').on('click', ()=> {
	chargeMoney();
})

// 원화포맷
function formatNumber(num) {
	return num.toLocaleString('ko-KR', 4) + '원';
}

// 금액충전
function chargeMoney() {
	const money = parseInt(prompt('얼마를 충전하시겠습니까?'));
	if(isNaN(money)) {alert('숫자만 입력가능합니다.'); return;}
	
	const init = {
        method: 'POST',
        body: JSON.stringify({m_pay: money}),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    }
	console.log(init.body);
	fetch('/pay/charge', init)
	.then((res) => {
			if (!res.ok) {
				alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				location.reload();
			}
			return res.json();
		})
		.then((data) => {
			if(data.result == 1) {
				alert('충전이 완료되었습니다.');
				location.reload();
				getMyInfo;
			} else {
				alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				location.reload();
				getMyInfo;
			}
		});
}

// 구매/판매내역 변경
function movePage(no) {
	location.href = '/member/sthpay/' + no + '?page=1';
}

function moveBoard(no) {
	location.href = '/board/view?b_no=' + no;
}

// 파라미터 가져오기
function getParameter(param) {
	return new URLSearchParams(location.search).get(param);
}


// 페이징링크
function linkPage(pageNo) {
	const url = window.location.pathname;
	const idx = url.substring(url.lastIndexOf('/')+1);
	
	if(idx == 0) {
		location.href = "/member/sthpay/" + idx + "?page=" + pageNo;
	} else {
		location.href = "/member/sthpay/" + idx + "?page=" + pageNo;
	}
}

