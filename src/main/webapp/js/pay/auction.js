function getParameter(param) {
	return new URLSearchParams(location.search).get(param);
}

const b_no = getParameter('b_no');
const m_no = $('.pay-balance').data('member-pk');
let price;
let balance;
let enddt = $('.pay-enddt').val();

// 경매정보 가져오기
function getAuctionInfo() {
    fetch('/auction/info/' + b_no)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
			makeAuctionInfo(data.data);
			if(data.data.b_state == '3') {
				alert('이미 분양되었습니다.');
				window.close();
			}
        });
}

function makeAuctionInfo(data) {
	$('.pay-title').text('상품명 : ' + data.b_title);
	$('.pay-startprice-ctnt').text(formatNumber(data.ac_startprice));
	$('.pay-curprice-ctnt').text(formatNumber(data.ac_price));
	$('.pay-bid-text').attr('placeholder', formatNumber(data.ac_price) + '이상 입력하세요.');
	enddt = data.ac_enddt;
	price = data.ac_price;
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
refresh();
// 새로고침 5초마다
function refresh() {
	getAuctionInfo();
	getMyInfo();
}

setInterval(()=>{
	refresh();	
},3000);

// 입찰
function bid() {
	const param = {
		b_no: b_no,
		ac_cur_winner: m_no,
		ac_price: parseInt($('.pay-bid-text').val())
	}
	
	const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    }
	
	fetch('/auction', init)
		.then((res) => {
			if (!res.ok) {
				alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				window.close();
			}
			return res.json();
		})
		.then((data) => {
			if(data.result == 1) {
				alert('입찰 성공.');
				
			} else {
				alert('잘못된 접근입니다. 관리자에게 문의해주세요.');
				window.close();
			}
		});
}

$('.payment').on('click', ()=> {
	refresh();
	if(parseInt($('.pay-bid-text').val()) > balance) {
		alert('잔액이 부족합니다. 충전 후 시도해 주세요.');
	} else if ($('input:checkbox:checked').length != 2) {
		alert('동의 후 진행해주세요.')
	} else if (parseInt($('.pay-bid-text').val()) < price){
		alert('현재 분양가보다 높게 입력해주세요.')
	} else {
		bid();
	}
});


// 충전하기
$('.pay-charge-button').on('click', ()=>{
	window.open('/member/sthpay/0?page=1');
	//TODO: 충전페이지 이동
});

// ----------------------- 마감일 계산기 ------------------------------------
const getDDay = () => {
	const dday = new Date(enddt);
	// D-Day 날짜 지정
	const setDate = new Date(dday);
	// D-day 날짜의 연,월,일 구하기
	const setDateYear = setDate.getFullYear();
	// getMonth 메서드는 0부터 세기 때문에 +1 해준다.
	const setDateMonth = setDate.getMonth() + 1;
	const setDateDay = setDate.getDate();

	// 현재 날짜를 new 연산자를 사용해서 Date 객체를 생성
	const now = new Date();

	// D-Day 날짜에서 현재 날짜의 차이를 getTime 메서드를 사용해서 밀리초의 값으로 가져온다. 
	const distance = setDate.getTime() - now.getTime();

	// Math.floor 함수를 이용해서 근접한 정수값을 가져온다.
	// 밀리초 값이기 때문에 1000을 곱한다. 
	// 1000*60 => 60초(1분)*60 => 60분(1시간)*24 = 24시간(하루)
	// 나머지 연산자(%)를 이용해서 시/분/초를 구한다.
	const day = Math.floor(distance / (1000 * 60 * 60 * 24));
	const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	const seconds = Math.floor((distance % (1000 * 60)) / 1000);

	// D-Day 날짜를 가져오고,
	// 삼항 연산자를 사용해서 값이 10보다 작을 경우에 대해 조건부 렌더링을 해준다.
	if(!isNaN(day)) {
		$('.pay-timer').text(`${day}일 ${hours < 10 ? `0${hours}` : hours}시간 ${minutes < 10 ? `0${minutes}` : minutes}분 ${seconds < 10 ? `0${seconds}` : seconds}초 (마감일 : ${enddt})`);
	}
}
const init = () => {
	// init 함수 생성해서 getDDay함수 호출하고,
	getDDay();
	// setInterval 메서드에서 getDDay함수를 1초(1000밀리초)마다 호출한다.
	setInterval(getDDay, 1000);
}
init();

// 원화 포맷
function formatNumber(num) {
	return num.toLocaleString('ko-KR', 4) + '원';
}