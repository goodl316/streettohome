var authstate = document.querySelector('.authstate');

function get_query() {
    var url = document.location.href;
    var qs = url.substring(url.indexOf('?') + 1).split('&');
    for (var i = 0, result = {}; i < qs.length; i++) {
        qs[i] = qs[i].split('=');
        result[qs[i][0]] = decodeURIComponent(qs[i][1]);
    }
    return result;
}

function linkPage(pageNo) {
		location.href = "/member/mybaord?m_no="+get_query().m_no+"&page="+pageNo
		
}

function delBoard(b_no){
	
	var param = {
		b_no : b_no
	}
	
	fetch(`/admin/delBoard`,{
		method:'post',
		headers :{
			'Content-Type':'application/json'
		},
		body:JSON.stringify(param)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload();
	})
}



function ccc(){
	var a = $("#okselect option:selected").val();
	console.log(a)
}

