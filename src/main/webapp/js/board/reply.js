// ------------------------------ 댓글 ---------------------

// 댓글작성
$('.view-reply-button').on('click.regReply', () => {
    const param = {
        b_no: b_no,
        r_ctnt: $('.view-reply-textarea').val(),
        m_no: memberPK
    }
    if (param.r_ctnt == '') {
        alert('댓글을 입력해주세요.');
        return;
    } else {
        regReply(param, 0);
    }
});

function regReply(param, check) {

    const init = {
        method: 'POST',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };

    fetch('/board/reply/' + check, init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            getReplyList();
            if (data.result == 'fail') {
                alert('잠시 후 시도해 주세요.');
            }
        });
}
// 댓글 리스트 가져오기
function getReplyList() {
    fetch('/board/reply/' + b_no)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            makeReplyList(data.data);
        });
}
// 댓글 리스트 생성
function makeReplyList(data) {
    $('.view-reply-list').empty();

    data.forEach((item) => {
        const replyPiece = $('<li class=view-reply-piece></li>');
        const replyHeader = $('<div class="view-reply-list-header"></div>');
        const replyWriter = $('<div class="view-reply-writer"></div>');
        const replyDate = $('<div class="view-reply-date"></div>');
        const replyBody = $('<div class="view-reply-list-body"></div>');
        const replyContent = $('<div class="view-reply-content"></div>');
        const replyDelete = $('<div class="view-reply-delete"></div>');
        const replyDelbtn = $('<input type="button" value="삭제">');
        const reReplyContainer = $('<div class="view-reply-rereply-container"></div>')

        $('.view-reply-list').append(replyPiece);
        replyPiece.append(replyHeader, replyBody, reReplyContainer);
        replyHeader.append(replyWriter, replyDate);
        replyWriter.text(item.r_writer);
        replyDate.text(item.r_dt);
        replyBody.append(replyContent, replyDelete);

        if (item.r_del == 0) {
            replyContent.text(item.r_ctnt);

            if (memberPK == item.m_no) {
                replyDelete.append(replyDelbtn);
            }

            // 댓글 삭제 이벤트
            replyDelbtn.on('click', () => {
                if (confirm('삭제하시겠습니까?')) {
                    const param = {
                        r_no: item.r_no,
                        m_no: item.m_no
                    }
                    delReply(param);
                }
            });

            // 댓글 클릭시 대댓글창 생성
            replyContent.on('click', () => {
                if (reReplyContainer.hasClass('rereply-on')) {
                    reReplyContainer.removeClass('rereply-on');
                    reReplyContainer.empty();
                    return;
                }
                const rereplyElem = $('#view-reply-write').clone();
                reReplyContainer.addClass('rereply-on');
                reReplyContainer.append(rereplyElem);
                reReplyContainer.find('textarea').val('');
                $('.view-reply-button').on('click', () => {
                    const param = {
                        b_no: b_no,
                        r_ctnt: reReplyContainer.find('textarea').val(),
                        r_idx: item.r_idx,
                        r_ord: item.r_ord,
                        r_detp: item.r_dept
                    };
                    if(param.r_ctnt == '') {
                        alert('댓글을 입력해주세요.');
                        return;
                    }
                    regReply(param, 1);
                })
            });
        } else {
            replyContent.text('삭제된 댓글 입니다');
        }
    });
}
getReplyList();

// 댓글 삭제
function delReply(param) {
    const init = {
        method: 'DELETE',
        body: JSON.stringify(param),
        headers: {
            'accept': 'application/json',
            'content-type': 'application/json;charset=UTF-8'
        }
    };

    fetch('/board/reply', init)
        .then((res) => {
            return res.json();
        })
        .then((data) => {
            getReplyList();
            if (data.result == 'fail') {
                alert('잠시 후 시도해 주세요.');
            }
        });
}
