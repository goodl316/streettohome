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