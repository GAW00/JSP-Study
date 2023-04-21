//mem_uid  
//mem_pwd  
//mem_name 
//mem_email
//mem_addr 

function check_ok(){
//	if(document.reg_frm.mem_uid.value.length == 0){
//	if(document.reg_frm.mem_uid.value.length == ""){
	if(reg_frm.mem_uid.value.length == 0){  // document 생략 가능(없어도 폼 이름의 name 값을 통해 찾아감)
		alert("아이디를 써주세요");
		reg_frm.mem_uid.focus();
		return;
	}
	if(reg_frm.mem_uid.value.length < 4){
		alert("아이디는 4자 이상입니다.");
		reg_frm.mem_uid.focus();
		return;
	}
	if(reg_frm.mem_pwd.value.length == 0){
		alert("암호를 써주세요");
		reg_frm.mem_pwd.focus();
		return;
	}
	if(reg_frm.mem_pwd.value != reg_frm.pwd_check.value){
		alert("패스워드가 일치하지 않습니다.");
		reg_frm.pwd_check.focus();
		return;
	}
	if(reg_frm.mem_name.value.length == 0){
		alert("이름을 써주세요");
		reg_frm.mem_name.focus();
		return;
	}
	if(reg_frm.mem_email.value.length == 0){
		alert("Email을 써주세요");
		reg_frm.mem_email.focus();
		return;
	}
}