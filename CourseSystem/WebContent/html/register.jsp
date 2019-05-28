<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>精品课程系统--注册页面</title>
	<link rel="stylesheet" type="text/css" href="../css/register.css">
</head>
<body>
	<div id="log">
		<span id="tlt">欢迎注册精品课程系统</span><br><br><br>
		<form action="../RegisterServlet" method="post">
			<label>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
			<input type="text" placeholder="请输入账号" class="inp" required="required" id="ban" name="sid">&nbsp;&nbsp;&nbsp;
			<span class="require">*必填(用于个人登录)</span>
			<br><br>
			<label>手机号码：</label>
			<input type="text" placeholder="请输入手机号码" required="required" class="inp" id="phone" maxlength="11" name="sphone">&nbsp;&nbsp;&nbsp;
			<span class="require">*请输入正确的手机号码</span>
			<br><br>
			<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
			<input type="text" placeholder="请输入邮箱" class="inp" id="email" required="required" name="semail">&nbsp;&nbsp;&nbsp;
			<span class="require">*请输入正确的邮箱</span>
			<br><br>
			<label>输入密码：</label>
			<input type="password" placeholder="请输入密码" class="inp" id="psw" required="required" name="sps">&nbsp;&nbsp;&nbsp;
			<span class="require">*请输入长度为6-16的字符</span>
			<br><br>
			<label>确认密码：</label>
			<input type="password" placeholder="请再次输入密码" class="inp" required="required" id="ret" name="sreps">
			<br><br><br>
			<input type="submit" value="立即注册" id="sub" onclick="return register()">
		</form>
		<br><br>
		<span class="a3">已有账号？</span>
		<a href="login.jsp" class="a2">前往登录</a>
	</div><br><br><br>
	<span style="color: white;font-family: 微软雅黑;font-size: 13px;margin-left: 630px;">版权所有 广东工业大学软件工程  精品课程系统</span>
	<script>
		function register(){
			var ban = document.getElementById('ban').value;
			var phone = document.getElementById('phone').value;
			var email = document.getElementById('email').value;
			var psw = document.getElementById('psw').value;
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
	</script>
</body>
</html>
<script> 
//取出传回来的参数error并与yes比较
  var errori ='<%=request.getParameter("error")%>';
  if(errori=='yes'){
   alert("注册失败！");
  }
</script>