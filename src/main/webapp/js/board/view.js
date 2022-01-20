// --------------------------------------------
function get_query() {
    var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0, result = {}; i < qs.length; i++) {
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    }
    return result;
}

const memberPK = $('#view-member-pk').data('member-pk');
const b_no = get_query().b_no;

// ----------------------- 마감일 계산기 ------------------------------------

const enddt = document.querySelector("#enddate");
const dday = new Date(enddt.dataset.enddt);
console.log(enddt.dataset.enddt, dday)
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

	if(setDate.getTime() <= now.getTime()) {
		enddt.innerText = '마감 (마감일 : ' + enddt.dataset.enddt + ')'
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


// ---------------------찜기능----------------------------------------
const favBtn = $('.favorite');

favBtn.on('click', () => {
    const param = {
        m_no: memberPK, 
        b_no: b_no
    }
    if (favBtn.hasClass('clicked')) {
        delFav(param);
    } else {
        regFav(param);
    }
});

function selFav() { // memberpk로변경
    fetch('/board/fav?b_no=' + b_no + '&m_no=' + 1)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            if (data.result == null) {
                favBtn.removeClass('clicked');
            } else {
                favBtn.addClass('clicked');
            }
        });
}
selFav();

function regFav(param) {
    const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };

    fetch('/board/fav', init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            if (data.result == 1) {
                if(confirm('찜묵록으로 이동하시겠습니까?')) {
					location.href = '';  //TODO:찜목록 url이동	
				}
            } else {
                alert('잠시 뒤 다시 시도해 주세요');
                location.reload();
            }
            selFav();
        });
}

function delFav(param) {
    const init = {
        method: 'DELETE',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };

    fetch('/board/fav', init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            if (data.result == 1) {
                
            } else {
                alert('잠시 뒤 다시 시도해 주세요');
                location.reload();
            }
            selFav();
        });
}

// ------------------연락하기------------------------------

$('.contact').on('click', ()=> {
	alert('준비중입니다.');
})

// ---------------------구매하기 ---------------------------

$('.buy').on('click', ()=> {
	const url = '/pay?b_no=' + b_no;
	const title = "결제하기";
	openPopup(url, 1000, 700, title);
})

$('.none').on('click', ()=> {
	alert('이미 분양완료된 게시글 입니다.');
});
// --------------------- 경매 ---------------------------

$('.auction').on('click', ()=> {
	const url = '/auction?b_no=' + b_no;
	const title = "경매참가";
	openPopup(url, 1000, 700, title);
});

// --------------------신고하기-----------------------------


$('.view-detail-report').on('click', ()=> {
	const url = '/report?b_no=' + b_no + '&m_no=' + memberPK;
	const title = '신고하기';
	openPopup(url, 650, 380, title);
});

// ----------------------------------------------------------

// 팝업창
function openPopup(url, _width, _height, title) {
    const _left = Math.ceil(( window.screen.width - _width )/2);
    const _top = Math.ceil(( window.screen.height - _height )/2); 
	const popOption = 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top;

	window.open(url, title, popOption);
}

// 상세보기

$('.view-detail').on('click', ()=> {
	$('.view-detail-container').toggle();
});

