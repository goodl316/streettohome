// ----------------------- 마감일 계산기 ------------------------------------

const enddt = document.querySelector("#enddate");
const dday = new Date(enddt.dataset.enddt);

const getDDay = () => {
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

	if(setDate.getTime() == now.getTime()) {
		enddt.innerText = '마감 (마감일 : ${enddt.dataset.enddt})'
		return;
	}

	// D-Day 날짜를 가져오고,
	// 삼항 연산자를 사용해서 값이 10보다 작을 경우에 대해 조건부 렌더링을 해준다.
	enddt.innerText =
		`${day}일 ${hours < 10 ? `0${hours}` : hours}시간 ${minutes < 10 ? `0${minutes}` : minutes}분 ${seconds < 10 ? `0${seconds}` : seconds}초 (마감일 : ${enddt.dataset.enddt})`;
}


const init = () => {
	// init 함수 생성해서 getDDay함수 호출하고,
	getDDay();
	// setInterval 메서드에서 getDDay함수를 1초(1000밀리초)마다 호출한다.
	setInterval(getDDay, 1000);
}
init();



// ------------------------------ 댓글 ---------------------
const b_no = params.get('b_no');


// 댓글작성
$('.view-reply-textarea').addEventListener('click', ()=> {
});
$('.view-reply-button').addEventListener('click', ()=> {
	if($('.view-reply-textarea') == '') {
		alert('댓글을 입력해 주세요.');
		return;
	}
});

const param = {
	b_no: params.get('b_no'),
	r_ctnt: $('')
	// TODO: login session 부분 마무리되면 m_no 값 추가하기
}

function insReply(param, idx) {
	
	const init = {
		method: 'POST',
		body: JSON.stringify(param),
		headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
	};
	
	fetch('reply/' + idx, init)
	.then((res) => {
		return res.json();
	})
	.then((data) => {
		if(data.result == 'fail') {
			alert('잠시 후 시도해 주세요.');
		}
	});
}



