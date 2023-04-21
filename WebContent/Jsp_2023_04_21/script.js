function form_check(){
	if(document.form.id.value.length == 0){
		alert("아이디를 입력하세요.");
		form.id.focus();
		return;
	}
	if(document.form.id.value < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		document.form.id.focus();
		return;
	}
	if(document.form.pw.value.length == 0){
		alert("암호를 입력하세요.");
		form.pw.focus();
		return;
	}
	if(document.form.pw_check.value.length == 0){
		alert("암호 확인을 입력하세요.");
		document.form.pw_check.focus();
		return;
	}
	if(document.form.pw_check.value !== document.form.pw.value){
		alert("암호가 일치하지 않습니다.");
		document.form.pw_check.focul();
		return;
	}
	if(document.form.name.value.length == 0){
		alert("이름을 입력하세요.");
		document.form.name.focus();
		return;
	}
	if(document.form.email.value.length == 0){
		alert("이메일을 입력하세요.");
		document.form.email.focus();
		return;
	}
}