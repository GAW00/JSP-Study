//유효성 검사(validation check)
function check_ok(){
	console.log("@@");
	if(board_frm.b_name.value.length == 0){  // document 생략 가능(없어도 폼 이름의 name 값을 통해 찾아감)
		alert("작성자를 써주세요");
		board_frm.b_name.focus();
		return;
	}
	if(board_frm.b_title.value.length == 0){
		alert("글 제목을 써주세요");
		board_frm.b_title.focus();
		return;
	}
	if(board_frm.b_content.value.length == 0){
		alert("글 내용을 써주세요");
		board_frm.b_content.focus();
		return;
	}
	if(board_frm.b_pwd.value.length == 0){
		alert("비민번호를 써주세요");
		board_frm.b_pwd.focus();
		return;
	}
	document.board_frm.submit();
}

function delete_ok(){
	console.log("##");
	if(dlt_frm.validation.value.length == 0){
		alert("비밀번호를 입력하세요");
		dlt_frm.validation.focus();
		return;
	}
	document.dlt_frm.submit();
}