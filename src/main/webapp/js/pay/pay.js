function getParameter(param) {
	return new URLSearchParams(location.search).get(param);
}

const b_no = getParameter('b_no');
const m_no = $('.pay-balance').data('member-pk');
let price;
let balance;

// 결제정보 가져오기
function getPaymentInfo() {
    fetch('/pay/info/' + b_no)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
			makePaymentInfo(data.data);
			if(data.data.b_state == '분양완료') {
				alert('이미 분양되었습니다.');
				window.close();
			}
        });
}

function makePaymentInfo(data) {
	$('.pay-title').text('상품명 : ' + data.b_title);
	$('.pay-price-ctnt').text(formatNumber(data.b_price));
	price = data.b_price;
}

// 내정보 가져오기
function getMyInfo() {
	fetch('/pay/myinfo/' + m_no)
		.then((res) => {
			return res.json();
		})
		.then((data) => {
			$('.pay-balance-ctnt').text(formatNumber(data.myInfo));
			balance = data.myInfo;
		});
}

getPaymentInfo();
getMyInfo();

// 결제하기
function payment() {
	const param = {
		b_no: b_no,
		buyer: m_no,
	}
	
	const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    }
	
	fetch('/pay', init)
		.then((res) => {
			if (!res.ok) {
				alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				window.close();
			}
			return res.json();
		})
		.then((data) => {
			if(data.result == 1) {
				alert('결제가 완료되었습니다.');
				window.close();
			} else {
				alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				window.close();
			}
		});
}
$('.payment').on('click', ()=> {
	getPaymentInfo();
	getMyInfo();
	if(price > balance) {
		alert('잔액이 부족합니다. 충전 후 시도해 주세요.');
	} else if ($('input:checkbox:checked').length != 2) {
		alert('동의 후 진행해주세요.')
	} else {
		payment();
	}
});

// 충전하기
$('.pay-charge-button').on('click', ()=>{
	location.herf = ""; 
	//TODO: 충전페이지 이동
});

//-----------------------------------------

function formatNumber(num) {
	return num.toLocaleString('ko-KR', 4) + '원';
}
