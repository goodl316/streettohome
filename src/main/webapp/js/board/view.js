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

function selFav() { 
	// if(favBtn.hasClass('clicked')) {
	// 	$('.fa-heart').css('color', 'red');
	// } else {
	// 	$('.fa-heart').css('color', 'white');
	// }
    fetch('/board/fav?b_no=' + b_no + '&m_no=' + memberPK)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            if (data.result == null) {
                favBtn.removeClass('clicked');
                $('.fa-heart').css('color', 'white');
            } else {
                favBtn.addClass('clicked');
                $('.fa-heart').css('color', 'red');
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
                if(confirm('찜목록으로 이동하시겠습니까?')) {
					location.href = '/member/favlist';
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


$('.view-detail-button.report').on('click', ()=> {
	const url = '/report?b_no=' + b_no + '&m_no=' + memberPK;
	const title = '신고하기';
	openPopup(url, 650, 380, title);
});

// ----------------이미지 가져오기-------------

getImgList();

function getImgList(){
	fetch(`/board/boardmodImg?b_no=${b_no}`)
	.then(function(res){
		return res.json()
	}).then((list)=>{
		if(list.length ==0){ return; }
		
		for(let i=0; i<list.length; i++){
			const recode = createRecode(b_no,list[i])
			$('.view-img-container').append(recode)
		}
	});
}

function createRecode(b_no,item){
	const div = $('<div></div>');
	div.addClass('view-img');
	div.html(`<img class="view-img-item" src="/img/board/an_${b_no}/${item}">`);
	return div;
	
}

// -------------목록보기-------------------

function returnPage() {
	history.back();
}

// ---------------쪽지보내기 -----------------
function openWriteMessage(ms_receiver) {
	const url = "/member/message/write?ms_receiver=" + ms_receiver;
	const title = '메시지보내기';
	openPopup(url, 510, 460, title);
}