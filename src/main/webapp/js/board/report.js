if($('.report-etc option:eq("기타")')) {
	$('.report-text').attr('readOnly', 'true');
} else {
	$('.report-text').attr("readOnly", 'false');
}