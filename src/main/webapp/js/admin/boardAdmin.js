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
	if(get_query().m_name == undefined) {
		location.href = "/admin/BoardAdmin?an_type1=" + get_query().an_type1 + "&page=" + pageNo;
		
	} else {
		location.href = "/admin/BoardAdmin?an_type1=" + get_query().an_type1 + "&page=" + pageNo + "&m_name=" + get_query().m_name;
		
	}
}

function delBoard(b_no){
	var authstate = document.querySelector('.authstate')
	if(authstate.value != 999) {
		alert('실행권한이 없습니다.')
		return
	}
	
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

function searchMem(an_type1,page){
	var m_name = $('.search-text').val();
	var b_auth = $("#okselect option:selected").val();
	console.log(m_name)
	if(m_name != null && m_name != ""){
	return location.href = "/admin/BoardAdmin?an_type1="+an_type1+"&page="+page+"&m_name="+m_name+
	"&b_auth="+b_auth
	}else{
	return location.href = "/admin/BoardAdmin?an_type1="+an_type1+"&page="+page+"&b_auth="+b_auth
	}
	
}

function searchMem2(page){
	var m_name = $('.search-text').val();
	location.href = "/admin/delBoardAdmin?page="+page+"&m_name="+m_name
}


function okBtn(b_no){
	
	var param = {
		b_no : b_no,
		state : 1
	}
	
	fetch('/admin/boardOk',{
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload();
	})
}

function nonOk(b_no){
	
	var param = {
		b_no : b_no,
		state : 2
	}
	
	fetch('/admin/boardOk',{
		method : 'post',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	}).then(function(res){
		return res.json()
	}).then(function(data){
		location.reload()
	})
}

function ccc(){
	var a = $("#okselect option:selected").val();
	console.log(a)
}

