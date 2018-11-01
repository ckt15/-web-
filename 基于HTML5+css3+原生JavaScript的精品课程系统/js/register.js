function register(){
	var ban = document.getElementById('ban').value;
	var phone = document.getElementById('phone').value;
	var email = document.getElementById('email').value;
	var psw = document.getElementById('psw').value;
	var to = document.getElementById('toIndex').value;
	var ret = document.getElementById('ret').value;

	if(ban==""){
		alert("账号不能为空！");
		return false;
	}else if(phone==""){
		alert("手机号码不能为空！");
		return false;
	}else if(email==""){
		alert("邮箱不能为空！");
		return false;
	}else if(psw==""){
		alert("密码不能为空！");
		return false;
	}else if(ret==""){
		alert("请确认密码！");
		return false;
	}else if(phone.length!=11){
		alert("请输入正确的手机号码");
		return false;
	}else if(!(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email))){
		alert("邮箱格式不正确，请重新输入！");
		return false;
	}else if(psw.length<6||psw.length>16){
		alert("请输入长度为6-16的密码！");
		return false;
	}else if(psw!=ret){
		alert("两次输入的密码不一致，请重新输入！");
		return false;
	}
}